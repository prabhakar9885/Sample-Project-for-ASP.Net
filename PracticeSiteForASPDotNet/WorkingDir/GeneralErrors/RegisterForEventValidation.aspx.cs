using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeSiteForASPDotNet.WorkingDir.GeneralErrors
{
    public partial class RegisterForEventValidation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string msg;
            if (IsPostBack)
                msg = Request.Form[dd.UniqueID];
            else
                msg = dd.SelectedValue;
            Msg.Text = "Got the value: " + msg;
        }

        protected override void Render(HtmlTextWriter writer)
        {
            Page.ClientScript.RegisterForEventValidation(dd.UniqueID, "3");
            Page.ClientScript.RegisterForEventValidation(dd.UniqueID, "4");
            Page.ClientScript.RegisterForEventValidation(dd.UniqueID, "11");
            // and so on
            base.Render(writer);
        }
    }
}