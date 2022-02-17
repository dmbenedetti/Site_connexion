using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;

namespace Connexion
{
    public class HttpModule : IHttpModule
    {
        public void Dispose()
        {

        }

        void context_EndRequest(object sender, EventArgs e)
        {

        }

        public void Init(HttpApplication context)
        {
            context.BeginRequest += new EventHandler(context_BeginRequest);
            context.EndRequest += new EventHandler(context_EndRequest);
        }

        protected void context_BeginRequest(object sender, EventArgs e)
        {

            HttpRequest request = HttpContext.Current.Request;
            Uri requestUrl = request != null ? request.Url : null;
            string originalRequestUrl, newRequestURL;

            if (request != null && requestUrl != null)
            {
                originalRequestUrl = requestUrl.AbsolutePath;
                if (request.RequestType == "GET")
                {
                    if (originalRequestUrl.IndexOf(",i,") >= 0)
                    {
                        string[] aParans;
                        aParans = originalRequestUrl.Split(',');
                        newRequestURL = String.Format("~/internas.aspx?id={0}", aParans[2].Substring(0, aParans[2].IndexOf(".")));

                         string filePath = HttpContext.Current.Server.MapPath("~/internas.aspx");
                        //HttpContext.Current.RemapHandler(PageParser.GetCompiledPageInstance(newRequestURL, filePath, HttpContext.Current));
                         HttpContext.Current.RewritePath("~/internas.aspx", "", String.Format("id={0}", aParans[2].Substring(0, aParans[2].IndexOf("."))) + "&" + request.QueryString);
         
                    }
                    else if (originalRequestUrl.IndexOf(",n,") >= 0)
                    {
                        string[] aParans;
                        aParans = originalRequestUrl.Split(',');

                        string filePath = HttpContext.Current.Server.MapPath("~/noticias_detail.aspx");
                        //HttpContext.Current.RemapHandler(PageParser.GetCompiledPageInstance(newRequestURL, filePath, HttpContext.Current));
                        HttpContext.Current.RewritePath("~/noticias_detail.aspx", "", String.Format("id={0}", aParans[2].Substring(0, aParans[2].IndexOf("."))) + "&" + request.QueryString);

                    }
                    else if (originalRequestUrl.IndexOf(",d,") >= 0)
                    {
                        string[] aParans;
                        aParans = originalRequestUrl.Split(',');

                        string filePath = HttpContext.Current.Server.MapPath("~/dynamic_page.aspx");
                        //HttpContext.Current.RemapHandler(PageParser.GetCompiledPageInstance(newRequestURL, filePath, HttpContext.Current));
                        HttpContext.Current.RewritePath("~/dynamic_page.aspx", "", String.Format("id={0}", aParans[2].Substring(0, aParans[2].IndexOf("."))) + "&" + request.QueryString);

                    }
                    else if (originalRequestUrl.IndexOf(",r,") >= 0)
                    {
                        string[] aParans;
                        aParans = originalRequestUrl.Split(',');

                        string filePath = HttpContext.Current.Server.MapPath("~/releases_detail.aspx");
                        //HttpContext.Current.RemapHandler(PageParser.GetCompiledPageInstance(newRequestURL, filePath, HttpContext.Current));
                        HttpContext.Current.RewritePath("~/releases_detail.aspx", "", String.Format("id={0}", aParans[2].Substring(0, aParans[2].IndexOf("."))) + "&" + request.QueryString);

                    }
                    else if (originalRequestUrl.IndexOf(",amr,") >= 0)
                    {
                        string[] aParans;
                        aParans = originalRequestUrl.Split(',');

                        string filePath = HttpContext.Current.Server.MapPath("~/am_revistas_detalhe.aspx");
                        //HttpContext.Current.RemapHandler(PageParser.GetCompiledPageInstance(newRequestURL, filePath, HttpContext.Current));
                        HttpContext.Current.RewritePath("~/am_revistas_detalhe.aspx", "", String.Format("id={0}", aParans[2].Substring(0, aParans[2].IndexOf("."))) + "&" + request.QueryString);

                    }
                }
            }

        }

    }
}
