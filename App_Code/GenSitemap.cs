using System;
using System.Data;
using System.Web;
using System.Collections.Generic;
using System.Xml;
using System.IO;
using System.Xml.Linq;
using System.Security.Policy;

/// <summary>
/// Summary description for GenSitemap
/// </summary>
public class GenSitemap
{
    public static void SitemapUpdate()
    {
        XNamespace ns = "http://www.sitemaps.org/schemas/sitemap/0.9";

        XElement sitemapIndex = new XElement(ns + "sitemapindex",
            new XElement(ns + "sitemap",
                new XElement(ns + "loc", C.ROOT_URL + "/sitemap/danh-muc-san-pham.xml")),
            new XElement(ns + "sitemap",
                new XElement(ns + "loc", C.ROOT_URL + "/sitemap/danh-muc-tin-tuc.xml")),
            new XElement(ns + "sitemap",
                new XElement(ns + "loc", C.ROOT_URL + "/sitemap/noi-dung.xml")),
            new XElement(ns + "sitemap",
                new XElement(ns + "loc", C.ROOT_URL + "/sitemap/san-pham.xml")),
            new XElement(ns + "sitemap",
                new XElement(ns + "loc", C.ROOT_URL + "/sitemap/tin-tuc.xml"))
        );

        XDocument sitemapDocument = new XDocument(
            new XDeclaration("1.0", "utf-8", null),
            sitemapIndex
        );

        string fileName = HttpContext.Current.Request.MapPath("/sitemap.xml");
        sitemapDocument.Save(fileName);

        Article_Sitemap();
        Product_Sitemap();
        Article_Category_Sitemap();
        Product_Category_Sitemap();
        Content_Category_Sitemap();
    }

