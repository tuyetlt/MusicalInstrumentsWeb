﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_Controls_CronJob : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //GenSitemap.SitemapUpdate();
        GenSitemap.GenGoogleShopping();
    }
}