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

public partial class LoadingPannelClientSide : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadComboBox1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
    {

        System.Threading.Thread.Sleep(1500);
        SqlDataSource2.SelectParameters["ProductID"].DefaultValue = RadComboBox1.SelectedValue;
        RadGrid1.Rebind();
    }
}
