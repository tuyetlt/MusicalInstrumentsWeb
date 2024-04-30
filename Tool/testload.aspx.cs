using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MetaNET.DataHelper;


public partial class Tool_testload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GenSitemap.SitemapUpdate();
        }
        //DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "*", "Moduls='category'", "Sort");
        //if (Utils.CheckExist_DataTable(dt))
        //{
        //    string moduls = "";
        //    string sqlQuery = "";

        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        //Utils.CreateCategoryLink
        //        int FlagInt = ConvertUtility.ToInt32(dr["LinkTypeMenuFlag"]);
        //        string UrlStr = ConvertUtility.ToString(dr["FriendlyUrl"]);
        //        string Link = ConvertUtility.ToString(dr["Link"]);
        //        string strReturn = string.Empty;

        //        if (FlagInt == (int)LinkTypeMenuFlag.Article)
        //        {
        //            moduls = "category_article";
        //        }
        //        else if (FlagInt == (int)LinkTypeMenuFlag.Product || FlagInt == (int)LinkTypeMenuFlag.None)
        //        {
        //            moduls = "category_product";
        //        }
        //        else if (FlagInt == (int)LinkTypeMenuFlag.Content)
        //        {
        //            moduls = "category_content";
        //        }
        //        else if (FlagInt == (int)LinkTypeMenuFlag.Link)
        //        {
        //            moduls = "category_link";
        //        }

        //        System.Collections.Hashtable hashtable = new System.Collections.Hashtable();

        //        hashtable["Name"] = dr["Name"].ToString();
        //        hashtable["FriendlyUrl"] = dr["FriendlyUrl"].ToString();
        //        hashtable["Moduls"] = moduls;
        //        hashtable["ContentID"] = dr["ID"].ToString();
        //        hashtable["CreatedDate"] = dr["CreatedDate"].ToString();
        //        hashtable["EditedDate"] = dr["EditedDate"].ToString();
        //        hashtable["CreatedBy"] = dr["CreatedBy"].ToString();
        //        hashtable["EditedBy"] = dr["EditedBy"].ToString();


        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //        {
        //            sqlQuery = @"INSERT INTO [dbo].[tblUrl]([Name],[FriendlyUrl],[Moduls],[ContentID],[CreatedDate],[EditedDate],[CreatedBy],[EditedBy]) OUTPUT INSERTED.ID VALUES (@Name,@FriendlyUrl,@Moduls,@ContentID,@CreatedDate,@EditedDate,@CreatedBy,@EditedBy)";

        //            db.AddParameter("@Name", System.Data.SqlDbType.NVarChar, hashtable["Name"].ToString());
        //            db.AddParameter("@FriendlyUrl", System.Data.SqlDbType.NVarChar, hashtable["FriendlyUrl"].ToString());
        //            db.AddParameter("@Moduls", System.Data.SqlDbType.NVarChar, hashtable["Moduls"].ToString());
        //            db.AddParameter("@ContentID", System.Data.SqlDbType.Int, hashtable["ContentID"].ToString());
        //            db.AddParameter("@CreatedDate", System.Data.SqlDbType.DateTime, hashtable["CreatedDate"].ToString());
        //            db.AddParameter("@EditedDate", System.Data.SqlDbType.DateTime, hashtable["EditedDate"].ToString());
        //            db.AddParameter("@CreatedBy", System.Data.SqlDbType.Int, hashtable["CreatedBy"].ToString());
        //            db.AddParameter("@EditedBy", System.Data.SqlDbType.Int, hashtable["EditedBy"].ToString());

        //            db.ExecuteSql(sqlQuery);
        //        }


        //        //sqlQuery += string.Format("INSERT INTO tblUrl (Name, FriendlyUrl, CreatedDate, EditedDate, EditedBy, CreatedBy, ContentID, Moduls) SELECT Name, FriendlyUrl, CreatedDate, EditedDate, EditedBy, CreatedBy, ID AS ContentID, '{0}' AS Moduls FROM tblCategories where Moduls='category'\n<br />", moduls);
                
        //    }
        //    ltr.Text = sqlQuery;

        //}
    }
}