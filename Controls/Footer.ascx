﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="Controls_Footer" %>
<%@ Import Namespace="System.Data" %>
<footer>
    <div class="ft-up fo1">
        <div class="in">
            <div class="info">
                <div class="item">
                    <div class="cnt-desc-ft">
                        <h3><%= ConfigWeb.SiteName %></h3>
                        <p><%= ConfigWeb.MetaDescription %></p>
                    </div>
                    <div class="cnt-item">
                        <div class="cnt-icon-up">
                            <i class="fad fa-map-marker-check"></i>
                        </div>

                        <div>
                            <%= ConfigWeb.Footer_Address %>
                        </div>
                    </div>
                    <div class="cnt-item">
                        <div class="cnt-icon-up">
                            <i class="fad fa-phone-office"></i>
                        </div>
                        <div>
                            <%= ConfigWeb.Footer_Phone %>
                        </div>
                    </div>
                    <div class="cnt-item">
                        <div class="item-icon">
                            <i class="fas fa-globe"></i>

                        </div>
                        <div>
                            <p><%= ConfigWeb.SiteUrl %></p>
                        </div>
                    </div>
                    <div class="cnt-item">
                        <div class="item-icon">
                            <i class="far fa-envelope"></i>

                        </div>
                        <div>
                            <p><%= ConfigWeb.Email %></p>
                        </div>
                    </div>
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
                <div class="item">
                    <div class="in">
                        <div class="item-child">
                            <div class="cnt-desc-ft">
                                <p>DANH MỤC SẢN PHẨM</p>
                            </div>
                            <ul>
                                <%
                                    string filter = string.Format("{0} AND {1}", Utils.CreateFilterHide, Utils.CreateFilterFlags(PositionMenuFlag.Main, "PositionMenuFlag"));
                                    DataTable dt_1 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,FriendlyUrl,SeoFlags,AttrMenuFlag,Icon,LinkTypeMenuFlag,Link,Image_3", string.Format("ParentID=0 AND {0}", filter), "Sort", 1, C.MAX_ITEM_MENU);
                                    if (Utils.CheckExist_DataTable(dt_1))
                                    {
                                        foreach (DataRow dr_1 in dt_1.Rows)
                                        {
                                            string link_1 = Utils.CreateCategoryLink(dr_1["LinkTypeMenuFlag"], dr_1["FriendlyUrl"], dr_1["Link"]);
                                            string noffollow1 = string.Empty;
                                            int SeoFlagINT = ConvertUtility.ToInt32(dr_1["SeoFlags"]);
                                            if (SeoFlagINT == (int)SeoFlag.Nofollow)
                                                noffollow1 = @" rel=""nofollow""";
                                %>
                                <li><a href="<%= link_1 %>" <%= Utils.CreateCategory_Target(dr_1["AttrMenuFlag"]) %><%= noffollow1 %>><%= dr_1["Name"].ToString() %></a></li>
                                <%
                                        }
                                    }

                                %>
                            </ul>
                        </div>

                        <%
                            int Bottom = (int)PositionMenuFlag.Bottom;
                            string filterWidget = string.Format("(Hide is null OR Hide=0) AND PositionMenuFlag & {0} <> 0", Bottom);
                            DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,LinkTypeMenuFlag,FriendlyUrl,Link", string.Format("ParentID=0 AND {0}", filterWidget), "Sort", 1, 3);
                            if (Utils.CheckExist_DataTable(dt))
                            {
                        %>
                        <div class="item-child">
                            <div class="cnt-desc-ft">
                                <p><%=dt.Rows[0]["Name"].ToString() %></p>
                            </div>
                            <ul>

                                <% DataTable dt_0 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "ID,Name,LinkTypeMenuFlag,FriendlyUrl,Link", string.Format("ParentID={0}", dt.Rows[0]["ID"]), "Sort", 1, 10);
                                    foreach (DataRow dr_0 in dt_0.Rows)
                                    {
                                        string link = Utils.CreateCategoryLink(dr_0["LinkTypeMenuFlag"], dr_0["FriendlyUrl"], dr_0["Link"]);
                                %>
                                <li><a href="<%= link %>"><%=dr_0["Name"].ToString() %></a></li>
                                <% } %>
                            </ul>
                            <% } %>
                        </div>
                    </div>
                    <div class="fo2">
                        <div class="in">
                            <%
                                if (Utils.CheckExist_DataTable(dt))
                                {
                                    

                                    for(int i = 1; i< dt.Rows.Count; i++)
                                    {
                                        DataTable dt_2 = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "Name,LinkTypeMenuFlag,FriendlyUrl,Link", string.Format("ParentID={0}", dt.Rows[i]["ID"]), "Sort", 1, 10);
                            %>


                            <div class="item">
                                <div class="insider">
                                    <p><%= dt.Rows[i]["Name"] %></p>
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
                                    <div class="social-up">
                                        <ul>
                                            <li>
                                                <a href="#"><i class="fab fa-facebook-square"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fab fa-youtube"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cnt-pay">
                        <div class="cnt-h4">Chấp nhận thanh toán</div>
                        <div class="social">
                            <img src="/themes/img/payment.png" alt="Payment method" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>Copyright 2023 © Công ty Nhạc cụ Tiến Đạt được Sở kế hoạch và đầu tư Thành phố Hà Nội cấp giấy chứng nhận đăng ký kinh doanh ngày DD/MM/YY.</p>
        </div>
    </div>
    <%--  <div class="fo1">
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
    </div> --%>
</footer>
