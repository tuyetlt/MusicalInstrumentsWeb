<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sitemap.aspx.cs" Inherits="Tool_Sitemap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
       <form id="form1" runat="server">
   <table cellspacing="0" cellpadding="5" border="0" width="100%">
    <tr>
        <td bgcolor="#18affe" colspan="2">
            <div class="font_title">
                <span>Cập nhật Sitemap cho các bộ máy tìm kiếm</span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <font color="red">
                <asp:Label runat="server" ID="lblInfo"></asp:Label></font>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnGen" runat="server" Text="Cập nhật Sitemap" OnClick="btnGen_Click" />
            <asp:Literal ID="ltr" runat="server"></asp:Literal>
        </td>
    </tr>
</table>

    </form>

</body>
</html>
