using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_NewsCategory : System.Web.UI.UserControl
{
    public DataRow drCat, drNews;
    public DataTable dtCat, dtNews, dtRef;
    public int ID, RootID, _totalArticle, _totalPage, _pageSize = 5;
    public string caturl;

    protected void Page_Load(object sender, EventArgs e)
    {
        ProccessParameter();
        if (!IsPostBack)
        {
            BindData();
            SetSeo();
        }
    }

    public void LoadData()
    {
        if (!IsPostBack)
        {
            BindData();
            SetSeo();
        }
    }


    protected void ProccessParameter()
    {
        caturl = ConvertUtility.ToString(Page.RouteData.Values["caturl"]);
    }

    protected void BindData()
    {
        if (Utils.CheckExist_DataTable(dtRef))
            dtCat = dtRef;
        else
           dtCat = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID, Name,FriendlyUrl,Image_1,MetaTitle,MetaKeyword,MetaDescription,SchemaRatingCount,SchemaRatingValue,SeoFlags,Canonical", string.Format("FriendlyUrl=N'{0}' AND {1}", caturl, Utils.CreateFilterHide));
        if (Utils.CheckExist_DataTable(dtCat))
        {
            drCat = dtCat.Rows[0];
            PageInfo.CategoryID = ConvertUtility.ToInt32(drCat["ID"]);
            string filterNews = string.Format(@"(CategoryIDList Like N'%,{0},%' OR CategoryaIDParentList Like N'%,{0},%') AND {1} AND StartDate<=getdate() AND {2}", drCat["ID"], Utils.CreateFilterDate, Utils.CreateFilterHide);
            dtNews = SqlHelper.SQLToDataTable("tblArticle", "Gallery,Name,FriendlyUrl,Description,SeoFlags", filterNews, ConfigWeb.SortArticle, 1, _pageSize, out _totalArticle);
            
        }
        else
            dtNews = SqlHelper.SQLToDataTable("tblArticle", "Gallery,Name,FriendlyUrl,Description,SeoFlags", string.Format(@"{0} AND StartDate<=getdate() AND {1}", Utils.CreateFilterDate, Utils.CreateFilterHide), ConfigWeb.SortArticle, 1, _pageSize, out _totalArticle);

        _totalPage = _totalArticle / _pageSize;

        if (_totalPage % _pageSize != 0)
            _totalPage++;


        CookieUtility.SetValueToCookie("pageIndex_Category", "2");
    }


    protected void SetSeo()
    {
        if (Utils.CheckExist_DataTable(dtCat))
        {
            int SEOFlags = ConvertUtility.ToInt32(drCat["SeoFlags"]);
            SeoFlag seoFlag = (SeoFlag)SEOFlags;
            bool NoIndex = seoFlag.HasFlag(SeoFlag.NoIndex);

            string MetaTitle = ConvertUtility.ToString(drCat["MetaTitle"]);
            string MetaKeyword = ConvertUtility.ToString(drCat["MetaKeyword"]);
            string MetaDescription = ConvertUtility.ToString(drCat["MetaDescription"]);

            if (MetaTitle.Length < 3)
                MetaTitle = ConvertUtility.ToString(drCat["Name"]);
            if (MetaKeyword.Length < 3)
                MetaKeyword = MetaTitle + ", " + ConfigWeb.MetaKeyword;
            if (MetaDescription.Length < 3)
                MetaDescription = MetaTitle + ", " + ConfigWeb.MetaDescription;

            string url = TextChanger.GetLinkRewrite_Category(ConvertUtility.ToString(drCat["FriendlyUrl"]));
            if (!string.IsNullOrEmpty(ConvertUtility.ToString(drCat["Canonical"])))
                url = ConvertUtility.ToString(drCat["Canonical"]);
            PageUtility.AddTitle(this.Page, MetaTitle);
            PageUtility.AddMetaTag(this.Page, "keywords", MetaKeyword);
            PageUtility.AddMetaTag(this.Page, "description", MetaDescription);
            string image = ConvertUtility.ToString(drCat["Image_1"]);
            if (string.IsNullOrEmpty(image))
                image = ConfigWeb.Image;
            PageUtility.OpenGraph(this.Page, MetaTitle, "website", url, C.ROOT_URL + image, ConfigWeb.SiteName, MetaDescription);
            PageUtility.AddCanonicalLink(this.Page, url);
            if (NoIndex)
                PageUtility.SetNoIndex(this.Page);
            else
                PageUtility.SetIndex(this.Page);

            SEO_Schema.Type = "WebSite";
            SEO_Schema.Title = SEO.meta_title;
            SEO_Schema.Description = SEO.meta_description;
            SEO_Schema.Image = image;
            SEO_Schema.Url = SEO.canonical;
            SEO_Schema.AuthorName = C.SITE_NAME;
            SEO_Schema.Publisher_Type = "Organization";
            SEO_Schema.Publisher_Name = C.ROOT_URL.Replace("https://", "");
            SEO_Schema.Publisher_Logo = ConfigWeb.LogoAdmin;
            SEO_Schema.RatingCount = ConvertUtility.ToInt32(drCat["SchemaRatingCount"]);
            SEO_Schema.RatingValue = ConvertUtility.ToInt32(drCat["SchemaRatingValue"]);
            if (SEO_Schema.RatingValue > 93)
                SEO_Schema.ReviewRatingValue = 5;
            else
                SEO_Schema.ReviewRatingValue = 4;

            PageInfo.CurrentControl = ControlCurrent.NewsCategory.ToString();
        }
        else
        {
            string MetaTitle = "";
            string MetaKeyword = "";
            string MetaDescription = "";

            if (MetaTitle.Length < 3)
                MetaTitle = "Tin tức";
            if (MetaKeyword.Length < 3)
                MetaKeyword = MetaTitle + ", " + ConfigWeb.MetaKeyword;
            if (MetaDescription.Length < 3)
                MetaDescription = MetaTitle + ", " + ConfigWeb.MetaDescription;

            string url = C.ROOT_URL + "/tin-tuc/";
            PageUtility.AddTitle(this.Page, MetaTitle);
            PageUtility.AddMetaTag(this.Page, "keywords", MetaKeyword);
            PageUtility.AddMetaTag(this.Page, "description", MetaDescription);
            string image = ConfigWeb.Image;
            PageUtility.OpenGraph(this.Page, MetaTitle, "website", url, image, ConfigWeb.SiteName, MetaDescription);
            PageUtility.AddCanonicalLink(this.Page, url);
                PageUtility.SetIndex(this.Page);

        }

        PageUtility.AddDefaultMetaTag(this.Page);
    }

    //protected void Page_PreRender(object sender, EventArgs e)
    //{
    //        UserControl errorControl = (UserControl)Page.LoadControl("~/Controls/404.ascx");
    //        PlaceHolder placeholder = (PlaceHolder)Page.FindControl("errorPlaceholder");
            
    //            placeholder.Controls.Add(errorControl);
            
    //}


    //protected void Page_PreRender(object sender, EventArgs e)
    //{
    //    UserControl errorControl = (UserControl)Page.LoadControl("~/Controls/404.ascx");
    //    this.Parent.Controls.Add(errorControl);
    //}

    //// Phương thức kiểm tra xem UserControl 404 đã được tải hay chưa
    //private bool Is404ControlLoaded()
    //{
    //    string controlPath = ResolveUrl("~/Controls/404.ascx");

    //    foreach (Control control in this.Parent.Controls)
    //    {
    //        if (control is UserControl && ResolveUrl(((UserControl)control).TemplateControl.AppRelativeVirtualPath) == controlPath)
    //        {
    //            return true;
    //        }
    //    }
    //    return false;
    //}
}