<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Tool.ascx.cs" Inherits="admin_ajax_Controls_Tool" %>
<%@ Import Namespace="System.Data" %>

<%=Utils.LoadUserControl("~/admin/Controls/AdminControl/HeaderLoad.ascx") %>

<style type="text/css">
    .notice {
        background: #fff;
        color: #0b009f;
        padding: 10px;
        border: 1px solid #dbdbdb;
        margin-bottom: 20px;
    }

    table, th, td {
        border: 1px solid;
        border-collapse: collapse;
        background: #fff;
        padding: 5px 10px;
    }

  /*  td {
        max-width: 200px;
        height: 200px;
        overflow: hidden;
    }*/
</style>

<div style="width: 700px; margin: 20px auto">
    <form method="post" enctype="multipart/form-data" id="frm_edit">
        <div class="notice"><%= Notice %></div>
        <div class="form-group">
            <div>Bảng</div>
            <div>

                <% 
                    DataTable dtTable = SqlHelper.SQLToDataTable("SYSOBJECTS", "", "xtype = 'U'");
                %>

                <select id="table" name="table" style="width: 300px">
                    <%
                        foreach (DataRow drTable in dtTable.Rows)
                        {
                            Response.Write(string.Format(@"<option value=""{0}"">{0}</option>", drTable["name"]));
                        }
                    %>
                </select>
            </div>
        </div>

        <div class="form-group">
            <div>Field</div>
            <div>
                <input type="text" name="field" value="" />
            </div>
        </div>

        <div class="form-group">
            <div>Tìm</div>
            <div>
                <input type="text" name="value1" value="" />
            </div>
        </div>
        <div class="form-group">
            <div>Thay thế bằng</div>
            <div>
                <input type="text" name="value2" value="" />
            </div>
        </div>

        <div class="clear"></div>
        <div>
            <div>&nbsp;</div>
            <div>

                <button type="submit" data-value="select" class="btnSubmit btnSave">Select</button>
                <button type="submit" data-value="replace" class="btnSubmit btnSaveAndAdd">Replace</button>
                <button type="submit" data-value="query" class="btnSubmit btnSaveAndBack">Query</button>
                <input type="hidden" id="done" name="done" value="0" />
                <script type="text/javascript">
                    $(".btnSubmit").click(function () {
                        var dataValue = $(this).attr("data-value");
                        $('#frm_edit #done').val(dataValue);
                        $(this).attr('disabled', 'disabled');
                        $(this).html('Loading...');
                        $("#frm_edit").submit();
                    });
                </script>
            </div>
        </div>
    </form>
</div>

<div>
    <% if (Utils.CheckExist_DataTable(dt))
        {
            Response.Write("<table>");
            foreach (DataRow dr in dt.Rows)
            {
                Response.Write("<tr>");
                Response.Write(string.Format(@"<td>{0}</td>", dt.Rows[0].ItemArray));

                for (int i = 0; i < dr.ItemArray.Length; i++)
                {
                    //if (!Utils.IsNullOrEmpty(dr[i]))
                        Response.Write(string.Format(@"<td>{0}</td>", dr[i]));
                }
                Response.Write("</tr>");
            }
            Response.Write("</table>");
        }
    %>
</div>
