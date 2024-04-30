<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DirectLinkUpdate.ascx.cs" Inherits="admin_Controls_directLink_DirectLinkUpdate" %>
<%@ Import Namespace="Ebis.Utilities" %>
<%@ Import Namespace="System.Data" %>
<div class="obj-edit">
    <form method="post" enctype="multipart/form-data" id="frm_edit">
        <input type="hidden" name="id" value="<%= dr["ID"].ToString() %>" />
        <div class="container">
            <div class="edit">
                <div class="left">
                    <!-- Name -->
                    <div class="form-group">
                        <div>Link cũ </div>
                        <div>
                            <input type="text" id="name" name="name" value="<%= dr["Name"].ToString()%>" />
                        </div>
                    </div>
                    <!-- LinkNew -->
                    <div class="form-group">
                        <div>Link mới </div>
                        <div>
                            <input type="text" id="linknew" name="linknew" value="<%= dr["LinkNew"].ToString()%>" />
                        </div>
                    </div>
                    <!-- Type -->
                    <div class="form-group">
                        <div>Kiểu chuyển Link </div>
                        <div>

                            <% List<Tuple<string, string>> listDirectType = new List<Tuple<string, string>>();
                                listDirectType.Add(new Tuple<string, string>("301", "301 Moved Permanently"));
                                listDirectType.Add(new Tuple<string, string>("302", "302 Redirect (Moved temporarily)"));
                                listDirectType.Add(new Tuple<string, string>("303", "Mã 303 (See Other Location)"));
                                listDirectType.Add(new Tuple<string, string>("304", "Mã 304 (Not Modified)"));
                                listDirectType.Add(new Tuple<string, string>("305", "Mã 305 (Use proxy)"));
                                listDirectType.Add(new Tuple<string, string>("307", "Mã 307 (Temporary Redirect)"));
                            %>
                            <select id="type" name="type" style="width: 300px">
                                <%
                                    foreach (Tuple<string, string> tuple in listDirectType)
                                    {
                                        string selected = "";
                                        if (tuple.Item1 == dr["Type"].ToString())
                                            selected = "selected";
                                        Response.Write(string.Format(@"<option value=""{0}"" {1}>{2}</option>", tuple.Item1, selected, tuple.Item2));
                                    }
                                %>
                            </select>




                        </div>
                    </div>
                </div>
                <div class="right">
                    <div style="color:#333333">
                        <h3>Ghi chú</h3>
                        <p>
                            <strong>301 Redirect (Moved permanently)</strong>&nbsp;là một mã trạng thái HTTP ( response code HTTP)&nbsp;để thông báo rằng các trang web hoặc URL đã&nbsp;chuyển hướng vĩnh viễn&nbsp;sang một trang web hoặc URL khác, có nghĩa là tất cả những giá trị của trang web hoặc URL gốc sẽ chuyển hết sang URL mới.
                        </p>
                        <p>
                            <strong>302 Redirect (Moved temporarily)</strong>&nbsp;là một mã trạng thái HTTP ( response code HTTP) thể thông báo rằng trang web hoặc URL đã&nbsp;chuyển hướng tạm thời sang địa chỉ mới nhưng vẫn phải dựa trên URL cũ. Vì một lý do nào đó, ví dụ như bảo trì trang web chính.
                        </p>
                        <p>
                            <strong>Mã 303 (See Other Location):</strong>&nbsp;Mã phản hồi này xuất hiện khi người dùng gửi&nbsp;yêu cầu truy cập cho một vị trí khác. Máy chủ sẽ chuyển yêu cầu truy cập đến vị trí đó.
                        </p>
                        <p>
                            <strong>Mã 304 (Not Modified):</strong>&nbsp;Mã phản hồi này cho biết&nbsp;không cần truyền lại các tài nguyên được yêu cầu. Đây là một loại&nbsp;chuyển hướng ngầm&nbsp;đến các tài nguyên được lưu trữ
                        </p>
                        <p>
                            <strong>Mã 305 (Use proxy):</strong>&nbsp;Tài nguyên mà bạn yêu cầu truy cập chỉ có thể truy cập được khi có&nbsp;sử dụng máy chủ proxy.
                        </p>
                        <p>
                            <strong>Mã 307 (Temporary Redirect):</strong>&nbsp;Mã phản hồi này được xem như&nbsp;gần giống với mã 302,&nbsp;nhưng chuyển hướng 307 thường được dùng trong trường hợp&nbsp;nâng cấp source hoặc trang web gặp sự cố,&nbsp;người dung nên tiếp tục truy cập địa chỉ này trong tương lai.
                        </p>

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
    </form>
</div>
