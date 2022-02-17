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

public partial class admin_Fotobb_texto : System.Web.UI.Page
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
        if (!Page.IsPostBack) {
            DateTime data_hoje = DateTime.Now.Date;
            data_hoje = data_hoje.AddDays(30);
            txt_data.Text = data_hoje.ToString("dd/MM/yyyy");
        }//fim do if page.ispostback

    }


    public string verifica_codigo(string codigo) {

        DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
        DataTable tb_fotos = fotos.Get_select_codigo(codigo);
        if (tb_fotos.Rows.Count > 0)
        {
            return "falso";
        }
        else {
            return "ok";
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string codigo = txt_codigo.Text.ToUpper();
        string nome_mae = txt_nome_mae.Text;
        string nome_pai = txt_nome_pai.Text;
        string nome_bb = txt_nome_bb.Text;
        string peso = txt_peso.Text;
        string altura = txt_altura.Text;
        DateTime data_hoje = DateTime.Now.Date ;
        /* Convertendo a data*/
        /********************************************************/
        string data_temp = txt_data.Text;
        string dia = data_temp.Remove(2);
        string mes = data_temp.Substring(3).Remove(2);
        string ano = data_temp.Substring(6);
        //string data = mes + "/" + dia + "/" + ano;
        string data = ano + "/" + mes + "/" + dia;
        DateTime data_saida = Convert.ToDateTime(data);
        /********************************************************/
        int status = 1;
        string verificar_codigo = verifica_codigo(codigo);


        string foto1 = "";
        string foto2 = "";
        string erro_foto = "";

        string nomeArq1 = DateTime.Now.Ticks.ToString();
        nomeArq1 = GetStringNoAccents(nomeArq1).Replace(" ", "_");
        nomeArq1 = "1_" + nomeArq1 + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

        string nomeArq2 = DateTime.Now.Ticks.ToString();
        nomeArq2 = GetStringNoAccents(nomeArq2).Replace(" ", "_");
        nomeArq2 = "2_"+nomeArq2 + System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();


        //**************************************************************************************
        if (FileUpload1.HasFile)
        {
            string autorizado1 = "";
            string caminho = Server.MapPath("~/fotosbb/");
            string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            //string nome_foto1 = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            int tamanho_kb = FileUpload1.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em kb
                if (tamanho_kb > 307200) { autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 300 KB.<br />"; }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else { autorizado1 = autorizado1 + "Foto1: Extensão não permitida.<br />"; }//fim do else
            //verifica se há algum erro.
            if (autorizado1 == "")
            {
                foto1 = nomeArq1;
                FileUpload1.SaveAs(caminho + foto1);
                erro_foto += "";
            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {
                //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
                erro_foto += autorizado1;
            }//fim do else

        }//fim do if
        else
        {
            erro_foto += "Foto 1 não selecionada<br />";
        }//fim do else
        //**************************************************************************************
        //**************************************************************************************
        if (FileUpload2.HasFile)
        {
            string autorizado2 = "";
            string caminho = Server.MapPath("~/fotosbb/");
            string extensao = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
            int tamanho_kb = FileUpload2.PostedFile.ContentLength;
            //verifica a extensão do arquivo.
            if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
            {
                //verifica o tamanho em kb
                if (tamanho_kb > 6553600) { autorizado2 = autorizado2 + "Foto2: Não São permitidos arquivos maiores que 800 KB.<br />"; }//fim do if
            }//fim do if
            //se a extensão não for permitida grava o erro na string.
            else { autorizado2 = autorizado2 + "Foto2: Extensão não permitida.<br />"; }//fim do else
            //verifica se há algum erro.
            if (autorizado2 == "")
            {
                foto2 = nomeArq2;
                FileUpload2.SaveAs(caminho + foto2);
                erro_foto += "";
            }//fim do if
            //exibe na tela se houver algum erro gravado na string erro.
            else
            {
                //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
                erro_foto += autorizado2;
            }//fim do else

        }//fim do if
        else
        {
            //erro_foto += "Foto 1 não selecionada";
        }//fim do else
        //**************************************************************************************
        if (verificar_codigo == "falso") {
            erro_foto += "A Senha digitada já está sendo utilizada em outro cadastro.<br />Por favor digite outra senha";
        }
        if (erro_foto == "")
        {
            DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
            fotos.Insert_fotobb(codigo, nome_bb, nome_mae, nome_pai, foto1, foto2, data_hoje, data_saida, status,peso,altura);
            Response.Write(@"<script>alert('Fotos cadastrada com Sucesso');location.href='Fotobb_fotos.aspx'</script>");
        }
        else {
            lbl_msg.Text = erro_foto;
        }
    }
}
