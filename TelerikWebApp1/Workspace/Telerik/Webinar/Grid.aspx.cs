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
using System.Collections.Generic;
using BusinessEntities;
using TelerikWebApp1.DataAccessRef;
using DataAccessLayer;
using System.Text.RegularExpressions;
using System.Drawing;

public partial class Grid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        GridFilterMenu gfm = RadGrid1.FilterMenu;
        foreach (RadMenuItem item in gfm.Items)
        {
            Regex re = new Regex("lessthan", RegexOptions.IgnoreCase);
            if (re.IsMatch(item.Text.Trim()))
                re.Replace(item.Text.Trim(), "<");
            
            re = new Regex("greaterthan", RegexOptions.IgnoreCase);
            if (re.IsMatch(item.Text.Trim()))
                re.Replace(item.Text.Trim(), ">");
        }
    }

    private void LoadData()
    {
        RadGrid1.DataSource = GetDataTable();
    }

    private List<Employee> GetDataTable()
    {
        DataAccessServiceClient client = new DataAccessServiceClient();
        EmployeeDataContract edc = client.GetEmployeeData(0);

        return edc.Employees;
    }

    protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        (sender as RadGrid).DataSource = GetDataTable();
    }
    
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {

        if (e.Item is GridDataItem)
        {
            GridDataItem gdi = e.Item as GridDataItem;
            try
            {
                if (int.Parse(gdi["UniqueId"].Text.Trim()) < 5)
                    gdi["UniqueId"].BackColor = Color.Red;
            }
            catch (Exception)
            {
            }
        }
    }
}
