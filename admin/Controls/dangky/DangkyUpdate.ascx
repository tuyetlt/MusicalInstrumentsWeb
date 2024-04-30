<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DangkyUpdate.ascx.cs" Inherits="admin_Controls_dangky_DangkyUpdate" %>
<%@ Import Namespace="Ebis.Utilities" %>
<%@ Import Namespace="System.Data" %>

<div class="obj-edit">
    <form method="post" enctype="multipart/form-data" id="frm_edit">
        <input type="hidden" name="id" value="<%= dr["ID"].ToString()%>" />
        <input type="hidden" name="token" value="<%= dr["Token"].ToString()%>" />


        <div class="container">
            <div class="edit">
                <div class="full">
                    <img src="<%= qrImage %>" style="width:300px" />
                    <!-- Name -->
                    <div class="form-group">
                        <div>Họ và tên </div>
                        <div>
                            <input type="text" id="name" name="name" value="<%= dr["Name"].ToString()%>"  />
                        </div>
                    </div>
                    <!-- GioiTinh -->
                    <div class="form-group">
                        <div>Giới tính </div>
                        <div>
                            <%
                                string isNam = "", isNu = "";
                                if (!string.IsNullOrEmpty(dr["GioiTinh"].ToString()) && ConvertUtility.ToBoolean(dr["GioiTinh"]))
                                {
                                    isNam = "checked";
                                }
                                else
                                {
                                    isNu = "checked";
                                    isNam = "";
                                }
                            %>

                            <input type="radio" id="nam" name="sex" <%= isNam %> />
                            <label for="nam">Nam</label>
                            <input type="radio" id="nu" name="sex" <%= isNu %> />
                            <label for="nam">Nữ</label>

                            <input type="hidden" id="gioitinh" name="gioitinh" value="<%= dr["GioiTinh"].ToString()%>" />


                            <script type="text/javascript">
                                $("input[name='sex']").change(function () {
                                    if ($(this).is(":checked")) {
                                        var val = $(this).attr("id");
                                        $("#gioitinh").val(val);
                                    }
                                });

                            </script>


                        </div>
                    </div>
                    <!-- DienThoai -->
                    <div class="form-group">
                        <div>Điện thoại </div>
                        <div>
                            <input type="text" id="dienthoai" name="dienthoai" value="<%= dr["DienThoai"].ToString()%>"  />
                        </div>
                    </div>
                    <!-- Zalo -->
                    <div class="form-group">
                        <div>Số điện thoại Zalo </div>
                        <div>
                            <input type="text" id="zalo" name="zalo" value="<%= dr["Zalo"].ToString()%>"  />
                        </div>
                    </div>
                    <!-- Email -->
                    <div class="form-group">
                        <div>Email </div>
                        <div>
                            <input type="text" id="email" name="email" value="<%= dr["Email"].ToString()%>"  />
                        </div>
                    </div>
                    <!-- Facebook -->
                    <div class="form-group">
                        <div>Tên/Link Facebook cá nhân </div>
                        <div>
                            <input type="text" id="facebook" name="facebook" value="<%= dr["Facebook"].ToString()%>"  />
                        </div>
                    </div>
                    <!-- DonVi -->
                    <div class="form-group">
                        <div>Đơn vị công tác </div>
                        <div>
                            <input type="text" id="donvi" name="donvi" value="<%= dr["DonVi"].ToString()%>"  />
                        </div>
                    </div>
                    <!-- SoNguoi -->
                    <div class="form-group">
                        <div>Số người tham dự </div>
                        <div>
                            <input type="text" id="songuoi" name="songuoi" value="<%= dr["SoNguoi"].ToString()%>" style="width: 50px" />
                        </div>
                    </div>
                    <!-- TaiTro -->
                    <div class="form-group">
                        <div>Dành cho Doanh nghiệp hợp tác Tài trợ</div>
                        <div>
                            <input type="text" id="taitro" name="taitro" value="<%= dr["TaiTro"].ToString()%>"  />
                        </div>
                    </div>
                    <!-- LuuY -->
                    <div class="form-group">
                        <div>Bạn có lưu ý gì dành cho BTC </div>
                        <div>
                            <input type="text" id="luuy" name="luuy" value="<%= dr["LuuY"].ToString()%>"  />
                        </div>
                    </div>
                    <!-- ChuyenKhoan -->
                    <div class="form-group">
                        <div>Chuyển khoản </div>
                        <div>
                            <%
                                string isChuyenKhoan = "";
                                if (!string.IsNullOrEmpty(dr["ChuyenKhoan"].ToString()) && ConvertUtility.ToBoolean(dr["ChuyenKhoan"]))
                                    isChuyenKhoan = " checked";
                            %>
                            <input type="checkbox" name="chuyenkhoan" id="chuyenkhoan" <%= isChuyenKhoan %> />
                            <label for="chuyenkhoan">Đã chuyển khoản</label><br>
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
                                <button type="submit" data-value="delete" class="btnSubmit btnDelete"><i class="fas fa-trash-alt"></i>Xoá</button>
                                <%}
                                    else
                                    { %>
                                <button type="submit" data-value="saveandadd" class="btnSubmit btnAddAndAdd"><i class="fas fa-plus"></i>Thêm</button>
                                <button type="submit" data-value="saveandback" class="btnSubmit btnAddAndBack"><i class="fas fa-plus"></i>Thêm và Quay Lại</button>
                                <button type="submit" data-value="saveandcopy" class="btnSubmit btnAddAndCopy"><i class="fas fa-copy"></i>Thêm và Sao Chép</button>
                                <% } %>

                                <button type="submit" data-value="cancel" class="btnSubmit btnCancel"><i class="fas fa-share"></i>Bỏ Qua</button>


                                <input type="hidden" id="done" name="done" value="0" />

                                <script type="text/javascript">
                                    $(".btnSubmit").click(function () {
                                        var dataValue = $(this).attr("data-value");
                                        if (dataValue == "delete")
                                            DeleteByID('<%= dr["ID"].ToString() %>', '<%= table %>', '<%= ControlAdminInfo.ShortName %>');
                                    $('#frm_edit #done').val(dataValue);
                                    $(this).attr('disabled', 'disabled');
                                    $(this).html('Loading...');
                                    $("#frm_edit").submit();
                                });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
