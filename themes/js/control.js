$(document).ready(function () {
    var arr_scroll = [];
    //search header
    $('header .search').on('click', function () {
        $('header').addClass('search_ac');
        $('header .over-lay').css({
            display: 'block',
        });
    });

    $('header .search input').on('keyup', function () {
        $('.show_search_content').fadeIn();
        if ($('header .search input').val() == '') {
            $('.show_search_content').fadeOut();
            $(".over-lay-search").hide();
        }
        return false;
    });

    $('.sticky_mobi input').on('keyup', function () {
        $('.search_toggle_show').addClass('ac');

        return false;
    });

    $('main').on('click', function () {
        $('header').removeClass('search_ac');
        $('.show_search_content').hide();
        $(".over-lay-search").hide();
        $(".loading-search").hide();
        $('.search_toggle_show').removeClass('ac');
        $('header .over-lay').css({
            display: 'none',
        });
    });
    $('.menu-header').on('click', function () {
        $('header').removeClass('search_ac');
        $('.show_search_content').hide();
        $(".over-lay-search").hide();
        $(".loading-search").hide();
        $('.search_toggle_show').removeClass('ac');
        $('header .over-lay').css({
            display: 'none',
        });
    });
    $('header .over-lay').on('click', function () {
        $('header').removeClass('search_ac');
        $('.show_search_content').hide();
        $(".over-lay-search").hide();
        $(".loading-search").hide();
        $('.search_toggle_show').removeClass('ac');
        $('header .over-lay').css({
            display: 'none',
        });
    });

    $('header .over-lay-search').on('click', function () {
        $('header').removeClass('search_ac');
        $('.show_search_content').hide();
        $(".over-lay-search").hide();
        $(".loading-search").hide();
        $('.search_toggle_show').removeClass('ac');
        $('header .over-lay').css({
            display: 'none',
        });
    });

    //slide homepage
    $('#owl_home_slide').owlCarousel({
        loop: true,
        nav: true,
        margin: 10,
        autoplay: true,
        dots: false,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1024: {
                items: 1,
                
            }
        }
    });

    $('#owl_slide_partners').owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        dots: false,
        responsive: {
            0: {
                items: 2
            },
            600: {
                items: 2
            },
            1000: {
                items: 5
            }
        }
    });

    //slide homepage
    $('#owl_slide_product').owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        dots: false,
        responsive: {
            0: {
                items: 2
            },
            600: {
                items: 2
            },
            1000: {
                items: 5
            }
        }
    });

    $('.owl_multi_product').owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        nav: true,
        dots: false,
        lazyLoad: true,
        responsive: {
            0: {
                items: 2
            },
            600: {
                items: 2
            },
            1000: {
                items: 3
            },
            1200: {
                items: 1
            }
        }
    });

    $('.owl_product_hot').owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        nav: true,
        dots: false,
        lazyLoad: true,
        responsive: {
            0: {
                items: 2
            },
            600: {
                items: 2
            },
            1000: {
                items: 4
            },
            1200: {
                items: 5
            }
        }
    });

    $('.owl_video').owlCarousel({
        loop: true,
        margin: 15,
        items: 1,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            },
            1000: {
                items: 3
            }
        }
    });


    $('.nav-link.down').on('click', function () {
        var dataid = $(this).attr("data-id");
        var sub = $(".sub" + dataid);
        sub.slideToggle();
    });

    $('.category-item.down').on('click', function () {
        var dataid = $(this).attr("data-id");
        var sub = $(".sub2_" + dataid);
        sub.slideToggle();
    });

    //menu mobi
    //$('.l1').on('click', function () {
    //    var tag = $(this).attr('value');
    //    var tag1 = $(this).text();
    //    // window.alert("#layer"+tag1);
    //    var back_link = "#layer" + tag;
    //    //window.alert(back_link);
    //    $('.nav-link').attr('href', back_link);
    //    //$('.nav-link').text(tag1);
    //    $('.nav-link').attr('value', tag);
    //    $("#layer" + tag).removeClass('hide-menu');
    //    $("#layer" + tag).toggleClass('show-menu');
    //});
    //$('.nav-link').on('click', function () {
    //    var tag = $(this).attr('href');
    //    var val = $(this).attr('value');
    //    // window.alert(val);
    //    $(tag).removeClass('show-menu');
    //    var back_link = "#layer" + (val - 1);
    //    $('.nav-link').attr('href', back_link);
    //    $('.nav-link').attr('value', val - 1);
    //    //window.alert(back_link);

    //});

    $('.close_mobi').on('click', function () {
        $('.menu_mobi').hide();
    });

    $('.toggle_menu').on('click', function () {
        $('.menu_mobi').show();
        //alert("ok");
        //$(".navbar-toggler-mobile").animate({ width: 'toggle' }, 350);
    });

    $('.video_show_iframe .close_iframe').on('click', function () {
        $('.video_show_iframe').removeClass('ac');
    });

    $('.video .item').on('click', function () {
        let url = $(this).attr('data-url');
        $('.video_show_iframe .insider iframe').attr('src', url);
        $('.video_show_iframe').addClass('ac');
    });

    $('.video .right').on('click', function () {
        let url = $(this).attr('data-url');
        $('.video_show_iframe .insider iframe').attr('src', url);
        $('.video_show_iframe').addClass('ac');
    });



    /*hotline*/
    $('.hotline-phone-ring-wrap').on('click', function () {
        $('.hotline_sup').show();
        return false;
    });
    $('.hotline_sup .close').on('click', function () {
        $('.hotline_sup').hide();
    });
    $('.hotline_sup .close_bg').on('click', function () {
        $('.hotline_sup').hide();
    });

    $(document).scroll(function () {
        let scroll = $(document).scrollTop();
        let position = 0;
        if ($('.section2').length !== 0) {
            position = $('.section2').offset().top;
        }

        if (scroll >= position) {
            $('.sticky').slideDown();
        } else {
            $('.sticky').slideUp();
        }
    });

    var arr_scroll = [];

    $('.toggle_search').on('click', function () {
        $('.search_toggle_show').show();
        $(".over-lay").css({
            display: 'block',
            bottom: 40,
        })
        $("#searchbox").select();
    });

    $(".over-lay").click(function () {
        $('.search_toggle_show').css({
            display: 'none',
        })
    })

    $("main").click(function () {
        $('.search_toggle_show').css({
            display: 'none',
        })
    })

    $(".backtop").click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, 1000);
    });

    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();

            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    if ($("#searchbox").length) {
        window.onload = () => {
            function ajax(data) {
                console.log(new Date().toLocaleTimeString() + ' - ' + data)

                $.ajax({
                    url: "/ajax/ajax.aspx",
                    data: {
                        control: "search",
                        key: data
                    },
                    type: "POST",
                    success: function (html) {
                        $(".loading-search").hide();
                        //alert(html.length);
                        if (html.length > 10) {
                            $('.show_search_content').show();
                            $(".show_search_content").html(html);
                        }
                        else {
                            $('.show_search_content').hide();
                        }
                    }
                });


            }

            function debounce(fn, delay) {
                return args => {
                    clearTimeout(fn.id)

                    fn.id = setTimeout(() => {
                        fn.call(this, args)
                    }, delay)
                }
            }

            const debounceAjax = debounce(ajax, 1000);

            document.querySelector('#searchbox').addEventListener('keyup', e => {
                //alert("ok");
                $(".loading-search").show();

                $(".over-lay-search").show();
                debounceAjax(e.target.value)
            })
        }
    }
    $(".carousel-banner").slick({
        infinite: true,
        speed: 700,
        autoplay: true,
        autoplaySpeed: 1300,
        dots: false,
    });
    var showFilter = false;
    var showSort = false;
    $(".btn-filter").click(function () {
        if (showFilter) {
            $(".content-filter").css({
                visibility: "hidden",
                opacity: 0,
            });
            showFilter = false;
        } else {
            $(".content-filter").css({
                visibility: "inherit",
                opacity: 1,
            });
            showFilter = true;
        }
    });
    $(".content-filter").mouseleave(function () {
        $(".content-filter").css({
            visibility: "hidden",
            opacity: 0,
        });
        showFilter = false;
    });
    $(".filter-item .exit").click(function () {
        if (showFilter) {
            $(".content-filter").css({
                visibility: "hidden",
                opacity: 0,
            });
            showFilter = false;
        } else {
            $(".content-filter").css({
                visibility: "inherit",
                opacity: 1,
            });
            showFilter = true;
        }
    });

    $(".btn-sort").click(function () {
        if (showSort) {
            $(".content-sort").css({
                visibility: "hidden",
                opacity: 0,
            });
            showSort = false;
        } else {
            $(".content-sort").css({
                visibility: "inherit",
                opacity: 1,
            });
            showSort = true;
        }
    });
    $(".content-sort").mouseleave(function () {
        $(".content-sort").css({
            visibility: "hidden",
            opacity: 0,
        });
        showSort = false;
    });
    $(".sort-item .exit").click(function () {
        if (showSort) {
            $(".content-sort").css({
                visibility: "hidden",
                opacity: 0,
            });
            showSort = false;
        } else {
            $(".content-sort").css({
                visibility: "inherit",
                opacity: 1,
            });
            showSort = true;
        }
    });


    var showCategory = false;
    $(".category-box .see-more-category").click(function () {
        if (showCategory) {
            $(".category-item.category-item-none").css({
                display: "none",
            });
            $(".category-box .see-more-category").html("<p>Xem thêm</p>");
            showCategory = false;
        } else {
            $(".category-item.category-item-none").css({
                display: "block",
            });
            $(".category-box .see-more-category").html("<p>Thu gọn</p>");
            showCategory = true;
        }
    });

    var showBrand = false;
    $(".brand-option .see-more-brand").click(function () {
        if (showBrand) {
            $(".brand-item.brand-item-none").css({
                display: "none",
            });
            $(".brand-option .see-more-brand").html("<p>Xem thêm</p>");
            showBrand = false;
        } else {
            $(".brand-item.brand-item-none").css({
                display: "block",
            });
            $(".brand-option .see-more-brand").html("<p>Thu gọn</p>");
            showBrand = true;
        }
    });


    if ($(".floor-menu-fixed").length) {
        $(".floor-menu-fixed").offset().top;
        vt = $(".section_blog").offset().top;

        window.addEventListener("scroll", function () {
            console.log(vt);
            vtmenu = $(".menu-header").offset().top + 50;
            if (
                $(".floor-menu-fixed").offset().top > 500 &&
                $(".floor-menu-fixed").offset().top < vt
            ) {
                $(".floor-menu-fixed").css({
                    visibility: "initial",
                    opacity: 1,
                });
            } else {
                $(".floor-menu-fixed").css({
                    visibility: "hide",
                    opacity: 0,
                });
            }
            $(".main section").each(function (index, value) {
                if (index !== 0) {
                    if (
                        vtmenu > $(".main section")[index].offsetTop
                    ) {
                        $(".floor-menu-fixed li").each(function (key, value) {
                            $(this).removeClass("ac");
                            if (key === index) {
                                $(this).addClass("ac");
                            }
                        });
                    }
                }
            });
        });
    }
    $('.list-product-new .product-list').slick({
        loop: true,
        nav: true,
        margin: 10,
        autoplay: true,
        dots: false,
        autoplaySpeed: 500000,
        autoplayHoverPause: true,
        infinite: true,
        slidesToShow: 6,
        slidesToScroll: 1,
        nextArrow: '<i class="slick-button-prev"></i>',
        prevArrow: '<i class="slick-button-next"></i>',
        responsive: [
            {
                breakpoint: 1280,
                settings: {
                    slidesToShow: 5,
                    slidesToScroll: 2,
                    adaptiveHeight: true,
                },
            },
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 4,
                    slidesToScroll: 1,
                },
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 2,
                    adaptiveHeight: true,
                },
            },
            {
                breakpoint: 520,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                },
            },
            {
                breakpoint: 420,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                },
            },
        ],
    });



