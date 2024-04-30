<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductCategory.ascx.cs" Inherits="Controls_ProductCategory" %>
<%@ Import Namespace="System.Data" %>

<input type="hidden" id="idCategory" value="<%= drCat["ID"] %>" />
<input type="hidden" id="pageIndex" value="1" />
<input type="hidden" id="pageSize" value="<%= C.ROWS_PRODUCTCATEGORY %>" />
<input type="hidden" id="totalProduct" value="<%= _totalProduct %>" />
<input type="hidden" id="rootFilterCategoryID" value="0" />
<input type="hidden" id="attributeIDList" value="" />
<input type="hidden" id="categoryName" value="<%= drCat["Name"] %>" />
<input type="hidden" id="loadByFilter" value="0" />

<input type="hidden" id="AttributesIDList" value="<%= Utils.CommaSQLRemove(drCat["AttributesIDList"].ToString()) %>" />
<main class="products">
    <div class="container">
        <%
            int flagStyle2 = (int)PositionMenuFlag.Style2;
            string filter_style2 = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", flagStyle2);
            DataTable dt_style2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0} AND {1}", RootID, filter_style2), "Sort");
            if (Utils.CheckExist_DataTable(dt_style2))
            {
        %>
        <div class="category-box">
            <ul class="category-list">

                <%  foreach (DataRow dr_3 in dt_style2.Rows)
                    {
                        string icon = C.NO_IMG_PATH;
                        if (!string.IsNullOrEmpty(dr_3["Icon"].ToString()))
                            icon = dr_3["Icon"].ToString();
                        string link = Utils.CreateCategoryLink(dr_3["LinkTypeMenuFlag"], dr_3["FriendlyUrl"], dr_3["Link"]);
                        string selected = string.Empty;
                        if (ConvertUtility.ToInt32(drCat["ID"]) == ConvertUtility.ToInt32(dr_3["ID"]))
                            selected = " selected";
                %>

                <li class="category-item<%= selected %>">
                    <a class="category-link" href="<%= link %>">
                        <img src="<%= icon %>" alt="<%= dr_3["Name"].ToString() %>" />
                        <%= dr_3["Name"].ToString() %>
                    </a>
                </li>

                <% } %>
            </ul>
        </div>
        <% } %>

        <%
            int flagStyle1 = (int)PositionMenuFlag.Style1;
            string filter_style1 = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", flagStyle1);
            DataTable dt_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,Icon,LinkTypeMenuFlag,FriendlyUrl,Link", string.Format("ParentID={0} AND {1}", RootID, filter_style1), "Sort");
            if (Utils.CheckExist_DataTable(dt_2))
            {
        %>

        <div class="brand-option">
            <ul class="brand-list">
                <%  foreach (DataRow dr_2 in dt_2.Rows)
                    {

                        string icon = C.NO_IMG_PATH;
                        if (!string.IsNullOrEmpty(dr_2["Icon"].ToString()))
                            icon = dr_2["Icon"].ToString();
                        string link = Utils.CreateCategoryLink(dr_2["LinkTypeMenuFlag"], dr_2["FriendlyUrl"], dr_2["Link"]);

                        string selected = string.Empty;
                        if (ConvertUtility.ToInt32(drCat["ID"]) == ConvertUtility.ToInt32(dr_2["ID"]))
                            selected = " selected";

                %>
                <li class="brand-item<%= selected %>">
                    <a href="<%= link %>">
                        <img src="<%= icon %>" alt="<%= dr_2["Name"].ToString() %>" class="logo-brand" /></a>
                </li>
                <% } %>

                <% if (dt_2.Rows.Count > 5)
                    { %>
                <li class="brand-item see-more-brand">
                    <p>Xem thêm</p>
                </li>
                <% } %>
            </ul>
        </div>

        <% } %>
        <div class="content">
            <div class="container-product">
                <div class="heading">
                    <h1 class="title">
                        <span><%= drCat["Name"] %></span>
                    </h1>

                    <%
                        string filter3 = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} = 0  AND PositionMenuFlag & {1} = 0 AND ParentID={2}", (int)PositionMenuFlag.MenuSubMainHome, (int)PositionMenuFlag.MenuSubMainHome2, drCat["ID"]);
                        DataTable dt_3 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "LinkTypeMenuFlag,FriendlyUrl,Link,ID,Icon,Name", filter3, "Sort");
                        if (Utils.CheckExist_DataTable(dt_3))
                        {
                    %>

                    <div class="child-option">
                        <ul class="child-list">
                            <%  foreach (DataRow dr_3 in dt_3.Rows)
                                {
                                    string icon = C.NO_IMG_PATH;
                                    if (!string.IsNullOrEmpty(dr_3["Icon"].ToString()))
                                        icon = dr_3["Icon"].ToString();
                                    string link = Utils.CreateCategoryLink(dr_3["LinkTypeMenuFlag"], dr_3["FriendlyUrl"], dr_3["Link"]);

                                    string selected = string.Empty;
                                    if (ConvertUtility.ToInt32(drCat["ID"]) == ConvertUtility.ToInt32(dr_3["ID"]))
                                        selected = " selected";

                            %>
                            <li class="child-item<%= selected %>"><i class="fad fa-chevron-double-right"></i>
                                <a href="<%= link %>">
                                    <%= dr_3["Name"].ToString() %></a>
                            </li>
                            <% } %>
                        </ul>
                    </div>

                    <% } %>
                </div>
                <div class="product-list">
                    <% 
                        if (Utils.CheckExist_DataTable(dtProduct))
                        {
                            foreach (DataRow drProduct in dtProduct.Rows)
                            {
                                string linkDetail = TextChanger.GetLinkRewrite_Products(ConvertUtility.ToString(drProduct["FriendlyUrlCategory"]), ConvertUtility.ToString(drProduct["FriendlyUrl"]));

                    %>
                    <div class="product-item">
                        <a href="<%= linkDetail %>">
                            <div class="img">
                                <img src="<%= Utils.GetFirstImageInGallery_Json(drProduct["Gallery"].ToString(), 300, 300) %>" alt="<%= drProduct["Name"].ToString() %>" />
                            </div>
                            <%--<span class="sale">50%</span>--%>
                            <div class="cont">
                                <h3 class="name"><%= drProduct["Name"].ToString() %></h3>
                                <div class="info">

                                    <ins><%= SqlHelper.GetPrice(drProduct, "Price") %></ins>
                                    <del><%= SqlHelper.GetPrice(drProduct, "Price1") %></del>

                                    <% if (!string.IsNullOrEmpty(SqlHelper.GetPricePercent(ConvertUtility.ToInt32(drProduct["ID"]))))
                                        { %>
                                    <span class="percent-sale"><%= SqlHelper.GetPricePercent(ConvertUtility.ToInt32(drProduct["ID"])) %></span>
                                    <% } %>
                                </div>
                            </div>
                        </a>
                        <div class="cnt-buy-now">
                            <a href="<%= linkDetail %>">Xem thêm</a>
                        </div>
                    </div>
                    <%}
                        } %>
                </div>
                <div class="clear"></div>
                <% if (_totalProduct > C.ROWS_PRODUCTCATEGORY)
                    { %>
                <div class="container-btn show-more"><a id="category_paging" class="btn-see-more">Xem thêm <i class="fas fa-sort-down"></i></a></div>
                <%} %>
            </div>
            <div class="filter">
                <div class="filted">
                    <%-- <span>Lọc: </span>--%>
                    <div id="filted">
                    </div>
                </div>
                <div class="filter-ajax">
                </div>
            </div>
            <% if (!Utils.IsNullOrEmpty(drCat["LongDescription"].ToString()))
                { %>
            <%   string AddressFunction = ConfigWeb.AdressFunction;
                string ContentHtml = ConvertUtility.ToString(drCat["LongDescription"]);
                ContentHtml = ContentHtml.Replace("{Address}", AddressFunction);
            %>
            <div id="description_cate" class="description_cate">
                <%= ContentHtml %>
            </div>
           
      

            <%} %>




