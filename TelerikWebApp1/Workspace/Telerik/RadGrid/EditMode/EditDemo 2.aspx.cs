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
using System.Collections;
using TelerikWebApp1.DataAccessRef;

public partial class EditDemo_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DataAccessServiceClient client = new DataAccessServiceClient();
        RadGrid1.DataSource = client.GetEmployeeData(9).Employees;
        RadGrid1.DataBind();
    }

    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        //if (e.CommandName == "UpdateAll")
        {
            foreach (GridEditableItem editedItem in RadGrid1.EditItems)
            {
                Hashtable newValues = new Hashtable();
                //The GridTableView will fill the values from all editable columns in the hash
                e.Item.OwnerTableView.ExtractValuesFromItem(newValues, editedItem);
                editedItem.Edit = false;
            }
        }
        RadGrid1.Rebind();
    }

    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridDataItem && e.Item.IsInEditMode)
        {
            GridDataItem dataItem = e.Item as GridDataItem;
            //Hides the Update button for each edit form
            //dataItem["EditCommandColumn"].Controls[0].Visible = false;
        }
    }
}