/*    $(".carousel-img-product").slick({
        dots: true,
        infinite: true,
        nextArrow: '<i class="slick-button-prev"></i>',
        prevArrow: '<i class="slick-button-next"></i>'
    });*/
    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        //centerMode: true,
        focusOnSelect: true,
        nextArrow: '<i class="slick-button-prev"></i>',
        prevArrow: '<i class="slick-button-next"></i>'
    });

    $("button.owl-prev").each(function (index, value) {
        $(this).html('<i class="button-prev"></i>');
    });
    $("button.owl-next").each(function (index, value) {
        $(this).html('<i class="button-next"></i>');
    });
    $(".carousel-Ad").slick({
        infinite: true,
        speed: 700,
        autoplay: true,
        autoplaySpeed: 1300,
        dots: true,
    });
    $(".carousel-banner").slick({
        infinite: true,
        speed: 700,
        autoplay: true,
        autoplaySpeed: 1300,
        dots: true,
    });

    $(".tab-a").click(function () {
        $(".tab").removeClass("tab-active");
        $(".tab[data-id='" + $(this).attr("data-id") + "']").addClass("tab-active");
        $(".tab-a").removeClass("active-a");
        $(this).parent().find(".tab-a").addClass("active-a");
    });

    function seeMore() {
        var dots = document.getElementById("dots");
        var moreText = document.getElementById("more");
        var btnText = document.getElementById("see-more-btn");

        if (dots.style.display === "none") {
            dots.style.display = "inline";
            btnText.innerHTML = "Xem thêm";
            moreText.style.display = "none";
        } else {
            dots.style.display = "none";
            btnText.innerHTML = "Ẩn đi";
            moreText.style.display = "inline";
        }
    }


    //var i,
    //    $mvar = $(".box-detail h3");

    //function genmenu(string, index) {
    //    $(".table-of-contents").show();
    //    var text = document.createTextNode(string);
    //    $(".table-ct .content-list").append(
    //        "<li class='content-item'><span class='list-style'></span><a class='content-link' href='' name='mucluc" +
    //        index +
    //        "'>" +
    //        string +
    //        "</a></li>"
    //    );
    //}

    //for (i = 0; i < $mvar.length; i++) {
    //    genmenu($mvar.eq(i).html(), i);
    //    $mvar.eq(i).attr("name", "mucluc" + i);
    //}

    ////genmenu($mvar.length);

    //if ($mvar.length > 0) {
    //    $(".table-ct").css("display", "inline-block");
    //}



    function scrollToAnchor(aid) {
        var aTag = $(".box-detail h3[name='" + aid + "']");
        $("html,body").animate({
            scrollTop: aTag.offset().top
        }, "slow");
    }

    $(".content-link").click(function () {
        if ($(".lessLink").length) { } else {
            $("#see-more-btn").click();
        }
        var ahref = $(this).attr("name");
        //alert(ahref);
        scrollToAnchor(ahref);
        //$(".table-ct").hide();
        return false;
    });

    function increaseValue() {
        var value = parseInt(document.getElementById("number").value, 10);
        value = isNaN(value) ? 0 : value;
        value++;
        document.getElementById("number").value = value;
    }

    function decreaseValue() {
        var value = parseInt(document.getElementById("number").value, 10);
        value = isNaN(value) ? 0 : value;
        value < 1 ? (value = 1) : "";
        value--;
        document.getElementById("number").value = value;
    }

    //window.addEventListener("scroll", function () {
    //    var start = 0;
    //    var end = 0;
    //    if ($('.start-tb').length !== 0) {
    //        start = $(".start-tb").offset().top;
    //    }
    //    if ($('.end-tb').length !== 0) {
    //        end = $(".end-tb").offset().top;
    //    }
    //    var obj = $(".menu-header").offset().top;
    //    if (obj - start > -50 && obj - end < -200) {
    //        $(".icon-sticky").css({
    //            visibility: "inherit",
    //            opacity: 1,
    //        });
    //    } else {
    //        $(".icon-sticky").css({
    //            visibility: "hidden",
    //            opacity: 0,
    //        });
    //        $(".table-of-contents-input").prop("checked", false);
    //    }
    //});


    $(".menu-mobile .sub-menu-item").each(function () {
        $(this).click(function () {
            if ($(this).hasClass("active")) {
                $(this).removeClass("active");
            } else {
                $(this).addClass("active");
            }
        });
    });

    $(".menu-mobile .nav-item-mobile .nav-link").each(function () {
        $(this).click(function () {
            // var containermenu = $(this);
            // var link = containermenu.find(".nav-link");
            // let at = $(this).find(".nav-link");
            if ($(this).hasClass("active")) {
                $(this).removeClass("active");
            } else {
                $(this).addClass("active");
            }
        });
    });

    $(".section1 .category").hover(function () {
        $(".section1 .category .over-lay-menu").css({
            display: 'block',
        })
    }, function () {
        $(".section1 .category .over-lay-menu").css({
            display: 'none',
        })
    });

    if ($("#frm_giohang #btnSubmit_giohang").length) {
        var buttonSubmit = $("#frm_giohang #btnSubmit_giohang");
        buttonSubmit.click(function () {
            $('#frm_giohang #done_giohang').val(1);
            $(this).attr('disabled', 'disabled');
            $(this).html('Loading...');
            $("#frm_giohang").submit();
        });
    }


    if ($("#frm_checkout").length) {
        var buttonSubmit = $("#frm_checkout #btnSubmit");
        buttonSubmit.click(function () {
            $('#frm_checkout #done').val(1);
            $(this).attr('disabled', 'disabled');
            $(this).html('Loading...');

            $.cookie('customer_name', $("#frm_checkout #name").val(), {
                expires: 365,
                path: '/'
            });
            $.cookie('customer_tel', $("#frm_checkout #tel").val(), {
                expires: 365,
                path: '/'
            });
            $.cookie('customer_address', $("#frm_checkout #address").val(), {
                expires: 365,
                path: '/'
            });

            $("#frm_checkout").submit();
        });

        $("#frm_checkout #name").val($.cookie("customer_name"));
        $("#frm_checkout #tel").val($.cookie("customer_tel"));
        $("#frm_checkout #address").val($.cookie("customer_address"));

        $(document).ready(function () {
            $("#frm_checkout").validate({
                rules: {
                    name: "required",
                    address: "required",
                    name: {
                        required: true,
                        minlength: 1
                    },
                    address: {
                        required: true,
                        minlength: 5
                    },
                    tel: {
                        required: true,
                        minlength: 10
                    },
                    email: {
                        required: false,
                        email: true
                    }
                },
                messages: {
                    name: {
                        required: "Vui lòng nhập Họ và tên",
                        minlength: "Tên quá ngắn"
                    },
                    name: {
                        required: "Vui lòng nhập Địa chỉ",
                        minlength: "Địa chỉ quá ngắn"
                    },
                    email: {
                        email: "Vui lòng nhập email hợp lệ"
                       
                    },
                    tel: {
                        required: "Vui lòng nhập số điện thoại",
                        minlength: "Điện thoại thiếu số"
                    }

                }
            });
        });


        $('#frm_checkout input[name="option_payment"]').bind('click', function () {
            $('#frm_checkout .list-content-nganluong li').removeClass('active');
            $(this).parent('li').addClass('active');
        });


    }




    var cart_count = $("#header-cart-count")
    $.getJSON('/ajax/ajax.aspx', {
        control: "dynamic",
        services: "cart_count,product_viewed,product_fav"
    }, function (data) {

        $.each(data, function (key, value) {
            console.log(key + " : " + value);

            if (key == "cart_count" && parseInt(value) > 0) {
                $("#header-cart-count").show();
                $("#header-cart-count").html(value);
            }
            //if (key == "product_viewed" && parseInt(value) > 0) {
            //    $("#header-product-viewed").show();
            //    $("#header-product-viewed").html(value);
            //}
            //if (key == "product_fav" && parseInt(value) > 0) {
            //    $("#header-product-fav").show();
            //    $("#header-product-fav").html(value);
            //}
        });
    });



    function GetPriceFormat(x) {
        var r = x.toString().replace(/,/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
        r = r + " VNĐ";
        return r;
    }





    $('.del_cart').click(function () {

        var id = $(this).attr("data-id");
        var quantity = 0;
        //console.log(id + " : " + quantity);
        var cart_total_price = $(".cart_total_price");
        var hdfTotalPrice = $("#hdfTotalPrice");
        var price_item = $(".price_item_" + id);
        Loading(true);

        $.getJSON('/ajax/ajax.aspx', { control: "dynamic", services: "cart_update,cart_total,cart_count", id: id, quantity: 0 }, function (data) {
            var jsonContent = JSON.parse(JSON.stringify(data));
            var cartCount = jsonContent.cart_count;

            $("#GG_Items").val(jsonContent.jsonProduct);
            $("#GG_Price").val(jsonContent.finalPrice);
            $("#GG_CountItems").val(jsonContent.quantity);
            cart_total_price.html(jsonContent.finalPriceVND);
            hdfTotalPrice.val(jsonContent.finalPriceVND);

            var item_rows_delete = $(".shopping-cart .item.item" + id);
            item_rows_delete.fadeOut("slow");

            if (parseInt(cartCount) > 0) {
                $("a.cart").show();
                $("#header-cart-count").html(cartCount);
            } else {
                console.log("cart empty");
                $("a.cart").hide();
                $(".cart-empty").show();
                $(".cart-info").hide();
            }
        });

        Loading(false);
    });


    $(function () {
        $('.increment').click(function () {
            var id = $(this).siblings('input').attr('id');
            var valueElement = $('#' + id);
            if ($(this).hasClass('plus')) {
                valueElement.val(Math.max(parseInt(valueElement.val()) + 1));
            } else if (valueElement.val() > 1) {
                valueElement.val(Math.max(parseInt(valueElement.val()) - 1));
            }
            Loading(true);
            $.getJSON('/ajax/ajax.aspx', { control: "dynamic", services: "cart_update", id: id, quantity: valueElement.val() }, function (data) {
                var jsonContent = JSON.parse(JSON.stringify(data));
                $("#GG_Items").val(jsonContent.jsonProduct);
                $("#GG_Price").val(jsonContent.finalPrice);
                $(".cart_total_price").html(jsonContent.finalPriceVND);
            });
            Loading(false);
            return false;
        });
    });





    /* Article */

    ShowMoreArticle(1, true);


    function ShowMoreArticle(pageIndex, fistLoad) {
        var TotalProduct = $.cookie("TotalArticle");
        var totalP = $("#totalArticle").val();
        var rowCategory = $("#pageSize").val();

        if (fistLoad)
            TotalProduct = totalP;
        var leftProduct = TotalProduct - (parseInt(pageIndex) * parseInt(rowCategory));
        if (leftProduct < 1)
            $(".show-more").hide();
        else
            $(".show-more").show();
        $("#category_paging_article").text("Xem thêm (" + leftProduct + " bài viết)");
    }


    $("#category_paging_article").click(function () {
        var pageIndex = 1;
        if (typeof $.cookie('pageIndex_Category') !== 'undefined') {
            pageIndex = $.cookie("pageIndex_Category");
        }
        var pageIndexShowMore = pageIndex;
        pageIndex = parseInt(pageIndex) + 1;
        var categoryID = $("#idCategory").val();
        console.log("page " + pageIndexShowMore);
        $(".div-ajax-loading").show();
        $(".article-list").css({
            opacity: 0.3
        });
        jQuery.ajax({
            url: '/ajax/ajax.aspx',
            type: "GET",
            data: {
                categoryID: categoryID,
                action: "article_list",
                control: "categoryload",
                pageIndex: pageIndexShowMore
            },
            complete: function (response) {
                setTimeout(function () {
                    $('.article-list').append(response.responseText);
                    $(".article-list").css({
                        opacity: 1
                    });
                    $(".div-ajax-loading").hide();
                    ShowMoreArticle(pageIndexShowMore, false);
                }, 10);
            }
        });
    });




    function Loading(isShow) {
        if (isShow)
            $(".div-ajax-loading").show();
        else
            $(".div-ajax-loading").hide();
    }

    function HomeProduct(categoryid) {
        jQuery.ajax({
            url: '/ajax/ajax.aspx',
            type: "GET",
            data: {
                categoryid: categoryid,
                control: "homeproduct"
            },
            complete: function (response) {
                setTimeout(function () {
                    $('.home-product-ajax-' + categoryid).append(response.responseText);
                }, 10);
            }
        });
    }
});



