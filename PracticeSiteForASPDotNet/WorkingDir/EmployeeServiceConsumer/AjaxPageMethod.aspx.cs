﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Services;

namespace PracticeSiteForASPDotNet.WorkingDir.EmployeeServiceConsumer
{
    public partial class AjaxPageMethod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetData()
        {
            return "Hello world";
        }
    }
}