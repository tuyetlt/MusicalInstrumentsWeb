using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_WidgetComment : System.Web.UI.UserControl
{
    public static int ArticleID = 0;
    string seo_title = "";
   
    protected void Page_Load(object sender, EventArgs e)
    {
        seo_title = ConvertUtility.ToString(Page.RouteData.Values["seo_title"]);
        if (!Page.IsPostBack)
        {
            LoadFirst(); 
        }
    }
    protected void LoadFirst()
    {
        DataTable dt = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "", string.Format("FriendlyUrl=N'{0}'", seo_title));
        if (Utils.CheckExist_DataTable(dt))
        {
            ArticleID = ConvertUtility.ToInt32(dt.Rows[0]["ID"] + "");

        }
    }
}