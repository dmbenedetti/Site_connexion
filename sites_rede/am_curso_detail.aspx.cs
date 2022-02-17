using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class campanhas : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int idHosp = Convert.ToInt32(Session["idHosp"]);

            var metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.ds_pagina == "default.aspx" select a).FirstOrDefault();
            if (metatags != null)
            {
                ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
            }
            metatags = (from a in cnDor.TB_CONTEUDO_METATAGS where a.id_hospital == idHosp && a.ds_pagina == "am_cursos.aspx" select a).FirstOrDefault();
            if (metatags != null)
            {
                ltlMetaTag.Text = "<meta name='description' content='" + metatags.ds_description + "'>\n<meta name='keywords' content='" + metatags.ds_keywords + "'>";
            }

            var pagina = (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.ds_link == "am_cursos.aspx" && a.id_sessao == 7 && a.id_hospital == idHosp select a).FirstOrDefault();
            ltlTitulo.Text = pagina.ds_titulo;

            int id_curso;
            int.TryParse(Request["id"], out id_curso);
            var Curso = (from v in cnDor.TB_AREA_MEDICA_CURSO where v.id == id_curso select v).FirstOrDefault();

            lbl_titulo.Text = "<strong>" + Curso.ds_curso + "</strong>";
            if (Curso.dt_curso != null)
                ltlData.Text = Curso.dt_curso.ToString("dd MMM  yyyy");
            if (Curso.ds_horario != null)
                ltlHorario.Text = Curso.ds_horario.ToString();
            if (Curso.ds_local != null)
                ltlLocal.Text = Curso.ds_local.ToString();
            ltr_conteudo.Text = Curso.ds_descricao;
            if (Curso.dt_inscricao != null)
                ltlDataInscri.Text = ((DateTime)Curso.dt_inscricao).ToString("dd/MM/yyyy");
            
            if (Curso.vl_curso != null)
                ltlPreco.Text = "Taxa de Incrição: " + Curso.vl_curso;
            if (Curso.id_hospital != null)
                ltlUnidade.Text = ((from v in cnDor.TB_HOSPITAL where v.id_hospital == Curso.id_hospital select v).FirstOrDefault()).nm_hospital;
            if (Curso.ds_link_curso != null)
            {
                hpkInscricao.NavigateUrl = Curso.ds_link_curso.ToString();
                hpkInscricao.Text = "Mais informações";
                hpkInscricao.Target = "_blank";
            }
            if (Curso.ds_minidesc != null)
            {
                ltlInfo.Text = Curso.ds_minidesc;
            }
            if (Curso.ds_box2_desc != null)
            {
                ltlDescBox2.Text = Curso.ds_box2_desc;
            }
            if (Curso.ds_box2_titulo != null)
            {
                ltlTituloBox2.Text = Curso.ds_box2_titulo;
            }
            if (Curso.ds_telefone != null)
            {
                ltlTelefone.Text = Curso.ds_telefone;
            }
            if (Curso.ds_email != null)
            {
               HyperLink1.NavigateUrl = "mailto:" + Curso.ds_email;
               HyperLink1.Visible = true;
            }

        }//fim do if postback
    }
}