//$(document).ready(function () {
//    GetAttributeProduct();
//});





//Load theo category
function GetAttributeProduct() {

    if ($("#AttributesIDList").length) {
        var htmlContent = '';
        var count = 0;
        var categoryIDList = $("#idCategory").val();
        $.getJSON('/ajax/ajax.aspx', { control: "attributeproduct", categoryList: String(categoryIDList) }, function (data) {
            var jsonContent = JSON.parse(JSON.stringify(data));
            var divAttrAjax = $(".filter-ajax");
            for (var i = 0; i < jsonContent.length; i++) {
                var item = jsonContent[i];
                if (item.Name == "RootID") {
                    $("#rootFilterCategoryID").val(item.ID);
                }
                else {
                    count++;

                    htmlContent += "<div>"
                    htmlContent += "<h3>" + item.Name + "</h3>";

                    var jsonChild = JSON.parse(JSON.stringify(item.attributeProductChild));
                    for (var j = 0; j < jsonChild.length; j++) {
                        var itemChild = jsonChild[j];
                        var selected = "";

                        var categoryName = $("#categoryName").val();
                        if (itemChild.Name == categoryName) {
                            var filted_html = "<a href='javascript:;' onclick='RemoveAttr(" + itemChild.ID + ")' data-id='" + itemChild.ID + "'><span>" + itemChild.Name + "</span><i class='fas fa-times'></i></a>";
                            $("#filted").html(filted_html);
                            //selected = " checked"; //Tự động tích vào nếu cùng tên với danh mục
                            $("#attributeIDList").val(itemChild.ID);
                        }
                        //console.log(categoryName + " - " + itemChild.Name);

                        htmlContent += "<input" + selected + " type='checkbox' class='checkboxAttr' onclick='GetValueFromAttr()' id='checkboxAttr_" + itemChild.ID + "' data-name='" + itemChild.Name + "' />";
                        if (itemChild.Image != '')
                            htmlContent += "<label style='cursor:pointer' for='checkboxAttr_" + itemChild.ID + "'><img src='" + itemChild.Image + "'></label><br />";
                        else
                            htmlContent += "<label style='cursor:pointer' for='checkboxAttr_" + itemChild.ID + "'>" + itemChild.Name + "</label><br />";


                        //console.log(categoryName + " - " + itemChild.Name);

                    }
                    htmlContent += "</div>"
                }
            }
            if (data.length) {

                divAttrAjax.show();
                divAttrAjax.html(htmlContent);
                BindDataToAttr();
            }
        });

        if (count == 0) {
            $(".filter-ajax").hide();
        }
        else {
            $(".filter-ajax").show();
        }
    }
}


