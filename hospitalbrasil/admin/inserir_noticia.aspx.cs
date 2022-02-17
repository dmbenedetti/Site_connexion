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

public partial class admin_portal_editar_pagina : System.Web.UI.Page
{
    public string div_conteudo = "style='display:block;'";
    public string div_formulario = "style='display:none;'";

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
        
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        
        string titulo = txt_titulo.Text;
        string conteudo = FCKeditor1.Value;
        string resumo = txt_resumo.Text;

        /* Convertendo a data*/
        /********************************************************/
        string data_temp = txt_data.Text;
        string dia = data_temp.Remove(2);
        string mes = data_temp.Substring(3).Remove(2);
        string ano = data_temp.Substring(6);
        string data = ano + "/" + mes + "/" + dia;
        DateTime data_new = Convert.ToDateTime(data);
        /********************************************************/
        DataSet1TableAdapters.tb_noticiasTableAdapter noticias = new DataSet1TableAdapters.tb_noticiasTableAdapter();
        noticias.Insert_noticia(titulo, resumo, conteudo, data_new);
        Response.Write(@"<script>alert('Notícia gravada com sucesso!');location.href='noticias.aspx'</script>");
    }
    
}