    public static void Article_Sitemap()
    {
        try
        {
            DataTable dataTable = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "FriendlyUrl,EditedDate", string.Format(@"{0} AND StartDate<=getdate() AND {1}", Utils.CreateFilterDate, Utils.CreateFilterHide), ConfigWeb.SortProduct);
            if (Utils.CheckExist_DataTable(dataTable))
            {
                XNamespace ns = "http://www.sitemaps.org/schemas/sitemap/0.9";
                XElement urlSet = new XElement(ns + "urlset");

                foreach (DataRow dr in dataTable.Rows)
                {
                    string formattedDate = string.Empty;
                    DateTime editedDate;
                    if (dr["EditedDate"] != DBNull.Value && DateTime.TryParse(dr["EditedDate"].ToString(), out editedDate))
                    {
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }
                    else
                    {
                        editedDate = new DateTime(2010, 1, 1);
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }

                    XElement urlElement = new XElement(ns + "url",
                        new XElement(ns + "loc", TextChanger.GetLinkRewrite_Article(dr["FriendlyUrl"].ToString())),
                        new XElement(ns + "lastmod", formattedDate),
                        new XElement(ns + "changefreq", "daily"),
                        new XElement(ns + "priority", "0.5")
                    );
                    urlSet.Add(urlElement);
                }

                XDocument sitemapDocument = new XDocument(
                    new XDeclaration("1.0", "utf-8", null),
                    urlSet
                );

                sitemapDocument.Save(HttpContext.Current.Request.MapPath("/sitemap/tin-tuc.xml"));
            }
        }
        catch { }
    }

    public static void Product_Sitemap()
    {
        try
        {
            DataTable dataTable = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "FriendlyUrl,EditedDate,FriendlyUrlCategory", Utils.CreateFilterHide, ConfigWeb.SortArticle);
            if (Utils.CheckExist_DataTable(dataTable))
            {
                XNamespace ns = "http://www.sitemaps.org/schemas/sitemap/0.9";
                XElement urlSet = new XElement(ns + "urlset");

                foreach (DataRow dr in dataTable.Rows)
                {
                    
                    string formattedDate = string.Empty;
                    DateTime editedDate;
                    if (dr["EditedDate"] != DBNull.Value && DateTime.TryParse(dr["EditedDate"].ToString(), out editedDate))
                    {
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }
                    else
                    {
                        editedDate = new DateTime(2010, 1, 1);
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }


                    XElement urlElement = new XElement(ns + "url",
                        new XElement(ns + "loc", TextChanger.GetLinkRewrite_Products(dr["FriendlyUrlCategory"].ToString(), dr["FriendlyUrl"].ToString())),
                        new XElement(ns + "lastmod", formattedDate),
                        new XElement(ns + "changefreq", "daily"),
                        new XElement(ns + "priority", "0.6")
                    );
                    urlSet.Add(urlElement);
                }

                XDocument sitemapDocument = new XDocument(
                    new XDeclaration("1.0", "utf-8", null),
                    urlSet
                );

                sitemapDocument.Save(HttpContext.Current.Request.MapPath("/sitemap/san-pham.xml"));
            }
        }
        catch { }
    }


    public static void Article_Category_Sitemap()
    {
        try
        {
            string filter = string.Format("(Hide is null OR Hide=0) AND LinkTypeMenuFlag & {0} <> 0 and PositionMenuFlag & {1} = 0", (int)LinkTypeMenuFlag.Article, (int)PositionMenuFlag.Bottom);
            DataTable dataTable = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "FriendlyUrl,EditedDate", string.Format("{0}", filter), "Sort");
            if (Utils.CheckExist_DataTable(dataTable))
            {
                XNamespace ns = "http://www.sitemaps.org/schemas/sitemap/0.9";
                XElement urlSet = new XElement(ns + "urlset");

                foreach (DataRow dr in dataTable.Rows)
                {
                    string formattedDate = string.Empty;
                    DateTime editedDate;
                    if (dr["EditedDate"] != DBNull.Value && DateTime.TryParse(dr["EditedDate"].ToString(), out editedDate))
                    {
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }
                    else
                    {
                        editedDate = new DateTime(2010, 1, 1);
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }

                    XElement urlElement = new XElement(ns + "url",
                        new XElement(ns + "loc", TextChanger.GetLinkRewrite_CategoryArticle(dr["FriendlyUrl"].ToString())),
                        new XElement(ns + "lastmod", formattedDate),
                        new XElement(ns + "changefreq", "daily"),
                        new XElement(ns + "priority", "0.8")
                    );
                    urlSet.Add(urlElement);
                }

                XDocument sitemapDocument = new XDocument(
                    new XDeclaration("1.0", "utf-8", null),
                    urlSet
                );

                sitemapDocument.Save(HttpContext.Current.Request.MapPath("/sitemap/danh-muc-tin-tuc.xml"));
            }
        }
        catch { }
    }


    public static void Product_Category_Sitemap()
    {
        try
        {
            string filter = string.Format("{0} AND {1}", Utils.CreateFilterHide, Utils.CreateFilterFlags(PositionMenuFlag.Main, "PositionMenuFlag"));
            DataTable dataTable = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "FriendlyUrl,EditedDate", string.Format("{0}", filter), "Sort");
            if (Utils.CheckExist_DataTable(dataTable))
            {
                XNamespace ns = "http://www.sitemaps.org/schemas/sitemap/0.9";
                XElement urlSet = new XElement(ns + "urlset");

                foreach (DataRow dr in dataTable.Rows)
                {
                    string formattedDate = string.Empty;
                    DateTime editedDate;
                    if (dr["EditedDate"] != DBNull.Value && DateTime.TryParse(dr["EditedDate"].ToString(), out editedDate))
                    {
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }
                    else
                    {
                        editedDate = new DateTime(2010, 1, 1);
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }

                    XElement urlElement = new XElement(ns + "url",
                        new XElement(ns + "loc", TextChanger.GetLinkRewrite_Category(dr["FriendlyUrl"].ToString())),
                        new XElement(ns + "lastmod", formattedDate),
                        new XElement(ns + "changefreq", "daily"),
                        new XElement(ns + "priority", "0.9")
                    );
                    urlSet.Add(urlElement);
                }

                XDocument sitemapDocument = new XDocument(
                    new XDeclaration("1.0", "utf-8", null),
                    urlSet
                );

                sitemapDocument.Save(HttpContext.Current.Request.MapPath("/sitemap/danh-muc-san-pham.xml"));
            }
        }
        catch { }
    }

    public static void Content_Category_Sitemap()
    {
        try
        {
            string filter = string.Format("{0} AND {1}", Utils.CreateFilterHide, Utils.CreateFilterFlags(LinkTypeMenuFlag.Content, "LinkTypeMenuFlag"));
            DataTable dataTable = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "FriendlyUrl,EditedDate", string.Format("{0}", filter), "Sort");
            if (Utils.CheckExist_DataTable(dataTable))
            {
                XNamespace ns = "http://www.sitemaps.org/schemas/sitemap/0.9";
                XElement urlSet = new XElement(ns + "urlset");

                foreach (DataRow dr in dataTable.Rows)
                {
                    string formattedDate = string.Empty;
                    DateTime editedDate;
                    if (dr["EditedDate"] != DBNull.Value && DateTime.TryParse(dr["EditedDate"].ToString(), out editedDate))
                    {
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }
                    else
                    {
                        editedDate = new DateTime(2010, 1, 1);
                        formattedDate = editedDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
                    }

                    XElement urlElement = new XElement(ns + "url",
                        new XElement(ns + "loc", TextChanger.GetLinkRewrite_Menu(dr["FriendlyUrl"].ToString())),
                        new XElement(ns + "lastmod", formattedDate),
                        new XElement(ns + "changefreq", "daily"),
                        new XElement(ns + "priority", "0.5")
                    );
                    urlSet.Add(urlElement);
                }

                XDocument sitemapDocument = new XDocument(
                    new XDeclaration("1.0", "utf-8", null),
                    urlSet
                );

                sitemapDocument.Save(HttpContext.Current.Request.MapPath("/sitemap/noi-dung.xml"));
            }
        }
        catch { }
    }

    public static void GenGoogleShopping()
    {
        string Uu_Tien = "Không Ưu Tiên";
        string filterCat = "1=1";

        string filter = string.Format("(Hide is null OR Hide=0) AND Len(FriendlyUrlCategory)>0 AND Price>0 AND " + filterCat);

        DataTable dt = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID,Name,FriendlyUrl,Price,Price1,Gallery, Hide,FriendlyUrlCategory,Brand,ProductType,AttributesIDList,CategoryNameList,CategoryIDList,CategoryIDParentList", filter, "ID DESC");
        if (Utils.CheckExist_DataTable(dt))
        {
            string link = "/upload/gg-shopping-list.txt";
            string savepath = HttpContext.Current.Request.MapPath("~" + link);
            TextWriter writer = new StreamWriter(savepath);
            writer.WriteLine("id\ttiêu đề\tmô tả\tliên kết\ttình trạng\tgiá\tgiá ưu đãi\tngày giá ưu đãi có hiệu lực\tcòn hàng\tliên kết hình ảnh\tnhãn hiệu\tloại sản phẩm\tcustom_label_0\tcustom_label_1\tcustom_label_2\tcustom_label_3", System.Text.Encoding.Unicode);

            foreach (DataRow dr in dt.Rows)
            {
                DataTable dtCat = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "FriendlyUrl,AttrMenuFlag", Utils.CreateFilterHide + " AND FriendlyUrl='" + dr["FriendlyUrlCategory"] + "'", "ID DESC");
                if (Utils.CheckExist_DataTable(dtCat))
                {
                    int Price = ConvertUtility.ToInt32(dr["Price"]);
                    string imgPath = Utils.GetFirstImageInGallery_Json(dr["Gallery"].ToString());
                    if (Price > 0 && !imgPath.Contains("no-img"))
                    {

                        Uu_Tien = "Không Ưu Tiên";

                        string filterPriority1 = string.Format("AttrProductFlag & {0} <> 0", (int)AttrProductFlag.Priority1);
                        DataTable dt1 = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID", filterPriority1);
                        if (Utils.CheckExist_DataTable(dt1))
                        {
                            foreach (DataRow dr1 in dt1.Rows)
                            {
                                if (dr1["ID"].ToString() == dr["ID"].ToString())
                                {
                                    Uu_Tien = "Ưu Tiên Số 1";
                                }
                            }
                        }

                        string filterPriority2 = string.Format("AttrProductFlag & {0} <> 0", (int)AttrProductFlag.Priority2);
                        DataTable dt2 = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID", filterPriority2);
                        if (Utils.CheckExist_DataTable(dt2))
                        {
                            foreach (DataRow dr2 in dt2.Rows)
                            {
                                if (dr2["ID"].ToString() == dr["ID"].ToString())
                                {
                                    Uu_Tien = "Ưu Tiên Số 2";
                                }
                            }
                        }

                        string filterPriority3 = string.Format("AttrProductFlag & {0} <> 0", (int)AttrProductFlag.Priority3);
                        DataTable dt3 = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID", filterPriority3);
                        if (Utils.CheckExist_DataTable(dt1))
                        {
                            foreach (DataRow dr3 in dt3.Rows)
                            {
                                if (dr3["ID"].ToString() == dr["ID"].ToString())
                                {
                                    Uu_Tien = "Ưu Tiên Số 3";
                                }
                            }
                        }




                        string type = dr["ProductType"].ToString().Replace(">", "-");
                        if (string.IsNullOrEmpty(type))
                            type = "0";

                        string brand = dr["Brand"].ToString();
                        if (brand == "0")
                            brand = ConfigWeb.SiteName;

                        string categoryName = "0";
                        string CategoryNameList = dr["CategoryNameList"].ToString().Trim(',');
                        if (!string.IsNullOrEmpty(CategoryNameList))
                            categoryName = CategoryNameList;

                        int Price1 = ConvertUtility.ToInt32(dr["Price1"]);
                        if (Price1 > 0)
                        {
                            Price = ConvertUtility.ToInt32(dr["Price1"]);
                            Price1 = ConvertUtility.ToInt32(dr["Price"]);
                        }
                        else
                        {
                            Price = ConvertUtility.ToInt32(dr["Price"]);
                            Price1 = ConvertUtility.ToInt32(dr["Price"]);
                        }

                        DateTime date = DateTime.Now;
                        var firstDayOfMonth = new DateTime(date.Year, date.Month, 1);
                        var lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);
                        string NgayDau = firstDayOfMonth.ToString("yyyy-MM-dd") + "T08:00+0700";
                        string NgayCuoi = lastDayOfMonth.ToString("yyyy-MM-dd") + "T23:00+0700";
                        string NgayUuDai = NgayDau + "/" + NgayCuoi;

                        writer.WriteLine(string.Format("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}\t{8}\t{9}\t{10}\t{11}\t{12}\t{13}\t{14}\t{15}",
                            dr["ID"].ToString(),
                            Utils.FixCapitalization(dr["Name"].ToString()),
                            dr["Name"] + ", " + ConfigWeb.SiteName,
                            TextChanger.GetLinkRewrite_Products(dtCat.Rows[0]["FriendlyUrl"].ToString(), dr["FriendlyUrl"]),
                            "mới",
                            Price.ToString().Replace(",0000", "") + " VND", Price1.ToString().Replace(",0000", "") + " VND",
                            NgayUuDai,
                            "còn hàng",
                            imgPath,
                            brand, dr["ProductType"].ToString(), type, "0", categoryName, Uu_Tien),
                            System.Text.Encoding.Unicode);
                    }
                }
            }
            writer.Close();
        }
    }
}

public class SitemapPage
{
    public SitemapPage(string location, DateTime lastModificationDate, string changeFrequency, string priority)
    {
        Location = location;
        LastModificationDate = lastModificationDate;
        ChangeFrequency = changeFrequency;
        Priority = priority;
    }

    public string Location;
    public DateTime LastModificationDate;
    public string ChangeFrequency;
    public string Priority;
}