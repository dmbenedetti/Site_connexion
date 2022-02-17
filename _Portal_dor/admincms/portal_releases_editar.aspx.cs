using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{
    int sessao_site = 5;//Imprensa
    int tipo = 6;//release

    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string id_user = Convert.ToString(Session.Contents["iduser"]);
            int user = Convert.ToInt32(id_user);
            int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
            int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);

            var ls = (from p in cnDor.TB_PERMISSAO_ADMIN
                      join h in cnDor.TB_HOSPITAL on p.id_hospital equals h.id_hospital
                      where p.id_user == user
                      select new { h.nm_hospital, h.id_hospital }).ToList();
            ListItem oitem;
            foreach (var l in ls)
            {
                oitem = new ListItem();
                oitem.Text = l.nm_hospital;
                oitem.Value = l.id_hospital.ToString();

                chb_hospitais.Items.Add(oitem);
            }

            //chb_hospitais.DataSource = cnDor.TB_HOSPITAL.Where(x => x.id_status == 1 && x.id_hospital !=1).ToList();
            //chb_hospitais.DataTextField = "nm_hospital";
            //chb_hospitais.DataValueField = "id_hospital";
            chb_hospitais.DataBind();
            foreach (var a in (from p in cnDor.TB_PORTAL_CONTEUDO_HOSPITAL where p.id_conteudo == id_conteudo select p))
            {
                try
                {
                    chb_hospitais.Items.FindByValue(a.id_hospital.ToString()).Selected = true;
                }
                catch { }
            }


            var noticia = (from n in cnDor.TB_PORTAL_CONTEUDO
                               where n.id_conteudo==id_conteudo && n.id_noticia==id_noticia
                               select n).FirstOrDefault();
            txt_titulo.Text = noticia.nm_titulo;
            txt_resumo.Text = noticia.ds_resumo;
            DateTime data = Convert.ToDateTime(noticia.dt_conteudo);
            txt_data.Text = data.ToString("dd/MM/yyyy");
            FCKeditor1.Value = noticia.ds_conteudo;


        }//fim do if !Page.IsPostBack
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

        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        int id_noticia = Convert.ToInt32(Request.QueryString["id_not"]);
        
        int usuario = Convert.ToInt32(Session.Contents["iduser"]);
        DateTime data = Convert.ToDateTime(txt_data.Text);
        string titulo = txt_titulo.Text;
        string resumo = txt_resumo.Text;
        string conteudo = FCKeditor1.Value;
        string imagem = "";
        bool erro = false;
            try
            {
                var noticia = (from n in cnDor.TB_PORTAL_CONTEUDO where n.id_conteudo == id_conteudo && n.id_noticia == id_noticia select n).FirstOrDefault();
                noticia.nm_titulo = txt_titulo.Text;
                noticia.ds_resumo = txt_resumo.Text;
                noticia.dt_conteudo = data;
                noticia.ds_conteudo = FCKeditor1.Value;
                noticia.nm_titulo_fonetico = iFonetizar.Fonetizar(noticia.nm_titulo, false);
                noticia.ds_resumo_fonetico = iFonetizar.Fonetizar(noticia.ds_resumo, false);
                noticia.ds_conteudo_fonetico = iFonetizar.Fonetizar(noticia.ds_conteudo, false);
                cnDor.SaveChanges();
                var conteudo_hosptial = (from v in cnDor.TB_PORTAL_CONTEUDO_HOSPITAL where v.id_conteudo == noticia.id_conteudo select v);
                foreach (var ch in conteudo_hosptial)
                {
                    cnDor.DeleteObject(ch);
                }
                db_rede_dorModel.TB_PORTAL_CONTEUDO_HOSPITAL ohospital;
                foreach (ListItem oitem in chb_hospitais.Items)
                {
                    if (oitem.Selected)
                    {
                        ohospital = new db_rede_dorModel.TB_PORTAL_CONTEUDO_HOSPITAL();
                        ohospital.id_conteudo = noticia.id_conteudo;
                        ohospital.id_hospital = Convert.ToInt32(oitem.Value);
                        cnDor.AddToTB_PORTAL_CONTEUDO_HOSPITAL(ohospital);
                    }
                }
                cnDor.SaveChanges();
                    
                   /* //
                     * 
                     * voltar aqui para fazer o insert da notícia na tabela de hospitais;
                     *
                     * 
                     *location.href='portal_noticias.aspx'
                    * */
                //provavelmente o ACT está dando conflito com a linha abaixo, resolvi fazendo o response.write na linha seguinte
                //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Dados Gravados com sucesso');location.href='portal_noticias.aspx'", true);
                Response.Write(@"<script>alert('Dados Gravados com sucesso');location.href='portal_releases.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }
    }

    
}