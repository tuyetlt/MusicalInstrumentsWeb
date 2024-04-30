using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ajax_Controls_Tool : System.Web.UI.UserControl
{
    public string Notice = "";
    public string click_action;
    public DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckPermission();
        UpdateDatabase();
    }


    protected void UpdateDatabase()
    {
        try
        {
            click_action = Request.Form["done"];
            if (!String.IsNullOrEmpty(click_action))
            {
                string table = Request.Form["table"];
                string field = Request.Form["field"];
                string value1 = Request.Form["value1"];
                string value2 = Request.Form["value2"];

                if (click_action == "replace")
                {

                    using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                    {
                        string sqlQuery = string.Format(@"UPDATE {0} SET {1} = REPLACE({1}, @Value1, @Value2)", table, field);
                        db.AddParameter("@Value1", System.Data.SqlDbType.NVarChar, value1);
                        db.AddParameter("@Value2", System.Data.SqlDbType.NVarChar, value2);
                        db.ExecuteSql(sqlQuery);

                        Notice = sqlQuery + "<br />";
                    }
                }
                else if (click_action == "select")
                {
                    dt = SqlHelper.SQLToDataTable(table, field, "", "ID DESC", 1, 100);
                }
                else if (click_action == "query")
                {

                }
            }
        }
        catch (Exception e)
        {
            Notice += e.Message;
        }
    }

    protected void CheckPermission()
    {
        using (var dbx = MetaNET.DataHelper.SqlService.GetSqlService())
        {
            string sqlQuery = string.Format("Select Top 1 u.ID, u.[Name], u.Email, u.Gallery, p.Name as 'PermissionName', p.[Role] from tblAdminUser as u inner join tblAdminPermission as p on u.Permission = p.ID AND u.ID={0}", Page.User.Identity.Name);
            DataTable dt = dbx.ExecuteSqlDataTable(sqlQuery);
            if (Utils.CheckExist_DataTable(dt) && dt.Rows[0]["Email"].ToString() == "tuanson.nd@gmail.com")
            {

            }
            else
            {
                Response.Redirect("/admin/login/");
            }
        }
    }
}