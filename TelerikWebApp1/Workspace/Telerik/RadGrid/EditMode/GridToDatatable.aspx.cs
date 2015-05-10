﻿using System;
using System.Linq;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using DataAccessLayer;
using BusinessEntities;

public partial class GridToDatatable : System.Web.UI.Page 
{

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void GetDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        EmployeeDataContract edc;
        if (Session["data"] == null)
        {
            DataAccessService das = new DataAccessService();
            edc = das.GetEmployeeData(1);
        }
        else
            edc = Session["data"] as EmployeeDataContract;
        ((RadGrid)sender).DataSource = edc.Employees;
    }

    protected void ExtractToDatatable_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();

        int columncount = 0;

        foreach (GridColumn column in RadGrid1.MasterTableView.AutoGeneratedColumns)
        {
            if (!string.IsNullOrEmpty(column.UniqueName) && !string.IsNullOrEmpty(column.HeaderText))
            {
                columncount++;
                dt.Columns.Add(column.UniqueName, typeof(string));
            }
        }

        DataRow dr;
        foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        {
            dr = dt.NewRow();

            for (int i = 0; i < columncount; i++)
            {
                dr[i] = item[RadGrid1.MasterTableView.AutoGeneratedColumns[i].UniqueName].Text;
            }

            dt.Rows.Add(dr);
        }

        RadGrid2.DataSource = dt;
        RadGrid2.DataBind();
    }

    protected void RadGrid1_PreRender(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    for (int i = 0; i < RadGrid1.PageSize; i++)
        //    {
        //        RadGrid1.EditIndexes.Add(i);
        //        RadGrid1.MasterTableView.EditMode = GridEditMode.InPlace;
        //        RadGrid1.Rebind();
        //    }
        //}
    }

    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        GridEditableItem editedItem = (GridEditableItem)e.Item;
    }

    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem gdi = e.Item as GridDataItem;
            GridTableCell gdc = gdi["ManagerNameUnique"] as GridTableCell;

            RadAutoCompleteBox ManagerAC = (RadAutoCompleteBox)gdc.FindControl("ManagerAC");
            //List<string> ManagerNames = (from emp in edc.Employees
            //                             select emp.ManagerName).ToList<string>();
            //if (ManagerAC != null)
            //{
            //    ManagerAC.DataSource = ManagerNames;
            //    ManagerAC.DataBind();
            //}
        }
    }

    protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
    {
        GridEditableItem gei = e.Item as GridEditableItem;
        string Id = (gei["IdUnique"].FindControl("IdTextBox") as TextBox).Text;
        string Name = (gei["NameUnique"].FindControl("NameTextBox") as TextBox).Text;
        string Job = (gei["JobUnique"].FindControl("JobTextBox") as TextBox).Text;
        string Salary = (gei["SalaryUnique"].FindControl("SalaryTextBox") as TextBox).Text;
        string Manager = (gei["ManagerNameUnique"].FindControl("ManagerTextBox") as TextBox).Text;

        DataAccessService das = new DataAccessService();
        EmployeeDataContract edc = das.GetEmployeeData(1);

        edc.Employees = (edc.Employees.Select(item =>
                                        {
                                            Employee emp = item;
                                            if (item.Id.ToString() == Id)
                                            {
                                                if (item.ManagerName != Manager) emp.ManagerName = Manager;
                                                if (item.Job != Job) emp.Job = Job;
                                                if (item.Name != Name) emp.Name = Name;
                                                if (item.Salary.ToString() != Salary)
                                                    emp.Salary = double.Parse(Salary);
                                            }
                                            return emp;
                                        })).ToList<Employee>();
        Session["data"] = edc;
    }

}