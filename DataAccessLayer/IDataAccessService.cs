using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using BusinessEntities;

namespace DataAccessLayer
{
    [DataContract]
    public class EmployeeDataContract
    {
        [DataMember]
        public List<Employee> Employees;
    }

    [ServiceContract]
    public interface IDataAccessService
    {
        [OperationContract]
        EmployeeDataContract GetEmployeeData(int value);
    }
}
