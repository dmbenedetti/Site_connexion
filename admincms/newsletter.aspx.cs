using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_newsletter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("content-disposition", "attachment; filename=newsletter.xls");
        Response.ContentType = "application/vnd.ms-excel";
    }
}