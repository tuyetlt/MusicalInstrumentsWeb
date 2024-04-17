using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Ebis.Utilities;


public partial class admin_DonHang_Chart_chart : System.Web.UI.Page
{
    #region Variable
    Control mainControl;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        PlaceHolder1.Controls.Clear();
        if (!IsPostBack)
        {
            var control = Request.QueryString["control"];
            if (string.IsNullOrEmpty(control))
            {
                control = ConvertUtility.ToString(Page.RouteData.Values["control"]).ToLower();
            }
            else
            {
                control = control.ToLower();
            }

         
            try
            {
                switch (control)
                {
                    case "donhang":
                        {
                            mainControl = LoadControl("~/admin/donhang/chart/controls/DonHang.ascx");
                            break;
                        }
                    case "khung":
                        {
                            mainControl = LoadControl("~/admin/donhang/chart/controls/Khung.ascx");
                            break;
                        }
                    case "thuchi":
                        {
                            mainControl = LoadControl("~/admin/donhang/chart/controls/ThuChi.ascx");
                            break;
                        }
                    default:
                        {
                            mainControl = LoadControl("~/admin/donhang/chart/controls/DonHang.ascx");
                            break;
                        }
                }
                PlaceHolder1.Controls.Add(mainControl);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }

}