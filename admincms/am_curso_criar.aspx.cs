using System;
using System.Collections.Generic;
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
            string id_user = Convert.ToString(Session.Contents["iduser"]);
            int user = Convert.ToInt32(id_user);

            chb_hospitais.DataSource = (from p in cnDor.TB_PERMISSAO_ADMIN
                                        join h in cnDor.TB_HOSPITAL on p.id_hospital equals h.id_hospital
                                        where p.id_user == user
                                        select new { h.nm_hospital, h.id_hospital }).ToList();
            chb_hospitais.DataTextField = "nm_hospital";
            chb_hospitais.DataValueField = "id_hospital";
            chb_hospitais.DataBind();
            chb_hospitais.SelectedValue = Session["idHosp"].ToString();
            
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
        int usuario = Convert.ToInt32(Session.Contents["iduser"]);
        int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
        DateTime data, data_insc;
        data = Convert.ToDateTime(txt_data.Text);
        DateTime.TryParse(txt_inscr.Text, out data_insc);

        int id_unidade = Convert.ToInt32(drp_Unidade.SelectedValue);
        //double preco = 0.0;
        //double.TryParse(txtPreco.Text, out preco);
        string titulo = txt_titulo.Text;
        string conteudo = FCKeditor1.Value;
        bool erro = false;
        if (erro == false)
        {
            try
            {
                db_rede_dorModel.TB_AREA_MEDICA_CURSO novoCurso = new db_rede_dorModel.TB_AREA_MEDICA_CURSO();
                novoCurso.id_status = 1;
                novoCurso.ds_descricao = conteudo;
                novoCurso.dt_curso = data;
                novoCurso.ds_curso = titulo;
                novoCurso.vl_curso = txtPreco.Text;
                novoCurso.id_hospital = id_unidade;
                novoCurso.ds_horario = txt_hora.Text;
                novoCurso.ds_link_curso = txtLink.Text;
                novoCurso.ds_box2_desc = txtBox2Desc.Text;
                novoCurso.ds_box2_titulo = txtBox2Titulo.Text;
                novoCurso.ds_minidesc = txtMimDesc.Text;
                novoCurso.ds_telefone = txtTelefone.Text;
                novoCurso.ds_email = txtEmail.Text;
                novoCurso.ds_local = txt_local.Text;
                if (data_insc != DateTime.MinValue) {
                    novoCurso.dt_inscricao = data_insc;
                }
                cnDor.AddToTB_AREA_MEDICA_CURSO(novoCurso);
                cnDor.SaveChanges();
                int id_curso = novoCurso.id;
                db_rede_dorModel.TB_AREA_MEDICA_CURSO_ESPECIALIDADE novaespecialidade = null;
                foreach (ListItem l in lst_especialidade.Items)
                {
                    if (l.Selected)
                    {
                        novaespecialidade = new db_rede_dorModel.TB_AREA_MEDICA_CURSO_ESPECIALIDADE();
                        novaespecialidade.id_area_medica_curso = id_curso;
                        novaespecialidade.id_especialidade = Convert.ToInt32(l.Value);
                        cnDor.AddToTB_AREA_MEDICA_CURSO_ESPECIALIDADE(novaespecialidade);
                        cnDor.SaveChanges();
                    }

                }
                db_rede_dorModel.TB_AREA_MEDICA_CURSO_HOSPITAL ohospital;
                foreach (ListItem oitem in chb_hospitais.Items)
                {
                    if (oitem.Selected)
                    {
                        ohospital = new db_rede_dorModel.TB_AREA_MEDICA_CURSO_HOSPITAL();
                        ohospital.id_curso = novoCurso.id;
                        ohospital.id_hospital = Convert.ToInt32(oitem.Value);
                        cnDor.AddToTB_AREA_MEDICA_CURSO_HOSPITAL(ohospital);
                    }
                }
                cnDor.SaveChanges();

                //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Notícia Gravada com sucesso!');location.href='portal_noticias.aspx'", true);
                Response.Write(@"<script>alert('Post Gravado com sucesso!');location.href='am_cursos.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteudo \nErro: " + ex.Message + "');", true);
            }
        }//fim do if
        else {
            lbl_erro.Text = "Algum erro";
        }
    }
}