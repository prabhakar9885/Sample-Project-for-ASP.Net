using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

public partial class TelerikWebForm : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadTextBox1_TextChanged(object sender, EventArgs e)
    {
        RadDatePicker1.MinDate = DateTime.Now.AddDays(-2);
        RadDatePicker1.MaxDate = DateTime.Now.AddDays(double.Parse(RadTextBox1.Text.Trim()));
        RadDatePicker1.DataBind();
    }
}
