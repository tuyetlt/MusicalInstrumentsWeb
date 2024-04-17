using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_CategoryAll : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //PageInfo.ControlName = "Sơ đồ Website";
        PageInfo.CurrentControl = ControlCurrent.ContentDetail.ToString();
        SetSEO();
    }

    protected void SetSEO()
    {
        string Title = "Sơ đồ Website";
        string MetaTitle = Title + ", " + ConfigWeb.MetaTitle;
        string MetaKeyword = Title + ", " + ConfigWeb.MetaKeyword;
        string MetaDescription = Title + ", " + ConfigWeb.MetaDescription;
        string url = C.ROOT_URL + Request.RawUrl;
        PageUtility.AddTitle(this.Page, MetaTitle);
        PageUtility.AddMetaTag(this.Page, "keywords", MetaKeyword);
        PageUtility.AddMetaTag(this.Page, "description", MetaDescription);
        PageUtility.OpenGraph(this.Page, MetaTitle, "website", url, C.ROOT_URL + ConfigWeb.Image, ConfigWeb.SiteName, MetaDescription);
        PageUtility.AddCanonicalLink(this.Page, url);
        PageUtility.SetIndex(this.Page);
        PageUtility.AddDefaultMetaTag(this.Page);
    }
}