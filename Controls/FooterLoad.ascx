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


<script>
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

    //$('#countdown').countdown('2021/02/12', function (event) {
    //    $(this).html(event.strftime('<div class="item"><span>%D</span><div>ngày</div></div ><div class="item"><span>%H</span><div>giờ</div></div><div class="item"><span>%M</span><div>phút</div></div><div class="item"><span>%S</span><div>giây</div></div>'));
    //});


    $(document).ready(function () {
        if ($("#calendar-right").length > 0) {
            CreateCalendarUCRight();
        }
        var ps = 3;
        var totalRow = parseInt($('#hdfTotal').val());
        var totalPage = parseInt(totalRow / ps);
        if (totalPage < 1) $('.view_more_comment').hide();
        GetCommentList(1, ps, false);
        var cookfullname = getCookie('fullname');
        $('#name').val(cookfullname);
        $('#name1').val(cookfullname);

        var cookiesAvatar = getCookie("avatar");
        if (cookiesAvatar != '' && cookiesAvatar != null) {
            alert(cookiesAvatar);
            var avt = '/upload/avatar/' + cookiesAvatar;
            $('#myAvatar').attr("src", avt);
            $('#myAvatar1').attr("src", avt);
        }
    });
    <% if (Utils.isMobileBrowser)
    {%>

    $(".icon-mobi-right .btn-search").click(function () {
        $(".header-content.headermobi .search").show();
        $(this).hide();
        $("#searchbox").focus();
    });

    $(document).mouseup(function (e) {
        var container = $(".header-content.headermobi .search");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.hide();
            $(".icon-mobi-right .btn-search").show();
        }
    });
    <% } %>

    function setCookie(key, value, expiry) {
        var expires = new Date();
        expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
        document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
    }

    function getCookie(key) {
        var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
        return keyValue ? keyValue[2] : null;
    }

    function eraseCookie(key) {
        var keyValue = getCookie(key);
        setCookie(key, keyValue, '-1');
    } 
</script>


<script>
    $(document).ready(function () {
        if ($("#calendar-right").length > 0) {
            CreateCalendarUCRight();
        }
        var ps = 3;
        var totalRow = parseInt($('#hdfTotal').val());
        var totalPage = parseInt(totalRow / ps);
        if (totalPage < 1) $('.view_more_comment').hide();
        GetCommentList(1, ps, false);
        var cookfullname = getCookie('fullname');
        $('#name').val(cookfullname);
        $('#name1').val(cookfullname);

        var cookiesAvatar = getCookie("avatar");
        if (cookiesAvatar != '' && cookiesAvatar != null) {
            alert(cookiesAvatar);
            var avt = '/upload/avatar/' + cookiesAvatar;
            $('#myAvatar').attr("src", avt);
            $('#myAvatar1').attr("src", avt);
        }
    });
    <% if (Utils.isMobileBrowser)
    {%>

    $(".icon-mobi-right .btn-search").click(function () {
        $(".header-content.headermobi .search").show();
        $(this).hide();
        $("#searchbox").focus();
    });

    $(document).mouseup(function (e) {
        var container = $(".header-content.headermobi .search");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.hide();
            $(".icon-mobi-right .btn-search").show();
        }
    });
    <% } %>

    function setCookie(key, value, expiry) {
        var expires = new Date();
        expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
        document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
    }

    function getCookie(key) {
        var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
        return keyValue ? keyValue[2] : null;
    }

    function eraseCookie(key) {
        var keyValue = getCookie(key);
        setCookie(key, keyValue, '-1');
    } 
