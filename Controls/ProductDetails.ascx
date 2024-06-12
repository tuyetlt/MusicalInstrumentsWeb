<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductDetails.ascx.cs" Inherits="Controls_ProductDetails" %>
<%@ Import Namespace="System.Data" %>
<% List<GalleryImage> galleryList = Newtonsoft.Json.JsonConvert.DeserializeObject<System.Collections.Generic.List<GalleryImage>>(dr["Gallery"].ToString());
    List<string> imgList = new List<string>();
%>
<main class="product-detail">
    <div class="container">
        <div class="container-detail-product">
            <div class="detail-product">
                <div class="box-overview">
                    <div class="box-img-product">
                        <div class="box-images">
                            <div class="container-carousel">
                                <div class="carousel-img-product">
                                    <%
                                        if (!Utils.IsNullOrEmpty(dr["VideoGallery"]))
                                        {
                                            List<VideoGallery> videoGalleryList = Newtonsoft.Json.JsonConvert.DeserializeObject<List<VideoGallery>>(ConvertUtility.ToString(dr["VideoGallery"]));
                                            if (videoGalleryList.Count > 0)
                                            {%>
                                    <div class="slide vid">
                                        <%
                                            foreach (VideoGallery video in videoGalleryList)
                                            {
                                                if (!string.IsNullOrEmpty(video.IDYoutube))
                                                {
                                        %>
                                        <div class="slide vid">

                                            <%--<iframe width="377" height="377" src="//www.youtube-nocookie.com/embed/<%= video.IDYoutube %>?rel=0?version=3&autoplay=0&controls=0&&showinfo=0&loop=1&mute=0" title="<%= dr["Name"].ToString() %>" frameborder="0" allow="autoplay; fullscreen"></iframe>--%>
                                            <iframe width="377" height="377" src="https://www.youtube.com/embed/<%= video.IDYoutube %>?start=0&rel=0&autoplay=0&enablejsapi=1&origin=<%= Utils.UrlEncode(C.ROOT_URL) %>&widgetid=1" title="<%= dr["Name"].ToString() %>" frameborder="0" allow="autoplay; fullscreen"></iframe>

                                        </div>
                                        <%}
                                            }
                                        %>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>


                                    <%

                                        if (galleryList != null && galleryList.Count > 0)
                                        {
                                            int count = 0;
                                            foreach (GalleryImage gallery in galleryList)
                                            {
                                                string alt = dr["name"].ToString() + " " + count.ToString();
                                                count++;
                                    %>
                                    <div class="slide">
                                        <a href="<%= C.MAIN_URL %><%= gallery.Path %>?width=1000&height=1000&quality=100" data-fancybox="images">
                                            <img src="<%= C.MAIN_URL %><%= gallery.Path %>?width=500&height=500&quality=100" alt="<%= alt %>" />
                                        </a>
                                    </div>

                                    <%
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="thumbnail-child">

                            <%

                                if (galleryList != null && galleryList.Count > 0)
                                {
                                    int count = 0;
                                    foreach (GalleryImage gallery in galleryList)
                                    {
                                        string alt = dr["name"].ToString() + " " + count.ToString();
                                        count++;
                                        imgList.Add(C.MAIN_URL + gallery.Path);
                            %>
                            <div class="thumb">
                                <a href="<%= C.MAIN_URL %><%= gallery.Path %>?width=1000&height=1000&quality=100" data-fancybox="images">
                                    <img src="<%= C.MAIN_URL %><%= HttpUtility.UrlDecode(gallery.Path) %>?width=80&height=80&quality=100" alt="<%= alt %>" />
                                </a>
                            </div>

                            <%
                                    }
                                }
                            %>


                            <%
                                //Piano Điện
                                string CategoryIDParentList = dr["CategoryIDParentList"].ToString();
                                if (1 == 1)
                                {
                                    if (dr != null && CategoryIDParentList.Contains(",142,") && !CategoryIDParentList.Contains(",141,") && !dr["CategoryIDList"].ToString().Contains(",141,")) //Yamaha
                                    {
                                        if (!CategoryIDParentList.Contains(",44,") && !CategoryIDParentList.Contains(",45,") && !dr["CategoryIDList"].ToString().Contains(",44,") && !dr["CategoryIDList"].ToString().Contains(",45,"))
                                        {
                            %>

                            <div class="thumb">
                                <a href="https://www.youtube-nocookie.com/embed/Sv_DhzuKVs0" data-fancybox="images">
                                    <img src="/assets/images/video-icon.jpg" />
                                </a>
                            </div>

                            <% }
                                    }
                                }%>






                            <%
                                //Piano Điện
                                //string CategoryIDParentList = dr["CategoryIDParentList"].ToString();

                                if (Utils.isMobileBrowser)
                                {
                                    if (dr != null && CategoryIDParentList.Contains(",142,") && !CategoryIDParentList.Contains(",141,") && !dr["CategoryIDList"].ToString().Contains(",141,")) //Yamaha
                                    {
                                        if (!CategoryIDParentList.Contains(",44,") && !CategoryIDParentList.Contains(",45,") && !dr["CategoryIDList"].ToString().Contains(",44,") && !dr["CategoryIDList"].ToString().Contains(",45,"))
                                        {
                            %>
                            <div class="video" style="margin-top: 10px">
                                <iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Sv_DhzuKVs0" title="Piano Điện tại Nhạc cụ Tiến Đạt" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <% }
                                    }
                                }%>




                            <%--<div class="box-option-show">
                                <div class="option-show-item">
                                    <%
                                        if (galleryList != null && galleryList.Count > 0)
                                        {
                                            int count = 0;
                                    %>
                                    <a href="<%= Utils.GetFirstImageInGallery_Json(dr["Gallery"].ToString()) %>"
                                        data-fancybox="images-preview"
                                        data-width="1500"
                                        data-height="1000"
                                        data-thumbs='{"autoStart":true}'>
                                        <i class="fas fa-image"></i>
                                    </a>
                                    <p class="title">Bộ ảnh (14)</p>

                                    <div style="display: none">
                                        <%
                                            foreach (GalleryImage gallery in galleryList)
                                            {
                                                string alt = dr["name"].ToString() + " " + count.ToString();
                                                count++;
                                        %>

                                        <a
                                            href="<%= gallery.Path %>"
                                            data-fancybox="images-preview"
                                            data-width="1500"
                                            data-height="1000"
                                            data-thumb="<%= gallery.Path %>"></a>

                                        <% } %>
                                    </div>

                                    <% } %>
                                </div>


                                <div class="option-show-item">
                                    <a href="https://www.youtube.com/watch?v=TTyDNCyoUeY"
                                        data-fancybox="images-preview"
                                        data-width="1500"
                                        data-height="1000"
                                        data-thumbs='{"autoStart":true}'>
                                        <i class="fab fa-youtube"></i>
                                    </a>
                                    <p class="title">Video (2)</p>
                                    <div style="display: none">
                                        <a href="https://www.youtube.com/watch?v=TTyDNCyoUeY"
                                            data-fancybox="images-preview"
                                            data-width="1500"
                                            data-height="1000"></a>
                                        <a href="https://www.youtube.com/watch?v=Y4nRZfVnObg"
                                            data-fancybox="images-preview"
                                            data-width="1500"
                                            data-height="1000"></a>
                                        <a href="https://www.youtube.com/watch?v=TTyDNCyoUeY"
                                            data-fancybox="images-preview"
                                            data-width="1500"
                                            data-height="1000"></a>
                                        <a href="https://www.youtube.com/watch?v=Y4nRZfVnObg"
                                            data-fancybox="images-preview"
                                            data-width="1500"
                                            data-height="1000"></a>
                                    </div>
                                </div>

                                <%
                                    if (Utils.CheckExist_DataTable(dtNews))
                                    {
                                %>
                                <div class="option-show-item">
                                    <a data-fancybox
                                        data-src="#hidden-content-new"
                                        href="javascript:;"
                                        class="btn">
                                        <i class="far fa-newspaper"></i>
                                    </a>

                                    <p class="title">Tin tức (<%= dtNews.Rows.Count %>)</p>
                                    <div class="container-new"
                                        style="display: none; width: 100vw; height: 95vh"
                                        id="hidden-content-new">
                                        <div class="new-list">


                                            <%
                                                foreach (DataRow drNews in dtNews.Rows)
                                                {
                                                    string linkNews = TextChanger.GetLinkRewrite_Article(drNews["FriendlyUrl"].ToString());
                                                    string imageNews = Utils.GetFirstImageInGallery_Json(drNews["Gallery"].ToString());
                                            %>

                                            <div class="new-item">
                                                <a href="<%= linkNews %>">
                                                    <div class="img">
                                                        <img src="<%= imageNews %>?quality=100&width=300&height=150" alt="<%= drNews["Name"] %>" />
                                                    </div>
                                                    <h2 class="title"><%= drNews["Name"] %>
                                                    </h2>
                                                    <p class="text">
                                                        <%= drNews["Description"] %>
                                                    </p>
                                                </a>
                                            </div>
                                            <% } %>



                                            <div class="container-btn">
                                                <button data-fancybox-close class="btn-close">
                                                    đóng
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>--%>

                                </div>

                            <div class="clear"></div>



                            <%--<div class="commitment">
                                <h4 class="title">TIENDATNHACCU CAM KẾT</h4>
                                <p class="text">
                                    - Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                                            Dignissimos eos omnis quaerat voluptatibus nulla ipsa
                                </p>
                                <p class="text">
                                    - Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                                            Dignissimos eos omnis quaerat voluptatibus nulla ipsa
                                </p>
                                <div class="icon">
                                    <i class="far fa-award"></i>
                                </div>
                            </div>--%>
                        </div>
                        
                    </div>
                    <div class="box-order">
                        <div class="heading-box">
                            <h1 class="title"><%= dr["Name"] %></h1>
                            <div class="container-names">
                                <%--  <div class="box-name">
                                    <p class="name">Acoustic guitar</p>
                                    <p class="brand">Thương hiệu: <a href="#">Yamaha</a></p>
                                </div>--%>
                                <%--  <div class="rate-star">
                                        <div class="star">
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </div>
                                        <p class="vote">
                                            <a href="#">(123 đánh giá)</a>
                                        </p>
                                    </div>--%>
                                <div class="content-chose-color">
                                    <div class="title-color">
                                        Color
                                    </div>
                                    <ul class="list-color">
                                        <li>
                                            <a href="#">
                                                <img src="/assets/images/mau1.png" alt="màu 1" />
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="/assets/images/mau2.png" alt="màu 2" />
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="list-title-combo">
                                    <div class="combo">
	                                    <div class="title-color">Tiêu đề:</div>
	                                    <div class="list-option-product">  
		                                    <div data-value="PIANO YAMAHA YDP 105B" class="item piano-ydp">
			                                    <label data-name="option1" data-value="PIANO YAMAHA YDP 105B" data-vhandle="piano-ydp" id="piano-ydp" class="active">
								                    <span>Piano yamaha ydp 105b</span>
			                                    </label>
		                                    </div>
		                                    <div data-value="PIANO YAMAHA YDP 105B + Chân" class="item piano-ydp-chan">
			                                    <label data-name="option1" data-value="PIANO YAMAHA YDP 105B + Chân" data-vhandle="piano-ydp-chan" id="swatch-0-psr-f52-chan" class="">
								                    <span>Piano yamaha ydp 105b + Chân</span>
			                                    </label>
		                                    </div>
		                                    <div data-value="PIANO YAMAHA YDP 105B + Bao" class="item piano-ydp-bao">
			                                    <label data-name="option1" data-value="PSR F52 + Bao" data-vhandle="piano-ydp-bao" id="swatch-0-psr-f52-bao" class="">
								                     <span>Piano yamaha ydp 105b + Bao</span>
			                                    </label>
		                                    </div>
	                                    </div>
                                    </div>
								</div>
                            </div>
                        </div>

                        <form method="post" enctype="multipart/form-data" id="frm_giohang" class="dathang">
                            <ul class="property-list">
                                <li class="property-item">

                                    <div class="content">
                                        <p class="sale-price"><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(dr["ID"]), "Price", true) %></p>
                                    </div>
                                </li>

                                <% if (SqlHelper.GetPrice_Decimal(ConvertUtility.ToInt32(dr["ID"]), "Price1", true) > 0)
                                    { %>

                                <li class="property-item">
                                    <p class="title">Giá gốc:</p>
                                    <div class="content">
                                        <p class="base-price">
                                            <span class="price"><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(dr["ID"]), "Price1", true) %></span>
                                            <span class="percent-sale"><%= SqlHelper.GetPricePercent(ConvertUtility.ToInt32(dr["ID"])) %> </span>
                                        </p>
                                    </div>
                                </li>
                                <% } %>

                                <% ProductStatusFlag statusFlag = (ProductStatusFlag)ConvertUtility.ToInt32(dr["ProductStatusFlag"]);
                                    string strStatus = string.Empty;

                                    if (statusFlag.ToString() != ProductStatusFlag.None.ToString())
                                    {
                                        if (statusFlag.HasFlag(ProductStatusFlag.InStock))
                                            strStatus = "Có hàng";
                                        else if (statusFlag.HasFlag(ProductStatusFlag.Contact))
                                            strStatus = "Liên hệ";
                                        else if (statusFlag.HasFlag(ProductStatusFlag.Importing))
                                            strStatus = "Đang nhập";
                                        else if (statusFlag.HasFlag(ProductStatusFlag.OutStock))
                                            strStatus = "Hết hàng";
                                %>

                                <% if (strStatus != "Có hàng")
                                    { %>
                                <li class="property-item">
                                    <p class="title">Tình trạng:</p>
                                    <div class="content"><%= strStatus %></div>
                                </li>
                                <% }
                                    } %>






                                <%--<% ProductVATFlag vatFlag = (ProductVATFlag)ConvertUtility.ToInt32(dr["ProductVATFlag"]);
                                    string strVat = string.Empty;
                                    if (vatFlag.ToString() != ProductVATFlag.None.ToString() && vatFlag.ToString() != ProductVATFlag.Unown.ToString())
                                    {
                                        if (strVat.ToString() == ProductVATFlag.No.ToString())
                                            strStatus = "Chưa bao gồm thuế VAT";
                                        else
                                            strVat = "Đã bao gồm thuế VAT";
                                %>


                                <li class="property-item">
                                    <div class="content"><%= strVat %></div>
                                </li>
                                <% } %>--%>

                                <% if (!string.IsNullOrEmpty(dr["Warranty"].ToString()))
                                    { %>
                                <li class="property-item">
                                    <p class="title">Bảo hành:</p>
                                    <div class="content"><%= dr["Warranty"].ToString() %></div>
                                </li>
                                <% } %>


                                <%
                                    bool gift = false;
                                    if (dr["Gift"].ToString().Length > 5)
                                        gift = true;
                                    if (gift && Utils.isMobileBrowser)
                                    {
                                %>
                                <li class="Ad-special">
                                    <h5 class="title">Quà tặng</h5>
                                    <ul class="Ad-special-list">
                                        <%= dr["Gift"].ToString() %>
                                    </ul>
                                </li>
                                <% } %>

                                <li class="product-desc">
                                    <%= dr["Description"] %>
                                </li>



                                <li class="property-item" style="display: none">
                                    <p class="title">Chọn số lượng:</p>
                                    <div class="content">
                                        <div class="increases-form">
                                            <a class="minus increment" href="javascript:;">-</a>
                                            <input type="text" class="quantity_cart" readonly="readonly" id="quantity" name="quantity" value="1" />
                                            <a class="plus increment" href="javascript:;">+</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <div class="container-button">
                                <a href="javascript:;" id="btnSubmit_giohang" class="button btn-red">
                                    <i class="fad fa-cart-plus"></i>Thêm vào giỏ hàng
                                </a>
                                <%--  <a href="#" class="button btn-blue">
                                    <i class="fas fa-sack-dollar"></i>trả góp
                                </a>
                                <a href="#" class="button btn-green">
                                    <i class="fas fa-headset"></i>tư vấn
                                </a>--%>
                            </div>



                            <input type="hidden" value="<%= dr["ID"].ToString() %>" name="hdfProductID" />
                            <input type="hidden" id="done_giohang" name="done_giohang" value="" />
                            <script type="text/javascript">

</script>
                        </form>
                        <%--  <div class="box-info">
                                <div class="info">
                                    <div class="icon">
                                        <i class="fas fa-shipping-fast"></i>
                                    </div>
                                    <p class="text">
                                        Mua sản phẩm này bạn sẽ được giao hàng miễn phí trong nội
                                            thành Hà Nội và nội thành TP. Hồ Chí Minh.
                                    </p>
                                </div>
                                <div class="see-more">
                                    <a href="#">Xem thêm &rArr;</a>
                                </div>
                            </div>--%>
                    </div>
                </div>
                <div class="box-content-cross-sell">
    <div class="">
        Frequently bought together
    </div>
    <div class="box-top-img-add">
        <div class="box-images">
            <ul>
                <li>
                    <img src="https://nhaccutiendat.vn/upload/img/dan-piano-yamaha-ydp-105b.jpg" alt="Alternate Text" />
                </li>
                <li>
                    <img src="https://nhaccutiendat.vn/upload/img/dan-piano-yamaha-ydp-105b.jpg" alt="Alternate Text" />
                </li>
                <li>
                    <img src="https://nhaccutiendat.vn/upload/img/dan-piano-yamaha-ydp-105b.jpg" alt="Alternate Text" />
                </li>
            </ul>
        </div>
        <div class="box-add">
            <div class="title-price">Tổng tiền</div>
            <div class="price-all">20 000 000</div>
             <div class="container-button">
                 <a href="javascript:;" id="btnSubmit_giohang" class="button btn-red">
                    Thêm vào giỏ hàng
                 </a>
                 <%--  <a href="#" class="button btn-blue">
                     <i class="fas fa-sack-dollar"></i>trả góp
                 </a>
                 <a href="#" class="button btn-green">
                     <i class="fas fa-headset"></i>tư vấn
                 </a>--%>
             </div>
        </div>
    </div>
    <div class="">
        <div class="list-checkbox">
            <form>
                <div class="item-prd">
                     <div class="form-group">
                       <input type="checkbox" id="piano_ydp">
                       <label for="piano_ydp">ĐÀN PIANO YAMAHA YDP 105B</label>
                     </div>
                    <div class="price">
                           17.290.000 VNĐ
                    </div>
                </div>
               <div class="item-prd">
                    <div class="form-group">
                      <input type="checkbox" id="chan">
                      <label for="chan">Chân đàn</label>
                    </div>
                   <div class="price">
                           1.290.000 VNĐ
                    </div>
                </div>
                <div class="item-prd">
                    <div class="form-group">
                      <input type="checkbox" id="tuidung">
                      <label for="tuidung">Túi đựng</label>
                    </div>
                    <div class="price">
                        290.000 VNĐ
                    </div>
                </div>
              </form>
        </div>
    </div>
</div>
                <div class="box-detail">
                    <div class="tab-menu">
                        <ul>
                            <li>
                                <a class="tab-a active-a" data-id="tab0">MÔ TẢ SẢN PHẨM</a>
                            </li>
                            <%
                                bool tab1 = false;
                                if (dr["Tab1"].ToString().Length > 5)
                                    tab1 = true;
                                if (tab1)
                                {
                            %>
                            <li><a class="tab-a" data-id="tab1">THÔNG SỐ KỸ THUẬT</a></li>
                            <% } %>


                              <%
                                bool tab3 = false;
                                if (dr["Tab3"].ToString().Length > 5)
                                    tab3 = true;
                                if (tab3)
                                {
                            %>
                            <li><a class="tab-a" data-id="tab3">INFOMARTION</a></li>
                            <% } %>
                        </ul>
                    </div>
                    <div class="tab tab-active" data-id="tab0">
                        <div class="container-content">
                            <div class="table-of-contents table-ct">
                                <ul class="content-list"></ul>
                            </div>
                            <div class="start-tb"></div>
                            <!-- ------------------table-of-contents-sticky----------------------- -->
                            <div class="icon-sticky">
                                <label for="table-of-contents-toggler" class="target-check">
                                    <i class="fas fa-bars"></i>
                                </label>
                                <input type="checkbox"
                                    class="table-of-contents-input"
                                    name=""
                                    id="table-of-contents-toggler" />
                                <label for="table-of-contents-toggler" class="overlay">
                                </label>
                                <div class="table-of-contents-sticky table-ct">
                                    <ul class="content-list"></ul>
                                </div>
                            </div>

                            <div class="content">
                                <%   string AddressFunction = ConfigWeb.AdressFunction;
                                    string ContentHtml = ConvertUtility.ToString(dr["LongDescription"]);
                                    ContentHtml = ContentHtml.Replace("{Address}", AddressFunction);
                                    ContentHtml = ContentHtml.Replace("{address}", AddressFunction);
                                %>
                                <%= ContentHtml %>
                            </div>
                            <div class="end-tb"></div>
                        </div>
                    </div>
                    <% if (tab1)
                        { %>
                    <div class="tab" data-id="tab1">
                        <div class="container-content">
                            <h2 class="title">THÔNG SỐ KỸ THUẬT</h2>
                            <p class="text">
                                <%= dr["Tab1"].ToString() %>
                            </p>
                        </div>
                    </div>

                    <% } %>

                     <% if (tab3)
                        { %>
                    <div class="tab" data-id="tab3">
                        <div class="container-content">
                            <p class="text">
                                <%= dr["Tab3"].ToString() %>
                            </p>
                        </div>
                    </div>

                    <% } %>
                </div>

<%--                <%
                    string tags = string.Empty;
                    if (dr["TagIDList"].ToString().Length > 2)
                    {
                        Response.Write(@"<div class=""box-tag"">");

                        DataTable dt = SqlHelper.SQLToDataTable(C.CATEGORY_TABLE, "Name, FriendlyUrl", string.Format("ID in ({0}) AND ItemNumber > 0", Utils.CommaSQLRemove(dr["TagIDList"].ToString())), "ID");
                        if (Utils.CheckExist_DataTable(dt))
                        {
                            foreach (DataRow dr1 in dt.Rows)
                            {
                                tags += string.Format(@"<a href=""{0}"" class=""tag"">{1}</a>", TextChanger.GetLinkRewrite_Category(dr1["FriendlyUrl"].ToString()), dr1["Name"].ToString());
                            }
                        }
                        Response.Write(tags);
                        Response.Write("</div>");
                    }
                %>--%>
            </div>
            <div class="box-Ad">
                <div class="container-carousel">
                    <div class="carousel-Ad">
                        <% if (Utils.CheckExist_DataTable(dtBannerRight))
                            {
                                foreach (DataRow drBannerRight in dtBannerRight.Rows)
                                {
                        %>
                        <div class="slide">
                            <a href="<%= drBannerRight["Link"] %>">
                                <img src="<%= C.ROOT_URL %><%= drBannerRight["Image_1"] %>" alt="<%= drBannerRight["Alt"] %>" /></a>
                        </div>
                        <%
                                }
                            } %>
                    </div>
                    <%

                        if (gift && !Utils.isMobileBrowser)
                        {
                    %>
                    <div class="Ad-special">
                        <div class="title">Quà tặng</div>
                        <ul class="Ad-special-list">
                            <%= dr["Gift"].ToString() %>
                        </ul>
                    </div>
                    <% } %>

                    <%
                        //Piano Điện
                        //string CategoryIDParentList = dr["CategoryIDParentList"].ToString();
                        if (dr != null && CategoryIDParentList.Contains(",142,") && !CategoryIDParentList.Contains(",141,") && !dr["CategoryIDList"].ToString().Contains(",141,") && C.ROOT_URL.Contains("nhaccutiendat")) //Yamaha
                        {
                            if (!CategoryIDParentList.Contains(",44,") && !CategoryIDParentList.Contains(",45,") && !dr["CategoryIDList"].ToString().Contains(",44,") && !dr["CategoryIDList"].ToString().Contains(",45,"))
                            {
                    %>
                    <div class="Ad-special">
                        <div class="title">Quà tặng khi mua đàn Piano điện</div>
                        <div class="Ad-special-list">

                            <img src="/upload/banner/tangtainghe.jpg" alt="Tặng tai nghe" />
                        </div>
                    </div>

                    <% }
                        }%>
                </div>
                <div class="container-sticky">
                    <%=Utils.LoadUserControl("~/Controls/WidgetSupport.ascx") %>
                </div>

            </div>
            <div class="clear"></div>
            <div class="box-content-comment">
                 <form id="frmrating" class="form_rating" action="javascript:alert(grecaptcha.getResponse(widgetId1));">
                    <div class="comment-post">
                        <div class="clear"></div>
                        <input type="text" value='' name="articleid" id="txtArticleID" style="display: none" />
                        <input type="text" id="hdfRating" name="hdfRating" style="display: none" />
                        <div class="box-comment">
                            <div class="title-cmt">
                                Bình luận
                            </div>
                            <div class="box-name-phone">
                                <div>
                                    <input type="text" name="name" id="name" placeholder="Tên" required />
                                </div>
                                <div>
                                     <input type="text" name="phone" id="name" placeholder="Số điện thoại" required />
                                </div>
                            </div>
            
                            <div style="padding: 5px 0">
                                <textarea name="comment" id="comment" placeholder="Nội dung" rows="5" required></textarea>
                            </div>

                            <div id="dvCaptchaComment">
                            </div>
                            <input id="btnSubmitComment" type="submit" value="Gửi đánh giá" />
                         </div>
                    </div>
                </form>
            </div>
           <div class="clear"></div>
            <%if (ConvertUtility.ToInt32(PageInfo.CategoryID) > 0)
                { %>

            <div class="heading">
                <div class="title">
                    <span>Sản phẩm cùng danh mục</span>
                </div>
            </div>
            <div class="clear"></div>
            <div class="product-list">
                <% 
                    string filterProduct = string.Format(@"(Hide is null OR Hide=0) AND (CategoryIDList Like N'%,{0},%' OR CategoryIDParentList Like N'%,{0},%' OR TagIDList Like N'%,{0},%')", PageInfo.CategoryID);

                    DataTable dtProduct = SqlHelper.SQLToDataTable(C.PRODUCT_TABLE, "ID,Name,FriendlyUrl,FriendlyUrlCategory,Price, Price1,Gallery", filterProduct, ConfigWeb.SortProduct, 1, C.ROWS_PRODUCTCATEGORY);

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
                        <div class="cont">
                            <div class="name"><%= drProduct["Name"].ToString() %></div>
                            <div class="info">

                                <ins><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(drProduct["ID"]), "Price") %></ins>
                                <del><%= SqlHelper.GetPrice(ConvertUtility.ToInt32(drProduct["ID"]), "Price1") %></del>
                                  <% if (!string.IsNullOrEmpty(SqlHelper.GetPricePercent(ConvertUtility.ToInt32(drProduct["ID"]))))
                                        { %>
                                    <span class="percent-sale"><%= SqlHelper.GetPricePercent(ConvertUtility.ToInt32(drProduct["ID"])) %></span>
                                    <% } %>
                            </div>
                        </div>
                    </a>
                </div>
                <%}
                    } %>
            </div>

            <% } %>
        </div>
    </div>
</main>


<input type="hidden" value="product" id="GG_Page" />
<input type="hidden" value="<%= ConvertUtility.ToString(dr["ID"]) %>" id="GG_ID" />
<input type="hidden" value="<%= ConvertUtility.ToString(dr["Name"]) %>" id="GG_ProductName" />
<input type="hidden" value="<%= string.Format("{0:0}", ConvertUtility.ToDecimal(dr["Price"])) %>" id="GG_Price" />




<script type="application/ld+json">
{
  "@context": "https://schema.org/", 
  "@type": "Product", 
  "name": "<%= Utils.QuoteRemove(dr["Name"].ToString()) %>",
  "image": [
     <%
    int countIMG = 0;
    foreach (string img in imgList)
    {
        countIMG++;
        %>
    "<%= img %>"
    <%
        if (countIMG < imgList.Count)
            Response.Write(",");
    } %> 
    ],
  "description": "<%= Utils.QuoteRemove(SEO_Schema.Description) %>",
  "offers": {
    "@type": "Offer",
    "url": "<%= SEO_Schema.Url %>",
    "priceCurrency": "VND",
    "price": "<%= SEO_Schema.Price %>",
    "priceValidUntil": "2040-04-12",
    "availability": "https://schema.org/InStock",
    "itemCondition": "https://schema.org/NewCondition"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "bestRating": "100",
    "ratingValue": "<%= SEO_Schema.RatingValue %>",
    "ratingCount": "<%= SEO_Schema.RatingCount %>"
  }, 
    "sku": "<%= TextChanger.Translate(ConfigWeb.SiteName, "_") %><%= dr["ID"].ToString() %>",
            "mpn": "<%= TextChanger.Translate(ConfigWeb.SiteName, "_") %><%= dr["ID"].ToString() %>",
    "review": {
                "@type": "Review",
                "reviewRating": {
                    "@type": "Rating",
                    "ratingValue": "<%= SEO_Schema.ReviewRatingValue %>",
                    "bestRating": "5"
                },
                "author": {
                    "@type": "Person",
                    "name": "<%= ConfigWeb.SiteName %>"
                }
            },
     "brand": {
                "@type": "Brand",
                "name": "<%= SEO_Schema.Brand %>"
            }
}
</script>




<script type="text/javascript">
    window.dataLayer = window.dataLayer || [];
    dataLayer.push({
        'event': 'view_item',
        'ecommerce': {
            'items': [{
                'item_name': '<%= Utils.QuoteRemove(dr["Name"].ToString()) %>',
                'item_id': '<%= dr["ID"].ToString() %>',
                'item_category': '<%= dr["ProductType"] %>',
                'price': <%= SEO_Schema.Price %>,
                'currency': 'VND',
                'quantity': 1
            }]
        }
    });
</script>