function BindDataToAttr() {
    var datas = $("#AttributesIDList").val();
    var arr = datas.split(',');
    $.each(arr, function (index, value) {
        var checkbox = $("#checkboxAttr_" + value);
        if (checkbox.length) {
            checkbox.prop('checked', true);
            console.log(value.Access + '_' + value.ID);
        }
    });
}


// Load theo Attributes
function GetValueFromAttr() {
    $("#loadByFilter").val("1");
    

    var list_id = "";
    var filted_html = "";
    $('.checkboxAttr:checked').each(function () {
        if (list_id != null && list_id != '')
            list_id += ",";
        var checkboxValue = $(this).attr("id");
        list_id += checkboxValue.replace("checkboxAttr_", "");

        var name = $(this).attr("data-name");
        filted_html += "<a href='javascript:;' onclick='RemoveAttr(" + checkboxValue.replace("checkboxAttr_", "") + ")' data-id='" + checkboxValue.replace("checkboxAttr_", "") + "'><span>" + name + "</span><i class='fas fa-times'></i></a>";
    });
    console.log(list_id);
    $("#attributeIDList").val(list_id);
    $("#filted").html(filted_html);

    var pageIndex = 1;
    var rootFilterCategoryID = $("#rootFilterCategoryID").val();
    var attributeIDList = $("#attributeIDList").val();

    var pageIndexShowMore = pageIndex;
    pageIndex = parseInt(pageIndex) + 1;
    var categoryID = "";
    var keyword = "";
    if ($("#idCategory").length)
        categoryID = $("#idCategory").val();
    else
        keyword = $("#keyword").val();

    $(".div-ajax-loading").show();
    $(".product-list").css({
        opacity: 0.3
    });
    jQuery.ajax({
        url: '/ajax/ajax.aspx',
        type: "GET",
        data: {
            action: "product_list",
            control: "categoryload",
            rootFilterCategoryID: rootFilterCategoryID,
            attributeIDList: attributeIDList,
            pageIndex: pageIndexShowMore,
            keyword: keyword,
            categoryID: categoryID
        },
        complete: function (response) {
            setTimeout(function () {
                $('.product-list').html(response.responseText);
                $(".product-list").css({
                    opacity: 1
                });
                $(".div-ajax-loading").hide();
                ShowMore(pageIndexShowMore, false);
            }, 500);
        }
    });

}



