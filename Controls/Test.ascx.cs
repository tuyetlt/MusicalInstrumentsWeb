using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Test : System.Web.UI.UserControl
{
    public string ID { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void LoadData()
    {
        //Response.Write(ID);
    }
}