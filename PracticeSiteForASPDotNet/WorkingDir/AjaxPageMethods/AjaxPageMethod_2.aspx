<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxPageMethod_2.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.AjaxPageMethods.AjaxPageMethod_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.1.3.js" type="text/javascript"></script>
    <script type="text/javascript">

        var context = {
            'fun': 0,
            'GetEmpInfo': 1
        };

        //CallBack method when the page call succeeds
        function onSucceed(results, currentContext, methodName) {
            var res = "";
            switch (currentContext) {
                case context.fun:
                    res = results + "</br>";
                    res += methodName + "</br>" + currentContext;
                    break;
                case context.GetEmpInfo:
                    results = JSON.parse(results);
                    res = "<b>Id: </b>" + results.Id + "</br>";
                    res += "<b>Name: </b>" + results.Name + "</br>";
                    break;
                default:
            }
            $("#div").html(res);
        }

        //CallBack method when the page call fails due to interna, server error
        function onError(results, currentContext, methodName) {
            var s = '';
            s += results.get_exceptionType();
            s += results.get_mesage();
            s += results.get_stackTrace();
            s += results.get_statusCode();
            s += results.get_timedOut();
            $("#div").text(s);
        }

        function fun() {

            PageMethods.GetData("Prabhu", 25, onSucceed, onError, context.fun);
            return false; // to avoid Postback
        }

        function GetEmpInfo() {

            PageMethods.GetEmpInfo(onSucceed, onError, context.GetEmpInfo);
            return false; // to avoid Postback
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <fieldset style="width: 40%;">
        <legend>Ajax calls </legend>
        <asp:Button ID="Button1" runat="server" Text="Call Page Methods" OnClientClick="return fun()" />
        <asp:Button ID="GetEmp" runat="server" Text="Get Employee Info" OnClientClick="return GetEmpInfo()" />
        <br />
        <fieldset>
            <legend>Output</legend>
            <div id="div">
            </div>
        </fieldset>
    </fieldset>
    <%--START: Required to Enable the access to 'PageMethods' object from Javascript--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
    </asp:ScriptManager>
    <%--END: Required to Enable the access to 'PageMethods' object from Javascript--%>
    </form>
</body>
</html>
