using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tool_Tag : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DataTable dtP = SqlHelper.SQLToDataTable("CMRC_TagCloud", "", "", "TagCloudID");
        //if (Utils.CheckExist_DataTable(dtP))
        //{
        //    foreach (DataRow dr in dtP.Rows)
        //    {
        //        int ID = ConvertUtility.ToInt32(dr["TagCloudID"]);
        //        ID += 1000;
        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //        {
        //            string sqlQuery = @"INSERT INTO [dbo].[tblCategories] (ID, Name, FriendlyUrl, ParentID, Moduls, MetaTitle, MetaKeyword, MetaDescription) VALUES (@ID, @Name, @FriendlyUrl, @ParentID, @Moduls, @MetaTitle, @MetaKeyword, @MetaDescription)";
        //            db.AddParameter("@ID", System.Data.SqlDbType.Int, ID);
        //            db.AddParameter("@Name", System.Data.SqlDbType.NVarChar, dr["Name"].ToString());
        //            db.AddParameter("@FriendlyUrl", System.Data.SqlDbType.NVarChar, dr["Alias"].ToString());
        //            db.AddParameter("@ParentID", System.Data.SqlDbType.Int, 0);
        //            db.AddParameter("@Moduls", System.Data.SqlDbType.NVarChar, "tag");
        //            db.AddParameter("@MetaTitle", System.Data.SqlDbType.NVarChar, dr["MetaTitle"].ToString());
        //            db.AddParameter("@MetaKeyword", System.Data.SqlDbType.NVarChar, dr["MetaKeywords"].ToString());
        //            db.AddParameter("@MetaDescription", System.Data.SqlDbType.NVarChar, dr["MetaDescription"].ToString());
        //            db.ExecuteSql(sqlQuery);
        //        }
        //    }
        //}

        //DataTable dtP = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "TagIDList,ID", "", "ID");
        //if (Utils.CheckExist_DataTable(dtP))
        //{
        //    string result = "";
        //    foreach (DataRow dr in dtP.Rows)
        //    {
        //        if (dr["TagIDList"].ToString().Length > 2)
        //        {
        //            result = ",";

        //            string[] arr = dr["TagIDList"].ToString().Trim(',').Split(',');
        //            if (arr != null && arr.Length > 0)
        //            {
        //                foreach (string a in arr)
        //                {
        //                    int b = ConvertUtility.ToInt32(a);
        //                    b += 1000;
        //                    result += b + ",";
        //                }

        //                using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //                {
        //                    string sqlQuery = string.Format(@"UPDATE tblProducts set TagIDList='{0}' where ID={1}", result, dr["ID"].ToString());
        //                    db.ExecuteSql(sqlQuery);
        //                }
        //            }
        //        }
        //    }

        //    CacheUtility.PurgeCacheItems(C.PRODUCT_TABLE);
        //}


        //DataTable dtP = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "TagIDList,ID", "", "ID");
        //if (Utils.CheckExist_DataTable(dtP))
        //{
         
        //    foreach (DataRow dr in dtP.Rows)
        //    {
        //        string result = "";
        //        string Furl = "";

        //        if (dr["TagIDList"].ToString().Length > 2)
        //        {
                   
        //            DataTable dt = SqlHelper.SQLToDataTable("tblCategories", "Name, FriendlyUrl", string.Format("ID in ({0})", Utils.CommaSQLRemove(dr["TagIDList"].ToString())), "ID");
        //            if (Utils.CheckExist_DataTable(dt))
        //            {
        //                result = ",";
        //                Furl = ",";
        //                foreach (DataRow dr1 in dt.Rows)
        //                {
        //                    result += dr1["Name"] + ",";
        //                    Furl += dr1["FriendlyUrl"] + ",";
        //                }
        //            }
        //        }

        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //        {
        //            string sqlQuery = string.Format(@"UPDATE tblProducts set TagNameList=N'{0}', TagUrlList=N'{1}' where ID={2}", result, Furl, dr["ID"].ToString());
        //            db.ExecuteSql(sqlQuery);
        //        }
        //    }

        //    CacheUtility.PurgeCacheItems(C.PRODUCT_TABLE);
        //}
    }
}