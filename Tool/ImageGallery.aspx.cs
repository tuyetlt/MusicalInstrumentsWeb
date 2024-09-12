using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tool_ImageGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //DataTable dtP = SqlHelper.SQLToDataTable("CMRC_Products", "ProductImage, ProductID, VAT, TagLuuTruTam, TagsHTML, Status, IsHome", "", "ProductID");
        //if (Utils.CheckExist_DataTable(dtP))
        //{
        //    foreach (DataRow dr in dtP.Rows)
        //    {  //Chưa biết - 1, chưa 0, đã 1
        //       //1, 4 , 2
        //        int vat = 0;
        //        if (dr["VAT"].ToString() == "-1")
        //        {
        //            vat = 1;
        //        }
        //        else if (dr["VAT"].ToString() == "0")
        //        {
        //            vat = 4;
        //        }
        //        else if (dr["VAT"].ToString() == "1")
        //        {
        //            vat = 2;
        //        }

        //        int status = 0;
        //        if (dr["Status"].ToString() == "1")
        //            status = 1;
        //        else if (dr["Status"].ToString() == "2")
        //            status = 2;
        //        else if (dr["Status"].ToString() == "4")
        //            status = 4;
        //        else if (dr["Status"].ToString() == "8")
        //            status = 8;


        //        string tag = "", taghtml = "";
        //        if (dr["TagLuuTruTam"].ToString().Length > 2)
        //        {
        //            tag = dr["TagLuuTruTam"].ToString().Replace(";", ",");
        //            taghtml = dr["TagsHTML"].ToString().Replace(";", ",");
        //        }

        //        int AttrProductFlag = 0;
        //        if (ConvertUtility.ToBoolean(dr["IsHome"]))
        //            AttrProductFlag = 1;

        //        List<GalleryImage> galleryList = new List<GalleryImage>();

        //        GalleryImage gallery = new GalleryImage();
        //        gallery.Name = dr["ProductImage"].ToString();
        //        gallery.Path = "/upload/img/" + dr["ProductImage"].ToString();
        //        gallery.Size = "100";

        //        galleryList.Add(gallery);

        //        DataTable dtG = SqlHelper.SQLToDataTable("CMRC_ImageGallery", "ImgName, Path", "ProductID='" + dr["ProductID"] + "'", "SortOrder");
        //        if (Utils.CheckExist_DataTable(dtG))
        //        {
        //            foreach (DataRow drG in dtG.Rows)
        //            {
        //                GalleryImage g = new GalleryImage();
        //                g.Name = drG["ImgName"].ToString();
        //                g.Path = "/" + drG["Path"].ToString() + drG["ImgName"].ToString();
        //                g.Size = "100";

        //                galleryList.Add(g);
        //            }
        //        }

        //        string Json_Content = Newtonsoft.Json.JsonConvert.SerializeObject(galleryList, Newtonsoft.Json.Formatting.Indented);

        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //        {
        //            string sqlQuery = string.Format(@"UPDATE tblProducts set Gallery='{0}', ProductVATFlag={1}, ProductStatusFlag={2}, TagIDList='{3}', TagNameList=N'{4}', AttrProductFlag='{5}' where ID={6}", Json_Content, vat, status, tag, taghtml, AttrProductFlag, dr["ProductID"]);
        //            db.ExecuteSql(sqlQuery);
        //        }

        //        CacheUtility.PurgeCacheItems(C.PRODUCT_TABLE);
        //    }
        //}



        //DataTable dtP = SqlHelper.SQLToDataTable("CMRC_Products", "TagLuuTruTam,ProductID", "", "ProductID");
        //if (Utils.CheckExist_DataTable(dtP))
        //{
        //    foreach (DataRow dr in dtP.Rows)
        //    { 
        //        string tag = "";
        //        if (dr["TagLuuTruTam"].ToString().Length > 2)
        //        {
        //            tag = dr["TagLuuTruTam"].ToString().Replace(";", ",");
        //        }

        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //        {
        //            string sqlQuery = string.Format(@"UPDATE tblProducts set TagIDList='{0}' where ID={1}", tag, dr["ProductID"]);
        //            db.ExecuteSql(sqlQuery);
        //        }

        //        CacheUtility.PurgeCacheItems(C.PRODUCT_TABLE);
        //    }
        //}


        //DataTable dtP = SqlHelper.SQLToDataTable("CMRC_Products", "ProductID,ProductImage", "", "ProductID");
        //if (Utils.CheckExist_DataTable(dtP))
        //{
        //    foreach (DataRow dr in dtP.Rows)
        //    { 
        //        List<GalleryImage> galleryList = new List<GalleryImage>();

        //        GalleryImage gallery = new GalleryImage();
        //        gallery.Name = dr["ProductImage"].ToString();
        //        gallery.Path = "/upload/img/" + dr["ProductImage"].ToString();
        //        gallery.Size = "100";

        //        galleryList.Add(gallery);

        //        DataTable dtG = SqlHelper.SQLToDataTable("CMRC_ImageGallery", "ImgName, Path", "ProductID='" + dr["ProductID"] + "'", "SortOrder");
        //        if (Utils.CheckExist_DataTable(dtG))
        //        {
        //            foreach (DataRow drG in dtG.Rows)
        //            {
        //                GalleryImage g = new GalleryImage();
        //                g.Name = drG["ImgName"].ToString();
        //                g.Path = "/" + drG["Path"].ToString() + drG["ImgName"].ToString();
        //                g.Size = "100";

        //                galleryList.Add(g);
        //            }
        //        }

        //        string Json_Content = Newtonsoft.Json.JsonConvert.SerializeObject(galleryList, Newtonsoft.Json.Formatting.Indented);

        //        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        //        {
        //            string sqlQuery = string.Format(@"UPDATE tblProducts set Gallery=N'{0}' where ID={1}", Json_Content, dr["ProductID"]);
        //            db.ExecuteSql(sqlQuery);
        //        }

        //        CacheUtility.PurgeCacheItems(C.PRODUCT_TABLE);
        //    }
        //}
    }
}
