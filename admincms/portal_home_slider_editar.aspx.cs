using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class admincms_portal_home_banner : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
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
            int id_slider = Convert.ToInt32(Request.QueryString["id"]);
            int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
            var slider = cnDor.TB_PORTAL_SLIDER.Where(x => x.id_idioma == id_idioma && x.id_slider == id_slider).FirstOrDefault();
            if (slider != null)
            {
                txt_link.Text = slider.ds_link.ToString();
                Image1.ImageUrl = "../images/slider_home/" + slider.ds_imagem;
                txtOrdem.Text = slider.nu_ordem == null ? "0" : slider.nu_ordem.ToString();
            }//fim do if banner !=null
            else {
                ClientScript.RegisterStartupScript(GetType(), "erro", "alert('Slider não localizado');location.href='portal_home_slider.aspx';", true);
            }//fim do else
        }//fim do if isPostBack
    }
    protected void btn_gravar_Click(object sender, EventArgs e)
    {
        int id_slider = Convert.ToInt32(Request.QueryString["id"]);       
        string link = txt_link.Text;

        if (FileUpload1.HasFile)
        {
            //se selecionou uma outra imagem;
            string imagem; ;
            string erro_foto = "";
            string nomeArq = DateTime.Now.Ticks.ToString();
            int nuOrdem = 0;
            int.TryParse(txtOrdem.Text, out nuOrdem);
            nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
            nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/slider_home/");
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
                    


                    FileUpload1.SaveAs(caminho + nomeArq);
                    imagem = nomeArq;

                    var banner = cnDor.TB_PORTAL_SLIDER.Where(x => x.id_slider == id_slider).FirstOrDefault();

                    FileInfo TheFile = new FileInfo(MapPath("~/") + "/images/slider_home/" + banner.ds_imagem);
                    File.Delete(MapPath("~/") + "/images/slider_home/" + banner.ds_imagem);

                    banner.ds_link = link;
                    banner.nu_ordem = nuOrdem;
                    banner.ds_imagem = imagem;
                    cnDor.SaveChanges();

                    


                    ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('Slider Alterado com Sucesso');location.href='portal_home_slider.aspx';", true);

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
            var banner = cnDor.TB_PORTAL_SLIDER.Where(x=> x.id_slider == id_slider).FirstOrDefault();
            int nuOrdem = 0;
            int.TryParse(txtOrdem.Text, out nuOrdem);
            banner.nu_ordem = nuOrdem;
            banner.ds_link = link;
            cnDor.SaveChanges();
            ClientScript.RegisterStartupScript(GetType(), "sucesso", "alert('slider Alterado com Sucesso');location.href='portal_home_slider.aspx';", true);
            
        }

        

    }
}