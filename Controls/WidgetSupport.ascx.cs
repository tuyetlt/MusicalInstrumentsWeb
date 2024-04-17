using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_WidgetSupport : System.Web.UI.UserControl
{
    public bool MultiLevel = false;
    DataTable dtParent;
    protected void Page_Load(object sender, EventArgs e)
    {
        string filter = string.Format("ParentID<>0 AND Flags & {0} <> 0", (int)BaseTableFlag.Support);
        dtParent = SqlHelper.SQLToDataTable("tblBase", "ID", filter);
        if (Utils.CheckExist_DataTable(dtParent))
        {
            MultiLevel = true;
        }
    }
}