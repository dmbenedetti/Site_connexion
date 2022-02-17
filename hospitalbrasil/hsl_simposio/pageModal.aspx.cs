using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class pageModal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            //SERGINEI
            //int id = Convert.ToInt32(Request.QueryString["id"]);
            //simposioTableAdapters.tb_paginasTableAdapter paginas = new simposioTableAdapters.tb_paginasTableAdapter();
            //DataTable tb_pagina = paginas.Get_select_id(id);
            //if (tb_pagina.Rows.Count > 0)
            //{
            //    lblTitulo.Text = @"<img src='images/" + Convert.ToString(tb_pagina.Rows[0]["ds_arquivo"]) + "' />" + Convert.ToString(tb_pagina.Rows[0]["nm_pagina"]);
            //    ltrConteudo.Text = Convert.ToString(tb_pagina.Rows[0]["ds_conteudo"]);

            //}//fim do if tb_pagina
        }
    }
    
   
}