using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
public partial class _default : System.Web.UI.Page
{
    #region Variable
    Control mainControl;
    DateTime time;
    public bool IsHome = false;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckRedirect();
        PlaceHolder.Controls.Clear();
        if (!IsPostBack)
        {
            var controler = Request.QueryString["id"];
            try
            {
                PageInfo.CategoryID = 0;
                PageInfo.LinkEdit = string.Empty;
                PageInfo.ControlName = string.Empty;

                var caturl = ConvertUtility.ToString(Page.RouteData.Values["caturl"]);
                var purl = ConvertUtility.ToString(Page.RouteData.Values["purl"]);
                var m = ConvertUtility.ToString(Page.RouteData.Values["m"]);
                var ajax = ConvertUtility.ToString(Page.RouteData.Values["ajax"]);
                var newsdetail = ConvertUtility.ToString(Page.RouteData.Values["newsdetail"]);
                var content = ConvertUtility.ToString(Page.RouteData.Values["content"]);

                if (Utils.CheckDomain == "mayvesinh.vn" || Utils.CheckDomain == "nhaccutiendat.vn")
                {
                    if (m == "urlchung")
                    {
                        string friendlyUrl = ConvertUtility.ToString(Page.RouteData.Values["url"]).Trim();
                        DataTable dtUrl = SqlHelper.SQLToDataTable("tblUrl", "", string.Format("FriendlyUrl=N'{0}'", friendlyUrl));
                        if (Utils.CheckExist_DataTable(dtUrl))
                        {
                            DataRow drUrl = dtUrl.Rows[0];
                            string moduls = ConvertUtility.ToString(drUrl["Moduls"]);
                            if (moduls == "product_detail")
                            {
                                DataTable dt = SqlHelper.SQLToDataTable("tblProducts", "", string.Format("ID=N'{0}'", drUrl["ContentID"]));
                                mainControl = LoadControl("~/Controls/ProductDetails.ascx");
                                Controls_ProductDetails contentDetailControl = mainControl as Controls_ProductDetails;
                                if (contentDetailControl != null)
                                {
                                    contentDetailControl.dtRef = dt;
                                }
                            }
                            else if (moduls == "article_detail")
                            {
                                DataTable dt = SqlHelper.SQLToDataTable("tblArticle", "", string.Format("ID=N'{0}'", drUrl["ContentID"]));
                                mainControl = LoadControl("~/Controls/NewsDetail.ascx");
                                Controls_NewsDetail contentDetailControl = mainControl as Controls_NewsDetail;
                                if (contentDetailControl != null)
                                {
                                    contentDetailControl.dtRef = dt;
                                }
                            }
                            else if (moduls == "category_article")
                            {
                                DataTable dt = SqlHelper.SQLToDataTable("tblCategories", "ID, Name,FriendlyUrl,Image_1,MetaTitle,MetaKeyword,MetaDescription,SchemaRatingCount,SchemaRatingValue,SeoFlags,Canonical", string.Format("ID=N'{0}'", drUrl["ContentID"]));
                                mainControl = LoadControl("~/Controls/NewsCategory.ascx");
                                Controls_NewsCategory contentDetailControl = mainControl as Controls_NewsCategory;
                                if (contentDetailControl != null)
                                {
                                    contentDetailControl.dtRef = dt;
                                }
                            }
                            else if (moduls == "category_product")
                            {
                                DataTable dt = SqlHelper.SQLToDataTable("tblCategories", "ID,Name,FriendlyUrl,Image_1,Hide,ParentID,AttributesIDList,LongDescription,TagIDList,MetaTitle,MetaKeyword,MetaDescription,SchemaRatingCount,SchemaRatingValue,SortProduct,SeoFlags,Canonical,Moduls", string.Format("ID=N'{0}'", drUrl["ContentID"]));
                                mainControl = LoadControl("~/Controls/ProductCategory.ascx");
                                Controls_ProductCategory contentDetailControl = mainControl as Controls_ProductCategory;
                                if (contentDetailControl != null)
                                {
                                    contentDetailControl.dtRef = dt;
                                }
                            }
                            else if (moduls == "category_content")
                            {
                                DataTable dt = SqlHelper.SQLToDataTable("tblCategories", "", string.Format("ID=N'{0}'", drUrl["ContentID"]));
                                mainControl = LoadControl("~/Controls/ContentDetail.ascx");
                                Controls_ContentDetail contentDetailControl = mainControl as Controls_ContentDetail;
                                if (contentDetailControl != null)
                                {
                                    contentDetailControl.dtRef = dt;
                                }
                            }
                        }
                        else
                        {

                        }
                    }
                    else //nếu theo dạng link cũ, 301 về link mới
                    {
                        string url301 = string.Empty;
                        if (!Utils.IsNullOrEmpty(m) && m == "contentdetail")
                        {
                            url301 = ConvertUtility.ToString(Page.RouteData.Values["caturl"]);
                        }
                        //else if (!Utils.IsNullOrEmpty(m) && m == "productcategory")
                        //{
                        //    url301 = ConvertUtility.ToString(Page.RouteData.Values["caturl"]);
                        //}
                        else if (!Utils.IsNullOrEmpty(m) && m == "newscategory")
                        {
                            url301 = ConvertUtility.ToString(Page.RouteData.Values["caturl"]);
                            if(string.IsNullOrEmpty(url301))
                            {
                                mainControl = LoadControl("~/controls/" + m + ".ascx");
                            }    
                        }
                        else if (!Utils.IsNullOrEmpty(m) && m == "newsdetail")
                        {
                            url301 = ConvertUtility.ToString(Page.RouteData.Values["seo_title"]);
                        }
                        else if (!Utils.IsNullOrEmpty(m) && m == "productdetails")
                        {
                            url301 = ConvertUtility.ToString(Page.RouteData.Values["purl"]);
                        }
                        else if (!Utils.IsNullOrEmpty(m))
                        {
                            mainControl = LoadControl("~/controls/" + m + ".ascx");
                        }
                        else //trang chủ
                        {
                            mainControl = LoadControl("~/controls/Home.ascx");
                            PageInfo.CategoryID = 0;
                            string url = C.ROOT_URL;
                            PageUtility.AddTitle(this.Page, ConfigWeb.MetaTitle);
                            PageUtility.AddMetaTag(this.Page, "keywords", ConfigWeb.MetaKeyword);
                            PageUtility.AddMetaTag(this.Page, "description", ConfigWeb.MetaDescription);
                            PageUtility.OpenGraph(this.Page, ConfigWeb.MetaTitle, "website", url, C.ROOT_URL + ConfigWeb.Image, ConfigWeb.SiteName, ConfigWeb.MetaDescription);
                            PageUtility.AddCanonicalLink(this.Page, url);
                            PageUtility.SetIndex(this.Page);
                            PageUtility.AddDefaultMetaTag(this.Page);
                        }

                        string[] validValues = { "contentdetail", "productcategory", "newscategory", "newsdetail", "productdetails" };
                        if (Array.IndexOf(validValues, m) != -1 && !string.IsNullOrEmpty(url301))
                        {
                            HttpContext.Current.Response.Clear();
                            HttpContext.Current.Response.Status = "301 Moved Permanently";
                            HttpContext.Current.Response.StatusCode = 301;
                            HttpContext.Current.Response.AddHeader("Location", string.Format("/{0}/", url301));
                            HttpContext.Current.Response.End();
                        }    
                    }

                    if (!Utils.IsNullOrEmpty(ajax))
                        mainControl = LoadControl("~/ajax/" + ajax + ".ascx");
                }
                else
                {
                    if (!Utils.IsNullOrEmpty(m) && m == "contentdetail")
                    {
                        mainControl = LoadControl("~/controls/ContentDetail.ascx");
                    }
                    else if (!Utils.IsNullOrEmpty(m) && m == "productcategory")
                    {
                        mainControl = LoadControl("~/controls/ProductCategory.ascx");
                        PageInfo.CurrentControl = ControlCurrent.ProductCategory.ToString();
                    }
                    else if (!Utils.IsNullOrEmpty(m) && m == "productdetails")
                    {
                        mainControl = LoadControl("~/controls/ProductDetails.ascx");
                        PageInfo.CurrentControl = ControlCurrent.ProductDetails.ToString();
                    }
                    else if (!Utils.IsNullOrEmpty(m))
                        mainControl = LoadControl("~/controls/" + m + ".ascx");
                    else if (!Utils.IsNullOrEmpty(ajax))
                        mainControl = LoadControl("~/ajax/" + ajax + ".ascx");
                    else
                    {
                        mainControl = LoadControl("~/controls/Home.ascx");
                        IsHome = true;

                        PageInfo.CategoryID = 0;
                        string url = C.ROOT_URL;
                        PageUtility.AddTitle(this.Page, ConfigWeb.MetaTitle);
                        PageUtility.AddMetaTag(this.Page, "keywords", ConfigWeb.MetaKeyword);
                        PageUtility.AddMetaTag(this.Page, "description", ConfigWeb.MetaDescription);
                        PageUtility.OpenGraph(this.Page, ConfigWeb.MetaTitle, "website", url, C.ROOT_URL + ConfigWeb.Image, ConfigWeb.SiteName, ConfigWeb.MetaDescription);
                        PageUtility.AddCanonicalLink(this.Page, url);
                        PageUtility.SetIndex(this.Page);
                        PageUtility.AddDefaultMetaTag(this.Page);
                    }
                }
            }
            catch (Exception ex)
            {
                mainControl = LoadControl("~/controls/Home.ascx");
                Response.Write(ex.Message);

            }
            PlaceHolder.Controls.Add(mainControl);


            string cache = RequestHelper.GetString("cache", "");
            if (cache == "clear")
            {
                CacheUtility.ClearAllCache();
                CookieUtility.SetValueToCookie("ShowPopup", "0");
            }
        }
    }

    protected void CheckRedirect()
    {
        string url = Request.RawUrl;
        Uri uri;
        if (Uri.TryCreate(url, UriKind.RelativeOrAbsolute, out uri))
        {
            string relativePath = uri.IsAbsoluteUri ? uri.PathAndQuery : url;
            //Response.Write(relativePath);

            DataTable dt = SqlHelper.SQLToDataTable("tblDirectLink", "LinkNew, Type", string.Format("Name=N'{0}'", relativePath), "ID DESC", 1, 1);
            if (Utils.CheckExist_DataTable(dt))
            {
                DataRow dr = dt.Rows[0];
                int statusCode = ConvertUtility.ToInt32(dr["Type"]);
                string newUrl = ConvertUtility.ToString(dr["LinkNew"]);

                switch (statusCode)
                {
                    case 301://301 Redirect (Moved permanently) là một mã trạng thái HTTP ( response code HTTP) để thông báo rằng các trang web hoặc URL đã chuyển hướng vĩnh viễn sang một trang web hoặc URL khác, có nghĩa là tất cả những giá trị của trang web hoặc URL gốc sẽ chuyển hết sang URL mới.
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.Status = "301 Moved Permanently";
                        HttpContext.Current.Response.StatusCode = 301;
                        HttpContext.Current.Response.AddHeader("Location", newUrl);
                        HttpContext.Current.Response.End();
                        break;
                    case 302://302 Redirect (Moved temporarily) là một mã trạng thái HTTP ( response code HTTP) thể thông báo rằng trang web hoặc URL đã chuyển hướng tạm thời sang địa chỉ mới nhưng vẫn phải dựa trên URL cũ. Vì một lý do nào đó, ví dụ như bảo trì trang web chính.
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.Status = "302 Found";
                        HttpContext.Current.Response.StatusCode = 302;
                        HttpContext.Current.Response.AddHeader("Location", newUrl);
                        HttpContext.Current.Response.End();
                        break;
                    case 303://Mã 303 (See Other Location): Mã phản hồi này xuất hiện khi người dùng gửi yêu cầu truy cập cho một vị trí khác. Máy chủ sẽ chuyển yêu cầu truy cập đến vị trí đó.
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.Status = "303 See Other";
                        HttpContext.Current.Response.StatusCode = 303;
                        HttpContext.Current.Response.AddHeader("Location", newUrl);
                        HttpContext.Current.Response.End();
                        break;
                    case 304://Mã 304 (Not Modified): Mã phản hồi này cho biết không cần truyền lại các tài nguyên được yêu cầu. Đây là một loại chuyển hướng ngầm đến các tài nguyên được lưu trữ
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.Status = "304 Not Modified";
                        HttpContext.Current.Response.StatusCode = 304;
                        HttpContext.Current.Response.End();
                        break;
                    case 305://Mã 305 (Use proxy): Tài nguyên mà bạn yêu cầu truy cập chỉ có thể truy cập được khi có sử dụng máy chủ proxy.
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.Status = "305 Use Proxy";
                        HttpContext.Current.Response.StatusCode = 305;
                        HttpContext.Current.Response.End();
                        break;
                    case 307://Mã 307 (Temporary Redirect): Mã phản hồi này được xem như gần giống với mã 302, nhưng chuyển hướng 307 thường được dùng trong trường hợp nâng cấp source hoặc trang web gặp sự cố, người dung nên tiếp tục truy cập địa chỉ này trong tương lai.
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.Status = "307 Temporary Redirect";
                        HttpContext.Current.Response.StatusCode = 307;
                        HttpContext.Current.Response.AddHeader("Location", newUrl);
                        HttpContext.Current.Response.End();
                        break;
                    default:
                        Console.WriteLine("Mã trạng thái không được hỗ trợ");
                        break;
                }
            }
        }
    }
}