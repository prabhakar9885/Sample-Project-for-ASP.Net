<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxPageMethod_2.aspx.cs"
    Inherits="PracticeSiteForASPDotNet.WorkingDir.AjaxPageMethods.AjaxPageMethod_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.1.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        //CallBack method when the page call succeeds
        function onSucceed(results, currentContext, methodName) {
            var res = results + "\n";
            res += methodName + "\n" + currentContext;
            alert(res);
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
            var context= 10;
            PageMethods.GetData("Prabhu", 25, onSucceed, onError, context);
            return false;
        }   
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Call Page Methods" OnClientClick="return fun()" />
    <div>
    </div>

    <%--START: Required to Enable the access to 'PageMethods' object from Javascript--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
    </asp:ScriptManager>
    <%--END: Required to Enable the access to 'PageMethods' object from Javascript--%>

    </form>
</body>
</html>
