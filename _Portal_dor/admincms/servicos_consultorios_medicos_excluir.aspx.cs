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
            var curso = (from n in cnDor.TB_MEDICO_CONSULTORIOS
                         where n.idMedico_Consultorios == id_conteudo
                         select n).FirstOrDefault();
            if (curso != null)
            {
                lbl_titulo.Text = curso.dsNome;
            }
            else {
                Response.Write(@"<script>alert('Médico não encontrado');location.href='servicos_consultorios_medicos.aspx?id=" + Request["idEsp"] + "'</script>");
            }
        }//fim do if !Page.IsPostBack
    }
    
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);
            try
            {
                var conteudo_hosptial = (from v in cnDor.TB_MEDICO_CONSULTORIOS where v.idMedico_Consultorios == id_conteudo select v);
                foreach (var ch in conteudo_hosptial)
                {
                    cnDor.DeleteObject(ch);
                }

                cnDor.SaveChanges();
                var curso = (from n in cnDor.TB_HOSPITAL_CORPO_CLINICO
                             where n.id_corpo_clinico == id_conteudo
                             select n).FirstOrDefault();
                cnDor.DeleteObject(curso);
                cnDor.SaveChanges();

                ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Médico Excluido Com Sucesso');location.href='servicos_consultorios_medicos.aspx?id=" + Request["idEsp"] + "'", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }    
        
}

   
}