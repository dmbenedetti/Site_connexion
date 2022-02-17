using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
            var curso = (from n in cnDor.TB_ESPECIALIDADE_CONSULTORIOS
                         where n.idEspecialidade_Consutorios == id_conteudo
                         select n).FirstOrDefault();
            if (curso != null)
            {
                lbl_titulo.Text = curso.dsNome;
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Especialidade não encontrada');location.href='servicos_consultorios.aspx'", true);
            }
        }//fim do if !Page.IsPostBack
    }
    
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);
            try
            {
                var curso = (from n in cnDor.TB_ESPECIALIDADE_CONSULTORIOS
                             where n.idEspecialidade_Consutorios == id_conteudo
                             select n).FirstOrDefault();
                cnDor.DeleteObject(curso);
                cnDor.SaveChanges();

            ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Especialidade Excluida Com Sucesso');location.href='servicos_consultorios.aspx'", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }    
        
}

   
}