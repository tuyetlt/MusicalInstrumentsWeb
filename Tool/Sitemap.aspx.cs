using System;
using System.Data;
using System.Web;
using System.Collections.Generic;
using System.Xml;
public partial class Tool_Sitemap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGen_Click(object sender, EventArgs e)
    {
        string fileName = HttpContext.Current.Request.MapPath("") + "\\..\\sitemap.xml";
        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc = GetSitemapDocument();
        xmlDoc.Save(fileName);
    }


    #region Build sitemap document methods
    private XmlDocument GetSitemapDocument()
    {
        XmlDocument sitemapDocument = new XmlDocument();
        XmlDeclaration xmlDeclaration = sitemapDocument.CreateXmlDeclaration("1.0", "UTF-8", string.Empty);
        sitemapDocument.AppendChild(xmlDeclaration);

        XmlElement urlset = sitemapDocument.CreateElement("urlset");
        urlset.SetAttribute("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");
        urlset.SetAttribute("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance");
        urlset.SetAttribute("schemaLocation", "http://www.w3.org/2001/XMLSchema-instance", "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd");

        sitemapDocument.AppendChild(urlset);

        List<SitemapPage> urls = GetSitemapPages();

        foreach (SitemapPage sitemapPage in urls)
        {
            XmlElement url = CreateUrlElement(sitemapDocument, sitemapPage);
            urlset.AppendChild(url);
        }
        return sitemapDocument;
    }

    private XmlElement CreateUrlElement(XmlDocument sitemapDocument, SitemapPage sitemapPage)
    {
        XmlElement url = sitemapDocument.CreateElement("url");
        XmlElement loc = CreateElementWithText(sitemapDocument, "loc", sitemapPage.Location);
        url.AppendChild(loc);
        string lastModValue = sitemapPage.LastModificationDate.ToString("yyyy-MM-ddTHH:mm:ss+07:00");
        XmlElement lastmod = CreateElementWithText(sitemapDocument, "lastmod", lastModValue);
        url.AppendChild(lastmod);
        if (!string.IsNullOrEmpty(sitemapPage.ChangeFrequency))
        {
            XmlElement changefreq = CreateElementWithText(sitemapDocument, "changefreq", sitemapPage.ChangeFrequency);
            url.AppendChild(changefreq);
        }
        XmlElement priority = CreateElementWithText(sitemapDocument, "priority", sitemapPage.Priority);
        url.AppendChild(priority);
        return url;
    }

    private XmlElement CreateElementWithText(XmlDocument document, string elementName, string text)
    {
        XmlElement element = document.CreateElement(elementName);
        XmlText elementValue = document.CreateTextNode(text);
        element.AppendChild(elementValue);
        return element;
    }
    #endregion

    private List<SitemapPage> GetSitemapPages()
    {
        string SiteUrl = C.MAIN_URL + C.DS;

        List<SitemapPage> sitemapPages = new List<SitemapPage>();

        sitemapPages.Add(new SitemapPage(SiteUrl, DateTime.Now, "always", "1.0"));
        sitemapPages.Add(new SitemapPage(SiteUrl, new DateTime(2017, 4, 15), "yearly", "0.4"));
        sitemapPages.Add(new SitemapPage(SiteUrl, DateTime.Now, "monthly", "1.0"));

        int count = 3;


        DataTable dt = SqlHelper.SQLToDataTable("tblProducts", "", Utils.CreateFilterHide, "ID DESC");
        if (Utils.CheckExist_DataTable(dt))
        {
            foreach (DataRow drProduct in dt.Rows)
            {
                sitemapPages.Add(new SitemapPage(TextChanger.GetLinkRewrite_Products(drProduct["FriendlyUrlCategory"].ToString(), drProduct["FriendlyUrl"].ToString()), ConvertUtility.ToDateTime(drProduct["CreatedDate"]), "monthly", "0.5"));
                count++;
            }
        }



        DataTable dtArticle = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "", Utils.CreateFilterHide, "ID DESC");
        foreach (DataRow drNews in dtArticle.Rows)
        {
            sitemapPages.Add(new SitemapPage(TextChanger.GetLinkRewrite_Article(drNews["FriendlyUrl"].ToString()), ConvertUtility.ToDateTime(drNews["CreatedDate"]), "monthly", "0.5"));
            count++;
        }

        DataTable dtCategory = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", "Moduls='category' and (Hide=null or hide=0)", "ID DESC");
        foreach (DataRow drCategory in dtCategory.Rows)
        {
            sitemapPages.Add(new SitemapPage(TextChanger.GetLinkRewrite_Category(drCategory["FriendlyUrl"].ToString()), ConvertUtility.ToDateTime(drCategory["EditedDate"]), "monthly", "0.5"));
            count++;
        }

        ltr.Text = "Lập được: " + count + " chỉ mục  -  <a href=\"" + Globals.BaseUrl + "sitemap.xml\"> Xem Sitemap </a>";
        return sitemapPages;
    }


    private class SitemapPage
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

}