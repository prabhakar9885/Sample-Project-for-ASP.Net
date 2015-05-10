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
    [DataContract]
    public class EmployeeDataContract
    {
        [DataMember]
        public List<Employee> Employees;
        public DataTable EmployeeDT { get; set; }
    }

    [ServiceContract]
    public interface IDataAccessService
    {
        [OperationContract]
        EmployeeDataContract GetEmployeeData(int value);
        [OperationContract]
        DataSet GetEmployeeDataTable();
        [OperationContract]
        void UpdateEmpBatch(EmployeeDataContract emp);
    }
}
