<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxPageMethod.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer.AjaxPageMethod" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-1.11.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#b').click(function () {
                //                $.ajax({
                //                    type: "POST",
                //                    url: "Default.aspx/HelloWorld",
                //                    data: "{}",
                //                    contentType: "application/json",
                //                    dataType: "json",
                //                    success: function (msg) {
                //                        // Replace the div's content with the page method's return.
                //                        $("#div1").text(msg.d);
                //                    }
                //                });
                //            });
                $("#b").click(function () {
                    $.ajax({
                        type: "POST",
                        url: "AjaxPageMethod.aspx/GetData",
                        data: "{}",
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
