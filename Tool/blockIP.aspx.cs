using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tool_blockIP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string block = RequestHelper.GetString("block", string.Empty);
        string ok = RequestHelper.GetString("ok", string.Empty);

        if (!string.IsNullOrEmpty(ok))
        {
            using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
            {
                string sqlQuery = @"Update tblKeySearch set [Block]=0 Where [IP]=N'" + ok + "'";
                db.ExecuteSql(sqlQuery);
            }
        }
        else
        {
            if (!string.IsNullOrEmpty(block) && block == "all")
            {
                DataTable dtS = SqlHelper.SQLToDataTable("tblKeySearch", "", string.Format("Block is null"));
                if (Utils.CheckExist_DataTable(dtS))
                {
                    foreach (DataRow dr in dtS.Rows)
                    {
                        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                        {
                            string sqlQuery = @"Update tblKeySearch set [Block]=1 Where [IP]=N'" + dr["IP"] + "'";
                            sqlQuery += string.Format(@"DELETE FROM tblKeySearch WHERE ID NOT IN (SELECT MIN(ID) FROM tblKeySearch where IP=N'{0}') AND IP=N'{0}'", dr["IP"]);
                            db.ExecuteSql(sqlQuery);
                        }
                    }
                }
            }
            else if (!string.IsNullOrEmpty(block))
            {
                using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
                {
                    string sqlQuery = @"Update tblKeySearch set [Block]=1 Where [IP]=N'" + block + "'";
                    sqlQuery += string.Format(@"DELETE FROM tblKeySearch WHERE ID NOT IN (SELECT MIN(ID) FROM tblKeySearch where IP=N'{0}') AND IP=N'{0}'", block);
                    db.ExecuteSql(sqlQuery);
                }
            }
        }
    }
}