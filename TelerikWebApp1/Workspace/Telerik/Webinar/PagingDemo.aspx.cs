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
using DataAccessLayer;

public partial class PagingDemo : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataAccessServiceClient client = new DataAccessServiceClient();
        EmployeeDataContract edc = client.GetEmployeeData(0);

        RadGrid1.DataSource = edc.Employees;
        RadGrid1.DataBind();
    }

    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridPagerItem)
        {
            Page.Title = (e.Item as GridPagerItem).Paging.DataSourceCount.ToString();
        }
        //if (e.Item is GridDataItem)
        //{
        //    GridDataItem gdi = (GridDataItem)e.Item;
        //    string val = gdi["UniqueName"].Text;
        //    HyperLink hl = (HyperLink)gdi["UniqueId"].Controls[0];
        //    hl.NavigateUrl += "?q=val";
        //}
    }

    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridPagerItem)
        {
            GridPagerItem gpi = e.Item as GridPagerItem;
            
            LinkButton lb = gpi.FindControl("Prev") as LinkButton;
            lb.CommandName = "Page";
            lb.CommandArgument = "Prev";
            lb.Text = "<=";

            if (gpi.NamingContainer is GridTHead)
                (gpi.FindControl("Prev") as LinkButton).Text += "**";
            if (gpi.NamingContainer is GridTFoot)
                (gpi.FindControl("Prev") as LinkButton).Text = "**" + 
                    (gpi.FindControl("Prev") as LinkButton).Text;

            lb = gpi.FindControl("Next") as LinkButton;
            lb.CommandName = "Page";
            lb.CommandArgument = "Next";
            lb.Text = "=>";
        }
    }
}
