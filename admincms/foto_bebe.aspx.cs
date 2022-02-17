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
            int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
            int idHosp = Convert.ToInt32(Session["idHosp"]);
            var fotobebehosp = (from a in cnDor.TB_HOSPTIAL_FOTO_BEBE where a.id_hospital == idHosp select a).FirstOrDefault();
            if (fotobebehosp.ds_linkbanner != null)
            {
                txtLink.Text = fotobebehosp.ds_linkbanner;
                Image1.ImageUrl = "../images/foto_bebe/" + fotobebehosp.ds_banner;
            }
            //var optMenu = (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.id_sessao == 9 && a.id_hospital == idHosp && a.ds_link == "foto_bebe.aspx" select a).FirstOrDefault();
            //if (optMenu != null)
            //{
            //    txtMenu.Text = optMenu.ds_desc_menu;
            //    txtTitulo.Text = optMenu.ds_titulo;
            //    chkVisivel.Checked = optMenu.ds_visivel;
            //}   
            
        }//fim do if postback

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int idHosp = Convert.ToInt32(Session["idHosp"]);
        var fotobebehosp = (from a in cnDor.TB_HOSPTIAL_FOTO_BEBE where a.id_hospital == idHosp select a).FirstOrDefault();
        if (FileUpload1.HasFile)
        {
            string sfile = uploadimagem();
            if (sfile != "erro")
            {
                fotobebehosp.ds_banner = sfile;
            }
        }
        fotobebehosp.ds_linkbanner = txtLink.Text;
        cnDor.SaveChanges();
        txtLink.Text = fotobebehosp.ds_linkbanner;
        Image1.ImageUrl = "../images/foto_bebe/" + fotobebehosp.ds_banner;
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
    
    protected string uploadimagem()
    {
        //se selecionou uma outra imagem;
        string imagem;
        string erro_foto = "";
        string nomeArq = DateTime.Now.Ticks.ToString();
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
        nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        string autorizado1 = "";
        string caminho = Server.MapPath("~/images/foto_bebe/");
        string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        int tamanho_kb = FileUpload1.PostedFile.ContentLength;
        //verifica a extensão do arquivo.
        if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
        {
            //verifica o tamanho em kb
            if (tamanho_kb > 6553600) { autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 800 KB.<br />"; }//fim do if
        }//fim do if
        //se a extensão não for permitida grava o erro na string.
        else { autorizado1 = autorizado1 + "Imagem: Extensão não permitida.<br />"; }//fim do else
        //verifica se há algum erro.
        if (autorizado1 == "")
        {
            //salva o arquivo e exibe mensagem de sucesso.
            try
            {
                //FileInfo TheFile = new FileInfo(MapPath("../") + "/images/" + imagem);
                //File.Delete(MapPath("../") + "/images/" + imagem);
                FileUpload1.SaveAs(caminho + nomeArq);
                imagem = nomeArq;
                return imagem;
            }//fim do try
            //se houver algum erro na hora de salvar o arquivo grava na srting erro.
            catch (Exception ex)
            {
                autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                erro_foto = erro_foto + autorizado1;
                return "erro";
            }//fim do catch
        }//fim do if
        //exibe na tela se houver algum erro gravado na string erro.
        else
        {
            //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
            erro_foto = "Não foi possivel gravar este conteúdo:<br />" + erro_foto + autorizado1;
            return "erro";
        }//fim do else
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        int idHosp = Convert.ToInt32(Session["idHosp"]);
        var optMenu = (from a in cnDor.TB_CONTEUDO_PAGINA_FIXA where a.id_sessao == 9 && a.id_hospital == idHosp && a.ds_link == "foto_bebe.aspx" select a).FirstOrDefault();
        if (optMenu == null)
        {
            optMenu = new db_rede_dorModel.TB_CONTEUDO_PAGINA_FIXA();
        }
        //optMenu.ds_desc_menu = txtMenu.Text;
        //optMenu.ds_titulo = txtTitulo.Text;
        //optMenu.ds_visivel = chkVisivel.Checked;
        if (string.IsNullOrEmpty(optMenu.ds_link))
        {
            optMenu.ds_link = "foto_bebe.aspx";
            optMenu.id_hospital = idHosp;
            optMenu.id_sessao = 9;
            cnDor.AddToTB_CONTEUDO_PAGINA_FIXA(optMenu);
        }
        cnDor.SaveChanges();
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        int idHosp = Convert.ToInt32(Session["idHosp"]);
        var fotobebehosp = (from a in cnDor.TB_HOSPTIAL_FOTO_BEBE where a.id_hospital == idHosp select a).FirstOrDefault();
        fotobebehosp.ds_banner = "";
        fotobebehosp.ds_linkbanner = "";
        cnDor.SaveChanges();
        Image1.ImageUrl = "";
        txtLink.Text = "";

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("foto_bebe_criar.aspx");
    }
}