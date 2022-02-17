using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_newPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        //    pagina.InsertPagina(titulo, icone, conteudo,resumo);
        //    Response.Redirect("paginas.aspx");
        //}
        //catch
        //{
        //    Response.Write(@"<script>alert('Erro! A página não pode ser criada.')</script>");
        //}
    }
}