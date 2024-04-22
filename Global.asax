<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="Ebis.Utilities" %>

<script RunAt="server">

    //private static readonly log4net.ILog _logger = log4net.LogManager.GetLogger(typeof(Globals));

    void Application_BeginRequest(Object sender, EventArgs e)
    {

        //_logger.Info("IP: " + Utils.IPAddress);

        System.Threading.Thread.CurrentThread.CurrentCulture = System.Globalization.CultureInfo.CreateSpecificCulture("vi-VN");

        if (!Utils.IS_LOCAL)
        {
            if (HttpContext.Current.Request.Url.ToString().ToLower().Contains("http://www." + C.DOMAIN))
            {
                HttpContext.Current.Response.Status =
                    "301 Moved Permanently";
                HttpContext.Current.Response.AddHeader("Location",
                    Request.Url.ToString().ToLower().Replace(
                        "http://www." + C.DOMAIN,
                        "https://" + C.DOMAIN));
            }

            if (HttpContext.Current.Request.Url.ToString().ToLower().Contains("http://" + C.DOMAIN))
            {
                HttpContext.Current.Response.Status =
                    "301 Moved Permanently";
                HttpContext.Current.Response.AddHeader("Location",
                    Request.Url.ToString().ToLower().Replace(
                        "http://" + C.DOMAIN,
                        "https://" + C.DOMAIN));
            }
        }





        //    if (HttpContext.Current.Request.Url.ToString().ToLower().Contains("https://nhaccutiendat.vn/danorgan"))
        //    {
        //        HttpContext.Current.Response.Status =
        //            "301 Moved Permanently";
        //        HttpContext.Current.Response.AddHeader("Location",
        //            Request.Url.ToString().ToLower().Replace(
        //                "https://nhaccutiendat.vn/danorgan",
        //                "https://nhaccutiendat.vn/dan-organ"));
        //    }

        //    if (HttpContext.Current.Request.Url.ToString().ToLower().Contains("https://nhaccutiendat.vn/danpiano"))
        //    {
        //        HttpContext.Current.Response.Status =
        //            "301 Moved Permanently";
        //        HttpContext.Current.Response.AddHeader("Location",
        //            Request.Url.ToString().ToLower().Replace(
        //                "https://nhaccutiendat.vn/danpiano",
        //                "https://nhaccutiendat.vn/dan-piano"));
        //    }



        //}
    }



    void RegisterRoutes(RouteCollection routes)
    {
        routes.Ignore("{resource}.axd/{*pathInfo}");
        routes.Ignore("{resource}.ashx/{*pathInfo}");


        //Chuyển link
        //routes.MapPageRoute("chuyen link", "{url}.aspx", "~/Default.aspx", true, new RouteValueDictionary { { "m", "chuyenlink" } });
        //routes.MapPageRoute("chuyen link mayhutbui", "tin/{caturl}/{urltin}.aspx", "~/Default.aspx", true, new RouteValueDictionary { { "m", "chuyenlink" } });
        routes.MapPageRoute("test", "test/", "~/Default.aspx", true, new RouteValueDictionary { { "m", "footer" } });


        //Admin
        routes.MapPageRoute("admin_dashboard", "admin/{folder}/{control}", "~/admin/default.aspx");

        routes.MapPageRoute("search", "tim-kiem.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "searchresult" } });
        routes.MapPageRoute("sitemap", "sitemap.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "categoryall" } });
        routes.MapPageRoute("review", "review.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "customerreview" } });
        routes.MapPageRoute("loi 404", "404.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "404" } });
        routes.MapPageRoute("rss", "feed", "~/Default.aspx", true, new RouteValueDictionary { { "m", "rss" } });

        //blog
        routes.MapPageRoute("tin", "tin/{seo_title}.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "newsdetail" } });
        routes.MapPageRoute("tin1", "tin/{caturl}/{seo_title}.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "newsdetail" } });
        routes.MapPageRoute("tin 3", "tin-tuc/{seo_title}.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "newsdetail" } });
        routes.MapPageRoute("tin 4", "tin-tuc/{caturl}/{seo_title}.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "newsdetail" } });

        routes.MapPageRoute("danh muc tin", "tin/{caturl}/", "~/Default.aspx", true, new RouteValueDictionary { { "m", "newscategory" } });
        routes.MapPageRoute("danh muc tin1", "tin-tuc/{caturl}/", "~/Default.aspx", true, new RouteValueDictionary { { "m", "newscategory" } });

        routes.MapPageRoute("tinindex", "tin/", "~/Default.aspx", true, new RouteValueDictionary { { "m", "newscategory" } });
        routes.MapPageRoute("tinindex1", "tin-tuc/", "~/Default.aspx", true, new RouteValueDictionary { { "m", "newscategory" } });

        routes.MapPageRoute("hoan-tat-vnpay", "hoan-tat-vnpay.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "Vnpayfinish" } });


        routes.MapPageRoute("gio hang", "gio-hang.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "shoppingcart" } });
        routes.MapPageRoute("hoan tat don hang", "thong-tin-don-hang/{token}.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "orderinfo" } });

        routes.MapPageRoute("content", "{caturl}.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "contentdetail" } });


        routes.MapPageRoute("sp", "{caturl}/{purl}.html", "~/Default.aspx", true, new RouteValueDictionary { { "m", "productdetails" } });

        routes.MapPageRoute("ajax_shoppingcart", "ajax/shoppingcart", "~/Default.aspx", true, new RouteValueDictionary { { "ajax", "shoppingcart" } });
        routes.MapPageRoute("ajax_search", "ajax/search", "~/Default.aspx", true, new RouteValueDictionary { { "ajax", "product_search" } });
        routes.MapPageRoute("ajax", "ajax/{control}/", "~/Default.aspx");


        if (Utils.CheckDomain == "mayvesinh.vn"||Utils.CheckDomain == "nhaccutiendat.vn")
            routes.MapPageRoute("url chung", "{url}/", "~/Default.aspx", true, new RouteValueDictionary { { "m", "urlchung" } });
        else
            routes.MapPageRoute("dm sp", "{caturl}/", "~/Default.aspx", true, new RouteValueDictionary { { "m", "productcategory" } });


    }

    void Application_Start(object sender, EventArgs e)
    {
        //log4net.Config.XmlConfigurator.Configure(new System.IO.FileInfo(Server.MapPath("~/Web.config")));
        RegisterRoutes(RouteTable.Routes);
    }

    void Application_End(object sender, EventArgs e)
    {
    }

    void Application_Error(object sender, EventArgs e)
    {
        //_logger.Info("Err: " + Utils.IPAddress);

    }

    void Session_Start(object sender, EventArgs e)
    {

    }

    void Session_End(object sender, EventArgs e)
    {

    }
</script>
