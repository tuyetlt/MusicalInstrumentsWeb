<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManufacturerUpdate.ascx.cs" Inherits="admin_Controls_home_manufacturer_ManufacturerUpdate" %>
<div class="obj-edit">
    <form method="post" enctype="multipart/form-data" id="frm_edit">
        <input type="hidden" name="id" value="<%= dr["ID"].ToString() %>" />
        <div class="container">
            <div class="edit">
                <div class="full">
                    <div class="form-group">
                        <div>Tên </div>
                        <div>
                            <input type="text" id="name" name="name" value="<%= dr["Name"].ToString()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div>Link </div>
                        <div>
                            <input type="text" id="link" name="link" value="<%= dr["Link"].ToString()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div>Alternate Text</div>
                        <div>
                            <input type="text" id="alt" name="alt" value="<%= dr["Alt"].ToString()%>" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div>Sắp xếp </div>
                        <div>
                            <input type="text" id="sort" name="sort" value="<%= dr["Sort"].ToString()%>" />
                        </div>
                    </div>
                    <div class="form-group image-ck">
                        <div>Hình ảnh</div>
                        <div data-thumb="thumbnail_image_1" data-inputtext="image_1" data-folder="<%= Utils.GetFolderControlAdmin() %>">
                            <a href="javascript:;" class="get_ck">
                                <img src="<%= image_1 %>" id="thumbnail_image_1" alt="Chọn ảnh" />
                            </a>
                            <input type="text" id="image_1" name="image_1" value="<%= dr["Image_1"].ToString()%>" />
                        </div>
                    </div>

                     <div class="form-group">
                        <div>&nbsp;</div>
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
    </form>
</div>