function RemoveAttr(data_id) {
    var removeitem = $("#filted").find("[data-id='" + data_id + "']");
    console.log(data_id);
    removeitem.hide();

    var checkbox = $("#checkboxAttr_" + data_id);
    checkbox.prop("checked", false);

    var AttrList = $("#attributeIDList");
    var array = AttrList.val().split(",");

    array = jQuery.grep(array, function (value) {
        return value != data_id;
    });

    AttrList.val(array.toString());

    GetValueFromAttr();

}


$("#category_paging").click(function () {
    var pageIndex = 1;
    if (typeof $.cookie('pageIndex_Category') !== 'undefined') {
        pageIndex = $.cookie("pageIndex_Category");
    }

    var pageIndexShowMore = pageIndex;
    pageIndex = parseInt(pageIndex) + 1;


    var rootFilterCategoryID = "";
    var attributeIDList = "";

    if ($("#loadByFilter").val() == "1");
    {
        rootFilterCategoryID = $("#rootFilterCategoryID").val();
        attributeIDList = $("#attributeIDList").val();
    }


    var categoryID = "";
    var keyword = "";
    if ($("#idCategory").length)
        categoryID = $("#idCategory").val();
    else
        keyword = $("#keyword").val();

    console.log("page " + pageIndexShowMore);

    $(".div-ajax-loading").show();
    $(".product-list").css({
        opacity: 0.3
    });
    jQuery.ajax({
        url: '/ajax/ajax.aspx',
        type: "GET",
        data: {
            categoryID: categoryID,
            action: "product_list",
            control: "categoryload",
            rootFilterCategoryID: rootFilterCategoryID,
            attributeIDList: attributeIDList,
            keyword: keyword,
            pageIndex: pageIndexShowMore
        },
        complete: function (response) {
            setTimeout(function () {

                //if (isMore)
                $('.product-list').append(response.responseText);
                //else
                //    $('.category').html(response.responseText);
                //$(".category").css({ opacity: 1 });
                //$("#div-ajax-loading").hide();
                $(".product-list").css({
                    opacity: 1
                });
                $(".div-ajax-loading").hide();
                ShowMore(pageIndexShowMore, false);
            }, 10);
        }
    });
});

