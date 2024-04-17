<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryAll.ascx.cs" Inherits="Controls_CategoryAll" %>
<%@ Import Namespace="System.Data" %>
<div class="container sitemap">
    <%
        string filter = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", (int)PositionMenuFlag.Main);
        DataTable dt_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID=0 AND {0}", filter), "Sort");
        if (Utils.CheckExist_DataTable(dt_1))
        {
            Response.Write("<div class='parent'>");
            int count = 1;
            foreach (DataRow dr_1 in dt_1.Rows)
            {
                string link_1 = Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]);
                Response.Write(string.Format(@"<p><a href=""{0}"">{1}</a></p>", link_1, dr_1["Name"]));
                //Level 2
                string filter_2 = string.Format("((Hide is null OR Hide=0) AND PositionMenuFlag & {0} = 0 AND PositionMenuFlag & {1} = 0)", (int)PositionMenuFlag.MenuSubMainHome, (int)PositionMenuFlag.MenuSubMainHome2);
                DataTable dt_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0} AND {1}", dr_1["ID"], filter_2), "Sort");
                if (Utils.CheckExist_DataTable(dt_2))
                {
                    Response.Write("<div>");
                    foreach (DataRow dr_2 in dt_2.Rows)
                    {
                        string link_2 = Utils.CreateCategoryLink(dr_2["LinkTypeMenuFlag"], dr_2["FriendlyUrl"], dr_2["Link"]);
                        Response.Write(string.Format(@"<p><a href=""{0}"">{1}</a></p>", link_2, dr_2["Name"]));
                        //Level 3
                        DataTable dt_3 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0}", dr_2["ID"]), "Sort");
                        if (Utils.CheckExist_DataTable(dt_2))
                        {
                            Response.Write("<div>");
                            foreach (DataRow dr_3 in dt_3.Rows)
                            {
                                string link_3 = Utils.CreateCategoryLink(dr_3["LinkTypeMenuFlag"], dr_3["FriendlyUrl"], dr_3["Link"]);
                                Response.Write(string.Format(@"<p><a href=""{0}"">{1}</a></p>", link_3, dr_3["Name"]));
                                //Level 4
                                DataTable dt_4 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0}", dr_3["ID"]), "Sort");
                                if (Utils.CheckExist_DataTable(dt_2))
                                {
                                    Response.Write("<div>");
                                    foreach (DataRow dr_4 in dt_4.Rows)
                                    {
                                        string link_4 = Utils.CreateCategoryLink(dr_4["LinkTypeMenuFlag"], dr_4["FriendlyUrl"], dr_4["Link"]);
                                        Response.Write(string.Format(@"<p><a href=""{0}"">{1}</a></p>", link_4, dr_4["Name"]));
                                    }
                                    Response.Write("</div>");
                                }
                            }
                            Response.Write("</div>");
                        }
                    }
                    Response.Write("</div>");
                }


                if(count>0 && count % 2 == 0)
                {
                    Response.Write("</div><div class='parent'>");
                }

                count++;
            }
            Response.Write("</div>");
        }
    %>
    <div class="clear"></div>
</div>
