using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MetaNET.DataHelper;

public partial class Tool_Category : System.Web.UI.Page
{
    public string ShowResult = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //DataTable dt = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "", "");

        //foreach (DataRow dr in dt.Rows)
        //{
        //    using (var db = SqlService.GetSqlService())
        //    {
        //        string query = string.Format("update tblProducts set CategoryIDParentList=N'{0}' where ID={1}", GetCategoryIDParentList(dr["CategoryIDList"].ToString().Trim(',')), dr["ID"].ToString());
        //        db.ExecuteSql(query);
        //    }
        //}

        DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID, ParentID, LinkTypeMenuFlag, FriendlyUrl, Name, Link", "Moduls='category'", "Sort");
        if (Utils.CheckExist_DataTable(dt))
        {            
            foreach (DataRow dr in dt.Rows)
            {
                bool IsLeaf = true;
                int Level = 1;
                int RootID = 0;
                string ParentIDList ="";
                Stack<BreadCrumb> bcList = new Stack<BreadCrumb>();
                DataTable dtCurrent = dt;
                DataRow drCurrent = dr;

                List<BreadCrumbChild> bcChildList = new List<BreadCrumbChild>();

                DataTable dtChild = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", "ParentID=" + drCurrent["ID"], "Sort");
                if (Utils.CheckExist_DataTable(dtChild))
                {
                    IsLeaf = false;
                    bcChildList = new List<BreadCrumbChild>();
                    foreach (DataRow drChild in dtChild.Rows)
                    {
                        bcChildList.Add(CreateBreadCrumbChild(drChild));
                    }
                }
                else
                {
                    IsLeaf = true;
                }

                bcList.Push(CreateBreadCrumb(drCurrent, bcChildList));


                do
                {
                    if (!Utils.IsNullOrEmpty(drCurrent["ParentID"]) && ConvertUtility.ToInt32(drCurrent["ParentID"]) > 0)
                    {
                        dtCurrent = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID, ParentID, LinkTypeMenuFlag, FriendlyUrl, Name, Link", string.Format("ID={0}", drCurrent["ParentID"]), "Sort");
                        if (Utils.CheckExist_DataTable(dtCurrent))
                        {
                            Level++;
                            drCurrent = dtCurrent.Rows[0];
                            RootID = ConvertUtility.ToInt32(drCurrent["ID"]);

                            dtChild = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", "ParentID=" + drCurrent["ID"], "Sort");
                            if (Utils.CheckExist_DataTable(dtChild))
                            {
                                bcChildList = new List<BreadCrumbChild>();
                                foreach (DataRow drChild in dtChild.Rows)
                                {
                                    bcChildList.Add(CreateBreadCrumbChild(drChild));
                                }
                               
                            }

                            bcList.Push(CreateBreadCrumb(drCurrent, bcChildList));
                        }
                    }
                }
                while (!Utils.IsNullOrEmpty(drCurrent["ParentID"]) && ConvertUtility.ToInt32(drCurrent["ParentID"]) > 0);

                ShowResult = bcList.ToJSON();

                foreach(BreadCrumb bc in bcList)
                {
                    if(bc.ID != dr["ID"].ToString())
                        ParentIDList += bc.ID + ",";
                }

                ParentIDList = Utils.CommaSQLAdd(ParentIDList);

                using (var db = SqlService.GetSqlService())
                {
                    string query = string.Format("update tblCategories set BreadCrumbJson=N'{0}', IsLeaf='{1}', LevelNumber={2}, RootID={3}, ParentIDList='{4}' where ID={5}", bcList.ToJSON(), IsLeaf, Level, RootID, ParentIDList, dr["ID"].ToString());
                    db.ExecuteSql(query);
                }
            }
        }
    }

    protected BreadCrumb CreateBreadCrumb(DataRow dr, List<BreadCrumbChild> child)
    {
        BreadCrumb bc = new BreadCrumb();
        bc.ID = ConvertUtility.ToString(dr["ID"]);
        bc.Name = ConvertUtility.ToString(dr["Name"]);
        bc.FriendlyUrl = dr["FriendlyUrl"].ToString();
        bc.LinkTypeMenuFlag = dr["LinkTypeMenuFlag"].ToString();
        bc.Link = dr["Link"].ToString();
        bc.Child = child;
        return bc;
    }
    protected BreadCrumbChild CreateBreadCrumbChild(DataRow dr)
    {
        BreadCrumbChild bc = new BreadCrumbChild();
        bc.ID = ConvertUtility.ToString(dr["ID"]);
        bc.Name = ConvertUtility.ToString(dr["Name"]);
        bc.FriendlyUrl = dr["FriendlyUrl"].ToString();
        bc.LinkTypeMenuFlag = dr["LinkTypeMenuFlag"].ToString();
        bc.Link = dr["Link"].ToString();
        return bc;
    }

    protected string GetCategoryIDParentList(string CategoryIDList)
    {
        string returnValue = string.Empty;
        string CateofyIDList = CategoryIDList;
        if (string.IsNullOrEmpty(CateofyIDList))
            return returnValue;

        string[] NameArr = CateofyIDList.Split(',');
        if (NameArr != null && NameArr.Length > 0)
        {
            string CategoryIDParentList = ",";
            foreach (string CatID in NameArr)
            {
                using (var dbx = SqlService.GetSqlService())
                {
                    int count = 0;
                    int ParentID = ConvertUtility.ToInt32(CatID);
                    while (ParentID > 0 && count < 10)
                    {
                        string sqlQuery = string.Format("SELECT Top 1 * FROM tblCategories Where ID={0}", ParentID);
                        var ds = dbx.ExecuteSqlDataTable(sqlQuery);
                        if (ds != null && ds.Rows.Count > 0)
                        {
                            ParentID = ConvertUtility.ToInt32(ds.Rows[0]["ParentID"]);

                            if (!CategoryIDParentList.Contains("," + ParentID + ",") && ParentID > 0)
                                CategoryIDParentList += ParentID + ",";
                        }
                        else
                        {
                            ParentID = 0;
                        }
                        count++;
                    }
                }
            }
            returnValue = Utils.CommaSQLAdd(CategoryIDParentList.Trim(','));
        }
        return returnValue;
    }
}