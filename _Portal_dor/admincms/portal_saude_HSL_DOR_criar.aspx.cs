using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admincms_ogrupo : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

           
                          

        }//fim do if postback

    }
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
    protected void Button1_Click1(object sender, EventArgs e)
    {
        int tema = Convert.ToInt32(DropDownList1.SelectedValue);
        int especialista = Convert.ToInt32(DropDownList2.SelectedValue);
        db_rede_dorModel.TB_PORTAL_SAUDE_HSL_DOR novo = new db_rede_dorModel.TB_PORTAL_SAUDE_HSL_DOR();
        novo.nm_titulo = TextBox1.Text;
        novo.id_tema = tema;
        novo.id_espedcialista = especialista;
        novo.id_status = 1;

        try
        {
            if (FileUpload1.HasFile)
            {
                //se selecionou uma outra imagem;
                string imagem;
                string erro_foto = "";
                string autorizado1 = "";
                string nomeArq = DateTime.Now.Ticks.ToString();
                nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
                nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string caminho = "../podcast/";
                string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                int tamanho_kb = FileUpload1.PostedFile.ContentLength;
                //verifica a extensão do arquivo.
                if (extensao == ".mp3" )
                {
                    //verifica o tamanho em kb
                    if (tamanho_kb > 6291456) { autorizado1 = autorizado1 + "Áudio: Não São permitidos arquivos maiores que 6 MB.<br />"; }//fim do if
                }//fim do if
                //se a extensão não for permitida grava o erro na string.
                else { autorizado1 = autorizado1 + "Áudio: Extensão não permitida.<br />"; }//fim do else
                //verifica se há algum erro.
                if (autorizado1 == "")
                {
                    string url = Server.MapPath(caminho);
                    FileUpload1.SaveAs(url + nomeArq);
                    novo.ds_audio = nomeArq;
                    cnDor.AddToTB_PORTAL_SAUDE_HSL_DOR(novo);
                    cnDor.SaveChanges();
                    Response.Write(@"<script>alert('Áudio Inserido com sucesso.');location.href='portal_saude_HSL_DOR.aspx'</script>");
                    
                }//fim do if
                //exibe na tela se houver algum erro gravado na string erro.
                else
                {
                    erro_foto = "Não foi possivel gravar este conteúdo:<br />" + erro_foto + autorizado1;
                }//fim do else
            }//fim do if FileUpload1.HasFile
            
        }
        catch (Exception ex)
        {
            lbl_erro.Text = ex.Message;
        }
    }
    protected void DropDownList1_PreRender(object sender, EventArgs e)
    {
        DropDownList1.Items.Remove("");
        DropDownList1.Items.Insert(0, "");
    }
    protected void DropDownList2_PreRender(object sender, EventArgs e)
    {
        DropDownList2.Items.Remove("");
        DropDownList2.Items.Insert(0, "");
    }
}