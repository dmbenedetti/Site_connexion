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
    public string div_url = "style='display:none;'";
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
        DataSet1TableAdapters.tb_formulariosTableAdapter formularios = new DataSet1TableAdapters.tb_formulariosTableAdapter();
        DataTable tb02 = formularios.Get_select_all();
        DropDownList1.DataSource = tb02;
        DropDownList1.DataTextField = "nome";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        int id_pagina_mae = Convert.ToInt32(Request.QueryString["id"]);
        string titulo = txt_titulo.Text;
        string conteudo = FCKeditor1.Value;
        int subpagina = 1;
        string exibir = RadioButtonList2.Text;
        int galeria = Convert.ToInt32(RadioButtonList3.SelectedValue);
        int pagina_mae = id_pagina_mae;
        DateTime data = DateTime.Now.Date;
        string ordem_str = txt_ordem.Text;
        string url = txt_url.Text;
        if (ordem_str == null || ordem_str == "")
        {
            ordem_str = "0";
        }
        int ordrem = Convert.ToInt32(ordem_str);

        //string nomeArq = DateTime.Now.Ticks.ToString();
        //nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");

        string imagem = "";
        string link_imagem = "";

        int tipo_pag = Convert.ToInt32(RadioButtonList1.SelectedValue);
        int id_tipo = Convert.ToInt32(DropDownList1.SelectedValue);

        if (tipo_pag == 0)
        {
            id_tipo = 0;
        }

        DataSet1TableAdapters.tb_paginasTableAdapter insert_pagina = new DataSet1TableAdapters.tb_paginasTableAdapter();
        insert_pagina.Insertpagina(titulo, conteudo, subpagina, pagina_mae, data, ordrem,tipo_pag,imagem,link_imagem,id_tipo,exibir,url,galeria);
        Response.Write(@"<script>alert('Página gravada com sucesso!');location.href='subpaginas.aspx?id="+id_pagina_mae.ToString()+"'</script>");
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string tipo = RadioButtonList1.SelectedValue;
        if (tipo == "0")
        {
            div_conteudo = "style='display:block;'";
            div_formulario = "style='display:none;'";
            div_url = "style='display:none;'";
        }
        else if (tipo == "2")
        {

            div_conteudo = "style='display:none;'";
            div_formulario = "style='display:none;'";
            div_url = "style='display:block;'";

        }
        else if (tipo == "3")
        {

            div_conteudo = "style='display:none;'";
            div_formulario = "style='display:none;'";
            div_url = "style='display:block;'";

        }
        else
        {
            div_conteudo = "style='display:none;'";
            div_url = "style='display:none;'";
            div_formulario = "style='display:blcok;'";
        }

    }
}
