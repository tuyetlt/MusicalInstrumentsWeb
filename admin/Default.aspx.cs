using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Ebis.Utilities;


public partial class admin_default : System.Web.UI.Page
{
    #region Variable
    Control mainControl;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        PlaceHolder.Controls.Clear();
        if (!IsPostBack)
        {
            var folder = Request.QueryString["folder"];
            if (string.IsNullOrEmpty(folder))
            {
                folder = ConvertUtility.ToString(Page.RouteData.Values["folder"]).ToLower();
            }
            else
            {
                folder = folder.ToLower();
            }
            var control = Request.QueryString["control"];
            if (string.IsNullOrEmpty(control))
            {
                control = ConvertUtility.ToString(Page.RouteData.Values["control"]).ToLower();
            }
            else
            {
                control = control.ToLower();
            }

            var ID = Request.QueryString["id"];
            if (string.IsNullOrEmpty(ID))
            {
                ID = ConvertUtility.ToString(Page.RouteData.Values["id"]).ToLower();
            }
            else
            {
                ID = ID.ToLower();
            }


            if (string.IsNullOrEmpty(folder) || string.IsNullOrEmpty(control))
                Response.Redirect("/admin/order/orderlist/");


            try
            {
                using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                {
                    string sqlQuery = string.Format(string.Format("SELECT * FROM tblAdminMenu Where Control=N'{0}'", control));
                    var ds = db.ExecuteSqlDataTable(sqlQuery);
                    if (ds.Rows.Count > 0)
                    {
                        //string access = Utils.AccessPermission(control, action);
                        //if (access != "_denied")
                        //{

                        mainControl = LoadControl(string.Format("~/admin/controls/{0}/{1}", folder, ConvertUtility.ToString(ds.Rows[0]["Control"]) + ".ascx"));

                        ControlAdminInfo.Name = ConvertUtility.ToString(ds.Rows[0]["Name"]);
                        ControlAdminInfo.ShortName = ConvertUtility.ToString(ds.Rows[0]["ShortName"]);
                        ControlAdminInfo.SQLNameTable = ConvertUtility.ToString(ds.Rows[0]["SQLNameTable"]);
                       
                        ControlAdminInfo.Icon = ConvertUtility.ToString(ds.Rows[0]["Icon"]);
                        ControlAdminInfo.Control = ConvertUtility.ToString(ds.Rows[0]["Control"]);

                        if (control.Contains("list"))
                            SEO.meta_title = ControlAdminInfo.Name;
                        else if (ConvertUtility.ToInt32(ID) > 0)
                            SEO.meta_title = "Cập nhật " + ControlAdminInfo.ShortName.ToLower();
                        else if (ConvertUtility.ToInt32(ID) == 0)
                            SEO.meta_title = "Thêm mới " + ControlAdminInfo.ShortName.ToLower();
                        else
                            SEO.meta_title = ControlAdminInfo.ShortName.ToLower();


                    }
                    else
                    {
                        mainControl = LoadControl("~/admin/Controls/AdminControl/AccessDenied.ascx");
                        SEO.meta_title = "Access Denied";
                    }
                    //}
                    //else
                    //{
                    //    if (control == "config")
                    //    {
                    //        mainControl = LoadControl("~/admin/controls/ConfigUpdate.ascx");
                    //        SEO.meta_title = "Cấu hình hệ thống";
                    //    }
                    //}
                    SEO.control = control;
                    PlaceHolder.Controls.Add(mainControl);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}