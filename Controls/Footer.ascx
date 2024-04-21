<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="Controls_Footer" %>
<%@ Import Namespace="System.Data" %>
<footer>
    <div class="ft-up fo1">
        <div class="in">
             <div class="info">
                <div class="item">
                    <div class="cnt-desc-ft">
                        <h3>Nhạc cụ Tiến Đạt</h3>
                        <p>Hơn 20 năm kinh nghiệm phân phối Thiết bị Âm thanh & phụ kiện Đàn Organ, Guitar, Piano, Ukulele, trống, phụ kiện  các hãng Yamaha, Casio, Roland, Kawai, ...</p>
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
                                    <h3>DANH MỤC SẢN PHẨM</h3>
                            </div>
                            <ul>
                                <li><a href="http://localhost:57042/chinh-sach-va-quy-dinh-chung/">Chính sách và quy định chung</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-ban-hang-va-chat-luong-hang-hoa/">Chính sách bán hàng và chất lượng h.hóa</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-bao-mat-thong-tin/">Chính sách bảo mật thông tin</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-doi-tra-hang-hoa/">Chính sách Đổi - Trả hàng hóa</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-van-chuyen-giao-nhan-hang-hoa/">Chính sách vận chuyển, giao nhận h.hóa</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-bao-hanh-san-pham/">Chính sách Bảo hành sản phẩm</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-ho-tro-tra-gop/">Chính sách Hỗ trợ trả góp</a></li>
           
                            </ul>
                        </div>
                        <div class="item-child">
                            <div class="cnt-desc-ft">
                                    <h3>THÔNG TIN NHẠC CỤ TIẾN ĐẠT</h3>
                            </div>
                            <ul>
                                <li><a href="http://localhost:57042/chinh-sach-va-quy-dinh-chung/">Chính sách và quy định chung</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-ban-hang-va-chat-luong-hang-hoa/">Chính sách bán hàng và chất lượng h.hóa</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-bao-mat-thong-tin/">Chính sách bảo mật thông tin</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-doi-tra-hang-hoa/">Chính sách Đổi - Trả hàng hóa</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-van-chuyen-giao-nhan-hang-hoa/">Chính sách vận chuyển, giao nhận h.hóa</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-bao-hanh-san-pham/">Chính sách Bảo hành sản phẩm</a></li>
           
                                <li><a href="http://localhost:57042/chinh-sach-ho-tro-tra-gop/">Chính sách Hỗ trợ trả góp</a></li>
           
                            </ul>
                        </div>
                     </div>
                      <div class="fo2">
                         <div class="in">
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
