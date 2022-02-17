using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    int sessao_site = 5;//Imprensa

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
    protected string uploadimagem(){
            //se selecionou uma outra imagem;
            string imagem; 
            string erro_foto = "";
            string nomeArq = DateTime.Now.Ticks.ToString();
            nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
            nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/noticias/");
            string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            int tamanho_kb = FileUpload1.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em kb
                if (tamanho_kb > 6553600) { autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 800 KB.<br />"; }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else { autorizado1 = autorizado1 + "Imagem: Extensão não permitida.<br />"; }//fim do else
            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                //salva o arquivo e exibe mensagem de sucesso.
                try
                {
                    //FileInfo TheFile = new FileInfo(MapPath("../") + "/images/" + imagem);
                    //File.Delete(MapPath("../") + "/images/" + imagem);
                    FileUpload1.SaveAs(caminho + nomeArq);
                    imagem = nomeArq;
                    return imagem;
                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {
                    autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                    erro_foto = erro_foto + autorizado1;
                    lbl_erro.Text = erro_foto;
                    return "erro";
                }//fim do catch
            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {
                //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
                erro_foto = "Não foi possivel gravar este conteúdo:<br />"+erro_foto + autorizado1;
                return "erro";
            }//fim do else
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int tipo = 5;//tipo de conteudo = notícia
        int usuario = Convert.ToInt32(Session.Contents["iduser"]);
        int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
        DateTime data = Convert.ToDateTime(txt_data.Text);
        string titulo = txt_titulo.Text;
        string resumo = txt_resumo.Text;
        string conteudo = FCKeditor1.Value;
        string imagem = null;
        bool erro = false;
        
        

        if(FileUpload1.HasFile){
            string upload = uploadimagem();
            if (upload != "erro")
            {
                imagem = upload;
            }//fim do if upload!="erro"
            else {
                erro = true;
            }
        }//fim do if FileUpload1.HasFile
        if (erro == false)
        {
            db_rede_dorModel.TB_CONTROLE_NOTICIA controle_noticia = new db_rede_dorModel.TB_CONTROLE_NOTICIA();
            controle_noticia.dt_noticia = data;
            controle_noticia.id_status = 1;
            controle_noticia.id_usuario = usuario;
            try
            {
                cnDor.AddToTB_CONTROLE_NOTICIA(controle_noticia);
                cnDor.SaveChanges();

                var id_noticia = cnDor.TB_CONTROLE_NOTICIA.OrderByDescending(x=>x.id_noticia).FirstOrDefault();
                if (id_noticia != null)
                {
                    int noticia = Convert.ToInt32(id_noticia.id_noticia);

                    db_rede_dorModel.TB_PORTAL_CONTEUDO novaNoticia = new db_rede_dorModel.TB_PORTAL_CONTEUDO();
                    novaNoticia.id_idioma = id_idioma;
                    novaNoticia.id_status = 1;
                    novaNoticia.id_sessao = sessao_site;
                    novaNoticia.ds_conteudo = conteudo;
                    novaNoticia.id_tipo = tipo;
                    novaNoticia.dt_conteudo = data;
                    novaNoticia.ds_visivel = true;
                    novaNoticia.nm_titulo = titulo;
                    novaNoticia.ds_resumo = resumo;
                    novaNoticia.ds_imgDestaque = imagem;
                    novaNoticia.id_noticia = noticia;
                    novaNoticia.nm_titulo_fonetico = iFonetizar.Fonetizar(novaNoticia.nm_titulo, false);
                    novaNoticia.ds_resumo_fonetico = iFonetizar.Fonetizar(novaNoticia.ds_resumo, false);
                    novaNoticia.ds_conteudo_fonetico = iFonetizar.Fonetizar(novaNoticia.ds_conteudo, false);
                    
                    cnDor.AddToTB_PORTAL_CONTEUDO(novaNoticia);

                    cnDor.SaveChanges();
                    db_rede_dorModel.TB_PORTAL_CONTEUDO_HOSPITAL ohospital;
                    foreach (ListItem oitem in chb_hospitais.Items)
                    {
                        if (oitem.Selected)
                        {
                            ohospital = new db_rede_dorModel.TB_PORTAL_CONTEUDO_HOSPITAL();
                            ohospital.id_conteudo = novaNoticia.id_conteudo;
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
                    Response.Write(@"<script>alert('Notícia Gravada com sucesso!');location.href='portal_noticias.aspx'</script>");
                }//fim do if id_noticia != null
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Sem id do controle de noticias')", true);
                }
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