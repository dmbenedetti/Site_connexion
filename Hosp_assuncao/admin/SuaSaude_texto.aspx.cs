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
        if (!Page.IsPostBack) {
            DataSet1TableAdapters.tb_texto_dnaTableAdapter select_pagina = new DataSet1TableAdapters.tb_texto_dnaTableAdapter();
            DataTable tb01 = select_pagina.Get_select_texto();
            if (tb01.Rows.Count > 0) {
                FCKeditor1.Value = (string)tb01.Rows[0]["conteudo"];
           }//fim do if tb01.rows.count
        }//fim do if Page.IsPostBack
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        DataSet1TableAdapters.tb_texto_dnaTableAdapter editar_pagina = new DataSet1TableAdapters.tb_texto_dnaTableAdapter();
        string conteudo = FCKeditor1.Value;
        
        editar_pagina.Update_texto(conteudo);
        Response.Write(@"<script>alert('Página Editada com Sucesso!');location.href='SuaSaude_texto.aspx'</script>");
    }
    
}
