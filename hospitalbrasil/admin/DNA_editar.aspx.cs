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

public partial class admin_portal_excluir_pagina : System.Web.UI.Page
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
    public string erro;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int id=Convert.ToInt32(Request.QueryString["id"]);
        if (!Page.IsPostBack) {
            
            DataSet1TableAdapters.tb_dnaTableAdapter select_pagina = new DataSet1TableAdapters.tb_dnaTableAdapter();
            DataTable tb01 = select_pagina.Get_select_id_dna(id);
            txt_titulo.Text = (string)tb01.Rows[0]["titulo"];
            txt_edicao.Text = Convert.ToString(tb01.Rows[0]["edicao"]);
            img.ImageUrl = "~/images/dna/" + (string)tb01.Rows[0]["imagem"];
        }//fim do if Page.IsPotBack
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

        string id_pag1 = Request["id"];
        int id_pag = Convert.ToInt32(id_pag1);
        string foto_caminho = img.ImageUrl;
        string nome_foto = "";
        string nome_arquivo = "";

        DataSet1TableAdapters.tb_dnaTableAdapter delete_foto = new DataSet1TableAdapters.tb_dnaTableAdapter();
        DataTable tb2 = delete_foto.Get_select_id_dna(id_pag);


        if (tb2.Rows.Count > 0)
        {
            nome_foto = (string)tb2.Rows[0]["imagem"];
            nome_arquivo = (string)tb2.Rows[0]["arquivo"];
        }
        FileInfo TheFile = new FileInfo(MapPath("../") + "/images/dna/" + nome_foto);
        delete_foto.Deletearquivo(id_pag);
        File.Delete(MapPath("../") + "/images/dna/" + nome_foto);
        File.Delete(MapPath("../") + "/images/dna/" + nome_arquivo);

        Response.Write(@"<script>alert('Edição Excluída com sucesso!');location.href='dna.aspx';</script>");
      
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string id_pag1 = Request["id"];
        int id_pag = Convert.ToInt32(id_pag1);
        string nome_foto = "";
        string nome_arquivo = "";
        DataSet1TableAdapters.tb_dnaTableAdapter delete_foto = new DataSet1TableAdapters.tb_dnaTableAdapter();
        DataTable tb2 = delete_foto.Get_select_id_dna(id_pag);
        if (tb2.Rows.Count > 0)
        {
            nome_foto = (string)tb2.Rows[0]["imagem"];
            nome_arquivo = (string)tb2.Rows[0]["arquivo"];
        }

        string titulo = txt_titulo.Text;
        string edicao = txt_edicao.Text;
        FileInfo TheFile = new FileInfo(MapPath("../") + "/images/dna/" + nome_foto);
        if (fuparquivo.HasFile) {
            File.Delete(MapPath("../") + "/images/dna/" + nome_arquivo);

            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/DNA/");
            string extensao = System.IO.Path.GetExtension(fuparquivo.FileName).ToLower();
            string nomepdf = "DNA_" + DateTime.Now.Ticks.ToString();
            nomepdf = GetStringNoAccents(nomepdf).Replace(" ", "_");

            string nome_foto1 = nomepdf + System.IO.Path.GetExtension(fuparquivo.FileName).ToLower();
            int tamanho_kb = fuparquivo.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em bytes (limite 5 mb)
                if (tamanho_kb > 5242880)
                {
                    autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 5 MB.<br />";
                }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else
            {
                autorizado1 = autorizado1 + "Imagem: Extensão não permitida.<br />";
            }//fim do else
            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                //salva o arquivo e exibe mensagem de sucesso.
                try{ 
                    fupfoto.SaveAs(caminho + nome_foto1);
                    nome_arquivo = nome_foto1;
                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {
                    autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                    lblmsg.Text += autorizado1;
                }//fim do catch
            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {
                lblmsg.Text += autorizado1;
            }//fim do else

        }
        if (fupfoto.HasFile) {
            File.Delete(MapPath("../") + "/images/dna/" + nome_foto);
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/DNA/");
            string extensao = System.IO.Path.GetExtension(fupfoto.FileName).ToLower();

            string nomeimagem = "imgDNA_" + DateTime.Now.Ticks.ToString();
            nomeimagem = GetStringNoAccents(nomeimagem).Replace(" ", "_");

            string nome_foto1 = nomeimagem + System.IO.Path.GetExtension(fupfoto.FileName).ToLower();
            int tamanho_kb = fupfoto.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em bytes (limite 5 mb)
                if (tamanho_kb > 5242880)
                {
                    autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 5 MB.<br />";
                }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else
            {
                autorizado1 = autorizado1 + "Imagem: Extensão não permitida.<br />";
            }//fim do else
            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                //salva o arquivo e exibe mensagem de sucesso.
                try
                {
                    fupfoto.SaveAs(caminho + nome_foto1);
                    nome_foto = nome_foto1;
                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {
                    autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                    lblmsg.Text += autorizado1;
                }//fim do catch
            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {
                lblmsg.Text += autorizado1;
            }//fim do else
        }
        delete_foto.Update_dna(titulo, edicao, nome_arquivo, nome_foto, id_pag);
        Response.Write(@"<script>alert('Edição editada com sucesso!');location.href='dna.aspx';</script>");

    }
}
