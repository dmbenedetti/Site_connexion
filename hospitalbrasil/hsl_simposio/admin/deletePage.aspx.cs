using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_deletePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            int id = Convert.ToInt32(Request.QueryString["id"]);
            //SERGINEI
            ////simposioTableAdapters.tb_paginasTableAdapter paginas = new simposioTableAdapters.tb_paginasTableAdapter();
            ////DataTable tb_pagina = paginas.Get_select_id(id);
            ////if (tb_pagina.Rows.Count > 0)
            ////{
            ////    lblPagina.Text = Convert.ToString(tb_pagina.Rows[0]["nm_pagina"]);
            ////    lblTitulo.Text = Convert.ToString(tb_pagina.Rows[0]["nm_pagina"]);

            ////}//fim do if tb_pagina
        }//fim do if page.IsPostBack
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //SERGINEI
        //simposioTableAdapters.tb_paginasTableAdapter paginas = new simposioTableAdapters.tb_paginasTableAdapter();
        //int id = Convert.ToInt32(Request.QueryString["id"]);
        //try
        //{
        //    paginas.Delete_pagina(id);
        //    Response.Redirect("paginas.aspx");
        //}
        //catch {
        //    Response.Write(@"<script>alert('Erro! A página não pode ser Excluida. Tente novamente mais tarde!')</script>");
        //}
    }
}