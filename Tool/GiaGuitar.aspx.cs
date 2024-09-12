using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tool_GiaGuitar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void Organ()
    {
        string html = "";
        DataTable dtMau = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "Gift", "ID=" + 1160);
        html = dtMau.Rows[0][0].ToString();
        DataTable dt = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "", "(CategoryIDList like N'%,143,%' OR CategoryIDParentList like N'%,143,%') and hide=0", "ID");
        if (Utils.CheckExist_DataTable(dt))
        {
            foreach (DataRow dr in dt.Rows)
            {
               
                string sqlQuery = string.Format("Update tblProducts set Gift=N'{0}' where ID={1}", html , dr["ID"]);
                using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                {
                    db.ExecuteSql(sqlQuery);
                }
            }
        }

        //CacheUtility.PurgeCacheItems(C.PRODUCT_TABLE);

        decimal a = 25700000;
        decimal b = (a * 90) / 100;

        Response.Write(b);
    }

    protected void Guitar()
    {
        string html = "";
        DataTable dtMau = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "Gift", "ID=" + 486);
        html = dtMau.Rows[0][0].ToString();
        DataTable dt = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "", "(CategoryIDList like N'%,92,%' OR CategoryIDParentList like N'%92%') and hide=0", "ID");
        if (Utils.CheckExist_DataTable(dt))
        {
            foreach (DataRow dr in dt.Rows)
            {
                decimal Price = ConvertUtility.ToInt32(dr["Price1"]);
                decimal Price1 = (Price * 95) / 100;

                string sqlQuery = string.Format("Update tblProducts set Price={0} where ID={1}", Price1, dr["ID"]);
                using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                {
                    db.ExecuteSql(sqlQuery);
                }
            }
        }

        //CacheUtility.PurgeCacheItems(C.PRODUCT_TABLE);

        decimal a = 25700000;
        decimal b = (a * 90) / 100;

        Response.Write(b);
    }
}