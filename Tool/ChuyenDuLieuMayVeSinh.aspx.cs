using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MetaNET.DataHelper;

public partial class Tool_ChuyenDuLieuMayVeSinh : System.Web.UI.Page
{
    public string ShowResult = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCategory_Click(object sender, EventArgs e)
    {
        Hashtable hashtable = new Hashtable();
        DataTable dt = new DataTable();

        using (var db1 = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayhutbui_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        {
            string sqlQuery = @"Select * from CMRC_Categories order by CategoryID ASC";
            dt = db1.ExecuteSqlDataTable(sqlQuery);
            if (Utils.CheckExist_DataTable(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    hashtable["ID"] = dr["CategoryID"].ToString();
                    hashtable["Name"] = dr["CategoryName"].ToString();
                    hashtable["NameUsign"] = TextChanger.Translate(dr["CategoryName"].ToString().ToLower(), "-");
                    hashtable["FriendlyUrl"] = dr["FriendlyUrl"].ToString();
                    hashtable["Description"] = Utils.KillChars(Request.Form["description"]);
                    hashtable["LongDescription"] = Utils.KillChars(Request.Form["longdescription"]);

                    hashtable["Link"] = dr["Link"].ToString();
                    hashtable["ParentID"] = dr["ParentCategoryID"].ToString();
                    hashtable["Sort"] = dr["SortOrder"].ToString();

                    // Danh mục sản phẩm: 4, Danh mục bài viết: 8, dạng liên kết: 1, Nội dung chi tiết: 2 
                    string old_moduls = dr["Moduls"].ToString();
                    if (old_moduls == "category")
                        hashtable["LinkTypeMenuFlag"] = "4";
                    else if (old_moduls == "details")
                        hashtable["LinkTypeMenuFlag"] = "2";
                    else if (old_moduls == "link")
                        hashtable["LinkTypeMenuFlag"] = "1";
                    else if (old_moduls == "article")
                        hashtable["LinkTypeMenuFlag"] = "8";


                    hashtable["ParentIDList"] = Utils.KillChars(Request.Form["parentidlist"]);
                    hashtable["BreadCrumbJson"] = Utils.KillChars(Request.Form["breadcrumbjson"]);
                    hashtable["LevelNumber"] = Utils.KillChars(Request.Form["levelnumber"]);
                    hashtable["RootID"] = Utils.KillChars(Request.Form["rootid"]);
                    hashtable["IsLeaf"] = Utils.KillChars(Request.Form["isleaf"]);
                    hashtable["ItemNumber"] = Utils.KillChars(Request.Form["itemnumber"]);
                    hashtable["Image_1"] = Utils.KillChars(Request.Form["image_1"]);
                    hashtable["Image_2"] = Utils.KillChars(Request.Form["image_2"]);
                    hashtable["Image_3"] = Utils.KillChars(Request.Form["image_3"]);
                    hashtable["Icon"] = Utils.KillChars(Request.Form["icon"]);

                    hashtable["Sort1"] = Utils.KillChars(Request.Form["sort1"]);
                    hashtable["Sort2"] = Utils.KillChars(Request.Form["sort2"]);
                    hashtable["Moduls"] = "category"; // Trang máy vệ sinh chỉ có category, không có tag

                    // Main = 1,Top = 2,Bottom = 4, MenuSub = 8, MenuSubMainHome = 16, MenuSubMainHome2 = 32, Style1 = 64, Style2 = 128
                    int old_position = ConvertUtility.ToInt32(dr["Position"]);
                    if (old_position == 2) //Trên
                        hashtable["PositionMenuFlag"] = "2";
                    else if (old_position == 3) //Main
                        hashtable["PositionMenuFlag"] = "1";
                    else if (old_position == 4 || old_position == 5) //Dưới
                        hashtable["PositionMenuFlag"] = "4";

                    hashtable["AttrMenuFlag"] = Utils.KillChars(Request.Form["attrmenuflag"]);
                    hashtable["Hide"] = ConvertUtility.ToBoolean(dr["hide"]);
                    hashtable["FilterJson"] = Utils.KillChars(Request.Form["filterjson"]);
                    hashtable["AttributesIDList"] = Utils.KillChars(Request.Form["attributesidlist"]);
                    hashtable["AttributesUrlList"] = Utils.KillChars(Request.Form["attributesurllist"]);
                    hashtable["AttributeConfigIDList"] = Utils.KillChars(Request.Form["attributeconfigidlist"]);
                    hashtable["AttributeConfigUrlList"] = Utils.KillChars(Request.Form["attributeconfigurllist"]);
                    hashtable["TagIDList"] = Utils.KillChars(Request.Form["tagidlist"]);
                    hashtable["TagNameList"] = Utils.KillChars(Request.Form["tagnamelist"]);
                    hashtable["TagUrlList"] = Utils.KillChars(Request.Form["tagurllist"]);
                    hashtable["HashTagIDList"] = Utils.KillChars(Request.Form["hashtagidlist"]);
                    hashtable["HashTagNameList"] = Utils.KillChars(Request.Form["hashtagnamelist"]);
                    hashtable["HashTagUrlList"] = Utils.KillChars(Request.Form["hashtagurllist"]);
                    hashtable["MetaTitle"] = dr["SEOTitle"].ToString();
                    hashtable["MetaKeyword"] = dr["SEOKeyword"].ToString();
                    hashtable["MetaDescription"] = dr["SEODescription"].ToString();
                    hashtable["Temp1"] = Utils.KillChars(Request.Form["temp1"]);
                    hashtable["Temp2"] = Utils.KillChars(Request.Form["temp2"]);
                    hashtable["Temp3"] = Utils.KillChars(Request.Form["temp3"]);
                    hashtable["Temp4"] = Utils.KillChars(Request.Form["temp4"]);
                    hashtable["Temp5"] = Utils.KillChars(Request.Form["temp5"]);
                    hashtable["Temp6"] = Utils.KillChars(Request.Form["temp6"]);
                    hashtable["Temp7"] = Utils.KillChars(Request.Form["temp7"]);
                    hashtable["TempModuls"] = Utils.KillChars(Request.Form["tempmoduls"]);
                    hashtable["SchemaBestRating"] = 100;
                    hashtable["SchemaRatingValue"] = Utils.RandomNumber(92, 100);
                    hashtable["SchemaRatingCount"] = Utils.RandomNumber(200, 3000);
                    hashtable["SortProduct"] = Utils.KillChars(Request.Form["sortproduct"]);

                    using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQuery1 = @"INSERT INTO [dbo].[tblCategories] ([ID],[Name],[FriendlyUrl],[Description],[LongDescription],[Link],[ParentID],[ParentIDList],[BreadCrumbJson],[LevelNumber],[RootID],[IsLeaf],[ItemNumber],[Image_1],[Image_2],[Image_3],[Icon],[Sort],[Sort1],[Sort2],[Moduls],[LinkTypeMenuFlag],[PositionMenuFlag],[AttrMenuFlag],[Hide],[FilterJson],[AttributesIDList],[AttributesUrlList],[AttributeConfigIDList],[AttributeConfigUrlList],[TagIDList],[TagNameList],[TagUrlList],[HashTagIDList],[HashTagNameList],[HashTagUrlList],[MetaTitle],[MetaKeyword],[MetaDescription],[CreatedDate],[EditedDate],[CreatedBy],[EditedBy],[Temp1],[Temp2],[Temp3],[Temp4],[Temp5],[Temp6],[Temp7],[TempModuls],[SchemaBestRating],[SchemaRatingValue],[SchemaRatingCount],[SortProduct]) OUTPUT INSERTED.ID VALUES (@ID, @Name,@FriendlyUrl,@Description,@LongDescription,@Link,@ParentID,@ParentIDList,@BreadCrumbJson,@LevelNumber,@RootID,@IsLeaf,@ItemNumber,@Image_1,@Image_2,@Image_3,@Icon,@Sort,@Sort1,@Sort2,@Moduls,@LinkTypeMenuFlag,@PositionMenuFlag,@AttrMenuFlag,@Hide,@FilterJson,@AttributesIDList,@AttributesUrlList,@AttributeConfigIDList,@AttributeConfigUrlList,@TagIDList,@TagNameList,@TagUrlList,@HashTagIDList,@HashTagNameList,@HashTagUrlList,@MetaTitle,@MetaKeyword,@MetaDescription,@CreatedDate,@EditedDate,@CreatedBy,@EditedBy,@Temp1,@Temp2,@Temp3,@Temp4,@Temp5,@Temp6,@Temp7,@TempModuls,@SchemaBestRating,@SchemaRatingValue,@SchemaRatingCount,@SortProduct)";
                        db.AddParameter("@ID", System.Data.SqlDbType.NVarChar, hashtable["ID"].ToString());
                        db.AddParameter("@Name", System.Data.SqlDbType.NVarChar, hashtable["Name"].ToString());
                        db.AddParameter("@FriendlyUrl", System.Data.SqlDbType.NVarChar, hashtable["FriendlyUrl"].ToString());
                        db.AddParameter("@Description", System.Data.SqlDbType.NVarChar, hashtable["Description"].ToString());
                        db.AddParameter("@LongDescription", System.Data.SqlDbType.NVarChar, hashtable["LongDescription"].ToString());
                        db.AddParameter("@Link", System.Data.SqlDbType.NVarChar, hashtable["Link"].ToString());
                        db.AddParameter("@ParentID", System.Data.SqlDbType.Int, hashtable["ParentID"].ToString());
                        db.AddParameter("@ParentIDList", System.Data.SqlDbType.NVarChar, hashtable["ParentIDList"].ToString());
                        db.AddParameter("@BreadCrumbJson", System.Data.SqlDbType.NVarChar, hashtable["BreadCrumbJson"].ToString());
                        db.AddParameter("@LevelNumber", System.Data.SqlDbType.Int, hashtable["LevelNumber"].ToString());
                        db.AddParameter("@RootID", System.Data.SqlDbType.Int, hashtable["RootID"].ToString());
                        db.AddParameter("@IsLeaf", System.Data.SqlDbType.Bit, hashtable["IsLeaf"].ToString());
                        db.AddParameter("@ItemNumber", System.Data.SqlDbType.Int, hashtable["ItemNumber"].ToString());
                        db.AddParameter("@Image_1", System.Data.SqlDbType.NVarChar, hashtable["Image_1"].ToString());
                        db.AddParameter("@Image_2", System.Data.SqlDbType.NVarChar, hashtable["Image_2"].ToString());
                        db.AddParameter("@Image_3", System.Data.SqlDbType.NVarChar, hashtable["Image_3"].ToString());
                        db.AddParameter("@Icon", System.Data.SqlDbType.NVarChar, hashtable["Icon"].ToString());
                        db.AddParameter("@Sort", System.Data.SqlDbType.Int, hashtable["Sort"].ToString());
                        db.AddParameter("@Sort1", System.Data.SqlDbType.Int, hashtable["Sort1"].ToString());
                        db.AddParameter("@Sort2", System.Data.SqlDbType.Int, hashtable["Sort2"].ToString());
                        db.AddParameter("@Moduls", System.Data.SqlDbType.NVarChar, hashtable["Moduls"].ToString());
                        db.AddParameter("@LinkTypeMenuFlag", System.Data.SqlDbType.Int, hashtable["LinkTypeMenuFlag"].ToString());
                        db.AddParameter("@PositionMenuFlag", System.Data.SqlDbType.Int, hashtable["PositionMenuFlag"].ToString());
                        db.AddParameter("@AttrMenuFlag", System.Data.SqlDbType.Int, hashtable["AttrMenuFlag"].ToString());
                        db.AddParameter("@Hide", System.Data.SqlDbType.Bit, hashtable["Hide"].ToString());
                        db.AddParameter("@FilterJson", System.Data.SqlDbType.NVarChar, hashtable["FilterJson"].ToString());
                        db.AddParameter("@AttributesIDList", System.Data.SqlDbType.NVarChar, hashtable["AttributesIDList"].ToString());
                        db.AddParameter("@AttributesUrlList", System.Data.SqlDbType.NVarChar, hashtable["AttributesUrlList"].ToString());
                        db.AddParameter("@AttributeConfigIDList", System.Data.SqlDbType.NVarChar, hashtable["AttributeConfigIDList"].ToString());
                        db.AddParameter("@AttributeConfigUrlList", System.Data.SqlDbType.NVarChar, hashtable["AttributeConfigUrlList"].ToString());
                        db.AddParameter("@TagIDList", System.Data.SqlDbType.NVarChar, hashtable["TagIDList"].ToString());
                        db.AddParameter("@TagNameList", System.Data.SqlDbType.NVarChar, hashtable["TagNameList"].ToString());
                        db.AddParameter("@TagUrlList", System.Data.SqlDbType.NVarChar, hashtable["TagUrlList"].ToString());
                        db.AddParameter("@HashTagIDList", System.Data.SqlDbType.NVarChar, hashtable["HashTagIDList"].ToString());
                        db.AddParameter("@HashTagNameList", System.Data.SqlDbType.NVarChar, hashtable["HashTagNameList"].ToString());
                        db.AddParameter("@HashTagUrlList", System.Data.SqlDbType.NVarChar, hashtable["HashTagUrlList"].ToString());
                        db.AddParameter("@MetaTitle", System.Data.SqlDbType.NVarChar, hashtable["MetaTitle"].ToString());
                        db.AddParameter("@MetaKeyword", System.Data.SqlDbType.NVarChar, hashtable["MetaKeyword"].ToString());
                        db.AddParameter("@MetaDescription", System.Data.SqlDbType.NVarChar, hashtable["MetaDescription"].ToString());
                        db.AddParameter("@EditedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                        db.AddParameter("@EditedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);
                        db.AddParameter("@Temp1", System.Data.SqlDbType.Bit, hashtable["Temp1"].ToString());
                        db.AddParameter("@Temp2", System.Data.SqlDbType.Bit, hashtable["Temp2"].ToString());
                        db.AddParameter("@Temp3", System.Data.SqlDbType.Bit, hashtable["Temp3"].ToString());
                        db.AddParameter("@Temp4", System.Data.SqlDbType.Bit, hashtable["Temp4"].ToString());
                        db.AddParameter("@Temp5", System.Data.SqlDbType.Bit, hashtable["Temp5"].ToString());
                        db.AddParameter("@Temp6", System.Data.SqlDbType.Bit, hashtable["Temp6"].ToString());
                        db.AddParameter("@Temp7", System.Data.SqlDbType.Bit, hashtable["Temp7"].ToString());
                        db.AddParameter("@TempModuls", System.Data.SqlDbType.NVarChar, hashtable["TempModuls"].ToString());
                        db.AddParameter("@SchemaBestRating", System.Data.SqlDbType.Int, hashtable["SchemaBestRating"].ToString());
                        db.AddParameter("@SchemaRatingValue", System.Data.SqlDbType.Int, hashtable["SchemaRatingValue"].ToString());
                        db.AddParameter("@SchemaRatingCount", System.Data.SqlDbType.Int, hashtable["SchemaRatingCount"].ToString());
                        db.AddParameter("@SortProduct", System.Data.SqlDbType.NVarChar, hashtable["SortProduct"].ToString());
                        db.AddParameter("@CreatedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                        db.AddParameter("@CreatedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);

                        db.ExecuteSql(sqlQuery1);
                    }
                }
            }
        }

        //UpdateCategoryFromBeta();
        RenBreadcrumb();
    }


