<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryList.ascx.cs" Inherits="admin_Controls_CategoryList" %>
<div class="obj-list">
    <div class="filter">
        <a class="button" id="refresh" href="javascript:;"><i class="fas fa-sync-alt"></i>Refresh</a>
        <a class="button" id="delete" href="javascript:;"><i class="fas fa-trash-alt"></i>Xóa</a>
        <a class="button" href="<%= Utils.GetEditControl() %>"><i class="fas fa-plus"></i>Thêm <%= ControlAdminInfo.ShortName %></a>
       <%-- <input type="text" id="attr_c_id" name="attributeconfigidlist" value="" style="display: none" />
        <input type="text" id="attr_c_name" value="" style="display: none" />--%>
        <select id="drAttrC_List" multiple data-level="1" data-folder="<%= Utils.GetFolderControlAdmin() %>"></select>
        <input type="hidden" id="table" value="<%= ControlAdminInfo.SQLNameTable %>" />
        <input type="hidden" id="field" value='<%= ControlAdminInfo.FieldSql %>' />
        <input type="hidden" id="fromDate" />
        <input type="hidden" id="toDate" />
        <input type="hidden" id="pageIndex" />
        <input type="hidden" id="loadpaging" value="true" />
        <input type="hidden" id="pageSize" value="<%= C.PAGING_ADMIN %>" />
        <input type="hidden" id="control" value="<%= Utils.GetControlAdmin() %>" />
        <input type="hidden" id="folder" value="<%= Utils.GetFolderControlAdmin() %>" />
        <input type="hidden" id="controlName" value="<%= ControlAdminInfo.ShortName %>" />
        <input type="hidden" id="sort" />
        <input type="hidden" id="fieldSort" />
        <input type="hidden" id="PositionMenuFlag" value="1" />
        <select id="flags">
            <option value="<%= (int)PositionMenuFlag.None %>">Tất cả vị trí</option>
            <option value="<%= (int)PositionMenuFlag.Main %>" selected>Menu chính</option>
            <option value="<%= (int)PositionMenuFlag.Top %>">Menu trên</option>
            <option value="<%= (int)PositionMenuFlag.Bottom %>">Menu dưới</option>
            <option value="<%= (int)PositionMenuFlag.MenuSub %>">Menu Sub</option>
            <option value="<%= (int)PositionMenuFlag.MenuSubMainHome %>">Menu Sub Home 1 </option>
            <option value="<%= (int)PositionMenuFlag.MenuSubMainHome2 %>">Menu Sub Home 2</option>
        </select>
        <div class="div_checkbox">
            <input type="checkbox" id="level" />
            <label for="level">Phân cấp</label>
            <input type="checkbox" id="hide" />
            <label for="hide">Đang ẩn</label>
        </div>
    </div>
    <div class="content-list">
        <div class="tableData">
        </div>
    </div>
    <div class="clear"></div>
    <div id="paging"></div>
</div>

<script type="text/javascript">
    $("select#flags").change(function () {
        $("#PositionMenuFlag").val($(this).val());
        getval(0);
    });
</script>
