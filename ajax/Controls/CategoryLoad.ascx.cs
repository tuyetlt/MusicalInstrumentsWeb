using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_Controls_CategoryLoad : System.Web.UI.UserControl
{
    public DataRow drCat, drProduct, drArticle;
    public DataTable dtCat, dtProduct, dtArticle;
    public string action = RequestHelper.GetString("action", "product_list");

    protected void Page_Load(object sender, EventArgs e)
    {
        string CategoryIDList = RequestHelper.GetString("CategoryIDList", string.Empty);
        string CategoryIDParentList = RequestHelper.GetString("CategoryIDParentList", string.Empty);
        int categoryID = RequestHelper.GetInt("categoryID", 0);
        string keyword = RequestHelper.GetString("keyword", string.Empty);
        int pageIndex = RequestHelper.GetInt("pageIndex", 1);
        int mainCategory = RequestHelper.GetInt("mainCategory", 1);
        //string rootFilterCategoryID = ""; // RequestHelper.GetString("rootFilterCategoryID", ""); //Tạm bỏ Root đi để lấy đúng theo CategoryID
        string attributeIDList = RequestHelper.GetString("attributeIDList", "");

        int _totalProduct = 0;

        if (action == "product_list")
        {
            if (!string.IsNullOrEmpty(attributeIDList))
            {
                string filterAttr = string.Empty;
                string[] attributeID_Array = attributeIDList.Trim(',').Split(',');
                if (attributeID_Array != null && attributeID_Array.Length > 0)
                {
                    int count = 0;
                    foreach (string fil in attributeID_Array)
                    {
                        if (count > 0)
                            filterAttr += " OR ";
                        filterAttr += string.Format("(Hide is null OR Hide=0) AND AttributesIDList LIKE '%,{0},%' AND (CategoryIDList Like '%,{1},%' OR CategoryIDParentList Like '%,{1},%')", fil, categoryID);
                        count++;
                    }
                }

                //Tạo điều kiện lọc cho Attr
                string filterAttrParent = "";

                DataTable dtAttr = SqlHelper.SQLToDataTable("tblAttributes", "ID, ParentID", "ID in (" + attributeIDList.Trim(',') + ")", "ParentID");
                //DataTable dtAttr = SqlHelper.SQLToDataTable("tblAttributes", "ID, ParentID", "ID in (29,39,2,3)", "ParentID");


                if (Utils.CheckExist_DataTable(dtAttr))
                {
                    int ParentID = 0;
                    int countAND = 0;
                    int countOR = 0;

                    //filterAttrParent = "(";
                    foreach (DataRow drAtrr in dtAttr.Rows)
                    {
                        if(ParentID==0)
                            ParentID = ConvertUtility.ToInt32(drAtrr["ParentID"]);

                        if (ParentID != ConvertUtility.ToInt32(drAtrr["ParentID"]))
                        {
                            //if (countAND > 0)
                                filterAttrParent += ") AND (";
                            countAND++;
                            ParentID = ConvertUtility.ToInt32(drAtrr["ParentID"]);
                        }
                        else
                        {
                            if(countOR==0)
                                filterAttrParent += " (";
                            else
                                filterAttrParent += " OR ";

                            countOR++;
                        }

                        filterAttrParent += string.Format("AttributesIDList LIKE '%,{0},%'", drAtrr["ID"]);
                    }

                    if (!filterAttrParent.EndsWith(")"))
                        filterAttrParent += ")";
                }


                //Get Root ID, Sort
                string SortProduct = string.Empty;
                DataRow drCatRoot = drCat;
                int RootID = ConvertUtility.ToInt32(drCatRoot["ID"]);
                RootID = ConvertUtility.ToInt32(drCatRoot["ID"]);
                if (!string.IsNullOrEmpty(ConvertUtility.ToString(drCatRoot["SortProduct"])) && string.IsNullOrEmpty(SortProduct))
                    SortProduct = ConvertUtility.ToString(drCatRoot["SortProduct"]);

                int countCategory = 0;
                do
                {
                    if (ConvertUtility.ToInt32(drCatRoot["ParentID"]) > 0)
                    {
                        DataTable dtCatRoot = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID, ParentID, Name, SortProduct", string.Format("ID={0}", drCatRoot["ParentID"]));
                        if (Utils.CheckExist_DataTable(dtCatRoot))
                        {
                            drCatRoot = dtCatRoot.Rows[0];
                            RootID = ConvertUtility.ToInt32(drCatRoot["ID"]);
                            if (!string.IsNullOrEmpty(ConvertUtility.ToString(drCatRoot["SortProduct"])) && string.IsNullOrEmpty(SortProduct))
                                SortProduct = ConvertUtility.ToString(drCatRoot["SortProduct"]);
                        }
                        countCategory++;
                    }
                }
                while (ConvertUtility.ToInt32(drCatRoot["ParentID"]) > 0 && countCategory <= 5);
                if (string.IsNullOrEmpty(SortProduct))
                    SortProduct = ConfigWeb.SortProduct;

                string filterProduct = string.Format(@"(Hide is null OR Hide=0) AND (CategoryIDParentList LIKE '%,{0},%' OR CategoryIDList LIKE '%,{0},%' OR TagIDList Like N'%,{0},%') AND ({1})", categoryID, filterAttrParent);
                dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "", filterProduct, SortProduct, pageIndex, C.ROWS_PRODUCTCATEGORY, out _totalProduct);
                CookieUtility.SetValueToCookie("TotalProduct", _totalProduct.ToString());
                pageIndex += 1;
                CookieUtility.SetValueToCookie("pageIndex_Category", pageIndex.ToString());
            }
            else if (categoryID > 0 || !string.IsNullOrEmpty(keyword))
            {
                string filterProduct = "";
                if (categoryID > 0)
                    filterProduct = string.Format(@"(Hide is null OR Hide=0) AND (CategoryIDList Like N'%,{0},%' OR CategoryIDParentList Like N'%,{0},%' OR TagIDList Like N'%,{0},%')", categoryID);
                else
                    filterProduct = string.Format(@"Name Like N'%{0}%' OR NameUnsign Like N'%{0}%'", keyword);
                dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "", filterProduct, ConfigWeb.SortProduct, pageIndex, C.ROWS_PRODUCTCATEGORY, out _totalProduct);
                CookieUtility.SetValueToCookie("TotalProduct", _totalProduct.ToString());
                pageIndex += 1;
                CookieUtility.SetValueToCookie("pageIndex_Category", pageIndex.ToString());
            }
        }
        else if (action == "article_list")
        {
            if (categoryID > 0)
            {
                string filterProduct = string.Format(@"(Hide is null OR Hide=0) AND (CategoryIDList Like N'%,{0},%' OR CategoryaIDParentList Like N'%,{0},%')", categoryID);
                dtArticle = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "", filterProduct, ConfigWeb.SortArticle, pageIndex, C.ROWS_PRODUCTCATEGORY, out _totalProduct);
            }
            else
            {
                dtArticle = SqlHelper.SQLToDataTable("tblArticle", "Gallery,Name,FriendlyUrl,Description", string.Format(@"{0} AND StartDate<=getdate() AND {1}", Utils.CreateFilterDate, Utils.CreateFilterHide), ConfigWeb.SortArticle, pageIndex, C.ROWS_PRODUCTCATEGORY, out _totalProduct);
            }
            CookieUtility.SetValueToCookie("TotalArticle", _totalProduct.ToString());
            pageIndex += 1;
            CookieUtility.SetValueToCookie("pageIndex_Category", pageIndex.ToString());
        }
    }
}