</script>
<script type="text/javascript">

    $(document).ready(function () {
        $(".comment-list").on("click", ".comment_like", function () {
            var currLike = $(this).attr("data-like");
            var id = $(this).attr("data-id");
            var currButton = $(this);
            var likeHtml = $(this).find("span");
            $.getJSON('/ajax/ajax.aspx', { control: "comment", action: 'like', id: id, currLike: currLike, t: Math.random() }, function (data) {
                $.each(data, function (key, value) {
                    if (key == "active") {
                        if (value == "true")
                            currButton.addClass("active");
                        else
                            currButton.removeClass("active");
                    }
                    if (key == "currLike") {
                        currButton.attr('data-like', value);
                        likeHtml.html(value);
                    }
                });
            });
        });
    });
    $("input[name='rating']").click(function () {
        var value = $(this).attr("data-value");
        var hdfRating = $("#hdfRating");
        hdfRating.val(value);
    });

    $(document).ready(function (e) {
        /* var rcres = grecaptcha.getResponse();
         if (rcres.length > 0) {*/

        $("#frmrating").on('submit', (function (e) {
            e.preventDefault();
            setCookie('fullname', $('#name').val(), '30');
            console.log('fullname'),
            $.ajax({
                
                url: "/ajax/ajax.aspx?control=comment&action=post",
                type: "POST",
                data: new FormData(this),
                contentType: false,
                cache: false,
                processData: false,
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'invalid') {
                        console.log("Dữ liệu không hợp lệ");
                    }
                    else {
                        var retSplit = data.split('|');
                        if (retSplit.length > 1) {
                            var ckiesAvatar = retSplit[1];
                            if (ckiesAvatar != '') setCookie('avatar', ckiesAvatar, '30');
                        }
                        $('#name').val('');
                        $('#comment').val("");
                        $('#hdfRating').val("");
                        GetCommentList(1, 3, false);
                        console.log("Post thành công");
                    }
                },
                error: function (e) {
                    console.log("Có lỗi xảy ra");
                }
            });
        }));
        /*} else {
            alert('Check chọn xác thực');
        }*/
        //reply form
        $("#frm_reply_comment").on('submit', (function (e) {
            //var rcres = grecaptcha.getResponse();
            //if (rcres.length > 0) {
                var articleCurrent = $('#hdfCurrentComment').val();
                var modal = document.getElementById("model_reply_comment");
                setCookie('fullname', $('#name1').val(), '30');
                e.preventDefault();
                $.ajax({
                    url: "/ajax/ajax.aspx?control=comment&action=reply&currid=" + articleCurrent,
                    type: "POST",
                    data: new FormData(this),
                    contentType: false,
                    cache: false,
                    processData: false,
                    beforeSend: function () {
                    },
                    success: function (data) {
                        if (data == 'invalid') {
                            console.log("Dữ liệu không hợp lệ");
                        }
                        else {
                            var retSplit = data.split('|');
                            if (retSplit.length > 1) {
                                var ckiesAvatar = retSplit[1];
                                if (ckiesAvatar != '') setCookie('avatar', ckiesAvatar, '30');
                            }
                            modal.style.display = "none";
                            $('#name1').val('');
                            $('#comment1').val("");
                            $('#hdfRating1').val("");
                            GetCommentList(1, 3, false);
                            console.log("Post thành công");
                        }
                    },
                    error: function (e) {
                        console.log("Có lỗi xảy ra");
                    }
                });
            //}
            //ParsteWeather();
            //window.setInterval(ParsteWeather, 6000 * 2);
        }));


    });
    window.addEventListener('load', function () {
        var fileAvar = $("#fileavatar")[0];
        if (typeof (fileAvar) != 'undefined') {
            $("#fileavatar")[0].addEventListener('change', function () {
                if (this.files && this.files[0]) {
                    var img = $("#myAvatar")[0];
                    img.src = URL.createObjectURL(this.files[0]);
                    img.onload = imageIsLoaded;

                    $("#hdfimg").val($("#fileavatar").val().split('\\').pop());
                }
            });
        }

        var fileAvar1 = $("#fileavatar1")[0];
        if (typeof (fileAvar1) != 'undefined') {
            $("#fileavatar1")[0].addEventListener('change', function () {
                if (this.files && this.files[0]) {
                    var img = $("#myAvatar1")[0];
                    img.src = URL.createObjectURL(this.files[0]);
                    img.onload = imageIsLoaded;
                    $("#hdfimg1").val($("#fileavatar1").val().split('\\').pop());
                }
            });
        }

    });
    function imageIsLoaded(e) { }

    function ImgLoading(show) {
        if (show) {
            $("#div-ajax-loading").show();
        }
        else {
            $("#div-ajax-loading").hide();
        }
    }
    function DelComment(del, parentid) {
        if (confirm("Xóa bình luận?")) {
            $.ajax({
                url: "ajax/ajax.aspx?control=comment",
                type: "POST",
                data: { action: "delete", delid: del, parent: parentid },
                contentType: false,
                cache: false,
                processData: false,
                beforeSend: function () {
                },
                success: function (data) {
                    if (data == 'ok') {
                        alert("Xóa thành công");
                        GetCommentList(1, 3, false);
                    }
                }
            });
        }
    }
    $('#viewmore').click(function (e) {
        var pageIndex = $('#hdfpageIndex').val();
        var totalRows = parseInt($('#hdfTotal').val());
        var pageSize = parseInt($('#hdfPageSize').val());
        pageSize += pageSize;
        GetCommentList(pageIndex, pageSize, false);
        $('#hdfpageIndex').val(parseInt(pageIndex));
        var total = totalRows;
        total = parseInt(total - pageSize);
        if (total > 3) {
            $('#viewmore').html("Xem thêm " + 3 + "/" + total);
        } else {
            $('#viewmore').hide();
            pageSize += total;
        }
    });
    function GetCommentList(PageIndex, pagesize, isAppend) {
        var articleID = $('#txtArticleID').val();
        var d = new Date();
        var n = d.getMilliseconds();
        ImgLoading(true);
        var xhr = $.ajax({
            url: "/ajax/ajax.aspx",
            data: { control: "commentlistdetail", article: articleID, pi: PageIndex, ps: pagesize, t: n },
            success: function (html) {
                if (html != "") {
                    if (isAppend)
                        $(".comment-list").append(html);
                    else
                        $(".comment-list").html(html);
                } else $('.view_more_comment').hide();
                ImgLoading(false);

            }
        });
        console.log(xhr);
    } 
</script>