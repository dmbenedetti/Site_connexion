﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class campanhas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("am_cursos.aspx");
        if (!Page.IsPostBack)
        {
               // Response.Redirect("iep_dor_page.aspx");
        }//fim do if postback
    }
}