ShowMore(1, true);

function ShowMore(pageIndex, fistLoad) {
    var TotalProduct = $.cookie("TotalProduct");
    var totalP = $("#totalProduct").val();
    var rowCategory = $("#pageSize").val();

    if (fistLoad)
        TotalProduct = totalP;

    

    var leftProduct = TotalProduct - (parseInt(pageIndex) * parseInt(rowCategory));

    console.log("pageIndex: " + pageIndex + " - TotalProduct: " + TotalProduct);



    //alert(leftProduct);
    if (leftProduct < 1)
        $(".show-more").hide();
    else
        $(".show-more").show();
    //alert(TotalProduct + ", " + pageIndex);
    $("#category_paging").text("Xem thêm (" + leftProduct + " sản phẩm)");
}



//$(".box-detail .content").readmore({
//    speed: 500, //Açılma Hızı
//    collapsedHeight: 400, // 100px sonra yazının kesileceğini belirtir.
//    moreLink: '<div class="container-button"><button id="see-more-btn">Xem thêm</button></div>', // açma linki yazısı
//    lessLink: '<div class="container-button lessLink"><button id="see-more-btn">Thu gọn</button></div>', // kapatma linki yazısı
//});


//var lastScrollTop = 0;
//$(window).scroll(function (event) {
//    var st = $(this).scrollTop();
//    if (st > lastScrollTop) {
//        $(".menu-header").fadeOut();
//    } else {
//        $(".menu-header").fadeIn();
//    }
//    lastScrollTop = st;
//});


