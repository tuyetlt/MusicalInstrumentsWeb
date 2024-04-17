<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetPopup.ascx.cs" Inherits="Controls_WidgetPopup" %>
<%@ Import Namespace="System.Data" %>
<%
    string cookieShowPopup = CookieUtility.GetValueFromCookie("ShowPopup");
    //Response.Write(ConvertUtility.ToInt32(cookieShowPopup));
    if (string.IsNullOrEmpty(cookieShowPopup) || ConvertUtility.ToInt32(cookieShowPopup)<1)
    {
        //Response.Write("cookie: " + cookieShowPopup);
        try
        {
            string domainBanner = System.Configuration.ConfigurationManager.AppSettings["DOMAIN_BANNER_MANAGER"];
            string domainBannerDisplay = System.Configuration.ConfigurationManager.AppSettings["DOMAIN_BANNER_DISPLAY"];
            string filter = string.Format("Website like N'%,{0},%'", domainBannerDisplay);
            filter += " AND (StartDate is null OR StartDate<= GETDATE()) AND (EndDate is null OR EndDate>= GETDATE())";
            filter += string.Format(" AND (Flags & {0} <> 0)", (int)BannerFlag.Popup);
            filter += string.Format(" AND (Hide is null OR Hide=0)");
            System.Data.DataTable dt = SqlHelper.SQLToDataTableBanner("tblBanner", "Image_1,Image_2,Flags,Link,Alt", filter, "Sort", 1, 100);
            if (dt != null && dt.Rows.Count > 0)
            {
                int count = 0;
                foreach (System.Data.DataRow dr in dt.Rows)
                {

                    string link = dr["Link"].ToString();
                    string newTab = string.Empty;
                    if (((BannerFlag)(Ebis.Utilities.ConvertUtility.ToInt32(dr["Flags"]))).HasFlag(BannerFlag.OpenNewWindows))
                        newTab = @" target=""_blank""";
                    string image_1 = domainBanner + dr["Image_1"].ToString();
                    string image_2 = domainBanner + dr["Image_2"].ToString();
                    if (string.IsNullOrEmpty(image_2))
                        image_2 = image_1;
                    string alt = dr["Alt"].ToString();
                    string cssClass = "";

                    string img = string.Format(@"<a{0} href=""{1}""{2}><img src=""{3}"" alt=""{4}"" /></a>", cssClass, link, newTab, image_1, alt);
                    string img_mobile = string.Format(@"<a{0} href=""{1}""{2}><img src=""{3}"" alt=""{4}"" /></a>", cssClass, link, newTab, image_2, alt);

%>

<div id="myModal" class="modal" style="display:none">
    <div class="modal-content">
        <div id="close_popup">&nbsp;</div>
        <p>
            <%
                if (!Utils.isMobileBrowser)
                    Response.Write(img);
                else
                    Response.Write(img_mobile);
                count++;
            %>
        </p>
    </div>
</div>
<%
                }
            }
        }
        catch
        {

        }
    }
%>

<%--<%

        string filter0 = string.Format("Flags & {0} <> 0", (int)BannerPositionFlag.Popup);
        DataTable dt = SqlHelper.SQLToDataTable(C.BANNER_TABLE, "", filter0, "Sort", 1, 10);
        if (Utils.CheckExist_DataTable(dt))
        {
            foreach (DataRow dr in dt.Rows)
            {
                string link = ConvertUtility.ToString(dr["Link"]);
%>
<div id="myModal" class="modal">
    <div class="modal-content">
        <div id="close_popup">&nbsp;</div>
        <p>
            <a href="<%= link %>">
                <img src="<%= dr["Image_1"] %>" alt="<%= dr["Alt"] %>" />
            </a>
        </p>
    </div>
</div>

<script>
    setCookiePopup("ShowPopup", "1", 5);
    function setCookiePopup(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }
</script>


<% }
        }
    } %>--%>



<script>

    setCookiePopup("ShowPopup", "1", 1);
    function setCookiePopup(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 60 * 1000));
        var expires = "expires=" + d.toUTCString();
        document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }
</script>
