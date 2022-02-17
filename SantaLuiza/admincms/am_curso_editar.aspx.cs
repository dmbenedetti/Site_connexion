using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    int sessao_site = 3;//Publicações e Campanhas
    int tipo = 12;//sua saude

    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);

            string id_user = Convert.ToString(Session.Contents["iduser"]);
            int user = Convert.ToInt32(id_user);

            var ls = (from p in cnDor.TB_PERMISSAO_ADMIN
                      join h in cnDor.TB_HOSPITAL on p.id_hospital equals h.id_hospital
                      where p.id_user == user
                      select new { h.nm_hospital, h.id_hospital }).ToList();
            ListItem oitem;
            foreach (var l in ls)
            {
                oitem = new ListItem();
                oitem.Text = l.nm_hospital;
                oitem.Value = l.id_hospital.ToString();

                chb_hospitais.Items.Add(oitem);
            }

            foreach (var a in (from p in cnDor.TB_AREA_MEDICA_CURSO_HOSPITAL where p.id_curso == id_conteudo select p))
            {
                try
                {
                    chb_hospitais.Items.FindByValue(a.id_hospital.ToString()).Selected = true;
                }
                catch { }
            }


            var curso = (from n in cnDor.TB_AREA_MEDICA_CURSO
                               where n.id==id_conteudo 
                               select n).FirstOrDefault();
            txt_titulo.Text = curso.ds_curso;
            FCKeditor1.Value = curso.ds_descricao;
            DateTime data = Convert.ToDateTime(curso.dt_curso);
            txt_data.Text = data.ToString("dd/MM/yyyy");
            txt_hora.Text = curso.ds_horario;
            if (curso.dt_inscricao != null)
            {
                txt_inscr.Text = ((DateTime)curso.dt_inscricao).ToString("dd/MM/yyyy");
            }
            if (curso.vl_curso != null)
            {
                txtPreco.Text = curso.vl_curso;
            }
            if (curso.ds_link_curso != null)
            {
                txtLink.Text = curso.ds_link_curso.ToString();
            }
            if (curso.ds_telefone != null)
            {
                txtTelefone.Text = curso.ds_telefone.ToString();
            }
            if (curso.ds_box2_desc != null)
            {
                txtBox2Desc.Text = curso.ds_box2_desc.ToString();
            }
            if (curso.ds_box2_titulo != null)
            {
                txtBox2Titulo.Text = curso.ds_box2_titulo.ToString();
            }
            if (curso.ds_minidesc != null)
            {
                txtMimDesc.Text = curso.ds_minidesc.ToString();
            }
            if (curso.ds_email != null)
            {
                txtEmail.Text = curso.ds_email.ToString();
            }

            txt_local.Text = curso.ds_local;
            drp_Unidade.SelectedValue = curso.id_hospital.ToString();
            var especialidades = (from n in cnDor.TB_EPSECIALIDADE orderby n.nm_especialidade select n);
            var especialistadecurso = (from n in cnDor.TB_AREA_MEDICA_CURSO_ESPECIALIDADE where n.id_area_medica_curso == id_conteudo select n);
            ListItem oItem;
            foreach (db_rede_dorModel.TB_EPSECIALIDADE especilade in especialidades)
            {
                oItem = new ListItem();
                oItem.Value = especilade.id_especialidade.ToString();
                oItem.Text = especilade.nm_especialidade;
                lst_especialidade.Items.Add(oItem);
            }
            lst_especialidade.DataBind();
            foreach (db_rede_dorModel.TB_AREA_MEDICA_CURSO_ESPECIALIDADE esp in especialistadecurso)
            {
                lst_especialidade.Items.FindByValue(esp.id_especialidade.ToString()).Selected = true;
            }


        }//fim do if !Page.IsPostBack
    }
    public static string GetStringNoAccents(string str)
    {

        /** Troca os caracteres acentuados por não acentuados **/
        string[] acentos = new string[] { "ç", "Ç", "á", "é", "í", "ó", "ú", "ý", "Á", "É", "Í", "Ó", "Ú", "Ý", "à", "è", "ì", "ò", "ù", "À", "È", "Ì", "Ò", "Ù", "ã", "õ", "ñ", "ä", "ë", "ï", "ö", "ü", "ÿ", "Ä", "Ë", "Ï", "Ö", "Ü", "Ã", "Õ", "Ñ", "â", "ê", "î", "ô", "û", "Â", "Ê", "Î", "Ô", "Û" };
        string[] semAcento = new string[] { "c", "C", "a", "e", "i", "o", "u", "y", "A", "E", "I", "O", "U", "Y", "a", "e", "i", "o", "u", "A", "E", "I", "O", "U", "a", "o", "n", "a", "e", "i", "o", "u", "y", "A", "E", "I", "O", "U", "A", "O", "N", "a", "e", "i", "o", "u", "A", "E", "I", "O", "U" };

        for (int i = 0; i < acentos.Length; i++)
        {
            str = str.Replace(acentos[i], semAcento[i]);
        }

        /** Troca os caracteres especiais da string por "" **/
        string[] caracteresEspeciais = { "\\.", ",", "-", ":", "\\(", "\\)", "ª", "\\|", "\\\\", "°" };

        for (int i = 0; i < caracteresEspeciais.Length; i++)
        {
            str = str.Replace(caracteresEspeciais[i], "");
        }

        /** Troca os espaços no início por "" **/
        str = str.Replace("^\\s+", "");
        /** Troca os espaços no início por "" **/
        str = str.Replace("\\s+$", "");
        /** Troca os espaços duplicados, tabulações e etc por  " " **/
        str = str.Replace("\\s+", " ");
        return str;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int usuario = Convert.ToInt32(Session.Contents["iduser"]);
        DateTime data, data_insc;
        data = Convert.ToDateTime(txt_data.Text);
        DateTime.TryParse(txt_inscr.Text, out data_insc);
        string titulo = txt_titulo.Text;
        string resumo = FCKeditor1.Value;
        double preco = 0.0;
        double.TryParse(txtPreco.Text, out preco);
        string conteudo = "";
        string imagem = "";
        bool erro = false;
        if (erro == false)
        {
            try
            {
                var curso = (from n in cnDor.TB_AREA_MEDICA_CURSO
                               where n.id==id_conteudo 
                               select n).FirstOrDefault();
                curso.ds_descricao = resumo;
                curso.dt_curso = data;
                curso.ds_curso = titulo;
                curso.vl_curso = txtPreco.Text;
                curso.ds_box2_desc = txtBox2Desc.Text;
                curso.ds_box2_titulo = txtBox2Titulo.Text;
                curso.ds_minidesc = txtMimDesc.Text;
                curso.ds_telefone = txtTelefone.Text;
                curso.ds_local = txt_local.Text;
                curso.ds_link_curso = txtLink.Text;
                curso.ds_horario = txt_hora.Text;
                curso.ds_local = txt_local.Text;
                curso.ds_email = txtEmail.Text;
                if (data_insc != DateTime.MinValue)
                {
                    curso.dt_inscricao = data_insc;
                }
                curso.id_hospital = Convert.ToInt32(drp_Unidade.SelectedValue);
                cnDor.SaveChanges();
                db_rede_dorModel.TB_AREA_MEDICA_CURSO_ESPECIALIDADE novaespecialidade = null;
                var especialistadecurso = (from n in cnDor.TB_AREA_MEDICA_CURSO_ESPECIALIDADE where n.id_area_medica_curso == id_conteudo select n);
                bool bremove = false;
                foreach (db_rede_dorModel.TB_AREA_MEDICA_CURSO_ESPECIALIDADE esp in especialistadecurso)
                {
                    bremove = false;
                    if (!lst_especialidade.Items.FindByValue(esp.id_especialidade.ToString()).Selected) {
                        bremove = true;
                    }
                    if (bremove)
                    {
                        cnDor.DeleteObject(esp);
  
                    }
                }
                cnDor.SaveChanges(); 
                foreach (ListItem l in lst_especialidade.Items)
                {
                    int id_especidade = Convert.ToInt32(l.Value);
                    if (l.Selected && (from n in cnDor.TB_AREA_MEDICA_CURSO_ESPECIALIDADE where n.id_area_medica_curso == id_conteudo && n.id_especialidade == id_especidade select n).Count() == 0)
                    {
                        novaespecialidade = new db_rede_dorModel.TB_AREA_MEDICA_CURSO_ESPECIALIDADE();
                        novaespecialidade.id_area_medica_curso = id_conteudo;
                        novaespecialidade.id_especialidade = Convert.ToInt32(l.Value);
                        cnDor.AddToTB_AREA_MEDICA_CURSO_ESPECIALIDADE(novaespecialidade);
                        cnDor.SaveChanges();
                    }

                }

                var conteudo_hosptial = (from v in cnDor.TB_AREA_MEDICA_CURSO_HOSPITAL where v.id_curso == id_conteudo select v);
                foreach (var ch in conteudo_hosptial)
                {
                    cnDor.DeleteObject(ch);
                }
                db_rede_dorModel.TB_AREA_MEDICA_CURSO_HOSPITAL ohospital;
                foreach (ListItem oitem in chb_hospitais.Items)
                {
                    if (oitem.Selected)
                    {
                        ohospital = new db_rede_dorModel.TB_AREA_MEDICA_CURSO_HOSPITAL();
                        ohospital.id_curso = id_conteudo;
                        ohospital.id_hospital = Convert.ToInt32(oitem.Value);
                        cnDor.AddToTB_AREA_MEDICA_CURSO_HOSPITAL(ohospital);
                    }
                }
                cnDor.SaveChanges();



                //provavelmente o ACT está dando conflito com a linha abaixo, resolvi fazendo o response.write na linha seguinte
                //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Dados Gravados com sucesso');location.href='portal_noticias.aspx'", true);
                Response.Write(@"<script>alert('Dados Gravados com sucesso');location.href='am_cursos.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }
        }//fim do if
        else {
            lbl_erro.Text = "Algum erro";
        }
    }

}