<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShoppingCart.ascx.cs" Inherits="Controls_ShoppingCart" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="System.Data" %>
<% decimal finalPrice = 0; %>

<%
    PageInfo.ControlName = "Giỏ hàng";
    string displayNoCart = string.Empty;
    string displayFormInfo = string.Empty;
    if (ShoppingCart.CartCount == 0)
    {
        displayNoCart = "display:block";
        displayFormInfo = "display:none";
    }
    else
    {
        displayNoCart = "display:none";
        displayFormInfo = "display:block";
    }
%>

<div style="<%= displayFormInfo %>" class="cart-info">
    <form method="post" enctype="multipart/form-data" id="frm_checkout">
        <div class="container">
            <div class="checkout">
                <div class="shopping-cart">
                    <h2><i class="fad fa-cart-arrow-down"></i>Thông Tin Đơn Hàng</h2>
                    <div class="header-cart">
                        <div>Ảnh</div>
                        <div>Sản phẩm</div>
                        <div>Số lượng</div>
                        <div>Thành tiền</div>
                        <div>Xoá</div>
                    </div>
                    <%

                        List<OrderInfo> orderInfoList = ShoppingCart.GetOrderInfo(out finalPrice);
                        if (orderInfoList.Count > 0)
                        {
                            foreach (OrderInfo orderInfo in orderInfoList)
                            {
                                DataTable dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "", "ID=" + orderInfo.ProductID);
                                if (Utils.CheckExist_DataTable(dtProduct))
                                {
                                    string link = TextChanger.GetLinkRewrite_Products(dtProduct.Rows[0]["FriendlyUrlCategory"], dtProduct.Rows[0]["FriendlyUrl"]);

                    %>

                    <div class="item item<%= orderInfo.ProductID %>">
                        <div>
                            <img src="<%= orderInfo.Image %>" alt="<%= orderInfo.Name %>" />
                        </div>
                        <div>
                            <a href="<%=link %>"><%= orderInfo.Name %></a>
                        </div>
                        <div>
                            <a class="minus increment" href="javascript:;">-</a>
                            <input type="text" class="quantity_cart" readonly="readonly" id="<%= orderInfo.ProductID %>" value="<%= orderInfo.Quantity %>" />
                            <a class="plus increment" href="javascript:;">+</a>
                        </div>
                        <div class="price_item_<%= orderInfo.ProductID %>">
                            <%=string.Format("{0:N0}", orderInfo.TotalPrice) %> VNĐ
                        </div>
                        <div><a href="javascript:;" class="del_cart" data-id="<%= orderInfo.ProductID %>"><i class="fad fa-trash-alt"></i></a></div>
                    </div>

                    <%
                                }
                            }
                        }
                    %>

                    <div class="total">
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                        <div>Tổng tiền</div>
                        <div class="cart_total_price"><%=string.Format("{0:N0}", finalPrice) %> VNĐ</div>
                        <input type="hidden" id="hdfTotalPrice" name="hdfTotalPrice" value="<%= string.Format("{0}",Math.Round(finalPrice)) %>" />
                    </div>

                    <div class="clear"></div>

                    <%
                        DateTime today = DateTime.Now;
                        DateTime answer = today.AddDays(3);

                    %>
                    <%--<p>Thời gian giao hàng dự kiến <b><%= answer.ToString("hh:mm tt dd/MM/yyyy") %></b></p>--%>


                    <% if (finalPrice < 1200000 && C.ROOT_URL.Contains("nhaccutiendat"))
                        {
                            %>
                    <p><b>Lưu ý: </b>Chi phí này chưa bao gồm phí vận chuyển</p>
                    <%
                        }


                            %>



                </div>
                <div class="checkout-info">
                    <h2><i class="fad fa-address-card"></i>Thông Tin Người Nhận</h2>

                    <div class="info">
                        <label>Họ và tên<span class="required"></span></label>
                        <input type="text" placeholder="Họ và tên" id="name" name="name" required />
                    </div>
                    <div class="info">
                        <label>Số điện thoại<span class="required"></span></label>
                        <input placeholder="Số điện thoại" type="text" id="tel" name="tel" required />
                    </div>
                    <div class="info">
                        <label>Email</label>
                        <input placeholder="Email" type="text" id="email" name="email" />
                    </div>
                    <div class="info">
                        <label>Địa chỉ<span class="required"></span></label>
                        <textarea placeholder="Địa chỉ" id="address" name="address" rows="5" required></textarea>
                    </div>
                    <div class="info">
                        <label>Ghi chú</label>
                        <textarea placeholder="Ghi chú" id="note" name="note" rows="5"></textarea>
                    </div>





                    <div class="pay">
                        <h2><i class="fad fa-money-check-edit-alt"></i>Thông Tin Thanh Toán</h2>
                        <ul class="list-content-nganluong">
                            <li class="active">
                                <input type="radio" name="option_payment" id="COD" value="COD" checked="checked">
                                <label for="COD">Thanh toán tiền mặt khi nhận hàng (COD)</label>
                                <div class="boxContent">
                                    <img src="/themes/img/cod.jpg" alt="Giao hàng nhận tiền" />
                                </div>
                            </li>

                            <li>
                                <input type="radio" name="option_payment" id="chuyenkhoan" value="chuyenkhoan">
                                <label for="chuyenkhoan">Liên hệ chuyển khoản trực tiếp với nhân viên tư vấn</label>
                               
                            </li>

                            <li>
                                <input type="radio" name="option_payment" id="vnpay" value="vnpay">
                                <label for="vnpay">Thanh toán tự động bằng Internet banking</label>
                            </li>

                        </ul>

                    </div>

                    <div style="text-align: center">
                        <a href="javascript:;" id="btnSubmit"><i class="fad fa-paper-plane"></i>Hoàn tất</a>
                        <input type="hidden" id="done" name="done" value="0" />

                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<div style="<%= displayNoCart %>" class="cart-empty">
    <div class="container">
        <h2>Giỏ hàng của quý khách chưa có sản phẩm!</h2>
        <img src="/themes/img/cart-empty.png" />
    </div>
</div>


<%
    int count = 0;
    string Items = "[";
    if (orderInfoList.Count > 0)
    {
        foreach (OrderInfo orderInfo in orderInfoList)
        {
            count++;
            string dau_phay = ",";
            if (count == orderInfoList.Count)
                dau_phay = string.Empty;

            Items += string.Format(@"{{""id"":""{0}"",""productName"":""{1}"",""quantity"":""{2}""}}{3}", orderInfo.ProductID, orderInfo.Name, orderInfo.Quantity, dau_phay);
        }
    }
    Items += "]";
%>

 <input type="hidden" value="cart" id="GG_Page" />
 <input type="hidden" value="<%= string.Format("{0:0}", finalPrice) %>" id="GG_Price" />
 <input type="hidden" value='<%= Items %>' id="GG_Items" />
 <input type="hidden" value="<%= count %>" id="GG_CountItems" />
