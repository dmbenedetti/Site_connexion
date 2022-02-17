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

public partial class admin_noticias : System.Web.UI.Page
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

    }
    public string upload_pdf(string nomepdf) {
        string erro_foto = "";
        //**************************************************************************************
        // arquivo
        //verifica se há algum arquivo postado na foto2
        if (fuparquivo.HasFile)
        {
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/SuaSaude/");
            string extensao = System.IO.Path.GetExtension(fuparquivo.FileName).ToLower();
            string nome_foto1 = nomepdf + System.IO.Path.GetExtension(fuparquivo.FileName).ToLower();
            int tamanho_kb = fuparquivo.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".pdf")
            {
                if (tamanho_kb > 12582912)//verifica o tamanho em bytes (limite 5 mb)
                {
                    autorizado1 = autorizado1 + "Arquivo: Não São permitidos arquivos maiores que 5 MB.<br />";
                }//fim do if
            }//fim do if
            else//se a extensão não for permitida grava o erro na string.
            {
                autorizado1 = autorizado1 + "Arquivo: Extensão não permitida.<br />";
            }//fim do else
            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                //salva o arquivo e exibe mensagem de sucesso.
                try
                {
                    fuparquivo.SaveAs(caminho + nome_foto1);
                    return "ok";
                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {
                    autorizado1 = autorizado1 + "Arquivo: " + ex.Message + "<br />";
                    Response.Write(@"<script>alert('"+autorizado1+"')</script>");
                    return "erro";
                }//fim do catch
            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {
                lblmsg.Text += erro_foto + autorizado1;
                return "erro";
            }//fim do else
        }//fim fo if
        //se não houver produto postado no foto1
        else
        {
            lblmsg.Text += "Nenhum Arquivo selecionada para o envio!";
            return "erro";
        }
    }
    protected string upload_imagem(string nomeimagem)
    {
        //**************************************************************************************
        // arquivo
        //verifica se há algum arquivo postado na foto2
        if (fupfoto.HasFile)
        {
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/SuaSaude/");
            string extensao = System.IO.Path.GetExtension(fupfoto.FileName).ToLower();
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
                    return "ok";
                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {
                    autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                    Response.Write(@"<script>alert('" + autorizado1 + "')</script>");
                    return autorizado1;
                }//fim do catch
            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {
                lblmsg.Text += autorizado1;
                Response.Write(@"<script>alert('" + autorizado1 + "')</script>");
                return autorizado1;
            }//fim do else
        }//fim fo if
        //se não houver produto postado no foto1
        else
        {

            return "Nenhuma Foto selecionada para o envio!";
            Response.Write(@"<script>alert('Nenhuma Foto selecionada para o envio!')</script>");
            lblmsg.Text += "Nenhuma Foto selecionada para o envio!";
        }
    }//
    protected void Button4_Click(object sender, EventArgs e)
    {
        string titulo = txt_titulo.Text;
        string edicao = txt_edicao.Text;
        string nomeimagem = "imgSuaSaude_" + DateTime.Now.Ticks.ToString();
        nomeimagem = GetStringNoAccents(nomeimagem).Replace(" ", "_");
        string nomepdf = "SuaSaude_" + DateTime.Now.Ticks.ToString();
        nomepdf = GetStringNoAccents(nomepdf).Replace(" ", "_");
        string arquivo = upload_pdf(nomepdf);
        string imagem = upload_imagem(nomeimagem);
        string extensaoimagem = System.IO.Path.GetExtension(fupfoto.FileName).ToLower();
        string extensaoarquivo = System.IO.Path.GetExtension(fuparquivo.FileName).ToLower();
        
        if (imagem == "ok" && arquivo == "ok")
        {
            nomepdf = nomepdf + extensaoarquivo;
            nomeimagem = nomeimagem + extensaoimagem;
            DataSet1TableAdapters.tb_dnaTableAdapter dna = new DataSet1TableAdapters.tb_dnaTableAdapter();
            dna.Insert_dna(titulo, edicao, nomepdf, nomeimagem);
            Response.Write(@"<script>location.href='SuaSaude.aspx';</script>");
        }//fim do if
        else {
            Response.Write(@"<script>alert('"+imagem+"')</script>");
        }



    }
    protected void Button5_Click(object sender, EventArgs e)
    {

    }
}
