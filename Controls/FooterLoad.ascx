<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FooterLoad.ascx.cs" Inherits="Controls_FooterLoad" %>
<%@ Import Namespace="System.Data" %>
<script type="application/ld+json">{
"@context": "https://schema.org",
"@type": "LocalBusiness",

"url": "<%= C.ROOT_URL %>",
"logo": "<%= ConfigWeb.LogoAdmin %>",
"image": [
    "<%= C.ROOT_URL %><%= ConfigWeb.Image %>"
],
   "description": "<%= ConfigWeb.MetaDescription %>",
"name": "<%= ConfigWeb.SiteName %>",
   "telephone": "<%= ConfigWeb.SchemaTelephone %>",
"priceRange":"1$-100$",
"hasMap": "<%= ConfigWeb.MapLocation %>",
"email": "<%= ConfigWeb.Email %>",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "<%= ConfigWeb.SchemaStreetAddress %>",
    "addressLocality": "<%= ConfigWeb.SchemaAddressLocality %>",
    "postalCode": "<%= ConfigWeb.SchemaPostalCode %>",
    "addressCountry": "VN"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": <%= ConfigWeb.SchemaLatitude %>,
    "longitude": <%= ConfigWeb.SchemaLongitude %>
  },
  "openingHoursSpecification": {
    "@type": "OpeningHoursSpecification",
    "dayOfWeek": [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ],
    "opens": "00:00",
    "closes": "23:59"
  },
  "sameAs": <%= ConfigWeb.SchemaSameAs %>
    }
</script>


<% var themes = ""; // "-" + ConfigWeb.Style.Replace(".css", ""); %>

<div class="contactWidget">
    <div class="item">
        <a href="javascript:;" id="callButton" rel="nofollow">

            <img src="/themes/img/icon-contact<%= themes %>/phone.png" alt="Gọi ngay" />
            <br />
            Gọi ngay
        </a>
    </div>
    <div class="item">
        <% if (!IsTimeWorking)
            { %>
        <div class="bubble">
            <span class="bubble-outer-dot">
                <span class="bubble-inner-dot"></span>
            </span>
        </div>
        <% } %>
        <a  id="messengerButton" href="https://m.me/<%= ConfigWeb.FacebookID %>" rel="nofollow" target="_blank">
            <img src="/themes/img/icon-contact<%= themes %>/messenger.png" alt="Messenger" />
            <br />
            Messenger
        </a>
    </div>
    <div class="item">
        <% if (!IsTimeWorking)
            { %>
        <div class="bubble">
            <span class="bubble-outer-dot">
                <span class="bubble-inner-dot"></span>
            </span>
        </div>
        <% } %>
        <a  id="zaloButton" href="https://zalo.me/<%= ConfigWeb.OAZalo %>" rel="nofollow" target="_blank">
            <img src="/themes/img/icon-contact<%= themes %>/zalo.png" alt="Zalo" />
            <br />
            Zalo
        </a>
    </div>
    <div class="item">
        <a href="javascript:;" id="btnMap" rel="nofollow">
            <img src="/themes/img/icon-contact<%= themes %>/map.png" alt="Bản đồ" />
            <br />
            Bản đồ
        </a>
    </div>
    <div class="item">

        <% if (IsTimeWorking)
            { %>
        <div class="bubble">
            <span class="bubble-outer-dot">
                <span class="bubble-inner-dot"></span>
            </span>
        </div>
        <% } %>
        <a href="javascript:;" id="th-oncustomer-customchat" rel="nofollow">
            <img src="/themes/img/icon-contact<%= themes %>/chat.png" alt="Chat" />
            <br />
            Chat nhanh
        </a>
    </div>

    <div id="telList" class="modal">
        <div class="modal-content">
            <div class="close_popup">&nbsp;</div>
            <%=Utils.LoadUserControl("~/Controls/WidgetSupport.ascx") %>
        </div>
    </div>


    <div id="map" class="modal">
        <div class="modal-content">
            <div class="close_popup">&nbsp;</div>

            <%= ConfigWeb.MapPage %>
        </div>
    </div>
</div>


<%--<button class="backtop"><i class="fa fa-chevron-up"></i></button>--%>
<div class="div-ajax-loading">
    <div></div>
    <div></div>
    <div></div>
</div>

<%--<!--callphone-->
<div class="hotline-phone-ring-wrap">
    <div class="hotline-phone-ring">
        <div class="hotline-phone-ring-circle"></div>
        <div class="hotline-phone-ring-circle-fill"></div>
        <div class="hotline-phone-ring-img-circle">
            <a href="#" class="pps-btn-img">
                <img
                    src="/themes/image/icon-call-nh.png"
                    alt="Gọi điện thoại"
                    width="50" />
            </a>
        </div>
    </div>
</div>

<%= Utils.LoadUserControl("~/Controls/WidgetHotlinePopup.ascx") %>--%>


<%
    if (ShoppingCart.CartCount > 0)
    {
%>
<a href="/gio-hang.html" class="cart" rel="nofollow">
    <div class="container-cart">
        <div class="icon">
            <i class="fas fa-shopping-cart"></i>
        </div>
        <div class="content">
            <h4 class="title">Giỏ hàng</h4>
            <span class="text">Sản phẩm : </span><span id="header-cart-count" class="count"><%= ShoppingCart.CartCount %></span>
        </div>
    </div>
</a>
<% } %>




<script type="text/javascript" src="/assets/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" defer src="/assets/js/owl.carousel.min.js"></script>
<script type="text/javascript" defer src="/assets/js/jquery.cookie.min.js"></script>
<script type="text/javascript" defer src="/assets/js/jquery.validate.min.js"></script>
<script type="text/javascript" defer src="/assets/js/readmore.min.js"></script>
<script type="text/javascript" defer src="/assets/js/slick.min.js"></script>
<script type="text/javascript" defer src="/assets/js/jquery.fancybox.min.js"></script>
<script type="text/javascript" defer src="/themes/js/paging.js"></script>



<%--<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=6LeElkAUAAAAANuMaaQDYjafpAYLDnXYQlTa00eq" async defer></script>--%>

<%--<script>
        var onloadCallback = function () {
        var widgetId1 = grecaptcha.render('dvCaptchaComment', {
            'sitekey': '<%= C.GoogleCaptcha_SiteKey %>',
            'theme': 'light'
        });
        var widgetId2 = grecaptcha.render('dvCaptchaCommentRe', {
            'sitekey': '<%= C.GoogleCaptcha_SiteKey %>',
            'theme': 'light'
        });
    };

    </script>--%>

<script type="text/javascript" defer src="<%= Utils.CheckVersion_NonTemplate("/themes/js/control.js") %>"></script>

<script>
    var modal = $("#myModal");
    var btn = $("#myBtn");
    var close_popup = $("#close_popup");

    close_popup.click(function () {
        modal.hide();
    });

    modal.click(function () {
        modal.hide();
    });

    $("#xemthem").click(function () {
        $("#description_cate").removeClass("height250");
        $(this).parent().hide();
    });






    var modal_tel = $("#telList");
    var modal_map = $("#map");
    var btnTel = $("#callButton");
    var btnMap = $("#btnMap");
    var close_popup = $(".close_popup");


    btnTel.click(function () {
        modal_tel.show();
    });

    btnMap.click(function () {
        modal_map.show();
    });

    close_popup.click(function () {
        modal_tel.hide();
        modal_map.hide();
    });

    modal_tel.click(function () {
        modal_tel.hide();
    });




    setTimeout(function () {
        if ($('#myModal').length)
            $('#myModal').show();
    }, 3000);


</script>

