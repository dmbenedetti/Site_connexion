using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;

public partial class admin_imagem_home : System.Web.UI.Page
{
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
        int id = Convert.ToInt32(Request.QueryString["id"]);
        if (!Page.IsPostBack) { 
        DataSet1TableAdapters.tb_banners_homeTableAdapter imagem_home = new DataSet1TableAdapters.tb_banners_homeTableAdapter();
        DataTable tb00 = imagem_home.Get_select_id(id);
        Image1.ImageUrl = "../images/" + (string)tb00.Rows[0]["imagem"];
        txt_link.Text = (string)tb00.Rows[0]["link"];
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        DataSet1TableAdapters.tb_banners_homeTableAdapter imagem_home = new DataSet1TableAdapters.tb_banners_homeTableAdapter();
        DataTable tb00 = imagem_home.Get_select_id(id);
        string link = txt_link.Text;
        string imagem = (string)tb00.Rows[0]["imagem"];
        string erro_foto = "";

        string nomeArq = DateTime.Now.Ticks.ToString();
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
        nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        //**************************************************************************************
        if (FileUpload1.HasFile)
        {
            
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/");
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
                    imagem_home.Update_banner(link, imagem, id); ;
                    Response.Write(@"<script>alert('Banner Alterada com Sucesso');location.href='home.aspx'</script>");

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

        }//fim do if
        else
        {
            imagem_home.Update_banner(link, imagem, id); ;
            Response.Write(@"<script>alert('Banner Alterado com Sucesso');location.href='home.aspx'</script>");
        }//fim do else

        //**************************************************************************************
        
        

    }
}
