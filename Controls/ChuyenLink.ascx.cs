using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;

public partial class Controls_ChuyenLink : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Url = ConvertUtility.ToString(Page.RouteData.Values["url"]) + ".aspx";
        string TagUrl = ConvertUtility.ToString(Page.RouteData.Values["tagurl"]);


        if (C.ROOT_URL.Contains("mayhutbui.vn"))
        {
            if (!string.IsNullOrEmpty(TagUrl))
            {
                GetTag(TagUrl);
            }
            else
            {
                string UrlTin = ConvertUtility.ToString(Page.RouteData.Values["urltin"]) + ".aspx";

                if(!string.IsNullOrEmpty(UrlTin))
                {
                    Regex regexA = new Regex(@"([^/.\?]+)\.aspx(?:\?(.*))?"); //Regex Article
                    Match matchA = regexA.Match(UrlTin);

                    Response.Write(UrlTin);

                    if (matchA.Success)
                    {
                        string key = matchA.Groups[2].Value;
                        GetArticle(key);
                    }
                }
                else
                {
                    Regex regex = new Regex(@"([^/.\?]+)/([^/.\?]+)\.aspx(?:\?(.*))?"); //Regex Product
                    Match match = regex.Match(Url);
                    if (match.Success)
                    {
                        string key = match.Groups[2].Value;
                        //Response.Write("ProductID: " + key);
                        GetProduct(key);
                    }
                    else
                    {
                        regex = new Regex(@"([^/.\?]+).aspx(?:\?(.*))?"); //Regex Category
                        match = regex.Match(Url);
                        if (match.Success)
                        {
                            string key = match.Groups[2].Value;
                            //Response.Write("CategoryID: " + key);
                            GetCategory(key);
                        }
                    }
                }
            }
        }
        else
        {
            if (!string.IsNullOrEmpty(TagUrl))
            {
                GetTag(TagUrl);
            }
            else
            {
                Regex regex = new Regex(@"([^/.\?]+)-n(\d+).aspx(?:\?(.*))?"); //Regex Article
                Match match = regex.Match(Url);

                if (match.Success)
                {
                    string key = match.Groups[2].Value;
                    //Response.Write("ArticleID: " + key);
                    GetArticle(key);
                }
                else
                {
                    regex = new Regex(@"([^/.\?]+)-p(\d+).aspx(?:\?(.*))?"); //Regex Product
                    match = regex.Match(Url);
                    if (match.Success)
                    {
                        string key = match.Groups[2].Value;
                        //Response.Write("ProductID: " + key);
                        GetProduct(key);
                    }
                    else
                    {
                        regex = new Regex(@"([^/.\?]+)-c(\d+).aspx(?:\?(.*))?"); //Regex Category
                        match = regex.Match(Url);
                        if (match.Success)
                        {
                            string key = match.Groups[2].Value;
                            //Response.Write("CategoryID: " + key);
                            GetCategory(key);
                        }
                    }
                }
            }
        }
    }

    protected void GetProduct(string ProductID)
    {
        DataTable dt = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "FriendlyUrl,FriendlyUrlCategory", "ID=" + ProductID);
        if (Utils.CheckExist_DataTable(dt))
        {
            DataRow dr = dt.Rows[0];
            string FriendlyUrlCategory = "san-pham";
            if (dr["FriendlyUrlCategory"] != null)
                dr["FriendlyUrlCategory"].ToString();


            Response.Redirect(TextChanger.GetLinkRewrite_Products(FriendlyUrlCategory, dr["FriendlyUrl"].ToString()));
        }
    }


    protected void GetCategory(string CategoryID)
    {
        DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "FriendlyUrl", "ID=" + CategoryID);
        if (Utils.CheckExist_DataTable(dt))
        {
            DataRow dr = dt.Rows[0];
            Response.Redirect(TextChanger.GetLinkRewrite_Category(dr["FriendlyUrl"].ToString()));
        }
        else
        {
            Response.Redirect(C.ROOT_URL);
        }
    }

    protected void GetArticle(string ArticleID)
    {
        DataTable dt = SqlHelper.SQLToDataTable(C.ARTICLE_TABLE, "FriendlyUrl", "ID=" + ArticleID);
        if (Utils.CheckExist_DataTable(dt))
        {
            DataRow dr = dt.Rows[0];
            Response.Redirect(TextChanger.GetLinkRewrite_Article(dr["FriendlyUrl"].ToString()));
        }
        else
        {
            Response.Redirect(C.ROOT_URL);
        }
    }

    protected void GetTag(string Furl)
    {
        DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "FriendlyUrl", "FriendlyUrl='" + Furl + "'");
        if (Utils.CheckExist_DataTable(dt))
        {
            DataRow dr = dt.Rows[0];
            Response.Redirect(TextChanger.GetLinkRewrite_Category(dr["FriendlyUrl"].ToString()));
        }
        else
        {
            Response.Redirect(C.ROOT_URL);
        }
    }
}