// Hide Header on on scroll down
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('.menu-header').outerHeight();

$(window).scroll(function (event) {
    didScroll = true;
});

setInterval(function () {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 50);

function hasScrolled() {
    var st = $(this).scrollTop();

    // Make sure they scroll more than delta
    if (Math.abs(lastScrollTop - st) <= delta)
        return;

    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight) {
        // Scroll Down
        $('.menu-header').removeClass('nav-down').addClass('nav-up');
        $('.hotline-phone-ring-wrap').fadeOut();
        $('.backtop').fadeOut();
       
    } else {
        // Scroll Up
        if (st + $(window).height() < $(document).height()) {
            $('.menu-header').removeClass('nav-up').addClass('nav-down');
            $('.hotline-phone-ring-wrap').fadeIn();
            $('.backtop').fadeIn();
        }
    }

    lastScrollTop = st;
}

let tocId = "toc";

let headings;
let headingIds = [];
let headingIntersectionData = {};
let headerObserver;

function setLinkActive(link) {
    const links = document.querySelectorAll(`#${tocId} a`);
    links.forEach((link) => link.classList.remove("active"));
    if (link) {
        link.classList.add("active");
    }
}

function getProperListSection(heading, previousHeading, currentListElement) {
    let listSection = currentListElement;
    if (previousHeading) {
        if (heading.tagName.slice(-1) > previousHeading.tagName.slice(-1)) {
            let nextSection = document.createElement("ul");
            listSection.appendChild(nextSection);
            return nextSection;
        } else if (heading.tagName.slice(-1) < previousHeading.tagName.slice(-1)) {
            let indentationDiff =
                parseInt(previousHeading.tagName.slice(-1)) -
                parseInt(heading.tagName.slice(-1));
            while (indentationDiff > 0) {
                listSection = listSection.parentElement;
                indentationDiff--;
            }
        }
    }
    return listSection;
}

