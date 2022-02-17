using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class admincms_ogrupo : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            int id = Convert.ToInt32(Request.QueryString["id"]);
            var audio = cnDor.TB_PORTAL_SAUDE_HSL_DOR.Where(x => x.id_saude == id).FirstOrDefault();
            if (audio != null) {
                lbl_titulo.Text = audio.nm_titulo;
                lbl_tema.Text = audio.TB_PORTAL_TEMA.nm_tema;
                lbl_especialista.Text =  audio.TB_PORTAL_ESPECIALISTA.nm_especialista;
            }//fim do if audio  

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
        int id = Convert.ToInt32(Request.QueryString["id"]);
        var audio = cnDor.TB_PORTAL_SAUDE_HSL_DOR.Where(x => x.id_saude == id).FirstOrDefault();
        if (audio != null) { 
            try
            {
                
                    
                        string imagem_old = audio.ds_audio;
                        FileInfo TheFile = new FileInfo(MapPath("../") + "/podcast/" + imagem_old);
                        File.Delete(MapPath("../") + "/podcast/" + imagem_old);
                        cnDor.DeleteObject(audio);
                        cnDor.SaveChanges();
                        Response.Write(@"<script>alert('Dados Excluidos com sucesso.');location.href='portal_saude_HSL_DOR.aspx'</script>");
            }
            catch (Exception ex)
            {
                lbl_erro.Text = ex.Message;
            }
        }//fim do if audio
    }
}