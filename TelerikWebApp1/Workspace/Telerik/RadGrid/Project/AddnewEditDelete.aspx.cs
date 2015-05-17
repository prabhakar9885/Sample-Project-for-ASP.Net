using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using DataAccessLayer;
using System.Collections.Generic;
using BusinessEntities;

public partial class AddnewEditDelete : System.Web.UI.Page 
{
    EmployeeDataContract edc;

    protected void Page_Load(object sender, EventArgs e)
    {
    }


    /// <summary>
    /// If the data is not available in the session variable, 
    ///             Fetch the data from the WCF Service and return it.
    /// else,
    ///             Return the data from the session variable.
    /// </summary>
    /// <returns></returns>
    private EmployeeDataContract GetAppropriateDataObject()
    {
        EmployeeDataContract edc;
        if (Session["data"] == null)
        {
            DataAccessService das = new DataAccessService();
            edc = das.GetEmployeeData(1);
            Session["data"] = edc;
        }
        else
            edc = Session["data"] as EmployeeDataContract;
        return edc;
    }

    protected void RadGrid1_NeedDataSource1(object sender, GridNeedDataSourceEventArgs e)
    {
        edc = GetAppropriateDataObject();
        Session["data"] = edc;
        ((RadGrid)sender).DataSource = edc.Employees;
    }


    /// <summary>
    /// Event Handler for Update Command
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        if (e.Item is GridEditableItem)
        {
            
            GridEditableItem gei = e.Item as GridEditableItem;

            Dictionary<string, string> newValues = new Dictionary<string, string>();
            e.Item.OwnerTableView.ExtractValuesFromItem(newValues, gei);   

            int _Id = (int)gei.GetDataKeyValue("Id");

            EmployeeDataContract edc = GetAppropriateDataObject();

            edc.Employees = (edc.Employees.Select(emp =>
                {
                    if (emp.Id == _Id)
                    {
                        emp = new BusinessEntities.Employee
                        {
                            Id = _Id,
                            Job = newValues["Job"].ToString(),
                            ManagerName = newValues["ManagerName"].ToString(),
                            Name = newValues["Name"].ToString(),
                            Salary = double.Parse(newValues["Salary"].ToString())
                        };
                    }
                    return emp;
                })).ToList();

            Session["data"] = edc;
        }
    }


    /// <summary>
    /// Event Hhandler for Insert Command
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void RadGrid1_InsertCommand(object sender, GridCommandEventArgs e)
    {
        GridEditableItem gei = e.Item as GridEditableItem;

        Dictionary<string, string> newValues = new Dictionary<string, string>();
        e.Item.OwnerTableView.ExtractValuesFromItem(newValues, gei);

        edc = GetAppropriateDataObject();

        edc.Employees.Add(new BusinessEntities.Employee()
        {
            Id = edc.Employees.Max(p => p.Id) + 1,
            Job = newValues["Job"].ToString(),
            ManagerName = newValues["ManagerName"].ToString(),
            Name = newValues["Name"].ToString(),
            Salary = double.Parse(newValues["Salary"].ToString())
        });

        Session["data"] = edc;
    }



    /// <summary>
    /// Event handler for Delete Command
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void RadGrid1_DeleteCommand(object sender, GridCommandEventArgs e)
    {
        GridDataItem gdi = e.Item as GridDataItem;
        int Id = (int)gdi.GetDataKeyValue("Id");

        edc = GetAppropriateDataObject();

        EmployeeDataContract temp = new EmployeeDataContract();
        temp.Employees = new List<Employee>();
        foreach (Employee item in edc.Employees)
        {
            if (item.Id == Id)
                continue;
            temp.Employees.Add(item);
        }
        edc = temp;
        Session["data"] = edc;
    }

}
