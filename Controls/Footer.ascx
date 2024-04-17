<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="Controls_Footer" %>
<%@ Import Namespace="System.Data" %>
<footer>
    <div class="fo1">
        <div class="container">
            <div class="in">
                <div class="info">
                    <div class="item">
                       <i class="fad fa-phone-office"></i>
                        <div>
                            <%= ConfigWeb.Footer_Phone %>
                        </div>
                    </div>
                    <div class="item">
                        <i class="fad fa-map-marker-check"></i>

                        <div>
                            <%= ConfigWeb.Footer_Address %>
                        </div>
                    </div>
                    <div class="item">
                        <i class="far fa-link"></i>
                        <div>
                            <p>WEBSITE</p>
                            <p><%= ConfigWeb.SiteUrl %></p>
                            <p>E-MAIL</p>
                            <p><%= ConfigWeb.Email %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="fo2">
        <div class="container">
            <div class="in">
                <div class="item">
                    <div class="insider">
                        <div class="img_logo">
                            <a href="<%= C.ROOT_URL %>">
                                <img src="<%= ConfigWeb.LogoFooter %>" alt="<%= ConfigWeb.MetaTitle %>"></a>
                        </div>
                        <%--<h2><%= ConfigWeb.SiteName %></h2>--%>
                        <p>
                            <a href="http://online.gov.vn/Home/WebDetails/15750" target="_blank" rel="nofollow">
                                <img src="/assets/images/dathongbaobocongthuong.png" alt="Đã thông báo bộ công thương" style="width: 200px; margin-top: 10px" />
                            </a>
                        </p>
                        <%--<p>
                            Nhập địa chỉ <strong>E-mail</strong> để nhận được thông báo
                  mới nhất!
                        </p>
                        <form action="" method="post">
                            <input type="text" placeholder="Địa chỉ E-mail" />
                            <button type="submit">
                                <i class="fal fa-long-arrow-right"></i>
                            </button>
                        </form>--%>
                    </div>
                </div>


                <%
                    int mainMenu = (int)PositionMenuFlag.Bottom;
                    string filterWidget = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", mainMenu);
                    DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID=0 AND {0}", filterWidget), "Sort", 1, 100);
                    if (Utils.CheckExist_DataTable(dt))
                    {
                        foreach (DataRow dr_1 in dt.Rows)
                        {
                            DataTable dt_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "", string.Format("ParentID={0}", dr_1["ID"]), "Sort", 1, 10);
                %>


                <div class="item">
                    <div class="insider">
                        <p><%= dr_1["Name"] %></p>
                        <ul>
                            <% if (Utils.CheckExist_DataTable(dt_2))
                                {
                                    foreach (DataRow dr_2 in dt_2.Rows)
                                    {
                                        string link = Utils.CreateCategoryLink(dr_2["LinkTypeMenuFlag"], dr_2["FriendlyUrl"], dr_2["Link"]);
                            %>
                            <li><a href="<%= link %>"><%= dr_2["Name"] %></a></li>
                            <% } %>
                        </ul>
                    </div>
                </div>
                <%}
                        }
                    }
                %>
                <div class="item">
                    <div class="insider">
                        <div class="gg-map">
                            <iframe src="<%= ConfigWeb.MapLocation %>" width="100%" height="150" frameborder="0" style="border: 0" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                            <%  if (!string.IsNullOrEmpty(ConfigWeb.MapLocation1) && !string.IsNullOrEmpty(ConfigWeb.MapLocation2))
                                { %>
                            <div class="container-btn">
                                <a href="<%= ConfigWeb.MapLocation1 %>" class="btn-gg" target="_blank" rel="nofollow">Phía Bắc </a>
                                <a href="<%= ConfigWeb.MapLocation2 %>" class="btn-gg" target="_blank" rel="nofollow">Phía Nam </a>
                            </div>
                            <% } %>
                        </div>
                        <h4>Chấp nhận thanh toán</h4>
                        <div class="social">
                            <img src="/themes/img/payment.png" alt="Payment method" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
