<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WidgetMenuNews.ascx.cs" Inherits="Controls_WidgetMenuNews" %>
<%@ Import Namespace="System.Data" %>



<aside>
    <h3><i class="far fa-bars"></i>Danh mục tin</h3>
    <ul>
        <%
            string filter = string.Format("(Hide is null OR Hide=0) AND LinkTypeMenuFlag & {0} <> 0 and PositionMenuFlag & {1} = 0", (int)LinkTypeMenuFlag.Article, (int)PositionMenuFlag.Bottom);
            DataTable dt_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,LinkTypeMenuFlag,FriendlyUrl,Link,Name,SeoFlags", string.Format("ParentID=0 AND {0}", filter), "Sort");
            if (Utils.CheckExist_DataTable(dt_1))
            {
                foreach (DataRow dr_1 in dt_1.Rows)
                {
                    string noffollow = string.Empty;
                    int SeoFlagINT = ConvertUtility.ToInt32(dr_1["SeoFlags"]);
                    if (SeoFlagINT == (int)SeoFlag.Nofollow)
                        noffollow = @" rel=""nofollow""";

        %>
        <li>
            <a href="<%= Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]) %>"<%= noffollow %>>
                <%= dr_1["Name"].ToString() %>
            </a>
            <%
                DataTable dt_sub2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,LinkTypeMenuFlag,FriendlyUrl,Link,Name,SeoFlags", string.Format("(Hide is null OR Hide=0) AND ParentID={0}", dr_1["ID"]), "Sort");
                if (Utils.CheckExist_DataTable(dt_sub2))
                {
                    Response.Write(@"<ul>");
                    int count = 0;
                    foreach (DataRow dr_sub2 in dt_sub2.Rows)
                    {
                         string noffollow2 = string.Empty;
                    int SeoFlagINT2 = ConvertUtility.ToInt32(dr_sub2["SeoFlags"]);
                    if (SeoFlagINT2 == (int)SeoFlag.Nofollow)
                        noffollow2 = @" rel=""nofollow""";

                        Response.Write(string.Format(@"<li><a href=""{0}""{1}>{2}</a></li>", Utils.CreateCategoryLink(dr_sub2["LinkTypeMenuFlag"], dr_sub2["FriendlyUrl"], dr_sub2["Link"]), noffollow2, dr_sub2["Name"].ToString()));
                        count++;
                    }
                    Response.Write(@"</ul>");
                }
            %>
        </li>
        <%
                }
            }

        %>
    </ul>
</aside>
