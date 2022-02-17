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

public partial class includes_menu_left : System.Web.UI.UserControl
{
    public string paginas_menu_left = "";
    public string sub_menu(string id_pag) { 
        string subpaginas = "";
        int id = Convert.ToInt32(id_pag);
        DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();
        DataTable tb00 = paginas.Get_select_subpagina_id_pagina_mae(id);
        int qte_subpaginas = tb00.Rows.Count;
        if (tb00.Rows.Count > 0)
        {

            subpaginas = "<div>";
            for (int i = 0; qte_subpaginas > i; i++)
            {
                int id_subpagina = Convert.ToInt32(tb00.Rows[i]["id"]);
                string titulo_subpagina = (string)tb00.Rows[i]["titulo"];
                subpaginas += "<a href='internas.aspx?id=" + id_subpagina.ToString() + "'>" + titulo_subpagina + "</a>";
            }//fim do for
            subpaginas += "</div>";
        }//fim do if
        else {
            subpaginas = "";
        
        }//fim do else


            
        return subpaginas;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();
        DataTable tb00 = paginas.Get_select_painas();
        int qte_paginas = tb00.Rows.Count;
        paginas_menu_left = "";
        for (int i = 0; qte_paginas > i; i++) {
            int id_pagina = Convert.ToInt32(tb00.Rows[i]["id"]);
            string sub_p = sub_menu(id_pagina.ToString());
            if (sub_p == "")
            {
                string titulo_pagina = (string)tb00.Rows[i]["titulo"];
                paginas_menu_left += "<div><a href='internas.aspx?id=" + id_pagina.ToString() + "'>" + titulo_pagina + "</a><h3></h3>";
                paginas_menu_left += sub_menu(id_pagina.ToString());
                paginas_menu_left += "</div>";
            }
            else { 
            string titulo_pagina = (string) tb00.Rows[i]["titulo"];
            paginas_menu_left += "<div><a href='internas.aspx?id=" + id_pagina.ToString() + "'>" + titulo_pagina + "</a><h3><a href='#'>+</a></h3>";
            paginas_menu_left += sub_menu(id_pagina.ToString());
            paginas_menu_left += "</div>";
            }
                    
                    
                
        }//fim do for
    }
}
