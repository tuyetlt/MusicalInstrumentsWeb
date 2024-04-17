using System;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
public partial class Main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //AddCssLinks();
            //PageInfo.CategoryID = 0;
            //PageInfo.ControlName = string.Empty;
            //PageInfo.LinkEdit = string.Empty;

            //SEO.meta_title = ConfigWeb.MetaTitle;
            //SEO.meta_keyword = ConfigWeb.MetaKeyword;
            //SEO.meta_description = ConfigWeb.MetaDescription;
            //SEO.url_current = C.ROOT_URL;
            //SEO.canonical = C.MAIN_URL;

            //StringBuilder sb = new StringBuilder();
            //sb.AppendLine("<meta property='og:title' content='" + SEO.meta_title + "' />");
            //sb.AppendLine("<meta property='og:type' content='website'/>");
            //sb.AppendLine("<meta property='og:url' content='" + SEO.url_current + "'/>");
            //sb.AppendLine("<meta property='og:image' content='" + ConfigWeb.Image + "'/>");
            //sb.AppendLine("<meta property='og:site_name' content='" + SEO.url_current + "'/>");
            //sb.AppendLine("<meta property='og:description' content='" + SEO.meta_description + "'/>");
            //SEO.content_share_facebook = ConvertUtility.ToString(sb);
            //PageInfo.CurrentControl = ControlCurrent.Home.ToString();
        }
    }

  
}
