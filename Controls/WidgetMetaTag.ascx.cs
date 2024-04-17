using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_WidgetMetaTag : System.Web.UI.UserControl
{
    public string meta_title { get; set; }
    public string meta_keyword { get; set; }
    public string meta_description { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}