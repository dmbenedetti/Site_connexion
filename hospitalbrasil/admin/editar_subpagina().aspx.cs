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
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        if (!Page.IsPostBack) {
            DataSet1TableAdapters.tb_paginasTableAdapter select_pagina = new DataSet1TableAdapters.tb_paginasTableAdapter();
            DataTable tb01 = select_pagina.Get_select_id(id);
            if (tb01.Rows.Count > 0) {
                txt_titulo.Text = (string)tb01.Rows[0]["titulo"];
                FCKeditor1.Value = (string)tb01.Rows[0]["conteudo"];
                txt_ordem.Text = tb01.Rows[0]["ordem"].ToString();
            }//fim do if tb01.rows.count
        }//fim do if Page.IsPostBack
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        int id= Convert.ToInt32(Request.QueryString["id"]);
        int id_pagina_mae = 0;
        DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();
        DataTable tb01 = paginas.Get_select_id(id);
        if (tb01.Rows.Count > 0)
        {
            id_pagina_mae = Convert.ToInt32(tb01.Rows[0]["pagina_mae"]);
        }//fim do if tb01.rows.count
        string titulo = txt_titulo.Text;
        string conteudo = FCKeditor1.Value;
        int sessao = 1;
        int subpagina = 1;
        int pagina_mae = id_pagina_mae;
        DateTime data = DateTime.Now.Date;
        string ordem_str = txt_ordem.Text;
        if (ordem_str == null || ordem_str == "")
        {
            ordem_str = "0";
        }
        int ordrem = Convert.ToInt32(ordem_str);
//        paginas.Update_pagina(titulo, conteudo, subpagina, pagina_mae, data, ordrem, id);
        Response.Write(@"<script>alert('Página Editada com Sucesso!');location.href='subpaginas.aspx?id="+id_pagina_mae+"'</script>");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        int id_pagina_mae =0;
        DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();
        DataTable tb01 = paginas.Get_select_id(id);
        if (tb01.Rows.Count > 0)
        {
            id_pagina_mae = Convert.ToInt32(tb01.Rows[0]["pagina_mae"]);
        }//fim do if tb01.rows.count
        Response.Redirect("subpaginas.aspx?id="+id_pagina_mae);
    }
}
