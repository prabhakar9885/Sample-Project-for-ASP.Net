using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


//Source: http://aspalliance.com/1922_PageMethods_In_ASPNET_AJAX.1
namespace PracticeSiteForASPDotNet.WorkingDir.AjaxPageMethods
{
    public partial class AjaxPageMethod_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session["time"] = DateTime.Now;
            HttpContext.Current.Application["time"] = DateTime.Now;
            //HttpContext.Current.Cache["key"] = DateTime.Now;
        }

        [System.Web.Services.WebMethod]
        public static string GetData(string name, int age)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Hello "+ name+" (Age: "+age+") \n");

            sb.Append("Time diff(Session): " +
                ((DateTime)HttpContext.Current.Session["time"]).Subtract(DateTime.Now) + "\n");
            sb.Append("Time diff(App): "+ 
                ((DateTime)HttpContext.Current.Application["time"]).Subtract(DateTime.Now)+"\n");

            return sb.ToString();
        }
    }
}