using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_FooterLoad : System.Web.UI.UserControl
{
    public bool IsTimeWorking = false;
    protected void Page_Load(object sender, EventArgs e)
    {

        DateTime date = DateTime.Now;
        if (date.DayOfWeek == DayOfWeek.Sunday)
        {
            IsTimeWorking = false;
        }
        else if (date.Hour >= 9 && date.Hour < 12) //từ 9h đến 12h
        {
            IsTimeWorking = true;
        }
        else if (date.Hour >= 13 && date.Hour <= 18) //từ 13h30 đến 18h
        {
            IsTimeWorking = true;
        }
        else
        {
            IsTimeWorking = false;
        }
    }
}