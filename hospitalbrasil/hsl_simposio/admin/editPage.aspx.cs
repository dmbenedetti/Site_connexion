using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_editPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            //SERGINEI
            //int id = Convert.ToInt32(Request.QueryString["id"]);
            //simposioTableAdapters.tb_paginasTableAdapter paginas = new simposioTableAdapters.tb_paginasTableAdapter();
            //DataTable tb_pagina = paginas.Get_select_id(id);
            //if (tb_pagina.Rows.Count > 0) {
            //    lblPagina.Text = Convert.ToString(tb_pagina.Rows[0]["nm_pagina"]);
            //    txtTitulo.Text = Convert.ToString(tb_pagina.Rows[0]["nm_pagina"]);
            //    rblIcones.SelectedValue = Convert.ToString(tb_pagina.Rows[0]["id_icone"]);
            //    txtResumo.Text = Convert.ToString(tb_pagina.Rows[0]["ds_resumo"]);
            //    FCKeditor1.Value = Convert.ToString(tb_pagina.Rows[0]["ds_conteudo"]);
            
            //}//fim do if tb_pagina
        }//fim do if page.IsPostBack

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        string titulo = txtTitulo.Text;
        int icone = Convert.ToInt32(rblIcones.SelectedValue);
        string conteudo = FCKeditor1.Value;
        string resumo = txtResumo.Text;
        //SERGINEI
        //simposioTableAdapters.tb_paginasTableAdapter pagina = new simposioTableAdapters.tb_paginasTableAdapter();
        //try
        //{
        //    pagina.Update_pagina(titulo, icone, conteudo,resumo, id);
        //    Response.Redirect("paginas.aspx");
        //}
        //catch {
        //    Response.Write(@"<script>alert('Erro! A página não pode ser aterada.')</script>");
        //}
        
    }
}