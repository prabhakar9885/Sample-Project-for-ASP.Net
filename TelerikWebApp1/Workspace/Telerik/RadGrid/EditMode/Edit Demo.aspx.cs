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
using TelerikWebApp1.DataAccessRef;

public partial class Edit_Demo : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccessServiceClient client = new DataAccessServiceClient();
        RadGrid1.DataSource = client.GetEmployeeData(8).Employees;
        RadGrid1.DataBind();
    }

    protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
        }
        else
        {
            string NameOld = e.Item.SavedOldValues["Name"].ToString();
            string NameNew = e.Item.GetDataKeyValue("Name").ToString();
        }
    }

    protected void RadGrid1_ItemUpdated(object source, GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
        }
        else
        {
            string NameOld = e.Item.SavedOldValues["Name"].ToString();
            string NameNew = e.Item.GetDataKeyValue("Name").ToString();
        }
    }
}
