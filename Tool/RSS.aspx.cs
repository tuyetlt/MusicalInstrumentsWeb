using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
public partial class Tool_RSS : System.Web.UI.Page
{
    int CategoryID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        ProccessParameter();
        if (!IsPostBack)
        {
            string fileName = Server.MapPath("~/upload/rss/product.xml");
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(GetRSS());
            xmlDoc.Save(fileName);
        }
    }


    protected void ProccessParameter()
    {
        CategoryID = RequestHelper.GetInt("catid", 0);
    }

    protected string GetRSS()
    {

        int PageSize = RequestHelper.GetInt("ps", 200);

        string RSS = string.Format(@"<?xml version=""1.0"" encoding=""utf-8""?>") + "\n";
        RSS += @"<rss version=""2.0"" 
            xmlns:content=""http://purl.org/rss/1.0/modules/content/"" 
            xmlns:wfw=""http://wellformedweb.org/CommentAPI/""
            xmlns:dc = ""http://purl.org/dc/elements/1.1/""
            xmlns:atom = ""http://www.w3.org/2005/Atom""
            xmlns:sy = ""http://purl.org/rss/1.0/modules/syndication/""
            xmlns:slash = ""http://purl.org/rss/1.0/modules/slash/"" > " + "\n";

        RSS += "<channel>\n";
        RSS += "<title>" + ConfigWeb.SiteName + "</title>\n";
        RSS += "<link>" + C.MAIN_URL + "</link>\n";
        RSS += "<description>" + ConfigWeb.SiteName + " RSS</description>\n";
        RSS += @"<atom:link rel=""self"" href=""" + C.MAIN_URL + @"/upload/rss/product.xml"" />" + "\n";




        DataTable dt = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "", "", "newid()", 1, PageSize);
        if(Utils.CheckExist_DataTable(dt))
        {
            foreach (DataRow dr in dt.Rows)
            {
                //RSS = "";
                string linkDetail = TextChanger.GetLinkRewrite_Products(ConvertUtility.ToString(dr["FriendlyUrlCategory"]), ConvertUtility.ToString(dr["FriendlyUrl"]));

                RSS += "<item>\n";
                RSS += "<title>" + RemoveIllegalCharacters(dr["Name"].ToString()) + "</title>\n";
                RSS += "<link>" + linkDetail + "</link>\n";
                RSS += "<guid>" + linkDetail + "</guid>\n";
                RSS += "<description>" + RemoveIllegalCharacters(dr["Name"].ToString()) + "</description>\n";
                RSS += @"<enclosure url=""" + Utils.GetFirstImageInGallery_Json(dr["Gallery"].ToString()) + @""" length=""3305845"" type=""image/jpeg"" />" + "\n";
                RSS += "</item>\n";

                //writer.WriteLine(RSS, System.Text.Encoding.Unicode);

            }
        }


        //RSS = "";
        RSS += "</channel>\n";
        RSS += "</rss>\n";

        //Response.Clear();
        //Response.ContentType = "text/xml";
        //Response.Write(RSS);
        //Response.End();
        return RSS;
    }

    protected string RemoveIllegalCharacters(object input)
    {
        string data = input.ToString();
        data = data.Replace("&", "&amp;");
        data = data.Replace("\"", "&quot;");
        data = data.Replace("'", "&apos;");
        data = data.Replace("<", "&lt;");
        data = data.Replace(">", "&gt;");
        return data;
    }

}