<%--            <%
                string TagsList = drCat["TagIDList"].ToString().Trim(',');
                if (!Utils.IsNullOrEmpty(TagsList))
                {
                    DataTable dtTag = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "Name,FriendlyUrl", string.Format("ID IN ({0}) AND ItemNumber > 0", TagsList));
                    if (dtTag != null && dtTag.Rows.Count > 0)
                    {
            %>
            <div class="clear"></div>
            <div class="entry-tags">
                <ul>

                    <%
                        foreach (DataRow drTag in dtTag.Rows)
                        {
                            string link = TextChanger.GetLinkRewrite_Category(drTag["FriendlyUrl"].ToString());
                            string tagName = drTag["Name"].ToString();
                    %>
                    <li class="entry-tag-item"><a href="<%= link %>" title="<%= tagName %>"><%= tagName %></a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <div class="clear"></div>
            <%
                    }
                }
            %>--%>
        </div>
    </div>
</main>

 <input type="hidden" value="category" id="GG_Page" />
 <input type="hidden" value="<%= string.Format("{0:0}", 1000000) %>" id="GG_Price" />


<script type="application/ld+json">
{
"@context" : "http://schema.org",
"@type" : "<%= SEO_Schema.Type %>",
"name" : "<%= Utils.QuoteRemove(SEO_Schema.Title) %>",
"alternateName" : "<%= Utils.QuoteRemove(SEO_Schema.Description) %>",
"url" : "<%= SEO_Schema.Url %>",
"image" : "<%= SEO_Schema.Image %>",
"author": {
"@type": "Person",
    "name": "<%= ConfigWeb.SiteName %>",
  "url": "<%= ConfigWeb.SiteUrl %>"
},
"datePublished" : "<%= SEO_Schema.PublisherDate %>",
"headline" : "<%= Utils.QuoteRemove(SEO_Schema.Title) %>",
"dateModified" : "<%= SEO_Schema.PublisherDate %>",
"mainEntityOfPage": {
  "@type": "WebPage",
  "@id": "<%= SEO_Schema.Url %>"
},
"publisher": {
  "@type": "Organization",
  "name": "<%= SEO_Schema.Publisher_Name %>",
  "logo": {
    "@type": "ImageObject",
    "url": "<%= SEO_Schema.Publisher_Logo %>"
  }
}
}
</script>
