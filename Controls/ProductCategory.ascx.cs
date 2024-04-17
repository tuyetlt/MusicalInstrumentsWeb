using System;
using System.Data;
using System.Collections.Generic;
using System.Web.UI;
using log4net;

public partial class Controls_ProductCategory : System.Web.UI.UserControl
{
    public DataRow drCat, drProduct;
    public DataTable dtCat, dtProduct, dtRef;
    public int ID, RootID, RootChild, _totalProduct;
    public string caturl;
    public List<string> RootList = new List<string>();
    protected static readonly ILog log = LogManager.GetLogger(typeof(Controls_ProductCategory));
    public bool NoIndex = false;

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
        //log.Info("Category:" + caturl);
    }

    protected void BindData()
    {
        if (Utils.CheckExist_DataTable(dtRef))
            dtCat = dtRef;
        else
            dtCat = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,Image_1,Hide,ParentID,AttributesIDList,LongDescription,TagIDList,MetaTitle,MetaKeyword,MetaDescription,SchemaRatingCount,SchemaRatingValue,SortProduct,SeoFlags,Canonical,Moduls", string.Format("{0} AND Moduls=N'{1}' AND FriendlyUrl=N'{2}'", Utils.CreateFilterHide, "category", caturl));
        
        if (!Utils.CheckExist_DataTable(dtCat)) //Ưu tiên dạng Category trước, nếu không phải thì hiện tag
            dtCat = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,Image_1,Hide,ParentID,AttributesIDList,MetaTitle,LongDescription,TagIDList,MetaKeyword,MetaDescription,SchemaRatingCount,SchemaRatingValue,SortProduct,SeoFlags,Canonical,Moduls", string.Format("{0} AND Moduls=N'{1}' AND FriendlyUrl=N'{2}'", Utils.CreateFilterHide, "tag", caturl));

        if (Utils.CheckExist_DataTable(dtCat))
        {
            drCat = dtCat.Rows[0];
            if (ConvertUtility.ToBoolean(drCat["Hide"]))
            {
                Response.Redirect("/404.html");
                return;
            }

            PageInfo.CategoryID = ConvertUtility.ToInt32(drCat["ID"]);

            if (drCat["Moduls"].ToString() == "tag" || drCat["Moduls"].ToString() == "hashtag")
                PageInfo.LinkEdit = "/admin/category/tagupdate?id=" + drCat["ID"];
            else
                PageInfo.LinkEdit = "/admin/category/categoryupdate?id=" + drCat["ID"];
        }
        else
        {
            Response.Redirect("/404.html");
            return;
        }

        //Get Root ID, Sort
        string SortProduct = string.Empty;
        DataRow drCatRoot = drCat;
        RootID = ConvertUtility.ToInt32(drCatRoot["ID"]);
        if (!string.IsNullOrEmpty(ConvertUtility.ToString(drCatRoot["SortProduct"])) && string.IsNullOrEmpty(SortProduct))
            SortProduct = ConvertUtility.ToString(drCatRoot["SortProduct"]);
        
        int count = 0;
        do
        {
            if (ConvertUtility.ToInt32(drCatRoot["ParentID"]) > 0)
            {
                DataTable dtCatRoot = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID, ParentID, Name, SortProduct", string.Format("ID={0}", drCatRoot["ParentID"]));
                if (Utils.CheckExist_DataTable(dtCatRoot))
                {
                    drCatRoot = dtCatRoot.Rows[0];
                    RootID = ConvertUtility.ToInt32(drCatRoot["ID"]);
                    if (!string.IsNullOrEmpty(ConvertUtility.ToString(drCatRoot["SortProduct"])) && string.IsNullOrEmpty(SortProduct))
                        SortProduct = ConvertUtility.ToString(drCatRoot["SortProduct"]);
                }
                count++;
            }
        }
        while (ConvertUtility.ToInt32(drCatRoot["ParentID"]) > 0 && count <= 5);
        if (string.IsNullOrEmpty(SortProduct))
            SortProduct = ConfigWeb.SortProduct;
        //Response.Write(SortProduct);
        
        if (Utils.CheckExist_DataTable(dtCat))
        {
            string filterProduct = string.Format(@"(Hide is null OR Hide=0) AND (CategoryIDList Like N'%,{0},%' OR CategoryIDParentList Like N'%,{0},%' OR TagIDList Like N'%,{0},%')", drCat["ID"]);
            dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID,Name,FriendlyUrl,FriendlyUrlCategory,Gallery,Price,Price1", filterProduct, SortProduct, 1, C.ROWS_PRODUCTCATEGORY, out _totalProduct);
            CookieUtility.SetValueToCookie("pageIndex_Category", "2");
        }
    }


    protected void SetSeo()
    {
        if (!Utils.IsNullOrEmpty(drCat))
        {
            int SEOFlags = ConvertUtility.ToInt32(drCat["SeoFlags"]);
            SeoFlag seoFlag = (SeoFlag)SEOFlags;
            NoIndex = seoFlag.HasFlag(SeoFlag.NoIndex);


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
            


            //SEO.meta_title = ConvertUtility.ToString(drCat["MetaTitle"]);
            //SEO.meta_keyword = ConvertUtility.ToString(drCat["MetaKeyword"]);
            //SEO.meta_description = ConvertUtility.ToString(drCat["MetaDescription"]);

            //SEO.url_current = TextChanger.GetLinkRewrite_Category(ConvertUtility.ToString(drCat["FriendlyUrl"]));
            //SEO.canonical = TextChanger.GetLinkRewrite_Category(ConvertUtility.ToString(drCat["FriendlyUrl"]));
            //if (SEO.meta_title.Length < 3)
            //    SEO.meta_title = ConvertUtility.ToString(drCat["Name"]);
            //if (SEO.meta_keyword.Length < 3)
            //    SEO.meta_keyword = ConvertUtility.ToString(drCat["Name"]) + ", " + ConfigWeb.MetaKeyword;

            //if (SEO.meta_description.Length < 3)
            //    SEO.meta_description = ConvertUtility.ToString(drCat["Name"]) + ", " + ConfigWeb.MetaDescription;

            //SEO.content_share_facebook = "<meta property='og:title' content='" + SEO.meta_title + "'/>";
            //SEO.content_share_facebook += "<meta property='og:type' content='website'/>";
            //SEO.content_share_facebook += "<meta property='og:url' content='" + SEO.url_current + "'/>";

            //string image = ConvertUtility.ToString(drCat["Image_1"]);
            //if (string.IsNullOrEmpty(image))
            //    image = ConfigWeb.Image;
            //SEO.content_share_facebook += "<meta property='og:image' content='" + C.ROOT_URL + image + "'/>";
            //SEO.content_share_facebook += "<meta property='og:site_name' content='" + SEO.url_current + "'/> ";
            //SEO.content_share_facebook += "<meta property='og:description' content='" + SEO.meta_description + "'/>";




            SEO_Schema.Type = "WebSite";
            SEO_Schema.Title = SEO.meta_title;
            SEO_Schema.Description = SEO.meta_description;
            SEO_Schema.Image = image;
            SEO_Schema.Url = SEO.canonical;
            SEO_Schema.AuthorName = C.SITE_NAME;
            SEO_Schema.Publisher_Type = "Organization";
            SEO_Schema.Publisher_Name = C.ROOT_URL.Replace("https://","");
            SEO_Schema.Publisher_Logo = ConfigWeb.LogoAdmin;
            SEO_Schema.RatingCount = ConvertUtility.ToInt32(drCat["SchemaRatingCount"]);
            SEO_Schema.RatingValue = ConvertUtility.ToInt32(drCat["SchemaRatingValue"]);
            if (SEO_Schema.RatingValue > 93)
                SEO_Schema.ReviewRatingValue = 5;
            else
                SEO_Schema.ReviewRatingValue = 4;
        }
        PageUtility.AddDefaultMetaTag(this.Page);
        PageInfo.CurrentControl = ControlCurrent.ProductCategory.ToString();
    }
}