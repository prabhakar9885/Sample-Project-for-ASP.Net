<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JQuery AutoComplete.aspx.cs" Inherits="PracticeSiteForASPDotNet.WorkingDir.AjaxPageMethods.JQuery_AutoComplete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>jQuery AutoComplete with Highlight Search Term using Asp.net</title>
    <link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            var items;

            $("#txtAutoComplete").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "JQuery AutoComplete.aspx/GetEmps",
                        data: "{'term':'" + $("#txtAutoComplete").val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                items = data.d;
                                return {
                                    value: item
                                }
                            }))
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    })
                },
                select: function (event, ui) {
                    debugger;
                    if ($.inArray(ui.item.label, items) == -1) {
                        $("#Msg").css("display", "inline");
                    }
                }
            });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="text" id="txtAutoComplete" />
            <label id="Msg" style="display:none;">Emmployee not found</label>
        </div>
    </form>
</body>
</html>