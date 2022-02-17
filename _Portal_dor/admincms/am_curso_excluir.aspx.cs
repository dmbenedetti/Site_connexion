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
            var curso = (from n in cnDor.TB_AREA_MEDICA_CURSO
                         where n.id == id_conteudo
                         select n).FirstOrDefault();
            if (curso != null)
            {
                lbl_titulo.Text = curso.ds_curso;
            }
            else {
                Response.Write(@"<script>alert('Curso não encontrado');location.href='am_cursos.aspx'</script>");
            }
        }//fim do if !Page.IsPostBack
    }
    
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);
            try
            {
                var conteudo_hosptial = (from v in cnDor.TB_AREA_MEDICA_CURSO_HOSPITAL where v.id_curso == id_conteudo select v);
                foreach (var ch in conteudo_hosptial)
                {
                    cnDor.DeleteObject(ch);
                }
                cnDor.SaveChanges();
                var especialistadecurso = (from n in cnDor.TB_AREA_MEDICA_CURSO_ESPECIALIDADE where n.id_area_medica_curso == id_conteudo select n);
                foreach (db_rede_dorModel.TB_AREA_MEDICA_CURSO_ESPECIALIDADE esp in especialistadecurso)
                {
                    cnDor.DeleteObject(esp);
                }
                cnDor.SaveChanges();
                var curso = (from n in cnDor.TB_AREA_MEDICA_CURSO
                             where n.id == id_conteudo
                             select n).FirstOrDefault();
                cnDor.DeleteObject(curso);
                cnDor.SaveChanges();

                   /* //
                     * 
                     * voltar aqui para fazer o insert da notícia na tabela de hospitais;
                     *
                     * 
                     *location.href='portal_noticias.aspx'
                    * */
                //provavelmente o ACT está dando conflito com a linha abaixo, resolvi fazendo o response.write na linha seguinte
                //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Dados Gravados com sucesso');location.href='portal_noticias.aspx'", true);
                Response.Write(@"<script>alert('Notícia Excluida Com Sucesso');location.href='am_cursos.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }    
        
}

   
}