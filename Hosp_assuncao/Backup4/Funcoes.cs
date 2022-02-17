using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace HAssuncao.Util
{
    public struct Funcoes
    {
            public struct JS
            {
                public static void  Mensagem(Page pagina, string texto)
                {
                    
                    

                }

                public static string RemoverCaracteresEspeciais(string texto)
                {
                   return texto.Replace("\\","\\\\").Replace("'","\\'").Replace("r\n","\\n").Replace("\n","\\n"); 
                
                }
                public static void incluirStartUp(Page pagina, string script)
                {
                    pagina.ClientScript.RegisterStartupScript(pagina.GetType(), "jss" + DateTime.Now.Ticks, script, true);
                }
            }
   }
}