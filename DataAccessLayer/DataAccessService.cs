using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using BusinessEntities;
using System.Data;

namespace DataAccessLayer
{
    public class DataAccessService : IDataAccessService
    {
        public EmployeeDataContract GetEmployeeData(int value)
        {
            EmployeeDataContract edc;
            try
            {
                DAL dalObj = new DAL();
                edc = new EmployeeDataContract();
                DataSet ds = dalObj.GetAllEmployees();

                var query = from row in ds.Tables[0].AsEnumerable()
                            select new
                            {
                                Id = row.Field<int>("empno"),
                                Name = row.Field<string>("ename"),
                                Job = row.Field<string>("job"),
                                Salary = decimal.Parse( row["Salary"].ToString()),
                                ManagerNAme = row.Field<string>("ManagerName")
                            };
                
                edc.Employees = new List<Employee>();
                foreach (var item in query)
                {
                    Employee emp = new Employee();
                    emp.Id = item.Id;
                    emp.Job = item.Job ?? "-";
                    emp.Name = item.Name ?? "-";
                    emp.Salary = double.Parse(item.Salary.ToString() == "" ? "0" : item.Salary.ToString());
                    emp.ManagerName = item.ManagerNAme ?? "-";
                    edc.Employees.Add(emp);
                }
            }
            catch (Exception e)
            {
                
                throw;
            }

            return edc;
        }

        public DataSet GetEmployeeDataTable()
        {
            EmployeeDataContract edc;
            try
            {
                DAL dalObj = new DAL();
                edc = new EmployeeDataContract();
                DataSet ds = dalObj.GetAllEmployees();
                return ds;
            }
            catch (Exception e)
            {
            }
            return null;
        }
    }
}
