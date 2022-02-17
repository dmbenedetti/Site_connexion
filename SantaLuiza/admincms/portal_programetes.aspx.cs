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

            var programete = cnDor.TB_PORTAL_PROGRAMETES.Where(x => x.id_status == 1).Select(x => new {
                x.nm_titulo,
                x.id_programete
            }).ToList();
            GridView1.DataSource = programete;
            GridView1.DataBind();

            var texto = cnDor.TB_PORTAL_PROGRAMETES_TEXTO.Where(x => x.id_programete == 1).FirstOrDefault();
            TextBox1.Text = texto.ds_texto;


            var destaque = cnDor.TB_PORTAL_PROGRAMETES_DESTAQUE.Where(x => x.id_programete == 1).FirstOrDefault();
            TextBox3.Text = destaque.nm_titulo;
            TextBox2.Text = destaque.ds_video;
            ltr_video.Text = destaque.ds_video;
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
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("");
    }
    protected void btn_texto_Click(object sender, EventArgs e)
    {
        var texto = cnDor.TB_PORTAL_PROGRAMETES_TEXTO.Where(x => x.id_programete == 1).FirstOrDefault();
        texto.ds_texto = TextBox1.Text;
        cnDor.SaveChanges();
        Response.Redirect("portal_programetes.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        var destaque = cnDor.TB_PORTAL_PROGRAMETES_DESTAQUE.Where(x => x.id_programete == 1).FirstOrDefault();
        destaque.nm_titulo = TextBox3.Text;
        destaque.ds_video = TextBox2.Text;
        cnDor.SaveChanges();
        Response.Redirect("portal_programetes.aspx");
        }
}