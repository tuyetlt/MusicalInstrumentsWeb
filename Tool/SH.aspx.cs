using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tool_SH : System.Web.UI.Page
{
    string otherConn = "Data Source=14.225.17.150;Initial Catalog=mayhutbui_db;User ID=sa;Password=Ncbhtnvdt$$@@110";
    string mainConn = "Data Source=14.225.17.150;Initial Catalog=mayvesinh_db;User ID=sa;Password=Ncbhtnvdt$$@@110";
    protected void Page_Load(object sender, EventArgs e)
    {
        GetTag();
        //GetTagProduct();
    }

    protected void GetTagProduct()
    {
        string sqlQuery = @"SELECT * FROM CMRC_Products";

        using (var dbx = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString(otherConn))
        {
            DataTable dtTable = dbx.ExecuteSqlDataTable(sqlQuery);
            if (Utils.CheckExist_DataTable(dtTable))
            {
                foreach (DataRow drTable in dtTable.Rows)
                {
                    string TagsHTML = drTable["TagsHTML"].ToString();
                    string[] Arr = TagsHTML.Trim(',').Split(',');
                    string TagUrlList = "";
                    string TagNameList = "";
                    string TagIDList = "";

                    if (Arr != null && Arr.Length > 0)
                    {
                        foreach (string a in Arr)
                        {
                            string furl = TextChanger.Translate(a, "-");
                            furl = furl.Trim();
                            sqlQuery = string.Format("Select Top 1 ID,FriendlyUrl, Name From tblCategories where FriendlyUrl = N'{0}'", furl);
                            using (var db = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString(mainConn))
                            {
                                DataTable dtTag = db.ExecuteSqlDataTable(sqlQuery);
                                if (Utils.CheckExist_DataTable(dtTag))
                                {
                                    DataRow dr = dtTag.Rows[0];
                                    TagNameList += dr["Name"].ToString() + ",";
                                    TagUrlList += dr["FriendlyUrl"].ToString() + ",";
                                    TagIDList += dr["ID"].ToString() + ",";
                                }
                            }
                        }
                    }

                    string filterCategory = "";
                    if (ConvertUtility.ToInt32(drTable["CategoryID"]) > 0)
                        filterCategory = "ID=" + drTable["CategoryID"];

                    if (ConvertUtility.ToInt32(drTable["ParentCategoryID"]) > 0)
                    {
                        if (!string.IsNullOrEmpty(filterCategory))
                            filterCategory += " OR ";
                        filterCategory += "ID=" + drTable["ParentCategoryID"];
                    }

                    if (ConvertUtility.ToInt32(drTable["GrandFatherCategoryID"]) > 0)
                    {
                        if (!string.IsNullOrEmpty(filterCategory))
                            filterCategory += " OR ";
                        filterCategory += "ID=" + drTable["GrandFatherCategoryID"];
                    }


                    string CategoryUrlList = "";
                    string CategoryNameList = "";

                    sqlQuery = string.Format("Select Top 1 ID,FriendlyUrl, Name From tblCategories where {0}", filterCategory);
                    using (var db = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString(mainConn))
                    {
                        DataTable dtTag = db.ExecuteSqlDataTable(sqlQuery);
                        if (Utils.CheckExist_DataTable(dtTag))
                        {
                            DataRow dr = dtTag.Rows[0];
                            CategoryUrlList += dr["FriendlyUrl"].ToString() + ",";
                            CategoryNameList += dr["Name"].ToString() + ",";
                        }
                    }
                    

                    TagNameList = Utils.CommaSQLAdd(TagNameList);
                    TagUrlList = Utils.CommaSQLAdd(TagUrlList);
                    TagIDList = Utils.CommaSQLAdd(TagIDList);
                    CategoryNameList = Utils.CommaSQLAdd(CategoryNameList);
                    CategoryUrlList = Utils.CommaSQLAdd(CategoryUrlList);

                    string CategoryIDList = Utils.CommaSQLAdd(drTable["CategoryID"].ToString());
                    string CategoryIDParentList = Utils.CommaSQLAdd(drTable["ParentCategoryID"].ToString() + "," + drTable["GrandFatherCategoryID"].ToString());

                    string Gallery = string.Format(@"[{{""Name"":""{0}"",""Path"":""/upload/img/{0}"",""Size"":""100""}}]", drTable["ProductImage"]);

                    sqlQuery = string.Format(@"insert into tblProducts (ID,CategoryIDList,CategoryIDParentList,[Name],NameUnsign,FriendlyUrl, Gallery, TagNameList, TagUrlList, TagIDList,CategoryNameList,CategoryUrlList, FriendlyUrlCategory, ModelNumber)
                                values({0},N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',N'{6}',N'{7}',N'{8}',N'{9}', N'{10}', N'{11}', N'{12}', N'{13}')",
                                drTable["ProductID"], CategoryIDList, CategoryIDParentList, drTable["ModelName"], drTable["ModelNameUnsigned"], drTable["FriendlyUrl"], Gallery, TagNameList, TagUrlList, TagIDList, CategoryNameList, CategoryUrlList, drTable["Moduls"], drTable["ModelNumber"]);
                    using (var db = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString(mainConn))
                    {
                        db.ExecuteSql(sqlQuery);
                    }
                }
            }
        }
    }


    protected void GetTag()
    {
        string sqlQuery = @"Select ModelName,FriendlyUrl, ModelNameUnsigned,ProductImage,Description, LongDescription, SEODescription, SEOTitle,Warranty from CMRC_Products where CategoryID in (1238,1239,1240,1241,1242,1243,1244,1245,1246,1247)";

        using (var dbx = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString(otherConn))
        {
            DataTable dtTable = dbx.ExecuteSqlDataTable(sqlQuery);
            if (Utils.CheckExist_DataTable(dtTable))
            {
                foreach (DataRow drTable in dtTable.Rows)
                {
                   
                    sqlQuery = string.Format("insert into CMRC_Products (ModelName,FriendlyUrl, ModelNameUnsigned,ProductImage,Description, LongDescription, SEODescription, SEOTitle,Warranty,ParentCategoryID) values(N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}', N'{6}',N'{7}', N'{8}',218)", drTable[0], drTable[1], drTable[2], drTable[3], drTable[4], drTable[5], drTable[6], drTable[7], drTable[8]);
                    using (var db = MetaNET.DataHelper.SqlService.GetSqlServiceFromConnectionString(mainConn))
                    {
                        db.ExecuteSql(sqlQuery);
                    }
                }
            }
        }
    }
}