    protected void UpdateCategoryFromBeta()
    {
        Hashtable hashtable = new Hashtable();
        DataTable dt = new DataTable();

        using (var db1 = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayvesinh2022_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        {
            string sqlQuery = @"Select * from tblCategories";
            dt = db1.ExecuteSqlDataTable(sqlQuery);
            if (Utils.CheckExist_DataTable(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    hashtable["ID"] = dr["ID"].ToString();
                    hashtable["Image_1"] = dr["Image_1"].ToString();
                    hashtable["Image_2"] = dr["Image_2"].ToString();
                    hashtable["Image_3"] = dr["Image_3"].ToString();
                    hashtable["Icon"] = dr["Icon"].ToString();
                    hashtable["LinkTypeMenuFlag"] = dr["LinkTypeMenuFlag"].ToString();
                    hashtable["PositionMenuFlag"] = dr["PositionMenuFlag"].ToString();
                    hashtable["ParentID"] = dr["ParentID"].ToString();

                    using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQuery1 = @"UPDATE tblCategories set [Image_1]=@Image_1,[Image_2]=@Image_2,[Image_3]=@Image_3,[Icon]=@Icon,[LinkTypeMenuFlag]=@LinkTypeMenuFlag,[PositionMenuFlag]=@PositionMenuFlag,[ParentID]=@ParentID WHERE [ID] = @ID";
                        db.AddParameter("@ID", System.Data.SqlDbType.NVarChar, hashtable["ID"].ToString());
                        db.AddParameter("@Image_1", System.Data.SqlDbType.NVarChar, hashtable["Image_1"].ToString());
                        db.AddParameter("@Image_2", System.Data.SqlDbType.NVarChar, hashtable["Image_2"].ToString());
                        db.AddParameter("@Image_3", System.Data.SqlDbType.NVarChar, hashtable["Image_3"].ToString());
                        db.AddParameter("@Icon", System.Data.SqlDbType.NVarChar, hashtable["Icon"].ToString());
                        db.AddParameter("@LinkTypeMenuFlag", System.Data.SqlDbType.Int, hashtable["LinkTypeMenuFlag"].ToString());
                        db.AddParameter("@PositionMenuFlag", System.Data.SqlDbType.Int, hashtable["PositionMenuFlag"].ToString());
                        db.AddParameter("@ParentID", System.Data.SqlDbType.Int, hashtable["ParentID"].ToString());
                        db.ExecuteSql(sqlQuery1);
                    }
                }
            }
        }
    }


