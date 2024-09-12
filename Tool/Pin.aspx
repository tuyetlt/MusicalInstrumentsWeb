<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pin.aspx.cs" Inherits="Tool_Pin" %>
<%@ Import Namespace="System.Data" %>
<%@ Register Src="~/Controls/HeaderLoad.ascx" TagPrefix="uc1" TagName="HeaderLoad" %>
<%@ Register Src="~/Controls/FooterLoad.ascx" TagPrefix="uc1" TagName="FooterLoad" %>

<%
    string currUrl = Request.RawUrl;
    
    %>
<html>
<head>
    <title>Pin</title>
</head>

<body>
    <div class="product-list">
        <table>
            <% 
                if (Utils.CheckExist_DataTable(dtProduct))
                {
                    foreach (DataRow drProduct in dtProduct.Rows)
                    {
                        string linkDetail = TextChanger.GetLinkRewrite_Products(ConvertUtility.ToString(drProduct["FriendlyUrlCategory"]), ConvertUtility.ToString(drProduct["FriendlyUrl"]));
                        string Pin =  Utils.PinterestPin(linkDetail, Utils.GetFirstImageInGallery_Json(drProduct["Gallery"].ToString()), drProduct["Name"].ToString(), linkDetail.Replace("https://", ""));
            %>
            <tr>
                <td>
                    <a style="font-size:18pt" class="clickhere" data-id="<%= drProduct["ID"].ToString() %>" data-href="<%= Pin %>" href="javascript:;">Pin</a>
                </td>
                <td>
                    <%= drProduct["ID"].ToString() %>
                </td>
                <td>
                    <%= drProduct["Name"].ToString() %>
                </td>
            </tr>

            <%}
                } %>
        </table>
        Trên tổng số <b><%= _totalProduct %></b>
    </div>
    <script type="text/javascript" src="/assets/js/jquery-3.5.1.min.js"></script>

    <script type="text/javascript">
        function Pin()
        {
            window.location.reload(false); 
        }

        $(document).ready(function () {
            $('.clickhere').on('click', function (e) {
                e.preventDefault()
                window.open($(this).attr('data-href'), '_blank');
                var id = $(this).attr('data-id');
                //return false;
                // reload current page
                //location.reload();
                var url = '<%= currUrl %>';
                url = url.split('&')[0];
                window.location.href= url + '&pid=' + id;
            })
        })
    </script>
</body>
</html>