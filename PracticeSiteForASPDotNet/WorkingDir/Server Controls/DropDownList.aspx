<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropDownList.aspx.cs" Inherits="PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer.DataList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <style type="text/css">
        select, select > option
        {
            background: Green;
        }
    </style>
    <%--  <script type="text/javascript">
        $(function () {
            function GetData() {
                alert("Getting...");
            }
            $('#button').on('click', GetData());
        });
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input type="button" id="GetData" value="Get Data" />
        <br />
        <br />
        <asp:DropDownList ID="DropDownListSql" runat="server" OnSelectedIndexChanged="SelectedNewIndex" AutoPostBack="true">
        </asp:DropDownList>
    </div>
    <div>
        <asp:DropDownList ID="DropDownListOutput" runat="server">
        </asp:DropDownList>
    </div>
    </form>
</body>
</html>
