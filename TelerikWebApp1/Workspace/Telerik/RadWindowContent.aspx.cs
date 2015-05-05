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

public partial class RadWindowContent : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EnameTextBox.Text = Request.QueryString["ename"].ToString();
        JobTextBox.Text = Request.QueryString["job"].ToString();
        SalaryTextBox.Text = Request.QueryString["salary"].ToString();
        ManagerNameTextBox.Text = Request.QueryString["manager"].ToString();
    }
}
