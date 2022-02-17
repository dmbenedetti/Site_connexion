using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_carga : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        var lista = (from v in cnDor.TB_PORTAL_CONTEUDO select v);
        foreach (db_rede_dorModel.TB_PORTAL_CONTEUDO item in lista)
        {
            item.ds_conteudo_fonetico = iFonetizar.Fonetizar(item.ds_conteudo);
            item.ds_resumo_fonetico = iFonetizar.Fonetizar(item.ds_resumo);
            item.nm_titulo_fonetico = iFonetizar.Fonetizar(item.nm_titulo);
        }
        cnDor.SaveChanges();
    }
}