<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MvvmObservable.aspx.cs"
    Inherits="TelerikWebApp1.Workspace.Kendo.Demos.MvvmObservable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Styles/kendo.common.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/kendo.default.min.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-2.1.3.js" type="text/javascript"></script>
    <script src="../Scripts/kendo.web.min.js" type="text/javascript"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <input data-bind="value: make" data-value-update="keyup" /><br />
        <span data-bind="visible: messageIsVisible">You have entered:
            <label data-bind="text: make">
            </label>
        </span><br />
        <input type="button" data-bind="click: showMessage" value="Show Message" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var viewModel = kendo.observable({
                make: "Ferrari",
                messageIsVisible: function () {
                    return this.get("make").length != 0;
                },
                showMessage: function () {
                    var text = this.get("make");
                    alert("The user data is: " + text);
                }
            });

            kendo.bind($("#container"), viewModel);
        });
    </script>
    </form>
</body>
</html>
