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

public partial class FilterDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
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
}
