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
        string titulo = txt_titulo.Text;
        string conteudo = FCKeditor1.Value;
        int subpagina = 0;
        int pagina_mae = 0;
        string exibir = RadioButtonList2.Text;
        int galeria = Convert.ToInt32(RadioButtonList3.SelectedValue);
        DateTime data = DateTime.Now.Date;
        string ordem_str = txt_ordem.Text;
        string url = txt_url.Text;
        if (ordem_str == null || ordem_str == "")
        {
            ordem_str = "0";
        }
        int ordrem = Convert.ToInt32(ordem_str);

        string nomeArq = DateTime.Now.Ticks.ToString();
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");

        string imagem = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        string link_imagem = txt_link_img.Text;

        int tipo_pag = Convert.ToInt32(RadioButtonList1.SelectedValue);
        int id_tipo = Convert.ToInt32(DropDownList1.SelectedValue);

        if (tipo_pag == 0)
        {
            id_tipo = 0;
        }

        string erro_foto = "";
        //**************************************************************************************
        if (FileUpload1.HasFile)
        {   string autorizado1 = "";
            string caminho = Server.MapPath("~/images/destaque_home/");
            string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            //string nome_foto1 = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            int tamanho_kb = FileUpload1.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {   //verifica o tamanho em kb
                if (tamanho_kb > 6553600) { autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 800 KB.<br />"; }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else { autorizado1 = autorizado1 + "Imagem: Extensão não permitida.<br />"; }//fim do else
            //verifica se há algum erro.
            if (autorizado1 == "")
            {   //salva o arquivo e exibe mensagem de sucesso.
                try
                { FileUpload1.SaveAs(caminho + imagem);
                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {   autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                    erro_foto = erro_foto + autorizado1;
                }//fim do catch
            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {   //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
                erro_foto = erro_foto + autorizado1;
            }//fim do else
        }//fim fo if
        //**************************************************************************************


        DataSet1TableAdapters.tb_paginasTableAdapter insert_pagina = new DataSet1TableAdapters.tb_paginasTableAdapter();
        insert_pagina.Insertpagina(titulo, conteudo, subpagina, pagina_mae, data, ordrem,tipo_pag,imagem,link_imagem,id_tipo,exibir,url,galeria);
        Response.Write(@"<script>alert('Página gravada com sucesso!');location.href='paginas.aspx'</script>");
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
