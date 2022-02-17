using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    int sessao_site = 5;//Imprensa
    int tipo = 6;//release

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
        DateTime data = Convert.ToDateTime(txt_data.Text);
        string titulo = txt_titulo.Text;
        string resumo = txt_resumo.Text;
        string conteudo = FCKeditor1.Value;
        string imagem = null;
        bool erro = false;
            //USNDO A TABELA CONTROLE DE NOTICIA PARA REGISTRAR TAMBÉM OS RELEASES
            db_rede_dorModel.TB_CONTROLE_NOTICIA controle_noticia = new db_rede_dorModel.TB_CONTROLE_NOTICIA();
            controle_noticia.dt_noticia = data;
            controle_noticia.id_status = 1;
            controle_noticia.id_usuario = usuario;
            try
            {
                cnDor.AddToTB_CONTROLE_NOTICIA(controle_noticia);
                cnDor.SaveChanges();

                var id_release = cnDor.TB_CONTROLE_NOTICIA.OrderByDescending(x=>x.id_noticia).FirstOrDefault();
                if (id_release != null)
                {
                    int noticia = Convert.ToInt32(id_release.id_noticia);

                    db_rede_dorModel.TB_PORTAL_CONTEUDO novoRelease = new db_rede_dorModel.TB_PORTAL_CONTEUDO();
                    novoRelease.id_idioma = id_idioma;
                    novoRelease.id_status = 1;
                    novoRelease.id_sessao = sessao_site;
                    novoRelease.ds_conteudo = conteudo;
                    novoRelease.id_tipo = tipo;
                    novoRelease.dt_conteudo = data;
                    novoRelease.ds_visivel = true;
                    novoRelease.nm_titulo = titulo;
                    novoRelease.ds_resumo = resumo;
                    novoRelease.id_noticia = noticia;
                    novoRelease.nm_titulo_fonetico = iFonetizar.Fonetizar(novoRelease.nm_titulo, false);
                    novoRelease.ds_resumo_fonetico = iFonetizar.Fonetizar(novoRelease.ds_resumo, false);
                    novoRelease.ds_conteudo_fonetico = iFonetizar.Fonetizar(novoRelease.ds_conteudo, false);

                    cnDor.AddToTB_PORTAL_CONTEUDO(novoRelease);
                    cnDor.SaveChanges();
                    db_rede_dorModel.TB_PORTAL_CONTEUDO_HOSPITAL ohospital;
                    foreach (ListItem oitem in chb_hospitais.Items)
                    {
                        if (oitem.Selected)
                        {
                            ohospital = new db_rede_dorModel.TB_PORTAL_CONTEUDO_HOSPITAL();
                            ohospital.id_conteudo = novoRelease.id_conteudo;
                            ohospital.id_hospital = Convert.ToInt32(oitem.Value);
                            cnDor.AddToTB_PORTAL_CONTEUDO_HOSPITAL(ohospital);
                        }
                    }
                    cnDor.SaveChanges();
                    /* //
                      * 
                      * voltar aqui para fazer o insert da notícia na tabela de hospitais;
                      *
                      * 
                      *location.href='portal_noticias.aspx'
                     * */
                    //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Notícia Gravada com sucesso!');location.href='portal_noticias.aspx'", true);
                    Response.Write(@"<script>alert('Release Gravada com sucesso!');location.href='portal_releases.aspx'</script>");
                }//fim do if id_noticia != null
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Sem id do controle de release')", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteudo \nErro: " + ex.Message + "');", true);
            }
        
         

        
    }
    
}