function setIdFromContent(element, appendedId) {
    if (!element.id) {
        element.id = `${element.innerHTML
            .replace(/:/g, "")
            .trim()
            .toLowerCase()
            .split(" ")
            .join("-")}-${appendedId}`;
    }
}

function addNavigationLinkForHeading(heading, currentSectionList) {
    let listItem = document.createElement("li");
    let anchor = document.createElement("a");
    anchor.innerHTML = heading.innerHTML;
    anchor.id = `${heading.id}-link`;
    anchor.href = `#${heading.id}`;
    anchor.onclick = (e) => {
        setTimeout(() => {
            setLinkActive(anchor);
        });
    };
    listItem.appendChild(anchor);
    currentSectionList.appendChild(listItem);
}

function buildTableOfContentsFromHeadings() {
    const tocElement = document.querySelector(`#${tocId}`);
    const main = document.querySelector("article");
    if (!main) {
        throw Error("A `main` tag section is required to query headings from.");
    }
    headings = main.querySelectorAll("h1, h2, h3, h4, h5, h6");
    let previousHeading;
    let currentSectionList = document.createElement("ul");
    tocElement.appendChild(currentSectionList);

    headings.forEach((heading, index) => {
        currentSectionList = getProperListSection(
            heading,
            previousHeading,
            currentSectionList
        );
        setIdFromContent(heading, index);
        addNavigationLinkForHeading(heading, currentSectionList);

        headingIds.push(heading.id);
        headingIntersectionData[heading.id] = {
            y: 0
        };
        previousHeading = heading;
    });
}

function updateActiveHeadingOnIntersection(entry) {
    const previousY = headingIntersectionData[entry.target.id].y;
    const currentY = entry.boundingClientRect.y;
    const id = `#${entry.target.id}`;
    const link = document.querySelector(id + "-link");
    const index = headingIds.indexOf(entry.target.id);

    if (entry.isIntersecting) {
        if (currentY > previousY && index !== 0) {
            console.log(id + ":1 enter top");
        } else {
            console.log(id + ":2 enter bottom");
            setLinkActive(link);
        }
    } else {
        if (currentY > previousY) {
            console.log(id + ":3 leave bottom");
            const lastLink = document.querySelector(`#${headingIds[index - 1]}-link`);
            setLinkActive(lastLink);
        } else {
            console.log(id + ":4 leave top");
        }
    }

    headingIntersectionData[entry.target.id].y = currentY;
}

function observeHeadings() {
    let options = {
        root: document.querySelector("article"),
        threshold: 0.1
    };
    headerObserver = new IntersectionObserver(
        (entries) => entries.forEach(updateActiveHeadingOnIntersection),
        options
    );
    Array.from(headings)
        .reverse()
        .forEach((heading) => headerObserver.observe(heading));
}

window.addEventListener("load", (event) => {
    buildTableOfContentsFromHeadings();
    if ("IntersectionObserver" in window) {
        observeHeadings();
    }
});

window.addEventListener("unload", (event) => {
    headerObserver.disconnect();
});
$('.title-header-cate .icon-list').click(function () {
    $('#toc').toggleClass('view-content');
});