﻿using System;
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
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                adpt.Fill(ds);
            }

            return ds;
        }
    }
}
