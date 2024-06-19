<%@ Page Language="C#" AutoEventWireup="true" CodeFile="blockIP.aspx.cs" Inherits="Tool_blockIP" %>

<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Block</title>
    <style>
        table {
            border-collapse: collapse;
            border: 1px solid;
        }

        table, th, td {
            border: 1px solid;
            padding: 10px;
        }

        tr:hover{
            background:#fff1f1
        }
    </style>
</head>
<body>
    <h3><a href="blockIP.aspx">Block IP</a></h3>

    <%
        DataTable dtCount = SqlHelper.SQLToDataTable("tblKeySearch", "*", string.Format("[Block] = 1"));
        if (Utils.CheckExist_DataTable(dtCount))
        {
            Response.Write("<p>Đã block: <b>" + dtCount.Rows.Count + "</b> IP</p>");
        }

    %>


    <table>
        <%
            DataTable dtS = SqlHelper.SQLToDataTable("tblKeySearch", "*", string.Format("[Block] is null"));
            if (Utils.CheckExist_DataTable(dtS))
            {
                foreach (DataRow dr in dtS.Rows)
                {
        %>


        <tr>
            <td>
                <a href="blockIP.aspx?block=<%= dr["IP"].ToString() %>">Block</a>
            </td>
            <td>
                <%= dr["Name"].ToString() %>
            </td>
            <td>
                <%= dr["IP"].ToString() %>
            </td>
            <td>
                <%= dr["CreatedDate"].ToString() %>
            </td>

            <td>
                <a onclick="return cookkhong('<%= dr["Name"].ToString() %>');" href="blockIP.aspx?ok=<%= dr["IP"].ToString() %>">IP thật, an toàn</a>
            </td>

        </tr>


        <% }
            } %>
    </table>


    <h2>Các tìm kiếm mới</h2>

    <%
        DataTable dtCount1 = SqlHelper.SQLToDataTable("tblKeySearchBlockByIP", "ID,IP", string.Format("[Block] = 1"));
        if (Utils.CheckExist_DataTable(dtCount1))
        {
            Response.Write("<p>Đã block: <b>" + dtCount1.Rows.Count + "</b> IP</p>");
        }

        using (var db = MetaNET.DataHelper.SqlService.GetSqlService())
        {
            string sqlQuery1 = @"Select count(DISTINCT IP) as one From tblKeySearchBlockByIP";
            DataTable dtC = db.ExecuteSqlDataTable(sqlQuery1);
            Response.Write("<p>Không trùng: <b>" + dtC.Rows[0][0] + "</b> IP</p>");
        }

    %>


    <table>
        <%
            DataTable dt = SqlHelper.SQLToDataTable("tblKeySearchBlockByIP", "*", "", "ID DESC", 1, 100);
            if (Utils.CheckExist_DataTable(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
        %>


        <tr>

            <td>
                <%= dr["Name"].ToString() %>
            </td>
            <td>
                <%= dr["IP"].ToString() %>
            </td>
            <td>
                <%= dr["Block"].ToString() %>
            </td>
            <td>
                <%= dr["CreatedDate"].ToString() %>
            </td>


        </tr>


        <% }
            } %>
    </table>




    <script>
        function coxoakhong(text) {

            if (confirm("Bạn chắc chắn chữ này là cố ý phá hoại và Block IP Vĩnh Viễn ??? \n \n ======================================== \n" + text + "\n ======================================== ") == true) {
                return true;
            } else {
                return false;
            }
        }

        function cookkhong(text) {

            //if (confirm("An Toàn ??? \n \n ======================================== \n" + text + "\n ======================================== ") == true) {
            //    return true;
            //} else {
            //    return false;
            //}

            return true;
        }
    </script>
</body>
</html>
