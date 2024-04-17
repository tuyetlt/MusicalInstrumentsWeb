using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_NewsDetail : System.Web.UI.UserControl
{
    public DataRow dr;
    public DataTable dtRef;
    public int ID;
    public string seo_title, caturl, image;
    public bool NoIndex = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        ProccessParameter();

        if (!IsPostBack)
        {
            BindData();
        }
    }

    protected void ProccessParameter()
    {
        seo_title = ConvertUtility.ToString(Page.RouteData.Values["seo_title"]);
        //caturl = ConvertUtility.ToString(Page.RouteData.Values["caturl"]);
    }

    public void LoadData()
    {
        BindData();
    }

    protected void BindData()
    {
        // DataTable dt = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "", string.Format("FriendlyUrl=N'{0}' AND StartDate<=getdate() AND {1}", seo_title, Utils.CreateFilterHide));

        DataTable dt = new DataTable();
        if (Utils.CheckExist_DataTable(dtRef))
            dt = dtRef;
        else
            dt = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "", string.Format("FriendlyUrl=N'{0}'", seo_title));
        
        if (Utils.CheckExist_DataTable(dt))
        {
            dr = dt.Rows[0];

            int SEOFlags = ConvertUtility.ToInt32(dt.Rows[0]["SeoFlags"]);
            SeoFlag seoFlag = (SeoFlag)SEOFlags;
            NoIndex = seoFlag.HasFlag(SeoFlag.NoIndex);

            image = Utils.GetFirstImageInGallery_Json(ConvertUtility.ToString(dr["gallery"]));
            string[] cateList = ConvertUtility.ToString(dr["CategoryIDList"]).Trim(',').Split(',');
            foreach (string categoryid in cateList)
            {
                PageInfo.CategoryID = ConvertUtility.ToInt32(categoryid);
            }

            PageInfo.LinkEdit = "/admin/article/articleupdate?id=" + dr["ID"];

            //tăng 1 lên view
            using (var dbx = new MetaNET.DataHelper.SqlService())
            {
                int curenView = ConvertUtility.ToInt32(dr["Viewed"]) + 1;
                string sqlUpdateView = "Update tblArticle SET Viewed=@totalview WHERE ID=@articleID";
                dbx.AddParameter("@articleID", SqlDbType.Int, dr["ID"]);
                dbx.AddParameter("@totalview", SqlDbType.Int, curenView);
                dbx.ExecuteSql(sqlUpdateView);
            }

            SetSEO();
        }
        else
            Response.Redirect(C.ROOT_URL);
    }
    
    protected void SetSEO()
    {
        string MetaTitle = ConvertUtility.ToString(dr["MetaTitle"]);
        string MetaKeyword = ConvertUtility.ToString(dr["MetaKeyword"]);
        string MetaDescription = ConvertUtility.ToString(dr["MetaDescription"]);

        if (MetaTitle.Length < 3)
            MetaTitle = ConvertUtility.ToString(dr["Name"]);
        if (MetaKeyword.Length < 3)
            MetaKeyword = MetaTitle + ", " + ConfigWeb.MetaKeyword;
        if (MetaDescription.Length < 3)
            MetaDescription = MetaTitle + ", " + ConfigWeb.MetaDescription;

        string url = TextChanger.GetLinkRewrite_Article(ConvertUtility.ToString(dr["FriendlyUrl"]));
        if (!string.IsNullOrEmpty(ConvertUtility.ToString(dr["Canonical"])))
            url = ConvertUtility.ToString(dr["Canonical"]);
        PageUtility.AddTitle(this.Page, MetaTitle);
        PageUtility.AddMetaTag(this.Page, "keywords", MetaKeyword);
        PageUtility.AddMetaTag(this.Page, "description", MetaDescription);
        PageUtility.OpenGraph(this.Page, MetaTitle, "website", url, image, ConfigWeb.SiteName, MetaDescription);
        PageUtility.AddCanonicalLink(this.Page, url);
        if (NoIndex)
            PageUtility.SetNoIndex(this.Page);
        else
            PageUtility.SetIndex(this.Page);
        PageUtility.AddDefaultMetaTag(this.Page);



        //SEO.meta_title = ConvertUtility.ToString(dr["MetaTitle"]);
        //SEO.meta_keyword = ConvertUtility.ToString(dr["MetaKeyword"]);
        //SEO.meta_description = ConvertUtility.ToString(dr["MetaDescription"]);

        //if (SEO.meta_title.Length < 3)
        //    SEO.meta_title = ConvertUtility.ToString(dr["Name"]);
        //if (SEO.meta_keyword.Length < 3)
        //{
        //    string Meta_Keyword = "";
        //    if (Meta_Keyword.Length > 0)
        //        SEO.meta_keyword = Meta_Keyword;
        //    else
        //        SEO.meta_keyword = SEO.meta_title + ", " + ConfigWeb.MetaKeyword;
        //}

        //if (SEO.meta_description.Length < 3)
        //    SEO.meta_description = ConvertUtility.ToString(dr["Name"]) + ", " + ConfigWeb.MetaDescription;

        //string linkDetail = TextChanger.GetLinkRewrite_Article(dr["FriendlyUrl"].ToString());
        //SEO.url_current = linkDetail;
        //SEO.canonical = linkDetail;
        //SEO.content_share_facebook = "<meta property='og:title' content='" + SEO.meta_title + "'/>";
        //SEO.content_share_facebook += "<meta property='og:type' content='website'/>";
        //SEO.content_share_facebook += "<meta property='og:url' content='" + SEO.url_current + "'/>";
        //SEO.content_share_facebook += "<meta property='og:image' content='" + image + "'/>";
        //SEO.content_share_facebook += "<meta property='og:site_name' content='" + SEO.url_current + "'/> ";
        //SEO.content_share_facebook += "<meta property='og:description' content='" + SEO.meta_description + "'/>";


        SEO_Schema.Type = "NewsArticle";
        SEO_Schema.Url = SEO.canonical;
        SEO_Schema.Title = SEO.meta_title;
        SEO_Schema.Description = Utils.QuoteRemove(SEO.meta_description);
        SEO_Schema.Image = image;
        SEO_Schema.AuthorType = "Organization";
        SEO_Schema.AuthorName = C.SITE_NAME;
        SEO_Schema.Publisher_Type = "Organization";
        SEO_Schema.Publisher_Name = C.SITE_NAME;
        SEO_Schema.Publisher_Logo = ConfigWeb.Logo;
        SEO_Schema.PublisherDate = ConvertUtility.ToDateTime(dr["StartDate"]).ToString("yyyy-MM-dd");
        SEO_Schema.PublisherModify = ConvertUtility.ToDateTime(dr["EditedDate"]).ToString("yyyy-MM-dd");

        SEO_Schema.RatingCount = ConvertUtility.ToInt32(dr["SchemaRatingCount"]);
        SEO_Schema.RatingValue = ConvertUtility.ToInt32(dr["SchemaRatingValue"]);
        if (SEO_Schema.RatingValue > 93)
            SEO_Schema.ReviewRatingValue = 5;
        else
            SEO_Schema.ReviewRatingValue = 4;

        PageInfo.CurrentControl = ControlCurrent.NewsDetail.ToString();
    }

}