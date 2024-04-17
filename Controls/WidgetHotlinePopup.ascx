<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetHotlinePopup.ascx.cs" Inherits="Controls_WidgetHotlinePopup" %>
<%@ Import Namespace="System.Data" %>

<div class="hotline_sup">
    <div class="close_bg"></div>
    <div class="insider">
        <h3>HỖ TRỢ TRỰC TUYẾN</h3>
        <img src="../themes/img/cham-soc-khach-hang.png" alt="Chăm sóc khách hàng" />
        <a class="close" href="javascript:void(0);"><i class="fal fa-times"></i></a>
        <ul>
            <%
                string filter = string.Format("ParentID=0 AND Flags & {0} <> 0", (int)BaseTableFlag.Support);
                DataTable dtParent = SqlHelper.SQLToDataTable("tblBase", "", filter);

                if (MultiLevel)
                {
                    if (Utils.CheckExist_DataTable(dtParent))
                    {
                        foreach (DataRow drParent in dtParent.Rows)
                        {
            %>
            <li>
                <h4><%= drParent["Name"] %></h4>
                <div class="cont">
                    <%
                        filter = string.Format("ParentID={0} AND Flags & {1} <> 0", drParent["ID"], (int)BaseTableFlag.Support);
                        DataTable dtChild = SqlHelper.SQLToDataTable("tblBase", "", filter);
                        if (Utils.CheckExist_DataTable(dtChild))
                        {
                            foreach (DataRow drChild in dtChild.Rows)
                            {
                    %>
                    <a href="tel:<%= drChild["Phone"] %>" class="item">
                        <img src="/themes/image/callnowbutton.png" alt="<%= drChild["Name"] %>" />
                        <span><span><%= drChild["Name"] %>:</span> <%= drChild["Phone"] %></span>
                    </a>
                    <%
                            }
                        }
                    %>
                </div>
            </li>
            <%
                        }
                    }
                }
                else
                {
            %>

            <li>
                <div class="cont">
                    <%
                        if (Utils.CheckExist_DataTable(dtParent))
                        {
                            foreach (DataRow drParent in dtParent.Rows)
                            {
                    %>
                    <a href="tel:<%= drParent["Phone"] %>" class="item">
                        <img src="/themes/image/callnowbutton.png" alt="<%= drParent["Name"] %>" />
                        <span><span><%= drParent["Name"] %>:</span> <%= drParent["Phone"] %></span>
                    </a>
                    <%
                            }
                        }
                    %>
                </div>
            </li>
            <%
                }
            %>
        </ul>
    </div>
</div>
