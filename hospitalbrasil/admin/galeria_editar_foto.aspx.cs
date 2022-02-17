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

public partial class admin_galeria_excluir_foto : System.Web.UI.Page
{
    public string nome_pagina;
    public int id_prod_banco;
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

    public string carregadados(string id)
    {
        int id_pag = Convert.ToInt32(id);
        DataSet1TableAdapters.tb_galeriaTableAdapter delete_foto = new DataSet1TableAdapters.tb_galeriaTableAdapter();
        DataTable tb2 = delete_foto.Get_select_id(id_pag);


        if (tb2.Rows.Count > 0)
        {
            nome_pagina = (string)tb2.Rows[0]["nome_arquivo"];

            txt_titulo.Text = (string)tb2.Rows[0]["titulo"]; ;
            img.ImageUrl = "~/images/galeria/" + nome_pagina;
            //id_prod_banco = (int)tb2.Rows[0]["id_prod"];
        }



        return "ok";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string id_pag = Request["id"];
        if (!Page.IsPostBack)
        {
            carregadados(id_pag);
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {


        string id_pag1 = Request["id"];
        int id_pag = Convert.ToInt32(id_pag1);
        string titulo = txt_titulo.Text;
        string nome_foto = "";
        int id_paginas = 0;
        DataSet1TableAdapters.tb_galeriaTableAdapter foto = new DataSet1TableAdapters.tb_galeriaTableAdapter();
        DataTable tb2 = foto.Get_select_id(id_pag);
        if (tb2.Rows.Count > 0)
        {
            nome_foto = (string)tb2.Rows[0]["nome_arquivo"];
            id_paginas = Convert.ToInt32(tb2.Rows[0]["id_pg"]);
        }
        string foto1 = "";
        string erro_foto = "";
        string nomeArq = "img" + DateTime.Now.Ticks.ToString();
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");

        //**************************************************************************************
        // FOTO 1
        //verifica se há algum arquivo postado na foto2
        if (fupfoto.HasFile)
        {
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/galeria/");
            string extensao = System.IO.Path.GetExtension(fupfoto.FileName).ToLower();
            string nome_foto1 = nomeArq + System.IO.Path.GetExtension(fupfoto.FileName).ToLower();
            int tamanho_kb = fupfoto.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em kb
                if (tamanho_kb > 204800)
                {
                    autorizado1 = autorizado1 + "Foto: Não São permitidos arquivos maiores que 200 KB.<br />";

                }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else
            {
                autorizado1 = autorizado1 + "Foto: Extensão não permitida.<br />";
            }//fim do else


            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                //salva o arquivo e exibe mensagem de sucesso.
                try
                {
                    FileInfo TheFile = new FileInfo(MapPath("../") + "/images/galeria/" + nome_foto);
                    File.Delete(MapPath("../") + "/images/galeria/" + nome_foto);


                    fupfoto.SaveAs(caminho + nome_foto1);
                    foto1 = nome_foto1;
                }//fim do try
                //se houver algum erro na hora de salvar o arquivo grava na srting erro.
                catch (Exception ex)
                {
                    autorizado1 = autorizado1 + "Foto: " + ex.Message + "<br />";
                    erro_foto = erro_foto + autorizado1;
                }//fim do catch

            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {

                //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
                erro_foto = erro_foto + autorizado1;
            }//fim do else

        }//fim fo if
        //se não houver produto postado no foto1
        else
        {
            foto1 = nome_foto;
        }
        //**************************************************************************************
        if (erro_foto == "")
        {
            foto.UpdateFoto(foto1,titulo,id_pag);
            Response.Write(@"<script>alert('Foto Editada com sucesso');location.href='editar_galerias.aspx?id=" + Convert.ToString(id_paginas) + "'</script>");
        }
        else
        {
            lblmsg.Text = erro_foto;
        }
    }
}
