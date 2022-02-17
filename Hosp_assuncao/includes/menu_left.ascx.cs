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

            subpaginas = "<ul>";
            for (int i = 0; qte_subpaginas > i; i++)
            {
                int id_subpagina = Convert.ToInt32(tb00.Rows[i]["id"]);
                string titulo_subpagina = (string)tb00.Rows[i]["titulo"];
                int tipo = Convert.ToInt32(tb00.Rows[i]["tipo"]);
                string url = (string)tb00.Rows[i]["url"];
                if (tipo == 2) {
                    subpaginas += "<li><a href='internas.aspx?id=" + id_subpagina.ToString() + "' target='_blank'>" + titulo_subpagina + "</a></li>";
                }
                else if (tipo == 3)
                {
                    subpaginas += "<li><a href='" + url + "'>" + titulo_subpagina + "</a></li>";
                }
                else { 
                subpaginas += "<li><a href='internas.aspx?id=" + id_subpagina.ToString() + "'>" + titulo_subpagina + "</a></li>";
                }
            }//fim do for
            subpaginas += "</ul>";
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
            string url = (string)tb00.Rows[i]["url"];
            string sub_p = sub_menu(id_pagina.ToString());
            if (sub_p == "")
            {
                string titulo_pagina = (string)tb00.Rows[i]["titulo"];
                int tipo = Convert.ToInt32(tb00.Rows[i]["tipo"]);
                if (tipo == 2) {
                    paginas_menu_left += "<li><a href='internas.aspx?id=" + id_pagina.ToString() + "' target='_blank'>" + titulo_pagina + "</a>";
                }
                    else if (tipo == 3) {
                    paginas_menu_left += "<li><a href='" + url + "'>" + titulo_pagina + "</a>";
                }
                else
                {
                    paginas_menu_left += "<li><a href='internas.aspx?id=" + id_pagina.ToString() + "'>" + titulo_pagina + "</a>";
                }
                paginas_menu_left += sub_menu(id_pagina.ToString());
                paginas_menu_left += "</li>";
            }
            else { 
            string titulo_pagina = (string) tb00.Rows[i]["titulo"];

                int tipo = Convert.ToInt32(tb00.Rows[i]["tipo"]);
                if (tipo == 2) {
                    paginas_menu_left += "<li><a href='internas.aspx?id=" + id_pagina.ToString() + "'  target='_blank'>" + titulo_pagina + "<span style='text-align:right;float:right;'>+</span></a>";
                }
                if (tipo == 3)
                {
                    paginas_menu_left += "<li><a href='" + url + "'  >" + titulo_pagina + "<span style='text-align:right;float:right;'>+</span></a>";
                } 
                else { 
            paginas_menu_left += "<li><a href='internas.aspx?id=" + id_pagina.ToString() + "'>" + titulo_pagina + "<span style='text-align:right;float:right;'>+</span></a>";
           }
                paginas_menu_left += sub_menu(id_pagina.ToString());
            paginas_menu_left += "</li>";
            }
                    
                    
                
        }//fim do for
    }
}
