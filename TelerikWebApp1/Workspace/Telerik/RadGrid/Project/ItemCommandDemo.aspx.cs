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
using System.Drawing;
using System.Collections;

public partial class ItemCommandDemo : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    /// <summary>
    /// Old Values can be accessed in this Event Handler.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        Hashtable OldValues;
        Hashtable NewValues = new Hashtable();

        switch (e.CommandName.Trim())
        {
            case "Edit":
                break;
            case "Update":
                GridEditableItem EItem = e.Item as GridEditableItem;
                OldValues = (Hashtable) EItem.SavedOldValues;
                e.Item.OwnerTableView.ExtractValuesFromItem(NewValues, EItem);

                GridEditableItem Item = e.Item as GridEditableItem;
                RadAutoCompleteBox RadAC = Item["ShipVia"].
                                FindControl("RadAutoCompleteBox1") as RadAutoCompleteBox;

                string Text = RadAC.Text.Replace(";", "").Trim();
                string Value="";
                foreach (AutoCompleteBoxEntry entry in RadAC.Entries)
                {
                    if (entry.Text == Text)
                    {
                        Value = entry.Value;
                        break;
                    }
                }

                SqlDataSource2.UpdateParameters["ShipperId"].DefaultValue = Value.Trim();
                SqlDataSource2.Update();
                break;
            case "Delete":
                break;
            case "Cancel":
                break;
            default:
                break;
        }

        if (e.CommandName == RadGrid.UpdateCommandName)
        {
            RadGrid1.MasterTableView.ClearEditItems();
        }
    }


    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem Item = e.Item as GridDataItem;

            try
            {
                if (int.Parse(Item["ShipVia"].Text.Trim()) <= 2)
                    Item["ShipVia"].BackColor = Color.LawnGreen;
            }
            catch (Exception ex)
            {
            }
        }
    }

}
