<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChuyenDuLieuMayVeSinh.aspx.cs" Inherits="Tool_ChuyenDuLieuMayVeSinh" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="btnCategory" runat="server" Text="1. Category" OnClick="btnCategory_Click" />
        <asp:Button ID="Button1" runat="server" Text="2. Product" OnClick="btnProduct_Click" />
        <asp:Button ID="Button2" runat="server" OnClick="btnArticle_Click" OnClientClick="btnArticle_Click" Text="3. Article" />
        <asp:Button ID="Button3" runat="server" OnClick="ProductPrice_Click" Text="4. Product Price" />
        <asp:Button ID="btnTagCloud" runat="server" OnClick="btnTagCloud_Click" Text="5. TagCloud" />
        <asp:Button ID="btnArticleHide" runat="server" OnClick="btnArticleHide_Click" Text="5. Article Hide" />
    </form>
</body>
</html>
