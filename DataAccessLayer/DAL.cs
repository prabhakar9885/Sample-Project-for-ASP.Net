using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataAccessLayer
{
    class DAL
    {
        public string ConnectionString { get; set; }
        public string ApplicationName { get; set; }

        public DAL(string ApplicationName = "Default")
        {
            this.ApplicationName = ApplicationName;
            ConnectionString = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            if (ConnectionString == null || ConnectionString == "")
                throw new Exception("Connection String not found");
        }

        internal DataSet GetAllEmployees()
        {
            DataSet ds = new DataSet();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllEmmployees", con);

                #region PROCEDURE GetAllEmmployees
                /**
                 *          CREATE PROCEDURE GetAllEmmployees
                            AS
	                            SELECT e.empno [empno], e.ename [ename], e.job [job], m.ename [ManagerName]
	                            FROM Emp e
	                            LEFT JOIN emp m
	                            ON e.mgr = m.empno
	                            ORDER BY e.empno
                 * 
                 */
                #endregion

                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                adpt.Fill(ds);
            }

            return ds;
        }

        internal void UpdateEmpBatch(DataTable EmpDT)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "UpdateAllEmp";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Data", EmpDT);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception e)
            {
                
                throw e;
            }
        }
    }
}
