<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer.FileUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>
    <asp:Button ID="UploadButton" runat="server" Text="Upload" onclick="Button1_Click" />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
</body>
</html>
