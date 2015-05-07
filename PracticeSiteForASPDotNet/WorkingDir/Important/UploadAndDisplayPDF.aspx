<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadAndDisplayPDF.aspx.cs" Inherits="PracticeSiteForASPDotNet.WorkingDir.Important.DisplayPDF" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" /><br />
    <asp:Button ID="LoadPDF" runat="server" Text="Load PDF" OnClick="LoadPDF_Click" /><br />
    <asp:Button ID="ShowOutline" runat="server" Text="Show Outline" 
        onclick="ShowOutline_Click" /><br />
    <div style="margin: 5px;" id="Outline" runat="server">
        <div id="placeholder" runat="server">
        </div>
        <iframe id="IFrame" runat="server" src="/WorkingDir/Uploads/Flipkart.pdf">
        </iframe>
    </div>
    </form>
</body>
</html>
