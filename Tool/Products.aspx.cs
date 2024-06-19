using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Threading;
using System.Text;
public partial class Tool_Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        DataTable dt = SqlHelper.SQLToDataTable("tblProducts", "ID,Name", "", "ID DESC");
        if (Utils.CheckExist_DataTable(dt))
        {
            foreach (DataRow drProduct in dt.Rows)
            {

                using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                {
                    string sqlQuery = @"UPDATE [dbo].[tblProducts] SET  [FriendlyUrl]=@FriendlyUrl WHERE [ID] = @ID";
                    db.AddParameter("@ID", System.Data.SqlDbType.NVarChar, drProduct["ID"].ToString());
                    db.AddParameter("@FriendlyUrl", System.Data.SqlDbType.NVarChar, TextChanger.Translate(drProduct["Name"].ToString(), "-"));
                    db.ExecuteSql(sqlQuery);
                }
            }
        }



        //DataTable dt = SqlHelper.SQLToDataTable("tblProducts", "ID", "", "ID DESC");
        //if (Utils.CheckExist_DataTable(dt))
        //{
        //    foreach (DataRow drProduct in dt.Rows)
        //    {

        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //        {
        //            string sqlQuery = @"UPDATE [dbo].[tblProducts] SET  [SchemaBestRating]=@SchemaBestRating, [SchemaRatingValue]=@SchemaRatingValue, [SchemaRatingCount]=@SchemaRatingCount WHERE [ID] = @ID";


        //            db.AddParameter("@ID", System.Data.SqlDbType.NVarChar, drProduct["ID"].ToString());
        //            db.AddParameter("@SchemaBestRating", System.Data.SqlDbType.Int, 100);
        //            db.AddParameter("@SchemaRatingValue", System.Data.SqlDbType.Int, Utils.RandomNumber(92, 100));
        //            db.AddParameter("@SchemaRatingCount", System.Data.SqlDbType.Int, Utils.RandomNumber(200, 3000));
        //            db.ExecuteSql(sqlQuery);

        //            Thread.Sleep(100);
        //        }
        //    }
        //}

        //DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID", "", "ID DESC");
        //if (Utils.CheckExist_DataTable(dt))
        //{
        //    foreach (DataRow drProduct in dt.Rows)
        //    {

        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //        {
        //            string sqlQuery = @"UPDATE [dbo].[tblCategories] SET  [SchemaBestRating]=@SchemaBestRating, [SchemaRatingValue]=@SchemaRatingValue, [SchemaRatingCount]=@SchemaRatingCount WHERE [ID] = @ID";


        //            db.AddParameter("@ID", System.Data.SqlDbType.NVarChar, drProduct["ID"].ToString());
        //            db.AddParameter("@SchemaBestRating", System.Data.SqlDbType.Int, 100);
        //            db.AddParameter("@SchemaRatingValue", System.Data.SqlDbType.Int, Utils.RandomNumber(92, 100));
        //            db.AddParameter("@SchemaRatingCount", System.Data.SqlDbType.Int, Utils.RandomNumber(200, 3000));
        //            db.ExecuteSql(sqlQuery);

        //            Thread.Sleep(100);
        //        }
        //    }
        //}



        //DataTable dt = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "ID", "", "ID DESC");
        //if (Utils.CheckExist_DataTable(dt))
        //{
        //    foreach (DataRow drProduct in dt.Rows)
        //    {

        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //        {
        //            string sqlQuery = @"UPDATE [dbo].[tblArticle] SET  [SchemaBestRating]=@SchemaBestRating, [SchemaRatingValue]=@SchemaRatingValue, [SchemaRatingCount]=@SchemaRatingCount WHERE [ID] = @ID";


        //            db.AddParameter("@ID", System.Data.SqlDbType.NVarChar, drProduct["ID"].ToString());
        //            db.AddParameter("@SchemaBestRating", System.Data.SqlDbType.Int, 100);
        //            db.AddParameter("@SchemaRatingValue", System.Data.SqlDbType.Int, Utils.RandomNumber(92, 100));
        //            db.AddParameter("@SchemaRatingCount", System.Data.SqlDbType.Int, Utils.RandomNumber(20, 100));
        //            db.ExecuteSql(sqlQuery);

        //            Thread.Sleep(100);
        //        }
        //    }
        //}




        //DataTable dt = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "ID, Description", "", "ID DESC");
        //if (Utils.CheckExist_DataTable(dt))
        //{
        //    foreach (DataRow drProduct in dt.Rows)
        //    {

        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=nhaccutiendat2020_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        //        {
        //            string sqlQuery = @"update tblArticle set Description=@Des where ID=@ID";


        //            db.AddParameter("@ID", System.Data.SqlDbType.Int, drProduct["ID"].ToString());
        //            db.AddParameter("@Des", System.Data.SqlDbType.NVarChar, drProduct["Description"].ToString());
        //            db.ExecuteSql(sqlQuery);

        //            //Thread.Sleep(10);
        //        }
        //    }
        //}


        //DataTable dtP = SqlHelper.SQLToDataTable("tblProducts", "ID,CategoryIDList", "", "ID DESC");
        //if (Utils.CheckExist_DataTable(dtP))
        //{
        //    DataRow dr;
        //    DataTable dt;
        //    int CategoryID = 0;
        //    foreach (DataRow drP in dtP.Rows)
        //    {
        //        string[] cateList = ConvertUtility.ToString(drP["CategoryIDList"]).Trim(',').Split(',');
        //        if (cateList != null && cateList.Length > 0)
        //        {
        //            CategoryID = ConvertUtility.ToInt32(ConvertUtility.ToInt32(cateList[0]));
        //        }

        //        if (CategoryID > 0)
        //        {
        //            Stack<BreadCrumb> bcList = new Stack<BreadCrumb>();

        //            dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID, ParentID, LinkTypeMenuFlag, FriendlyUrl, Name, Link", string.Format("ID='{0}' AND {1}", CategoryID, Utils.CreateFilterHide), "Sort");
        //            if (Utils.CheckExist_DataTable(dt))
        //            {
        //                dr = dt.Rows[0];

        //                //add thêm thằng hiện tại
        //                BreadCrumb bcCurrent = new BreadCrumb();
        //                bcCurrent.Link = Utils.CreateCategoryLink(dr["LinkTypeMenuFlag"], dr["FriendlyUrl"], dr["Link"]);
        //                bcCurrent.Name = ConvertUtility.ToString(dr["Name"]);
        //                bcCurrent.ID = ConvertUtility.ToString(dr["ID"]);
        //                bcList.Push(bcCurrent);


        //                int countP = 0;
        //                DataRow drRoot = dr;
        //                int RootID = ConvertUtility.ToInt32(drRoot["ID"]);
        //                do
        //                {

        //                    if (ConvertUtility.ToInt32(drRoot["ParentID"]) > 0)
        //                    {
        //                        countP = countP + 1;
        //                        DataTable dtRoot = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID, ParentID, LinkTypeMenuFlag, FriendlyUrl, Name, Link", string.Format("ID={0}", drRoot["ParentID"]), "Sort");
        //                        if (Utils.CheckExist_DataTable(dtRoot))
        //                        {
        //                            drRoot = dtRoot.Rows[0];
        //                            RootID = ConvertUtility.ToInt32(drRoot["ID"]);

        //                            BreadCrumb bc = new BreadCrumb();
        //                            bc.Link = Utils.CreateCategoryLink(drRoot["LinkTypeMenuFlag"], drRoot["FriendlyUrl"], drRoot["Link"]);
        //                            bc.Name = ConvertUtility.ToString(drRoot["Name"]);
        //                            bc.ID = ConvertUtility.ToString(drRoot["ID"]);
        //                            bcList.Push(bc);
        //                        }
        //                        else
        //                            break;
        //                    }
        //                }
        //                while (ConvertUtility.ToInt32(drRoot["ParentID"]) > 0 && countP <= 5);
        //            }

        //            // Product type GoogleShopping

        //            StringBuilder sb = new StringBuilder();

        //            if (bcList != null && bcList.Count > 0)
        //            {
        //                int countPT = 0;

        //                foreach (BreadCrumb bc in bcList)
        //                {
        //                    countPT++;
        //                    sb.Append(bc.Name);

        //                    if (countPT < bcList.Count)
        //                        sb.Append(" > ");
        //                }
        //            }

        //            using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //            {
        //                string sqlQuery = @"UPDATE [dbo].[tblProducts] SET [ProductType]=@ProductType WHERE [ID] = @ID";
        //                db.AddParameter("@ID", System.Data.SqlDbType.NVarChar, drP["ID"].ToString());
        //                db.AddParameter("@ProductType", System.Data.SqlDbType.NVarChar, sb.ToString());
        //                db.ExecuteSql(sqlQuery);
        //                //Thread.Sleep(100);
        //            }
        //        }
        //    }
        //}




        //using (var db1 = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString("Data Source=14.225.17.150;Initial Catalog=mayvesinh_db;User ID=sa;Password=Ncbhtnvdt$$@@110"))
        //{
        //    string sqlQuery = @"Select * from CMRC_Article";
        //    DataTable dt = db1.ExecuteSqlDataTable(sqlQuery);
        //    if (Utils.CheckExist_DataTable(dt))
        //    {
        //        foreach (DataRow dr in dt.Rows)
        //        {
        //            Hashtable hashtable = new Hashtable();

        //            hashtable["ID"] = dr["ArticleID"].ToString();
        //            hashtable["Name"] = dr["Title"].ToString();
        //            hashtable["FriendlyUrl"] = dr["FriendlyUrl"].ToString();
        //            hashtable["FriendlyUrlCategory"] = Utils.KillChars(Request.Form["friendlyurlcategory"]);
        //            hashtable["NameUsign"] = Utils.KillChars(Request.Form["nameusign"]);
        //            hashtable["CategoryIDList"] = Utils.KillChars(Utils.CommaSQLAdd(Request.Form["categoryidlist"]));
        //            hashtable["CategoryNameList"] = "";
        //            hashtable["CategoryUrlList"] = "";
        //            hashtable["CategoryaIDParentList"] = "";

        //            hashtable["AttributesIDList"] = Utils.KillChars(Utils.CommaSQLAdd(Request.Form["attributesidlist"]));
        //            hashtable["AttributesUrlList"] = "";
        //            hashtable["AttributeConfigIDList"] = "";
        //            hashtable["AttributeConfigUrlList"] = "";

        //            hashtable["TagIDList"] = "";
        //            hashtable["TagNameList"] = "";
        //            hashtable["TagUrlList"] = "";

        //            hashtable["HashTagIDList"] = "";
        //            hashtable["HashTagNameList"] = "";
        //            hashtable["HashTagUrlList"] = "";

        //            hashtable["Description"] = dr["Description"].ToString();
        //            hashtable["LongDescription"] = dr["DetailContent"].ToString();
        //            hashtable["Tags"] = Utils.KillChars(Request.Form["tags"]);
        //            hashtable["Image"] = "";
        //            hashtable["Gallery"] = string.Format(@"[{{""Name"":""{0}"",""Path"":""/upload/article/{0}"",""Size"":0}}]", dr["Image"].ToString());

        //            hashtable["MetaTitle"] = dr["SeoTitle"].ToString();
        //            hashtable["MetaKeyword"] = dr["SeoKeyword"].ToString();
        //            hashtable["MetaDescription"] = dr["SeoDescription"].ToString();

        //            hashtable["StartDate"] = dr["CreatedDate"].ToString();
        //            hashtable["EndDate"] = DateUtil.GetMaxDateTime_IfNull(Request.Form["enddate"]);
        //            hashtable["Flags"] = "";
        //            hashtable["Sort"] = Utils.KillChars(Request.Form["sort"]);

        //            hashtable["Viewed"] = Utils.KillChars(Request.Form["viewed"]);
        //            hashtable["NewsRelatedIDList"] = Utils.KillChars(Request.Form["newsrelatedidlist"]);

        //            hashtable["SchemaBestRating"] = 100;

        //            int SchemaRatingValue = Utils.RandomNumber(92, 100);
        //            hashtable["SchemaRatingValue"] = SchemaRatingValue;

        //            int SchemaRatingCount = Utils.RandomNumber(20, 200);

        //            hashtable["SchemaRatingCount"] = SchemaRatingCount;
        //            hashtable["SchemaFAQ"] = Utils.KillChars(Request.Form["schemafaq"]);

        //            hashtable["Hide"] = false;

        //            using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //            {
        //                string sqlQuery1 = @"INSERT INTO [dbo].[tblArticle] ([ID],[Name],[FriendlyUrl],[FriendlyUrlCategory],[CategoryIDList],[CategoryNameList],[CategoryUrlList],[CategoryaIDParentList],[AttributesIDList],[AttributesUrlList],[AttributeConfigIDList],[AttributeConfigUrlList],[TagIDList],[TagNameList],[TagUrlList],[HashTagIDList],[HashTagNameList],[HashTagUrlList],[Description],[LongDescription],[StartDate],[EndDate],[Flags],[Hide],[Sort],[Viewed],[Tags],[Image],[Gallery],[MetaTitle],[MetaKeyword],[MetaDescription],[CreatedDate],[EditedDate],[CreatedBy],[EditedBy],[NameUsign],[NewsRelatedIDList],[SchemaBestRating],[SchemaRatingValue],[SchemaRatingCount],[SchemaFAQ]) OUTPUT INSERTED.ID VALUES (@ID, @Name,@FriendlyUrl,@FriendlyUrlCategory,@CategoryIDList,@CategoryNameList,@CategoryUrlList,@CategoryaIDParentList,@AttributesIDList,@AttributesUrlList,@AttributeConfigIDList,@AttributeConfigUrlList,@TagIDList,@TagNameList,@TagUrlList,@HashTagIDList,@HashTagNameList,@HashTagUrlList,@Description,@LongDescription,@StartDate,@EndDate,@Flags,@Hide,@Sort,@Viewed,@Tags,@Image,@Gallery,@MetaTitle,@MetaKeyword,@MetaDescription,@CreatedDate,@EditedDate,@CreatedBy,@EditedBy,@NameUsign,@NewsRelatedIDList,@SchemaBestRating,@SchemaRatingValue,@SchemaRatingCount,@SchemaFAQ)";
        //                db.AddParameter("@ID", System.Data.SqlDbType.NVarChar, hashtable["ID"].ToString());
        //                db.AddParameter("@Name", System.Data.SqlDbType.NVarChar, hashtable["Name"].ToString());
        //                db.AddParameter("@NameUsign", System.Data.SqlDbType.NVarChar, hashtable["NameUsign"].ToString());
        //                db.AddParameter("@FriendlyUrl", System.Data.SqlDbType.NVarChar, hashtable["FriendlyUrl"].ToString());
        //                db.AddParameter("@FriendlyUrlCategory", System.Data.SqlDbType.NVarChar, hashtable["FriendlyUrlCategory"].ToString());
        //                db.AddParameter("@CategoryIDList", System.Data.SqlDbType.NVarChar, hashtable["CategoryIDList"].ToString());
        //                db.AddParameter("@CategoryNameList", System.Data.SqlDbType.NVarChar, hashtable["CategoryNameList"].ToString());
        //                db.AddParameter("@CategoryUrlList", System.Data.SqlDbType.NVarChar, hashtable["CategoryUrlList"].ToString());
        //                db.AddParameter("@CategoryaIDParentList", System.Data.SqlDbType.NVarChar, hashtable["CategoryaIDParentList"].ToString());
        //                db.AddParameter("@AttributesIDList", System.Data.SqlDbType.NVarChar, hashtable["AttributesIDList"].ToString());
        //                db.AddParameter("@AttributesUrlList", System.Data.SqlDbType.NVarChar, hashtable["AttributesUrlList"].ToString());
        //                db.AddParameter("@AttributeConfigIDList", System.Data.SqlDbType.NVarChar, hashtable["AttributeConfigIDList"].ToString());
        //                db.AddParameter("@AttributeConfigUrlList", System.Data.SqlDbType.NVarChar, hashtable["AttributeConfigUrlList"].ToString());
        //                db.AddParameter("@Description", System.Data.SqlDbType.NVarChar, hashtable["Description"].ToString());
        //                db.AddParameter("@LongDescription", System.Data.SqlDbType.NVarChar, hashtable["LongDescription"].ToString());
        //                db.AddParameter("@TagIDList", System.Data.SqlDbType.NVarChar, hashtable["TagIDList"].ToString());
        //                db.AddParameter("@TagNameList", System.Data.SqlDbType.NVarChar, hashtable["TagNameList"].ToString());
        //                db.AddParameter("@TagUrlList", System.Data.SqlDbType.NVarChar, hashtable["TagUrlList"].ToString());
        //                db.AddParameter("@HashTagIDList", System.Data.SqlDbType.NVarChar, hashtable["HashTagIDList"].ToString());
        //                db.AddParameter("@HashTagNameList", System.Data.SqlDbType.NVarChar, hashtable["HashTagNameList"].ToString());
        //                db.AddParameter("@HashTagUrlList", System.Data.SqlDbType.NVarChar, hashtable["HashTagUrlList"].ToString());
        //                db.AddParameter("@NewsRelatedIDList", System.Data.SqlDbType.NVarChar, hashtable["NewsRelatedIDList"].ToString());
        //                db.AddParameter("@StartDate", System.Data.SqlDbType.DateTime, hashtable["StartDate"].ToString());
        //                db.AddParameter("@EndDate", System.Data.SqlDbType.DateTime, hashtable["EndDate"].ToString());
        //                db.AddParameter("@Flags", System.Data.SqlDbType.Int, hashtable["Flags"].ToString());
        //                db.AddParameter("@Hide", System.Data.SqlDbType.Bit, hashtable["Hide"].ToString());
        //                db.AddParameter("@Sort", System.Data.SqlDbType.Int, hashtable["Sort"].ToString());
        //                db.AddParameter("@Viewed", System.Data.SqlDbType.Int, hashtable["Viewed"].ToString());
        //                db.AddParameter("@Tags", System.Data.SqlDbType.NVarChar, hashtable["Tags"].ToString());
        //                db.AddParameter("@Image", System.Data.SqlDbType.NVarChar, hashtable["Image"].ToString());
        //                db.AddParameter("@Gallery", System.Data.SqlDbType.NVarChar, hashtable["Gallery"].ToString());
        //                db.AddParameter("@MetaTitle", System.Data.SqlDbType.NVarChar, hashtable["MetaTitle"].ToString());
        //                db.AddParameter("@MetaKeyword", System.Data.SqlDbType.NVarChar, hashtable["MetaKeyword"].ToString());
        //                db.AddParameter("@MetaDescription", System.Data.SqlDbType.NVarChar, hashtable["MetaDescription"].ToString());
        //                db.AddParameter("@EditedDate", System.Data.SqlDbType.DateTime, DateTime.Now);
        //                db.AddParameter("@EditedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);
        //                db.AddParameter("@SchemaBestRating", System.Data.SqlDbType.Int, hashtable["SchemaBestRating"].ToString());
        //                db.AddParameter("@SchemaRatingValue", System.Data.SqlDbType.Int, hashtable["SchemaRatingValue"].ToString());
        //                db.AddParameter("@SchemaRatingCount", System.Data.SqlDbType.Int, hashtable["SchemaRatingCount"].ToString());
        //                db.AddParameter("@SchemaFAQ", System.Data.SqlDbType.NVarChar, hashtable["SchemaFAQ"].ToString());
        //                db.AddParameter("@CreatedDate", System.Data.SqlDbType.DateTime, dr["CreatedDate"].ToString());
        //                db.AddParameter("@CreatedBy", System.Data.SqlDbType.Int, Page.User.Identity.Name);
        //                db.ExecuteSql(sqlQuery1);
        //            }
        //        }
        //    }
        //}
        //Response.Write(dt.Rows.Count);
    }

}
