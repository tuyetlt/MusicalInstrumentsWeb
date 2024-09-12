<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testemail.aspx.cs" Inherits="Tool_testemail" %>

<%@ Register Src="~/Controls/WidgetMenu.ascx" TagPrefix="uc1" TagName="WidgetMenu" %>

<uc1:WidgetMenu runat="server" ID="WidgetMenu" />
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="600px">
                <tr>
                    <td colspan="2">
                        <asp:Label runat="server" ID="lblInfo" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>SMTP_SERVER
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="SMTP_SERVER" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>SMTP_USERNAME
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="SMTP_USERNAME" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>SMTP_SENDER
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="SMTP_SENDER" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>SMTP_PORT
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="SMTP_PORT" Width="300px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>SMTP_PASSWORD
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="SMTP_PASSWORD" Width="300px"></asp:TextBox>
                    </td>
                </tr>

  <tr>
                    <td>SMTP_TO
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="SMTP_TO" Width="300px"></asp:TextBox>
                    </td>
                </tr>


                <tr>
                    <td colspan="2" align="center">
                        <asp:Button runat="server" ID="btnSend" Text="Gửi" OnClick="btnSend_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
