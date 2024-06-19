<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductUpdate.ascx.cs" Inherits="admin_Controls_ProductUpdate" %>
<%@ Import Namespace="System.Data" %>
<div class="obj-edit">
    <form method="post" enctype="multipart/form-data" id="frm_edit">
        <input type="hidden" name="id" value="<%= dr["ID"].ToString() %>" />
        <input type="hidden" name="hdfOldPrice" value="<%= OldPrice %>" />
        <input type="hidden" name="hdfOldPrice1" value="<%= OldPrice1 %>" />
        <div class="container">
            <div class="edit">
                <div class="left">
                    <!-- Tên sản phẩm -->
                    <div class="form-group">
                        <div>Tên sản phẩm <span class="required">*</span></div>
                        <div>
                            <input type="text" required id="name" name="name" value="<%= dr["Name"].ToString()%>" />
                        </div>
                    </div>
                    <!-- Url Thân thiện -->
                    <div class="form-group">
                        <div>Url Thân thiện <span class="required">*</span></div>
                        <div>
                            <input type="text" id="friendlyurl" name="friendlyurl" value="<%= dr["FriendlyUrl"].ToString()%>" />
                            <input type="hidden" id="table" value="<%= C.PRODUCT_TABLE %>" />
                            <input type="hidden" id="hdfUrlValid" />
                            <a href="javascript:;" id="apply_url"><i class="fad fa-comment-alt-edit"></i><span>Tạo lại Url</span></a>
                            <div id="url_valid">
                                <i class="fad fa-check-square"></i><span>Url hợp lệ</span>
                            </div>
                            <div id="url_invalid">
                                <i class="fad fa-exclamation-circle"></i><span>Url đã tồn tại, vui lòng chọn Url khác</span>
                            </div>
                        </div>
                    </div>
                    <!-- Giá -->
                    <div class="form-group">
                        <div>Giá </div>
                        <div>
                            <input type="text" id="price" name="price" class="price" value="<%= string.Format("{0:N0}", dr["Price"]) %>" />
                        </div>
                    </div>
                    <!-- Giá chưa giảm -->
                    <div class="form-group">
                        <div>Giá chưa giảm</div>
                        <div>
                            <input type="text" id="price1" name="price1" class="price" value="<%= string.Format("{0:N0}", dr["Price1"]) %>" />
                        </div>
                    </div>
                    <!--- Danh mục sản phẩm -->
                    <div class="form-group">
                        <div>Danh mục<span class="required">*</span></div>
                        <div>
                            <input type="text" id="categoryid" name="categoryidlist" value="<%= Utils.CommaSQLRemove(dr["CategoryIDList"].ToString()) %>" style="display: none" />
                            <input type="text" id="categoryname" name="categorynamelist" value="<%= CatNameList %>" style="display: none" />
                            <select id="drCategory" multiple data-level="1" name="itemSelect" style="width: 100%"></select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div>Sắp xếp</div>
                        <div>
                            <input type="text" id="sort" name="sort" value="<%= dr["Sort"].ToString() %>" />
                        </div>
                    </div>

                    <!--- Thuộc tính -->
                    <div class="form-group">
                        <div>Bộ lọc</div>
                    </div>
                    <div class="clear"></div>

                    <input type="hidden" id="attrCheckValue" name="attributesidlist" value="<%= Utils.CommaSQLRemove(dr["AttributesIDList"].ToString()) %>" />
                    <div class="attrCheck" style="display: none">
                        <%-- ajax result--%>
                    </div>

                    <div class="clear"></div>

                    <script type="text/javascript">

                        $(document).ready(function () {
                            var catid = $("#categoryid");
                            if (catid.val().length)
                                GetAttributeProduct(catid.val());
                        });


                        function GetAttributeProduct(categoryIDList) {
                            //categoryIDList = categoryIDList.replace(",", "_");
                            var htmlContent = '';
                            var count = 0;
                            $.getJSON('/ajax/ajax.aspx', { control: "attributeproduct", categoryList: String(categoryIDList) }, function (data) {
                                var jsonContent = JSON.parse(JSON.stringify(data));
                                var divAttrAjax = $(".attrCheck");
                                if (jsonContent != null && jsonContent.length) {
                                    for (var i = 0; i < jsonContent.length; i++) {
                                        var item = jsonContent[i];

                                        if (item.Name != "RootID") {
                                            count++;
                                            htmlContent += "<div>"
                                            htmlContent += "<h3>" + item.Name + "</h3>";

                                            var jsonChild = JSON.parse(JSON.stringify(item.attributeProductChild));
                                            for (var j = 0; j < jsonChild.length; j++) {
                                                var itemChild = jsonChild[j];

                                                htmlContent += "<input type='checkbox' class='checkboxAttr' onclick='GetValueFromAttr()' id='checkboxAttr_" + itemChild.ID + "' name='home' />";
                                                if (itemChild.Image != '')
                                                    htmlContent += "<label style='cursor:pointer' for='checkboxAttr_" + itemChild.ID + "'><img src='" + itemChild.Image + "' style='height:25px;vertical-align: middle;'></label><br />";
                                                else
                                                    htmlContent += "<label style='cursor:pointer' for='checkboxAttr_" + itemChild.ID + "'>" + itemChild.Name + "</label><br />";


                                            }
                                            htmlContent += "</div>"
                                        }
                                    }
                                }
                                //console.log(count);
                                if (jsonContent != null && jsonContent.length) {

                                    divAttrAjax.show();
                                    divAttrAjax.html(htmlContent);
                                    BindDataToAttr();
                                }

                                //alert(jsonContent.length);


                            });

                            //alert("ok: " + count);
                            if (count == 0) {
                                $(".attrCheck").hide();
                            }
                            else {
                                $(".attrCheck").show();
                                //alert("ok: " + count);
                            }
                        }




                        function BindDataToAttr() {
                            var datas = '<%= Utils.CommaSQLRemove(dr["AttributesIDList"].ToString()) %>';

                            var arr = datas.split(',');
                            $.each(arr, function (index, value) {
                                var checkbox = $("#checkboxAttr_" + value);
                                if (checkbox.length) {
                                    checkbox.prop('checked', true);
                                    console.log(value.Access + '_' + value.ID);
                                }
                            });
                        }

                        function GetValueFromAttr() {
                            var list_id = "";
                            $('.checkboxAttr:checked').each(function () {
                                if (list_id != null && list_id != '')
                                    list_id += ",";
                                var checkboxValue = $(this).attr("id");
                                list_id += checkboxValue.replace("checkboxAttr_", "");
                            });
                            console.log(list_id);
                            $("#attrCheckValue").val(list_id);
                        }
                    </script>



                    <!--- Tags -->
                    <div class="form-group">
                        <div>Tags</div>
                        <div>
                            <%
                                string TagNameList = Utils.CommaSQLRemove(dr["TagNameList"].ToString());
                                TagNameList = TagNameList.Replace(",", System.Environment.NewLine);
                            %>
                            <textarea id="tag_name" style="height: 250px" name="tag_name"><%= TagNameList %></textarea>
                            <input type="text" id="tag_id" name="tagidlist" value="<%= Utils.CommaSQLRemove(dr["TagIDList"].ToString()) %>" style="display: none" />
                            <%--<input type="text" id="tag_name" name="tag_name" value="<%= Utils.CommaSQLRemove(dr["TagNameList"].ToString()) %>" style="display: none" />
                            <select id="drTag" data-idreturn="Name" multiple data-level="0" data-folder="<%= Utils.GetFolderControlAdmin() %>"></select>--%>
                        </div>
                    </div>


                    <!--- Tag Ẩn -->
                    <div class="form-group">
                        <div>Tags Ẩn</div>
                        <div>
                            <input type="text" id="hashtag_id" name="hashtagidlist" value="<%= Utils.CommaSQLRemove(dr["HashTagIDList"].ToString()) %>" style="display: none" />
                            <input type="text" id="hashtag_name" name="hashtag_name" value="<%= Utils.CommaSQLRemove(dr["HashTagNameList"].ToString()) %>" style="display: none" />

                            <select id="drHashTag" data-idreturn="Name" multiple data-level="0" data-folder="<%= Utils.GetFolderControlAdmin() %>"></select>
                        </div>
                    </div>


                    <!-- Bảo hành -->
                    <div class="form-group">
                        <div>Bảo hành </div>
                        <div>
                            <input type="text" id="warranty" name="warranty" class="warranty" value="<%= dr["Warranty"].ToString() %>" />
                        </div>
                    </div>

                    <!--- Flag -->
                    <div class="flex">
                        <div>
                            <div>Vị trí đặt</div>
                            <div>
                                <input type="checkbox" id="home" name="home" <%= Utils.SetChecked(attrProFlag.HasFlag(AttrProductFlag.Home)) %> />
                                <label for="home">Đặt lên trang chủ</label><br>
                                <input type="checkbox" id="home1" name="home1" <%= Utils.SetChecked(attrProFlag.HasFlag(AttrProductFlag.Home1)) %> />
                                <label for="home1">Đặt lên trang chủ (dưới)</label><br>
                                <input type="checkbox" id="priority" name="priority" <%= Utils.SetChecked(attrProFlag.HasFlag(AttrProductFlag.Priority))%> />
                                <label for="priority">Sản phẩm ưu tiên</label><br>
                                <input type="checkbox" id="chkNew" name="chkNew" <%= Utils.SetChecked(attrProFlag.HasFlag(AttrProductFlag.New))%> />
                                <label for="chkNew">Sản phẩm mới</label><br>
                                <input type="checkbox" id="priority1" name="priority1" <%= Utils.SetChecked(attrProFlag.HasFlag(AttrProductFlag.Priority1))%> />
                                <label for="priority1">Feed dữ liệu GG Shopping 1</label><br>
                                <input type="checkbox" id="priority2" name="priority2" <%= Utils.SetChecked(attrProFlag.HasFlag(AttrProductFlag.Priority2))%> />
                                <label for="priority2">Feed dữ liệu GG Shopping 2</label><br>
                                <input type="checkbox" id="priority3" name="priority3" <%= Utils.SetChecked(attrProFlag.HasFlag(AttrProductFlag.Priority3))%> />
                                <label for="priority3">Feed dữ liệu GG Shopping 3</label><br>
                            </div>
                        </div>
                        <div>
                            <div>Trạng thái sản phẩm</div>
                            <div>

                                <input type="hidden" id="productstatusflag" name="productstatusflag" value="<%= statusFlag.ToString() %>" />

                                <input type="radio" name="status" id="InStock" <%= Utils.SetChecked(statusFlag.HasFlag(ProductStatusFlag.InStock)) %> />
                                <label for="InStock">Còn hàng</label><br>
                                <input type="radio" name="status" id="OutStock" <%= Utils.SetChecked(statusFlag.HasFlag(ProductStatusFlag.OutStock))%> />
                                <label for="OutStock">Hết hàng</label><br>
                                <input type="radio" name="status" id="Contact" <%= Utils.SetChecked(statusFlag.HasFlag(ProductStatusFlag.Contact))%> />
                                <label for="Contact">Liên hệ</label><br>

                                <script type="text/javascript">
                                    $("input[name='status']").change(function () {
                                        if ($(this).is(":checked")) {
                                            var val = $(this).attr("id");
                                            $("#productstatusflag").val(val);
                                        }
                                    });
                                    $(document).ready(function () {
                                        if ($("#productstatusflag").val() == "None") {
                                            $("#InStock").prop("checked", true);
                                        }
                                    });

                                </script>
                            </div>
                        </div>
                        <div>
                            <div>VAT</div>
                            <div>
                                <input type="hidden" id="productvatflag" name="productvatflag" value="<%= vatFlag.ToString() %>" />

                                <input type="radio" name="vat" id="Unown" <%= Utils.SetChecked(vatFlag.HasFlag(ProductVATFlag.Unown)) %> />
                                <label for="Unown">Chưa biết</label><br>
                                <input type="radio" name="vat" id="Yes" <%= Utils.SetChecked(vatFlag.HasFlag(ProductVATFlag.Yes))%> />
                                <label for="Yes">Có</label><br>
                                <input type="radio" name="vat" id="No" <%= Utils.SetChecked(vatFlag.HasFlag(ProductVATFlag.No))%> />
                                <label for="No">Không</label><br>

                                <script type="text/javascript">
                                    $("input[name='vat']").change(function () {
                                        if ($(this).is(":checked")) {
                                            var val = $(this).attr("id");
                                            $("#productvatflag").val(val);
                                        }
                                    });
                                    $(document).ready(function () {
                                        if ($("#productvatflag").val() == "None") {
                                            $("#Unown").prop("checked", true);
                                        }
                                    });

                                </script>
                            </div>
                        </div>
                        <div>
                            <div>Ẩn</div>
                            <div>
                                <%
                                    string isHide = "";
                                    if (!string.IsNullOrEmpty(dr["Hide"].ToString()) && ConvertUtility.ToBoolean(dr["Hide"]))
                                        isHide = " checked";
                                %>
                                <input type="checkbox" name="hide" id="hide" <%= isHide %> />
                                <label for="hide">Tạm ẩn</label><br>
                            </div>
                        </div>
                    </div>







                    <!-- Thư viện ảnh -->
                    <div class="form-group">
                        <div>Thư viện ảnh </div>
                        <div>
                            <input type="text" id="gallery" name="gallery" style="display: none" value='<%= dr["Gallery"].ToString()%>' />

                            <div id="dZUpload" class="dropzone" data-folder="img">
                                <div class="dz-default dz-message">
                                    Bấm hoặc kéo ảnh vào vùng này để tải ảnh.
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div>Video sản phẩm </div>
                        <div>

                            <input type="text" id="galleryvideo1" class="videosp" style="width: 40%; float: left; margin-right: 10px" placeholder="Chèn ID Video Youtube" />
                            <input type="text" id="galleryvideo2" class="videosp" style="width: 40%; float: left" placeholder="Chèn ID Video Youtube" />
                            <input type="text" id="videogallery" name="videogallery" value='<%= dr["VideoGallery"].ToString()%>' style="display: none" />
                        </div>
                    </div>

                    <script type="text/javascript">
                        $('#galleryvideo1').on('change', function () {
                            var idyt = GetIDYoutube(this.value);
                            $(this).val(idyt);
                            VideoToJson();
                        });
                        $('#galleryvideo2').on('change', function () {
                            GetIDYoutube(this.value);
                            var idyt = GetIDYoutube(this.value);
                            $(this).val(idyt);
                            VideoToJson();
                        });

                        function GetIDYoutube(url) {
                            if (url != '') {
                                var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
                                var match = url.match(regExp);
                                return (match && match[7].length == 11) ? match[7] : false;
                            }
                            else
                                return 'false';
                        }

                        function VideoToJson() {
                            var datas = [];
                            var count = 0;
                            $('.videosp').each(function () {
                                //alert($(this).val());
                                if ($(this).val() != 'false') {

                                    count++;
                                    var data = {
                                        ID: count,
                                        IDYoutube: this.value
                                    };
                                    datas.push(data);
                                }
                            });

                            $("#videogallery").val(JSON.stringify(datas))

                            console.log(datas);
                        }

                        BindDataToVideo();

                        function BindDataToVideo() {
                            var datas = JSON.parse($("#videogallery").val());
                            console.log(datas);
                            $.each(datas, function (index, value) {

                                var textVid = $('#galleryvideo' + value.ID);
                                if (textVid.length) {
                                    textVid.val(value.IDYoutube)
                                    console.log(value.IDYoutube);
                                }
                            });
                        }


                    </script>


                    <!-- Mô tả sản phẩm -->
                    <div class="form-group">
                        <div>Mô tả ngắn </div>
                        <div>
                            <textarea name="description" id="description" rows="5" class="ckeditor"><%= dr["Description"].ToString()%></textarea>
                        </div>
                    </div>

                    <!-- Mô tả sản phẩm -->
                    <div class="form-group">
                        <div>Thông tin chi tiết </div>
                        <div>
                            <textarea name="longdescription" id="longdescription" rows="5" class="ckeditor"><%= dr["LongDescription"].ToString()%></textarea>
                        </div>
                    </div>

                    <!-- Thông số kỹ thuật -->
                    <div class="form-group">
                        <div>Thông số kỹ thuật </div>
                        <div>
                            <textarea name="tab1" id="tab1" rows="5" class="ckeditor"><%= dr["Tab1"].ToString()%></textarea>
                        </div>
                    </div>
                    <!-- Thông số kỹ thuật -->
                    <div class="form-group">
                        <div>Thông tin tiếng anh </div>
                        <div>
                            <textarea name="tab3" id="tab3" rows="5" class="ckeditor"><%= dr["Tab3"].ToString()%></textarea>
                        </div>
                    </div>
                    <!-- Quà tặng -->
                    <div class="form-group">
                        <div>Quà tặng </div>
                        <div>
                            <textarea name="gift" id="gift" rows="5" class="ckeditor"><%= dr["Gift"].ToString()%></textarea>
                        </div>
                    </div>


                    <!-- SchemaBestRating -->
                    <div class="form-group" style="display: none">
                        <div>SchemaBestRating </div>
                        <div>
                            <input type="text" id="schemabestrating" name="schemabestrating" value="100" />
                        </div>
                    </div>
                    <!-- SchemaRatingValue -->
                    <div class="form-group" style="display: none">
                        <div>SchemaRatingValue </div>
                        <div>
                            <%
                                int SchemaRatingValue = ConvertUtility.ToInt32(dr["SchemaRatingValue"]);
                                if (SchemaRatingValue == 0)
                                    SchemaRatingValue = Utils.RandomNumber(92, 100);
                            %>
                            <input type="text" id="schemaratingvalue" name="schemaratingvalue" value="<%= SchemaRatingValue %>" />
                        </div>
                    </div>
                    <!-- SchemaRatingCount -->
                    <div class="form-group" style="display: none">
                        <div>SchemaRatingCount </div>
                        <div>
                            <%
                                int SchemaRatingCount = ConvertUtility.ToInt32(dr["SchemaRatingCount"]);
                                if (SchemaRatingCount == 0)
                                    SchemaRatingCount = Utils.RandomNumber(200, 3000);
                            %>
                            <input type="text" id="schemaratingcount" name="schemaratingcount" value="<%= SchemaRatingCount %>" />
                        </div>
                    </div>

                </div>
                <div class="right">
                    <!-- MetaTitle -->
                    <div class="form-group">
                        <div>Meta Title </div>
                        <div>
                            <span class="count-char"></span>
                            <textarea id="metatitle" name="metatitle"><%= dr["MetaTitle"].ToString()%></textarea>
                        </div>
                    </div>
                    <!-- MetaKeyword -->
                    <div class="form-group">
                        <div>Meta Keyword </div>
                        <div>
                            <span class="count-char"></span>
                            <%
                                string MetaKeyword = Utils.CommaSQLRemove(dr["MetaKeyword"].ToString());
                                MetaKeyword = MetaKeyword.Replace(",", System.Environment.NewLine);
                            %>
                            <textarea id="metakeyword" name="metakeyword"><%= MetaKeyword %></textarea>
                        </div>
                    </div>
                    <!-- MetaDescription -->
                    <div class="form-group">
                        <div>Meta Description </div>
                        <div>
                            <span class="count-char"></span>
                            <textarea id="metadescription" name="metadescription"><%= dr["MetaDescription"].ToString()%></textarea>
                        </div>
                    </div>

                    <div class="google-demo">
                        <p>
                            <img src="/admin/images/google-logo.png" />
                        </p>
                        <p class="title">Mô phỏng Website của bạn khi xuất hiện trên Google</p>
                        <p class="description">Lưu ý đây chỉ là mô phỏng website xuất hiện trên Google, để lên thực sự thì cần rất nhiều yếu tố khác</p>
                    </div>

                    <div class="form-group">
                        <div>Canonical </div>
                        <div>
                            <input type="text" id="canonical" name="canonical" value="<%= dr["Canonical"].ToString()%>" />
                        </div>
                    </div>
                    <div style="margin-top: 10px">
                       <%-- <input type="checkbox" name="index" id="Index" <%= Utils.SetChecked(seoFlag.HasFlag(SeoFlag.Index)) %> />
                        <label for="Index">Index</label><br>--%>
                        <input type="checkbox" name="nofollow" id="Nofollow" <%= Utils.SetChecked(seoFlag.HasFlag(SeoFlag.Nofollow)) %> />
                        <label for="Nofollow">Nofollow</label><br>
                        <input type="checkbox" name="noindex" id="NoIndex" <%= Utils.SetChecked(seoFlag.HasFlag(SeoFlag.NoIndex)) %> />
                        <label for="NoIndex">NoIndex</label><br>
                    </div>


                    <div class="form-group image-ck">
                        <div>Ảnh không có Watermark </div>
                        <div data-thumb="thumbnail_image_1" data-inputtext="image_1" data-folder="img_no_watermark">
                            <a href="javascript:;" class="get_ck">
                                <img src="<%= img_no_watermark %>" id="thumbnail_image_1" alt="Chọn ảnh" />
                            </a>
                            <input type="text" id="image_1" name="image_1" class="image_1" value="<%= dr["Image"].ToString()%>" />
                        </div>
                    </div>




                    <div class="priceHistory">

                        <%
                            DataTable dtPriceHistory = SqlHelper.SQLToDataTable("tblPriceHistory", "", "ProductID=" + dr["ID"].ToString());
                            if (Utils.CheckExist_DataTable(dtPriceHistory))
                            {
                        %>

                        <table>
                            <thead>
                                <tr>
                                    <th colspan="3"><i class="fad fa-history"></i>&nbsp;Lịch sử giá
                                    </th>
                                </tr>
                                <tr>
                                    <th>Giá</th>
                                    <th>Admin</th>
                                    <th>Ngày</th>
                                </tr>
                            </thead>


                            <%
                                foreach (DataRow drPriceHistory in dtPriceHistory.Rows)
                                {
                                    string User = "";
                                    DataTable dtUser = SqlHelper.SQLToDataTable("tblAdminUser", "", "ID=" + drPriceHistory["CreatedBy"].ToString());
                                    if (Utils.CheckExist_DataTable(dtPriceHistory))
                                        User = dtUser.Rows[0]["Name"].ToString();

                            %>
                            <tr>
                                <td>
                                    <%= string.Format("{0:N0} {1}", ConvertUtility.ToDecimal(drPriceHistory["Price"].ToString()), "VNĐ") %>
                                </td>
                                <td>
                                    <%= User %>
                                </td>
                                <td>
                                    <%= drPriceHistory["CreatedDate"].ToString() %></td>
                            </tr>

                            <%
                                }
                            %>
                        </table>
                        <%
                            }
                        %>
                    </div>
                </div>

                <!--- Submit Button -->
                <div class="clear"></div>
                <div class="form-group submit">
                    <div>&nbsp;</div>
                    <div>

                        <% if (IsUpdate)
                            { %>
                        <button type="submit" data-value="save" class="btnSubmit btnSave"><i class="fas fa-save"></i>Lưu</button>
                        <button type="submit" data-value="saveandadd" class="btnSubmit btnSaveAndAdd"><i class="fas fa-save"></i>Lưu và Thêm</button>
                        <button type="submit" data-value="saveandback" class="btnSubmit btnSaveAndBack"><i class="fas fa-save"></i>Lưu và Quay Lại</button>
                        <button type="submit" data-value="saveandcopy" class="btnSubmit btnSaveAndCopy"><i class="fas fa-copy"></i>Lưu và Sao Chép</button>
                        <button type="submit" data-value="delete" class="btnSubmit validate btnDelete"><i class="fas fa-trash-alt"></i>Xoá</button>
                        <button type="submit" data-value="view" class="btnSubmit btnView"><i class="fas fa-eye"></i>Xem thử</button>

                        <%}
                            else
                            { %>
                        <button type="submit" data-value="saveandadd" class="btnSubmit btnAddAndAdd"><i class="fas fa-plus"></i>Thêm</button>
                        <button type="submit" data-value="saveandback" class="btnSubmit btnAddAndBack"><i class="fas fa-plus"></i>Thêm và Quay Lại</button>
                        <button type="submit" data-value="saveandcopy" class="btnSubmit btnAddAndCopy"><i class="fas fa-copy"></i>Thêm và Sao Chép</button>
                        <% } %>

                        <button type="submit" data-value="cancel" class="btnSubmit validate btnCancel"><i class="fas fa-share"></i>Bỏ Qua</button>
                        <input type="hidden" id="done" name="done" value="0" />


                        <script type="text/javascript">
                            $(".btnSubmit").click(function () {
                                //var myDropzone = Dropzone.forElement(".dropzone");
                                //myDropzone.processQueue();

                                var dataValue = $(this).attr("data-value");
                                if (dataValue == "delete")
                                    DeleteByID('<%= dr["ID"].ToString() %>', '<%= table %>', '<%= ControlAdminInfo.ShortName %>');

                                if ($(this).hasClass("validate") || ValidateForm()) {
                                    $('#frm_edit #done').val(dataValue);
                                    $(this).attr('disabled', 'disabled');
                                    $(this).html('Loading...');
                                    $("#frm_edit").submit();
                                }
                                else {
                                    return false;
                                }
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
