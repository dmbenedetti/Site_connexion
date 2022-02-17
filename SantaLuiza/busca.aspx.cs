using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class busca : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int idHosp = Convert.ToInt32(Session["idHosp"]);
            string termo = "";
            termo = iFonetizar.Fonetizar(Request["wrd"]);
            var resultado = (from j in (from v in cnDor.TB_PORTAL_CONTEUDO join w in cnDor.TB_PORTAL_CONTEUDO_HOSPITAL on v.id_conteudo equals w.id_conteudo into _a from a in _a.DefaultIfEmpty() 
                             select new {id_conteudo = v.id_conteudo,  id_hospital = v.id_hospital, id_idioma = v.id_idioma, id_noticia = v.id_noticia, 
                                         id_sessao = v.id_sessao, id_status = v.id_status, id_tipo = v.id_tipo, nm_titulo = v.nm_titulo, nm_titulo_fonetico = v.nm_titulo_fonetico,
                                         nr_edicaorevista = v.nr_edicaorevista, ds_conteudo = v.ds_conteudo, ds_conteudo_fonetico = v.ds_conteudo_fonetico, 
                                         ds_imgDestaque = v.ds_imgDestaque, ds_resumo = v.ds_resumo, ds_resumo_fonetico = v.ds_resumo_fonetico, ds_url = v.ds_url, dt_conteudo = v.dt_conteudo,
                                         id_hospital_ls = a.id_hospital == null ? 0 : a.id_hospital }).ToList()
                             where (j.nm_titulo_fonetico.IndexOf(termo) > -1 || j.ds_resumo_fonetico.IndexOf(termo) > -1 || j.ds_conteudo_fonetico.IndexOf(termo) > -1) && j.id_status == 1 && j.id_idioma == 1 && (j.id_hospital == idHosp || j.id_hospital_ls == idHosp)
                             select j).ToList();
            ListView1.DataSource = resultado;
            ListView1.DataBind();
        }
    }

    protected string image(object imagem, int idHosp)
    {
        if (Convert.IsDBNull(imagem) || string.IsNullOrEmpty((string)imagem))
        {
            return "images/campanhas_publicitarias/destaque_default.jpg";
        }
        string sURL = "";
        switch (idHosp)
        {
            case 1:
                sURL = "images/campanhas_publicitarias/" + imagem;
                break;
            case 2:
                sURL = "images/unidades/" + imagem;
                break;
            case 3:
                sURL = "images/sua_saude/" + imagem;
                break;
            case 4:
                sURL = "images/iep/" + imagem;
                break;
            case 5:
                sURL = "images/noticias/" + imagem;
                break;
            case 6:
                sURL = "images/campanhas_publicitarias/" + imagem;
                break;
            case 7:
                sURL = "images/campanhas_publicitarias/" + imagem;
                break;
            case 8:
                sURL = "images/campanhas_publicitarias/" + imagem;
                break;
            case 9:
                sURL = "images/campanhas_publicitarias/" + imagem;
                break;


        }
        return sURL;
    }

    protected string url(string id, int idTipo, int idHosp, string Titulo)
    {
        Titulo = Server.UrlEncode(Titulo);
        string sURL = "";
        switch (idHosp)
        {
            case 1:
                switch (idTipo) {
                    case 1:
                        sURL = "ogrupo_page.aspx?id=" + id;
                        break;
                    case 4:
                        sURL = "campanha_detail.aspx?id=" + id;
                        break;
                }
                break;
            case 2:
                break;
            case 3:
                switch (idTipo)
                {
                    case 1:
                        sURL = "espaco_saude_page.aspx?id=" + id;
                        break;
                    case 12:
                        sURL = "sua_saude_detail.aspx?id=" + id;
                        break;
                }
                break;
            case 4:
                switch (idTipo)
                {
                    case 1:
                        sURL = "iep.aspx?id=" + id;
                        break;
                    case 13:
                        sURL = "iep_dor.aspx#" + id;
                        break;
                    case 14:
                        sURL = "iep_iep.aspx#" + id;
                        break;
                    case 15:
                        sURL = "iep_suade_publica.aspx#" + id;
                        break;
                    case 16:
                        sURL = "iep_sluiz.aspx#" + id;
                        break;
                }
                break;

            case 5:
                switch (idTipo) {
                    case 1:
                        sURL = Titulo + ",d," + id + ".aspx";
                        break;
                    case 5:
                        sURL = Titulo + ",n," + id + ".aspx";
                        break;
                    case 6:
                        sURL = Titulo + ",r," + id + ".aspx";
                        break;
                }
                break;
            case 6:
                break;
            case 7:
                break;
            case 8:
                sURL =  Titulo + ",d," + id + ".aspx";
                break;
            case 9:
                sURL = Titulo + ",d," + id + ".aspx";
                break;
        }
        return sURL; 

    }
}