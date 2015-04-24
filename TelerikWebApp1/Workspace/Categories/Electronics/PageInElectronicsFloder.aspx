<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageInElectronicsFloder.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.Categories.Electronics.PageInElectronicsFloder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownListSql" runat="server">
        </asp:DropDownList>
    </div>
    <div>
        <asp:DropDownList ID="CountriesDropDownlist" runat="server">
        </asp:DropDownList>
    </div>
    <asp:CheckBoxList ID="CheckBoxList1" runat="server">
        <asp:ListItem Value="1" Text="India"></asp:ListItem>
    </asp:CheckBoxList>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        <asp:ListItem Value="1" Text="India"></asp:ListItem>
    </asp:RadioButtonList>
    <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
        <asp:ListItem Value="1" Text="India"></asp:ListItem>
    </asp:ListBox>
    <asp:BulletedList ID="BulletedList1" runat="server">
        <asp:ListItem Value="1" Text="India"></asp:ListItem>
    </asp:BulletedList>
    </form>
</body>
</html>
