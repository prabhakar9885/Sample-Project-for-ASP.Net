﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxPageMethod_1.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer.AjaxPageMethod" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../../Scripts/jquery-2.1.3.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#b').click(function () {
                $("#b").click(function () {
                    $.ajax({
                        type: "POST",
                        url: "AjaxPageMethod.aspx/GetData",
                        data: "{'name': 'Prabhu', 'age' : 25}",
                        contentType: "application/json",
                        dataType: "json",
                        success: function (msg) {
                            $("#div1").text(msg.d);
                        }
                    });
                });
            });
        });
    </script>
</head>
<body>
    <%--<form id="form1" runat="server">--%>
    <input type="button" id="b" />
    <div id="div1">
    </div>
    <%--</form>--%>
</body>
</html>
