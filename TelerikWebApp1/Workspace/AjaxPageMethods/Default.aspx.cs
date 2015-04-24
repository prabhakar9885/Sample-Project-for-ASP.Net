using System;
using System.Web.Services;


// http://encosia.com/using-jquery-to-directly-call-aspnet-ajax-page-methods/
public partial class _Default : System.Web.UI.Page
{
  [WebMethod(EnableSession=false)]
  public static string HelloWorld()
  {
    return "Hello: " + DateTime.Now.Millisecond;
  }
}