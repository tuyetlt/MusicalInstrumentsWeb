﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tool_CountProductByCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string filter = string.Format("LinkTypeMenuFlag & {0} <> 0", (int)LinkTypeMenuFlag.Product);

        //DataTable dt = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "ID,Name,FriendlyUrl", "", "");
        //foreach (DataRow dr in dt.Rows)
        //{
        //    DataTable dtU = SqlHelper.SQLToDataTable("tblUrl", "", string.Format("FriendlyUrl=N'{0}'", dr["FriendlyUrl"]));
        //    if (!Utils.CheckExist_DataTable(dtU))
        //    {
        //        SqlHelper.Update_Url_Table(false, "article_detail", ConvertUtility.ToInt32(dr["ID"]), dr["Name"].ToString(), dr["FriendlyUrl"].ToString());
        //        Response.Write("ok - ");
        //    }
        //}



        //DataTable dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID,Name,FriendlyUrl", "", "");
        //foreach(DataRow drProduct in dtProduct.Rows)
        //{
        //    SqlHelper.Update_Url_Table(false, "product_detail", ConvertUtility.ToInt32(drProduct["ID"]), drProduct["Name"].ToString(), drProduct["FriendlyUrl"].ToString());
        //}

        //string filter = string.Format("(Hide is null OR Hide=0) AND LinkTypeMenuFlag & {0} <> 0", (int)LinkTypeMenuFlag.Article);

        //DataTable dtProduct = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl", filter, "");
        //foreach (DataRow drProduct in dtProduct.Rows)
        //{
        //    SqlHelper.Update_Url_Table(false, "category_article", ConvertUtility.ToInt32(drProduct["ID"]), drProduct["Name"].ToString(), drProduct["FriendlyUrl"].ToString());
        //}


        //DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,Image_1,Hide,ParentID,AttributesIDList,LongDescription,TagIDList,MetaTitle,MetaKeyword,MetaDescription,SchemaRatingCount,SchemaRatingValue,SortProduct", "", "");
        //foreach (DataRow dr in dt.Rows)
        //{
        //    string filterProduct = string.Format(@"(Hide is null OR Hide=0) AND (CategoryIDList Like N'%,{0},%' OR CategoryIDParentList Like N'%,{0},%' OR TagIDList Like N'%,{0},%')", dr["ID"]);
        //    int _totalProduct = 0;

        //    string query_count = string.Format("Select COUNT(ID) FROM {0} WHERE {1}", C.PRODUCT_TABLE, filterProduct);
        //    using (var dbx = MetaNET.DataHelper.SqlService.GetSqlService())
        //    {
        //        DataTable dtCount = dbx.ExecuteSqlDataTable(query_count);
        //        _totalProduct = ConvertUtility.ToInt32(dtCount.Rows[0][0]);

        //        string sqlQuery = @"UPDATE tblCategories SET ItemNumber=@ItemNumber WHERE ID=@ID";
        //        dbx.AddParameter("@ID", System.Data.SqlDbType.Int, dr["ID"].ToString());
        //        dbx.AddParameter("@ItemNumber", System.Data.SqlDbType.Int, _totalProduct);
        //        dbx.ExecuteSql(sqlQuery);
        //    }
        //}

        //int count = 0;
        //string miss = "";
        //DataTable dt = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID, Name, TagIDList, TagNameList, TagUrlList", "", "ID ASC");
        //foreach (DataRow dr in dt.Rows)
        //{
        //    string[] numbers = Utils.CommaSQLRemove(dr["TagUrlList"].ToString()).Split(',');
        //    string idList = "";
        //    foreach (string number in numbers)
        //    {
        //        if (!string.IsNullOrEmpty(number))
        //        {
        //            DataTable dtCat = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID", string.Format("FriendlyUrl = N'{0}' AND Moduls='tag'", number));
        //            if (Utils.CheckExist_DataTable(dtCat))
        //            {
        //                idList += dtCat.Rows[0]["ID"] + ",";
        //            }
        //            else
        //            {
        //                count++;
        //                miss += number + "\n - ";
        //            }
        //        }
        //    }

        //    idList = Utils.CommaSQLRemove(idList);
        //    idList = Utils.CommaSQLAdd(idList);

        //    using (var dbx = MetaNET.DataHelper.SqlService.GetSqlService())
        //    {
        //        string sqlQuery = @"UPDATE tblProducts SET TagIDList=@TagIDList WHERE ID=@ID";
        //        dbx.AddParameter("@ID", System.Data.SqlDbType.Int, dr["ID"].ToString());
        //        dbx.AddParameter("@TagIDList", System.Data.SqlDbType.NVarChar, idList);
        //        dbx.ExecuteSql(sqlQuery);
        //    }
        //}
        //Response.Write(count + miss);
    }
}