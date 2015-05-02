using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer
{
    public partial class Buttons : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButtonClicked(object sender, EventArgs e)
        {
            StatusLabel.InnerText = "Link button is clicked";
        }
    }
}