    #region BreadCrumb

    protected void RenBreadcrumb()
    {
        DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID, ParentID, LinkTypeMenuFlag, FriendlyUrl, Name, Link", "Moduls='category'", "Sort");
        if (Utils.CheckExist_DataTable(dt))
        {
            foreach (DataRow dr in dt.Rows)
            {
                bool IsLeaf = true;
                int Level = 1;
                int RootID = 0;
                string ParentIDList = "";
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

                int countP = 0;
                do
                {
                    countP = countP + 1;
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
                while (!Utils.IsNullOrEmpty(drCurrent["ParentID"]) && ConvertUtility.ToInt32(drCurrent["ParentID"]) > 0 && countP <= 5);

                ShowResult = bcList.ToJSON();

                foreach (BreadCrumb bc in bcList)
                {
                    if (bc.ID != dr["ID"].ToString())
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


    #endregion


    protected void btnArticle_Click(object sender, EventArgs e)
    {
        using (var db1 = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayhutbui_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        {
            string sqlQuery = @"Select * from CMRC_Article";
            DataTable dt = db1.ExecuteSqlDataTable(sqlQuery);
            if (Utils.CheckExist_DataTable(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    Hashtable hashtable = new Hashtable();
                    hashtable["ID"] = dr["ArticleID"].ToString();
                    hashtable["Name"] = dr["Title"].ToString();
                    hashtable["FriendlyUrl"] = dr["FriendlyUrl"].ToString();
                    hashtable["FriendlyUrlCategory"] = Utils.KillChars(Request.Form["friendlyurlcategory"]);

                    //if (ConvertUtility.ToBoolean(dr["ContainPhotos"].ToString())) //Công ty
                    //{
                    //    hashtable["CategoryIDList"] = ",10208,";
                    //    hashtable["CategoryNameList"] = ",Tin Thadaco,";
                    //    hashtable["CategoryUrlList"] = ",tin-thadaco,";
                    //}
                    //else if (ConvertUtility.ToBoolean(dr["AcceptVote"].ToString())) // Khuyến mãi
                    //{
                    //    hashtable["CategoryIDList"] = ",10207,";
                    //    hashtable["CategoryNameList"] = ",Tin khuyến mãi,";
                    //    hashtable["CategoryUrlList"] = ",tin-khuyen-mai,";
                    //}
                    //else //if (ConvertUtility.ToBoolean(dr["AcceptComment"].ToString())) // Tin Mới
                    //{
                    //    hashtable["CategoryIDList"] = ",10206,";
                    //    hashtable["CategoryNameList"] = ",Tin mới,";
                    //    hashtable["CategoryUrlList"] = ",tin-moi,";
                    //}

                    string CategoryIDList = "", CategoryNameList = "", CategoryUrlList = "", FirstCategory = "0";

                    FirstCategory = dr["CategoryID"].ToString();
                    CategoryIDList = dr["CategoryID"].ToString();



                    hashtable["FriendlyUrlCategory"] = "";
                    using (var db3 = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQ = @"select FriendlyUrl from tblCategories where ID=" + FirstCategory;
                        DataTable dtCP = db3.ExecuteSqlDataTable(sqlQ);
                        if (Utils.CheckExist_DataTable(dtCP))
                        {
                            hashtable["FriendlyUrlCategory"] = dtCP.Rows[0][0].ToString();
                        }
                    }

                    hashtable["CategoryIDList"] = Utils.CommaSQLAdd(CategoryIDList);
                    hashtable["CategoryNameList"] = CategoryNameList;
                    hashtable["CategoryUrlList"] = CategoryUrlList;


                    hashtable["CategoryaIDParentList"] = Utils.KillChars(Request.Form["categoryaidparentlist"]);
                    hashtable["AttributesIDList"] = Utils.KillChars(Request.Form["attributesidlist"]);
                    hashtable["AttributesUrlList"] = Utils.KillChars(Request.Form["attributesurllist"]);
                    hashtable["AttributeConfigIDList"] = Utils.KillChars(Request.Form["attributeconfigidlist"]);
                    hashtable["AttributeConfigUrlList"] = Utils.KillChars(Request.Form["attributeconfigurllist"]);
                    hashtable["TagIDList"] = Utils.KillChars(Request.Form["tagidlist"]);
                    hashtable["TagNameList"] = Utils.KillChars(Request.Form["tagnamelist"]);
                    hashtable["TagUrlList"] = Utils.KillChars(Request.Form["tagurllist"]);
                    hashtable["HashTagIDList"] = Utils.KillChars(Request.Form["hashtagidlist"]);
                    hashtable["HashTagNameList"] = Utils.KillChars(Request.Form["hashtagnamelist"]);
                    hashtable["HashTagUrlList"] = Utils.KillChars(Request.Form["hashtagurllist"]);

                    hashtable["Description"] = dr["Description"].ToString();
                    hashtable["LongDescription"] = dr["DetailContent"].ToString();
                    
                    hashtable["StartDate"] = ConvertUtility.ToDateTime(dr["FromDate"]);
                    hashtable["EndDate"] = ConvertUtility.ToDateTime(dr["ToDate"]);
                    hashtable["Flags"] = Utils.KillChars(Request.Form["flags"]);
                    hashtable["Hide"] = Utils.KillChars(Request.Form["hide"]);
                    hashtable["Sort"] = Utils.KillChars(Request.Form["sort"]);
                    hashtable["Viewed"] = dr["Viewed"];
                    hashtable["Tags"] = Utils.KillChars(Request.Form["tags"]);
                    hashtable["Image"] = dr["Image"].ToString();

                    
                    string JsonImage = "[";
                    if (!string.IsNullOrEmpty(dr["Image"].ToString()))
                    {
                        JsonImage += string.Format(@"{{""Name"":""{0}"", ""Path"":""/upload/article/{0}"", ""Size"":0}}", ConvertUtility.ToString(dr["Image"]));
                    }

                    JsonImage += "]";


                    hashtable["Gallery"] = JsonImage;

                    hashtable["MetaTitle"] = dr["SeoTitle"].ToString();
                    hashtable["MetaKeyword"] = dr["SeoKeyword"].ToString();
                    hashtable["MetaDescription"] = dr["SeoDescription"].ToString();
                    
                    hashtable["NameUsign"] = TextChanger.Translate(dr["Title"].ToString(), " ");
                    hashtable["NewsRelatedIDList"] = Utils.KillChars(Request.Form["newsrelatedidlist"]);
                    hashtable["SchemaBestRating"] = Utils.KillChars(Request.Form["schemabestrating"]);
                    
                    hashtable["SchemaRatingValue"] = 100;
                    hashtable["SchemaRatingValue"] = Utils.RandomNumber(92, 100);
                    hashtable["SchemaRatingCount"] = Utils.RandomNumber(200, 3000);

                    hashtable["SchemaFAQ"] = "";

                    hashtable["CreatedDate"] = ConvertUtility.ToDateTime(dr["CreatedDate"]);


                    using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQuery1 = @"INSERT INTO [dbo].[tblArticle] ([ID],[Name],[FriendlyUrl],[FriendlyUrlCategory],[CategoryIDList],[CategoryNameList],[CategoryUrlList],[CategoryaIDParentList],[AttributesIDList],[AttributesUrlList],[AttributeConfigIDList],[AttributeConfigUrlList],[TagIDList],[TagNameList],[TagUrlList],[HashTagIDList],[HashTagNameList],[HashTagUrlList],[Description],[LongDescription],[StartDate],[EndDate],[Flags],[Hide],[Sort],[Viewed],[Tags],[Image],[Gallery],[MetaTitle],[MetaKeyword],[MetaDescription],[CreatedDate],[EditedDate],[CreatedBy],[EditedBy],[NameUsign],[NewsRelatedIDList],[SchemaBestRating],[SchemaRatingValue],[SchemaRatingCount],[SchemaFAQ]) OUTPUT INSERTED.ID VALUES (@ID,@Name,@FriendlyUrl,@FriendlyUrlCategory,@CategoryIDList,@CategoryNameList,@CategoryUrlList,@CategoryaIDParentList,@AttributesIDList,@AttributesUrlList,@AttributeConfigIDList,@AttributeConfigUrlList,@TagIDList,@TagNameList,@TagUrlList,@HashTagIDList,@HashTagNameList,@HashTagUrlList,@Description,@LongDescription,@StartDate,@EndDate,@Flags,@Hide,@Sort,@Viewed,@Tags,@Image,@Gallery,@MetaTitle,@MetaKeyword,@MetaDescription,@CreatedDate,@EditedDate,@CreatedBy,@EditedBy,@NameUsign,@NewsRelatedIDList,@SchemaBestRating,@SchemaRatingValue,@SchemaRatingCount,@SchemaFAQ)";
                        db.AddParameter("@ID", System.Data.SqlDbType.Int, hashtable["ID"].ToString());
                        db.AddParameter("@Name", System.Data.SqlDbType.NVarChar, hashtable["Name"].ToString());
                        db.AddParameter("@FriendlyUrl", System.Data.SqlDbType.NVarChar, hashtable["FriendlyUrl"].ToString());
                        db.AddParameter("@FriendlyUrlCategory", System.Data.SqlDbType.NVarChar, hashtable["FriendlyUrlCategory"].ToString());
                        db.AddParameter("@CategoryIDList", System.Data.SqlDbType.NVarChar, hashtable["CategoryIDList"].ToString());
                        db.AddParameter("@CategoryNameList", System.Data.SqlDbType.NVarChar, hashtable["CategoryNameList"].ToString());
                        db.AddParameter("@CategoryUrlList", System.Data.SqlDbType.NVarChar, hashtable["CategoryUrlList"].ToString());
                        db.AddParameter("@CategoryaIDParentList", System.Data.SqlDbType.NVarChar, hashtable["CategoryaIDParentList"].ToString());
                        db.AddParameter("@AttributesIDList", System.Data.SqlDbType.NVarChar, hashtable["AttributesIDList"].ToString());
                        db.AddParameter("@AttributesUrlList", System.Data.SqlDbType.NVarChar, hashtable["AttributesUrlList"].ToString());
                        db.AddParameter("@AttributeConfigIDList", System.Data.SqlDbType.NVarChar, hashtable["AttributeConfigIDList"].ToString());
                        db.AddParameter("@AttributeConfigUrlList", System.Data.SqlDbType.NVarChar, hashtable["AttributeConfigUrlList"].ToString());
                        db.AddParameter("@TagIDList", System.Data.SqlDbType.NVarChar, hashtable["TagIDList"].ToString());
                        db.AddParameter("@TagNameList", System.Data.SqlDbType.NVarChar, hashtable["TagNameList"].ToString());
                        db.AddParameter("@TagUrlList", System.Data.SqlDbType.NVarChar, hashtable["TagUrlList"].ToString());
                        db.AddParameter("@HashTagIDList", System.Data.SqlDbType.NVarChar, hashtable["HashTagIDList"].ToString());
                        db.AddParameter("@HashTagNameList", System.Data.SqlDbType.NVarChar, hashtable["HashTagNameList"].ToString());
                        db.AddParameter("@HashTagUrlList", System.Data.SqlDbType.NVarChar, hashtable["HashTagUrlList"].ToString());
                        db.AddParameter("@Description", System.Data.SqlDbType.NVarChar, hashtable["Description"].ToString());
                        db.AddParameter("@LongDescription", System.Data.SqlDbType.NVarChar, hashtable["LongDescription"].ToString());
                        db.AddParameter("@StartDate", System.Data.SqlDbType.DateTime, hashtable["StartDate"].ToString());
                        db.AddParameter("@EndDate", System.Data.SqlDbType.DateTime, hashtable["EndDate"].ToString());
                        db.AddParameter("@Flags", System.Data.SqlDbType.Int, hashtable["Flags"].ToString());
                        db.AddParameter("@Hide", System.Data.SqlDbType.Bit, hashtable["Hide"].ToString());
                        db.AddParameter("@Sort", System.Data.SqlDbType.Int, hashtable["Sort"].ToString());
                        db.AddParameter("@Viewed", System.Data.SqlDbType.Int, hashtable["Viewed"].ToString());
                        db.AddParameter("@Tags", System.Data.SqlDbType.NVarChar, hashtable["Tags"].ToString());
                        db.AddParameter("@Image", System.Data.SqlDbType.NVarChar, hashtable["Image"].ToString());
                        db.AddParameter("@Gallery", System.Data.SqlDbType.NVarChar, hashtable["Gallery"].ToString());
                        db.AddParameter("@MetaTitle", System.Data.SqlDbType.NVarChar, hashtable["MetaTitle"].ToString());
                        db.AddParameter("@MetaKeyword", System.Data.SqlDbType.NVarChar, hashtable["MetaKeyword"].ToString());
                        db.AddParameter("@MetaDescription", System.Data.SqlDbType.NVarChar, hashtable["MetaDescription"].ToString());
                        db.AddParameter("@EditedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                        db.AddParameter("@EditedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);
                        db.AddParameter("@NameUsign", System.Data.SqlDbType.NVarChar, hashtable["NameUsign"].ToString());
                        db.AddParameter("@NewsRelatedIDList", System.Data.SqlDbType.NVarChar, hashtable["NewsRelatedIDList"].ToString());
                        db.AddParameter("@SchemaBestRating", System.Data.SqlDbType.Int, hashtable["SchemaBestRating"].ToString());
                        db.AddParameter("@SchemaRatingValue", System.Data.SqlDbType.Int, hashtable["SchemaRatingValue"].ToString());
                        db.AddParameter("@SchemaRatingCount", System.Data.SqlDbType.Int, hashtable["SchemaRatingCount"].ToString());
                        db.AddParameter("@SchemaFAQ", System.Data.SqlDbType.NVarChar, hashtable["SchemaFAQ"].ToString());
                        db.AddParameter("@CreatedDate", System.Data.SqlDbType.DateTime, hashtable["CreatedDate"].ToString());
                        db.AddParameter("@CreatedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);
                        db.ExecuteSql(sqlQuery1);
                    }
                }
            }
        }
    }

    protected void btnProduct_Click(object sender, EventArgs e)
    {
        Hashtable hashtable = new Hashtable();
        DataTable dt = new DataTable();

        using (var db1 = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayhutbui_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        {
            string sqlQuery = @"Select Top 50000 * from CMRC_Products";// WHERE ProductID = 3427";
            dt = db1.ExecuteSqlDataTable(sqlQuery);
            if (Utils.CheckExist_DataTable(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    hashtable["ID"] = ConvertUtility.ToString(dr["ProductID"]);
                    hashtable["Name"] = ConvertUtility.ToString(dr["ModelName"]);
                    hashtable["NameUnsign"] = TextChanger.Translate(ConvertUtility.ToString(dr["ModelName"]), " ");
                    hashtable["ModelNumber"] = Utils.KillChars(Request.Form["modelnumber"]);
                    hashtable["FriendlyUrl"] = TextChanger.Translate(ConvertUtility.ToString(dr["ModelName"]).ToLower(), "-");
                    hashtable["Price"] = ConvertUtility.ToDecimal(dr["Price"]);
                    hashtable["Price1"] = ConvertUtility.ToDecimal(dr["Price1"]);
                    hashtable["Warranty"] = ConvertUtility.ToString(dr["Warranty"]);
                    hashtable["Sort"] = ConvertUtility.ToString(dr["SortOrder"]);
                    hashtable["Sort1"] = Utils.KillChars(Request.Form["sort1"]);
                    hashtable["Sort2"] = Utils.KillChars(Request.Form["sort2"]);
                    hashtable["AttrProductFlag"] = "0"; //Hiển thị trang chủ
                    hashtable["ProductStatusFlag"] = Utils.KillChars(Request.Form["productstatusflag"]);
                    hashtable["ProductVATFlag"] = Utils.KillChars(Request.Form["productvatflag"]);
                    hashtable["Hide"] = ConvertUtility.ToBoolean(dr["Hide"]);

                    string CategoryIDList = "", CategoryNameList = "", CategoryUrlList = "", FirstCategory = "0";

                    FirstCategory = dr["CategoryID"].ToString();
                    CategoryIDList = dr["CategoryID"].ToString();

                    //using (var db2 = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayhutbui_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
                    //{
                    //    string sqlQ = @"select * from CMRC_CategoriesProducts where ProductID=" + ConvertUtility.ToString(dr["ProductID"]);
                    //    DataTable dtCP = db2.ExecuteSqlDataTable(sqlQ);
                    //    if (Utils.CheckExist_DataTable(dtCP))
                    //    {
                    //        foreach (DataRow drCP in dtCP.Rows)
                    //        {
                    //            CategoryIDList += drCP["CategoryID"].ToString() + ",";
                    //            if (FirstCategory == "0")
                    //                FirstCategory = drCP["CategoryID"].ToString();
                    //        }
                    //    }
                    //}





                    hashtable["FriendlyUrlCategory"] = "";
                    using (var db3 = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQ = @"select FriendlyUrl from tblCategories where ID=" + FirstCategory;
                        DataTable dtCP = db3.ExecuteSqlDataTable(sqlQ);
                        if (Utils.CheckExist_DataTable(dtCP))
                        {
                            hashtable["FriendlyUrlCategory"] = dtCP.Rows[0][0].ToString();
                        }
                    }

                    hashtable["CategoryIDList"] = Utils.CommaSQLAdd(CategoryIDList);
                    hashtable["CategoryNameList"] = CategoryNameList;
                    hashtable["CategoryUrlList"] = CategoryUrlList;
                    hashtable["CategoryIDParentList"] = GetCategoryIDParentList(Utils.CommaSQLRemove(CategoryIDList));
                    hashtable["AttributesIDList"] = Utils.KillChars(Request.Form["attributesidlist"]);
                    hashtable["AttributesUrlList"] = Utils.KillChars(Request.Form["attributesurllist"]);
                    hashtable["AttributeConfigIDList"] = Utils.KillChars(Request.Form["attributeconfigidlist"]);
                    hashtable["AttributeConfigUrlList"] = Utils.KillChars(Request.Form["attributeconfigurllist"]);

                    string TagUrlList = "", TagNameList = "";
                    string OldTagIDList = Utils.CommaSQLRemove(dr["Tags"].ToString().Replace(";", ","));
                    string NewTagIDList = "";
                    string[] arr = OldTagIDList.Trim(',').Split(',');
                    if (arr != null && arr.Length > 0)
                    {
                        string filter = string.Empty;
                        foreach (string strName in arr)
                        {
                            NewTagIDList += "10" + strName + ",";
                        }
                    }

                    NewTagIDList = Utils.CommaSQLRemove(NewTagIDList);
                    Utils.GetTagByID(Utils.CommaSQLRemove(NewTagIDList), "tblCategories", "tag", ref TagUrlList, ref TagNameList);

                    hashtable["TagIDList"] = Utils.CommaSQLAdd(NewTagIDList);
                    hashtable["TagNameList"] = Utils.CommaSQLAdd(TagNameList);
                    hashtable["TagUrlList"] = Utils.CommaSQLAdd(TagUrlList);

                    hashtable["HashTagIDList"] = Utils.KillChars(Request.Form["hashtagidlist"]);
                    hashtable["HashTagNameList"] = Utils.KillChars(Request.Form["hashtagnamelist"]);
                    hashtable["HashTagUrlList"] = Utils.KillChars(Request.Form["hashtagurllist"]);
                    hashtable["ManufacturerID"] = Utils.KillChars(Request.Form["manufacturerid"]);
                    hashtable["ManufacturerName"] = Utils.KillChars(Request.Form["manufacturername"]);
                    hashtable["Description"] = ConvertUtility.ToString(dr["Description"]);
                    hashtable["LongDescription"] = ConvertUtility.ToString(dr["LongDescription"]);
                    hashtable["Gift"] = Utils.KillChars(Request.Form["gift"]);
                    hashtable["Tab1"] = Utils.KillChars(Request.Form["tab1"]);
                    hashtable["Tab2"] = Utils.KillChars(Request.Form["tab2"]);
                    hashtable["Tab3"] = Utils.KillChars(Request.Form["tab3"]);
                    hashtable["Image"] = Utils.KillChars(Request.Form["image"]);

                    //Ảnh

                    int CountJson = 0;
                    string JsonImage = "[";
                    if (!string.IsNullOrEmpty(ConvertUtility.ToString(dr["ProductImage"])))
                    {
                        JsonImage += string.Format(@"{{""Name"":""{0}"", ""Path"":""/upload/img/{0}"", ""Size"":0}}", ConvertUtility.ToString(dr["ProductImage"]));
                        CountJson++;
                    }

                    using (var db3 = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayhutbui_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
                    {
                        string sqlImage = "Select * from CMRC_ImageGallery Where ProductID=" + ConvertUtility.ToString(dr["ProductID"]) + " order by SortOrder";
                        DataTable dtImage = db3.ExecuteSqlDataTable(sqlImage);
                        if (Utils.CheckExist_DataTable(dtImage))
                        {
                            foreach (DataRow drImage in dtImage.Rows)
                            {
                                if (CountJson > 0)
                                    JsonImage += ",";
                                JsonImage += string.Format(@"{{""Name"":""{0}"", ""Path"":""/upload/images/anhphusp/{0}"", ""Size"":0}}", ConvertUtility.ToString(drImage["ImgName"]));
                            }
                        }
                    }
                    JsonImage += "]";


                    hashtable["Gallery"] = JsonImage;

                    hashtable["VideoGallery"] = Utils.KillChars(Request.Form["videogallery"]);
                    hashtable["MetaTitle"] = ConvertUtility.ToString(dr["SEOTitle"]);
                    hashtable["MetaKeyword"] = ConvertUtility.ToString(dr["SEOKeyword"]);
                    hashtable["MetaDescription"] = ConvertUtility.ToString(dr["SEODescription"]);
                    hashtable["Temp_CategoryID"] = Utils.KillChars(Request.Form["temp_categoryid"]);
                    hashtable["Temp_ParentCategoryID"] = Utils.KillChars(Request.Form["temp_parentcategoryid"]);
                    hashtable["Temp_GrandFatherCategoryID"] = Utils.KillChars(Request.Form["temp_grandfathercategoryid"]);
                    hashtable["SchemaBestRating"] = 100;
                    hashtable["SchemaRatingValue"] = Utils.RandomNumber(92, 100);
                    hashtable["SchemaRatingCount"] = Utils.RandomNumber(200, 3000);



                    using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQuery1 = @"INSERT INTO [dbo].[tblProducts] ([ID],[Name],[NameUnsign],[ModelNumber],[FriendlyUrl],[Price],[Price1],[Warranty],[Sort],[Sort1],[Sort2],[AttrProductFlag],[ProductStatusFlag],[ProductVATFlag],[Hide],[FriendlyUrlCategory],[CategoryIDList],[CategoryNameList],[CategoryUrlList],[CategoryIDParentList],[AttributesIDList],[AttributesUrlList],[AttributeConfigIDList],[AttributeConfigUrlList],[TagIDList],[TagNameList],[TagUrlList],[HashTagIDList],[HashTagNameList],[HashTagUrlList],[ManufacturerID],[ManufacturerName],[Description],[LongDescription],[Gift],[Tab1],[Tab2],[Tab3],[Image],[Gallery],[VideoGallery],[MetaTitle],[MetaKeyword],[MetaDescription],[CreatedDate],[EditedDate],[CreatedBy],[EditedBy],[Temp_CategoryID],[Temp_ParentCategoryID],[Temp_GrandFatherCategoryID],[SchemaBestRating],[SchemaRatingValue],[SchemaRatingCount]) OUTPUT INSERTED.ID VALUES (@ID,@Name,@NameUnsign,@ModelNumber,@FriendlyUrl,@Price,@Price1,@Warranty,@Sort,@Sort1,@Sort2,@AttrProductFlag,@ProductStatusFlag,@ProductVATFlag,@Hide,@FriendlyUrlCategory,@CategoryIDList,@CategoryNameList,@CategoryUrlList,@CategoryIDParentList,@AttributesIDList,@AttributesUrlList,@AttributeConfigIDList,@AttributeConfigUrlList,@TagIDList,@TagNameList,@TagUrlList,@HashTagIDList,@HashTagNameList,@HashTagUrlList,@ManufacturerID,@ManufacturerName,@Description,@LongDescription,@Gift,@Tab1,@Tab2,@Tab3,@Image,@Gallery,@VideoGallery,@MetaTitle,@MetaKeyword,@MetaDescription,@CreatedDate,@EditedDate,@CreatedBy,@EditedBy,@Temp_CategoryID,@Temp_ParentCategoryID,@Temp_GrandFatherCategoryID,@SchemaBestRating,@SchemaRatingValue,@SchemaRatingCount)";

                        db.AddParameter("@ID", System.Data.SqlDbType.Int, hashtable["ID"].ToString());
                        db.AddParameter("@Name", System.Data.SqlDbType.NVarChar, hashtable["Name"].ToString());
                        db.AddParameter("@NameUnsign", System.Data.SqlDbType.NVarChar, hashtable["NameUnsign"].ToString());
                        db.AddParameter("@ModelNumber", System.Data.SqlDbType.NVarChar, hashtable["ModelNumber"].ToString());
                        db.AddParameter("@FriendlyUrl", System.Data.SqlDbType.NVarChar, hashtable["FriendlyUrl"].ToString());
                        db.AddParameter("@Price", System.Data.SqlDbType.Money, hashtable["Price"].ToString());
                        db.AddParameter("@Price1", System.Data.SqlDbType.Money, hashtable["Price1"].ToString());
                        db.AddParameter("@Warranty", System.Data.SqlDbType.NVarChar, hashtable["Warranty"].ToString());
                        db.AddParameter("@Sort", System.Data.SqlDbType.Int, hashtable["Sort"].ToString());
                        db.AddParameter("@Sort1", System.Data.SqlDbType.Int, hashtable["Sort1"].ToString());
                        db.AddParameter("@Sort2", System.Data.SqlDbType.Int, hashtable["Sort2"].ToString());
                        db.AddParameter("@AttrProductFlag", System.Data.SqlDbType.Int, hashtable["AttrProductFlag"].ToString());
                        db.AddParameter("@ProductStatusFlag", System.Data.SqlDbType.Int, hashtable["ProductStatusFlag"].ToString());
                        db.AddParameter("@ProductVATFlag", System.Data.SqlDbType.Int, hashtable["ProductVATFlag"].ToString());
                        db.AddParameter("@Hide", System.Data.SqlDbType.Bit, hashtable["Hide"].ToString());
                        db.AddParameter("@FriendlyUrlCategory", System.Data.SqlDbType.NVarChar, hashtable["FriendlyUrlCategory"].ToString());
                        db.AddParameter("@CategoryIDList", System.Data.SqlDbType.NVarChar, hashtable["CategoryIDList"].ToString());
                        db.AddParameter("@CategoryNameList", System.Data.SqlDbType.NVarChar, hashtable["CategoryNameList"].ToString());
                        db.AddParameter("@CategoryUrlList", System.Data.SqlDbType.NVarChar, hashtable["CategoryUrlList"].ToString());
                        db.AddParameter("@CategoryIDParentList", System.Data.SqlDbType.NVarChar, hashtable["CategoryIDParentList"].ToString());
                        db.AddParameter("@AttributesIDList", System.Data.SqlDbType.NVarChar, hashtable["AttributesIDList"].ToString());
                        db.AddParameter("@AttributesUrlList", System.Data.SqlDbType.NVarChar, hashtable["AttributesUrlList"].ToString());
                        db.AddParameter("@AttributeConfigIDList", System.Data.SqlDbType.NVarChar, hashtable["AttributeConfigIDList"].ToString());
                        db.AddParameter("@AttributeConfigUrlList", System.Data.SqlDbType.NVarChar, hashtable["AttributeConfigUrlList"].ToString());
                        db.AddParameter("@TagIDList", System.Data.SqlDbType.NVarChar, hashtable["TagIDList"].ToString());
                        db.AddParameter("@TagNameList", System.Data.SqlDbType.NVarChar, hashtable["TagNameList"].ToString());
                        db.AddParameter("@TagUrlList", System.Data.SqlDbType.NVarChar, hashtable["TagUrlList"].ToString());
                        db.AddParameter("@HashTagIDList", System.Data.SqlDbType.NVarChar, hashtable["HashTagIDList"].ToString());
                        db.AddParameter("@HashTagNameList", System.Data.SqlDbType.NVarChar, hashtable["HashTagNameList"].ToString());
                        db.AddParameter("@HashTagUrlList", System.Data.SqlDbType.NVarChar, hashtable["HashTagUrlList"].ToString());
                        db.AddParameter("@ManufacturerID", System.Data.SqlDbType.NVarChar, hashtable["ManufacturerID"].ToString());
                        db.AddParameter("@ManufacturerName", System.Data.SqlDbType.NVarChar, hashtable["ManufacturerName"].ToString());
                        db.AddParameter("@Description", System.Data.SqlDbType.NVarChar, hashtable["Description"].ToString());
                        db.AddParameter("@LongDescription", System.Data.SqlDbType.NVarChar, hashtable["LongDescription"].ToString());
                        db.AddParameter("@Gift", System.Data.SqlDbType.NVarChar, hashtable["Gift"].ToString());
                        db.AddParameter("@Tab1", System.Data.SqlDbType.NVarChar, hashtable["Tab1"].ToString());
                        db.AddParameter("@Tab2", System.Data.SqlDbType.NVarChar, hashtable["Tab2"].ToString());
                        db.AddParameter("@Tab3", System.Data.SqlDbType.NVarChar, hashtable["Tab3"].ToString());
                        db.AddParameter("@Image", System.Data.SqlDbType.NVarChar, hashtable["Image"].ToString());
                        db.AddParameter("@Gallery", System.Data.SqlDbType.NVarChar, hashtable["Gallery"].ToString());
                        db.AddParameter("@VideoGallery", System.Data.SqlDbType.NVarChar, hashtable["VideoGallery"].ToString());
                        db.AddParameter("@MetaTitle", System.Data.SqlDbType.NVarChar, hashtable["MetaTitle"].ToString());
                        db.AddParameter("@MetaKeyword", System.Data.SqlDbType.NVarChar, hashtable["MetaKeyword"].ToString());
                        db.AddParameter("@MetaDescription", System.Data.SqlDbType.NVarChar, hashtable["MetaDescription"].ToString());
                        db.AddParameter("@EditedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                        db.AddParameter("@EditedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);
                        db.AddParameter("@Temp_CategoryID", System.Data.SqlDbType.Int, hashtable["Temp_CategoryID"].ToString());
                        db.AddParameter("@Temp_ParentCategoryID", System.Data.SqlDbType.Int, hashtable["Temp_ParentCategoryID"].ToString());
                        db.AddParameter("@Temp_GrandFatherCategoryID", System.Data.SqlDbType.Int, hashtable["Temp_GrandFatherCategoryID"].ToString());
                        db.AddParameter("@SchemaBestRating", System.Data.SqlDbType.Int, hashtable["SchemaBestRating"].ToString());
                        db.AddParameter("@SchemaRatingValue", System.Data.SqlDbType.Int, hashtable["SchemaRatingValue"].ToString());
                        db.AddParameter("@SchemaRatingCount", System.Data.SqlDbType.Int, hashtable["SchemaRatingCount"].ToString());
                        db.AddParameter("@CreatedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                        db.AddParameter("@CreatedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);

                        db.ExecuteSql(sqlQuery1);
                    }
                }
            }
        }


    }



    protected void ProductPrice_Click(object sender, EventArgs e)
    {
        DataTable dtReturn = null;
        using (var db = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayhutbui_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        {
            string sqlQuery = @"select * from CMRC_Products Where ProductID=856 order by ProductID DESC";
            dtReturn = db.ExecuteSqlDataTable(sqlQuery);

            if (Utils.CheckExist_DataTable(dtReturn))
            {
                int count = 0;
                foreach (DataRow dr in dtReturn.Rows)
                {
                    count++;

                    DataTable dtRegion1 = null;
                    decimal giaphiabac = 0;
                    decimal giaphiabac1 = 0;

                    string sqlRegion1 = string.Format("Select * from CMRC_ProductByRegion where ProductID={0} And RegionID=1", dr["ProductID"]);
                    dtRegion1 = db.ExecuteSqlDataTable(sqlRegion1);
                    if (Utils.CheckExist_DataTable(dtRegion1))
                    {
                        giaphiabac = ConvertUtility.ToDecimal(dtRegion1.Rows[0]["Price"]);
                        giaphiabac1 = ConvertUtility.ToDecimal(dtRegion1.Rows[0]["Price1"]);
                    }

                    if (giaphiabac == 0)
                    {
                        giaphiabac = ConvertUtility.ToDecimal(dr["Price"]);
                        giaphiabac1 = ConvertUtility.ToDecimal(dr["Price1"]);
                    }

                    DataTable dtRegion2 = null;
                    decimal giaphianam = 0;
                    decimal giaphianam1 = 0;
                    string sqlRegion2 = string.Format("Select * from CMRC_ProductByRegion where ProductID={0} And RegionID=2", dr["ProductID"]);
                    dtRegion2 = db.ExecuteSqlDataTable(sqlRegion2);
                    if (Utils.CheckExist_DataTable(dtRegion2))
                    {
                        giaphianam = ConvertUtility.ToDecimal(dtRegion2.Rows[0]["Price"]);
                        giaphianam1 = ConvertUtility.ToDecimal(dtRegion2.Rows[0]["Price1"]);
                    }

                    if (giaphianam == 0)
                    {
                        giaphianam = ConvertUtility.ToDecimal(dr["Price"]);
                        giaphianam1 = ConvertUtility.ToDecimal(dr["Price1"]);
                    }
                    //Response.Write(string.Format("{0}  =====   {1} =====  {2} ===== {3} <br />", dr["ModelName"], giaphiabac, giaphianam, dr["Price"]));

                    if (giaphiabac == 0)
                        giaphiabac = giaphianam;
                    if (giaphianam == 0)
                        giaphianam = giaphiabac;

                    decimal FinalPrice = giaphiabac;
                    if (giaphianam > giaphiabac)
                        FinalPrice = giaphianam;

                    decimal FinalPrice1 = giaphiabac1;
                    if (giaphianam1 > giaphiabac1)
                        FinalPrice1 = giaphianam1;

                    using (var dbx = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQuery1 = "Update tblProducts Set Price=@Price, Price1=@Price1 Where ID=@ID AND EditedDate>'2022-12-22 19:11:42.183'";
                        dbx.AddParameter("@Price", System.Data.SqlDbType.Decimal, FinalPrice);
                        dbx.AddParameter("@Price1", System.Data.SqlDbType.Decimal, FinalPrice1);
                        dbx.AddParameter("@ID", System.Data.SqlDbType.Int, dr["ProductID"]);


                        dbx.ExecuteSql(sqlQuery1);
                    }
                }
            }
        }
    }

    protected void btnTagCloud_Click(object sender, EventArgs e)
    {
        DataTable dt = null;
        using (var db = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayhutbui_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        {
            string sqlQuery = @"select * from CMRC_TagCloud order by TagCloudID ASC";
            dt = db.ExecuteSqlDataTable(sqlQuery);
            if (Utils.CheckExist_DataTable(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string NewID = "10" + ConvertUtility.ToString(dr["TagCloudID"]);
                    using (var dbx = SqlService.GetSqlService())
                    {
                        string sqlQuery1 = @"INSERT INTO [dbo].[tblCategories] ([ID],[Name],[FriendlyUrl],[MetaTitle],[MetaKeyword],[MetaDescription],[CreatedDate],[EditedDate],[Moduls]) OUTPUT INSERTED.ID VALUES (@ID,@Name,@FriendlyUrl,@MetaTitle,@MetaKeyword,@MetaDescription,@CreatedDate,@EditedDate,@Moduls)";
                        dbx.AddParameter("@ID", System.Data.SqlDbType.Int, NewID);
                        dbx.AddParameter("@Name", System.Data.SqlDbType.NVarChar, dr["Name"].ToString());
                        dbx.AddParameter("@FriendlyUrl", System.Data.SqlDbType.NVarChar, dr["Alias"].ToString());
                        dbx.AddParameter("@MetaTitle", System.Data.SqlDbType.NVarChar, dr["Name"].ToString());
                        dbx.AddParameter("@MetaKeyword", System.Data.SqlDbType.NVarChar, dr["MetaKeywords"].ToString());
                        dbx.AddParameter("@MetaDescription", System.Data.SqlDbType.NVarChar, dr["MetaDescription"].ToString());
                        dbx.AddParameter("@CreatedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                        dbx.AddParameter("@EditedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
                        dbx.AddParameter("@Moduls", System.Data.SqlDbType.NVarChar, "tag");
                        dbx.ExecuteSql(sqlQuery1);
                    }
                }
            }
        }
    }

    protected void btnArticleHide_Click(object sender, EventArgs e)
    {
        using (var db1 = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayhutbui_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        {
            string sqlQuery = @"Select ArticleID,Hide from CMRC_Article";
            DataTable dt = db1.ExecuteSqlDataTable(sqlQuery);
            if (Utils.CheckExist_DataTable(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    Hashtable hashtable = new Hashtable();
                    hashtable["Hide"] = dr["Hide"].ToString();
                    hashtable["ID"] = dr["ArticleID"].ToString();

                    using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQuery1 = @"Update tblArticle set Hide=@Hide Where ID=@ID";
                        db.AddParameter("@ID", System.Data.SqlDbType.Int, hashtable["ID"].ToString());
                        db.AddParameter("@Hide", System.Data.SqlDbType.Bit, hashtable["Hide"].ToString());
                        db.ExecuteSql(sqlQuery1);
                    }
                }
            }
        }
    }
}