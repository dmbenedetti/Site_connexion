using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_portal_home_banner : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    public int id_idioma;
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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) { 
            int id_banner = Convert.ToInt32(Request.QueryString["id"]);
            id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
            int idHosp = Convert.ToInt32(Session["idHosp"]);
            drpCssType.DataSource = cnDor.TB_PORTAL_BANNER_CSS_TYPE;
            drpCssType.DataTextField = "ds_titulo";
            drpCssType.DataValueField = "ds_css";
            drpCssType.DataBind();
            if (idHosp > 1)
            {
                pnlSelo.Visible = true;
            }
            else
            {
                pnlSelo.Visible = false;
            }
            var banner = cnDor.TB_PORTAL_BANNER.Where(x => x.id_idioma == id_idioma && x.id_banner == id_banner).FirstOrDefault();
            if (banner != null)
            {
                txt_link.Text = banner.ds_link.ToString();
                txt_descricao.Text = banner.ds_descrição.ToString();
                Image1.ImageUrl = "../images/baners_home/" + banner.ds_imagem;
                lbl_banner.Text = banner.ds_descrição;
                drpCssType.SelectedValue = banner.css_type;
            }//fim do if banner !=null
            else {
                //ClientScript.RegisterStartupScript(GetType(), "erro", "alert('Banner não localizado');location.href='portal_homepage.aspx';", true);
            }//fim do else
            


        }//fim do if isPostBack
    }
    protected void btn_gravar_Click(object sender, EventArgs e)
    {
        int id_banner = Convert.ToInt32(Request.QueryString["id"]);       
        string link = txt_link.Text;
        string descricao = txt_descricao.Text;

        if (FileUpload1.HasFile)
        {
            //se selecionou uma outra imagem;
            string imagem; ;
            string erro_foto = "";
            string nomeArq = DateTime.Now.Ticks.ToString();
            nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
            nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/baners_home/");
            string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            //string nome_foto1 = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
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

                    var banner = cnDor.TB_PORTAL_BANNER.Where(x => x.id_banner == id_banner).FirstOrDefault();
                    if (banner == null)
                        banner = new db_rede_dorModel.TB_PORTAL_BANNER();
                    banner.ds_descrição = descricao;
                    banner.ds_link = link;
                    banner.ds_imagem = imagem;
                    banner.id_hospital = Convert.ToInt32(Session["idHosp"]);
                    banner.id_idioma = 1;
                    banner.id_status = 1;
                    int idposicao = 0;
                    int.TryParse(Request["idPosicao"], out idposicao);
                    banner.css_type = drpCssType.SelectedValue;
                    banner.id_posicao = idposicao;
                    if (banner.id_banner == 0)
                    {
                        cnDor.AddToTB_PORTAL_BANNER(banner);
                    }
                    cnDor.SaveChanges();
                    if (Session["idHosp"].ToString() == "1")
                    {
                        if (id_banner >= 1001 && id_banner < 1003)
                        {
                            ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('Banner Alterado com Sucesso');location.href='portal_homepage_tablet.aspx';", true);
                        }
                        else if (id_banner >= 1003 && id_banner < 1005)
                        {
                            ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('Banner Alterado com Sucesso');location.href='portal_homepage_mobile.aspx';", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('Banner Alterado com Sucesso');location.href='portal_homepage.aspx';", true);
                        }
                    }
                    else
                        ClientScript.RegisterStartupScript(GetType(),"sucesso","alert('Banner Alterado com Sucesso');location.href='hospital_homepage.aspx';",true);

                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {
                    autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                    erro_foto = erro_foto + autorizado1;
                    lblerro.Text = erro_foto;
                }//fim do catch

            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {
                //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
                erro_foto = erro_foto + autorizado1;

            }//fim do else


            
        }
        else { 
           //se não selecionou nenhuma outra imagem
            var banner = cnDor.TB_PORTAL_BANNER.Where(x=> x.id_banner == id_banner).FirstOrDefault();
            banner.ds_descrição = descricao;
            banner.css_type = drpCssType.SelectedValue;
            banner.ds_link = link;
            cnDor.SaveChanges();
            if (Session["idHosp"].ToString() == "1")
            {
                if (id_banner >= 1001 && id_banner < 1003)
                {
                    ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('Banner Alterado com Sucesso');location.href='portal_homepage_tablet.aspx';", true);
                }
                else if (id_banner >= 1003 && id_banner < 1005)
                {
                    ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('Banner Alterado com Sucesso');location.href='portal_homepage_mobile.aspx';", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('Banner Alterado com Sucesso');location.href='portal_homepage.aspx';", true);
                }
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('Banner Alterado com Sucesso');location.href='hospital_homepage.aspx';", true);
            
        }

        

    }
}