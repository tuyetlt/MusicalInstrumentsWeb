﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax_Controls_SearchSuggestion : System.Web.UI.UserControl
{
    public DataTable dtProduct;

    protected void Page_Load(object sender, EventArgs e)
    {

        var key = RequestHelper.GetString("key", "");// Utils.GetQueryString("key", "");

        Response.Clear();
        if (!Utils.IsNullOrEmpty(key))
        {
            dtProduct = Utils.SearchProduct(key, 10);
        }
    }
}