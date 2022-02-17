<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
    <link rel="stylesheet" href="responsiveslides.css" />
    <link rel="stylesheet" href="themes.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="responsiveslides.min.js"></script>
    <script type="text/javascript">
        // You can also use "$(window).load(function() {"
        $(function () {

            // Slideshow 1
            $("#slider1").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 1500,
                maxwidth: 940,
                namespace: "centered-btns"
            });

        });

        function OpenUnidade() {
             var a = document.getElementById("ContentPlaceHolder1_drpUnidades");

            window.open(a.value, "");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="slider">
        <!--<img src="images/slider.jpg" />-->
        <!-- Slideshow 1 -->
        <div class="rslides_container">
            <ul class="rslides" id="slider1">
                <asp:Literal ID="ltl_slider" runat="server"></asp:Literal>
            </ul>
        </div>
    </div>
    <div id="lead">
        <img src="<%= banner1 %>" />
        <nav id="caption">        
          	<ul>
                <li><img src="images/rsl.gif" class="<%= banner1_css %>" /></li>
                <li><a href="<%= banner1_link %>" <%= banner1_link.IndexOf("http") > -1 && banner1_link.IndexOf(dominio) == -1 ? "target='_blank'" : "" %>><%= banner1_desc %></a></li>
            </ul>
        </nav>
    </div>
    <div id="lead">
        <img src="<%= banner2 %>" />
        <nav id="caption">        
          	<ul>
                <li><img src="images/rsl.gif" class="<%= banner2_css %>" /></li>
                <li><a href="<%= banner2_link %>" <%= banner2_link.IndexOf("http") > -1 && banner2_link.IndexOf(dominio) == -1 ? "target='_blank'" : "" %>><%= banner2_desc %></a></li>
            </ul>
        </nav>
    </div>
    <div id="lead">
        <img src="<%= banner3 %>" />
        <nav id="caption">        
          	<ul>
                <li><img src="images/rsl.gif" class="<%= banner3_css %>" /></li>
                <li><a href="<%= banner3_link %>" <%= banner3_link.IndexOf("http") > -1 && banner3_link.IndexOf(dominio) == -1 ? "target='_blank'" : "" %>><%= banner3_desc %></a></li>
            </ul> 
        </nav>
    </div>
    <div id="lead2">
        <img src="<%= banner4 %>" />
        <nav id="caption">        
          	<ul>
                <li><img src="images/rsl.gif" class="<%= banner4_css %>" /></li>
                <li><a href="<%= banner4_link %>" <%= banner4_link.IndexOf("http") > -1 && banner4_link.IndexOf(dominio) == -1 ? "target='_blank'" : "" %>><%= banner4_desc %></a></li>
            </ul>
        </nav>
    </div>
    <div id="lead">
        <img src="<%= banner5 %>" />
        <nav id="caption">        
          	<ul>
                <li><img src="images/rsl.gif" class="<%= banner5_css %>" /></li>
                <li><a href="<%= banner5_link %>" <%= banner5_link.IndexOf("http") > -1 && banner5_link.IndexOf(dominio) == -1 ? "target='_blank'" : "" %>><%= banner5_desc %></a></li>
            </ul>
        </nav>
    </div>
    <div id="lead">
        <img src="<%= banner6 %>" />
        <nav id="caption">        
          	<ul>
                <li><img src="images/rsl.gif" class="<%= banner6_css %>" /></li>
                <li><a href="<%= banner6_link %>" <%= banner6_link.IndexOf("http") > -1 && banner6_link.IndexOf(dominio) == -1 ? "target='_blank'" : "" %>><%= banner6_desc %></a></li>
            </ul>
        </nav>
    </div>
    <div id="lead">
        <img src="<%= banner7 %>" />
        <nav id="caption">        
          	<ul>
                <li><img src="images/rsl.gif" class="<%= banner7_css %>" /></li>
                <li><a href="<%= banner7_link %>" <%= banner7_link.IndexOf("http") > -1 && banner7_link.IndexOf(dominio) == -1 ? "target='_blank'" : "" %>><%= banner7_desc %></a></li>
            </ul> 
        </nav>
    </div>
    <div id="lead2">
        <img src="<%= banner8 %>" />
        <nav id="caption">        
          	<ul>
                <li><img src="images/rsl.gif" class="<%= banner8_css %>" /></li>
                <li><a href="<%= banner8_link %>" <%= banner8_link.IndexOf("http") > -1 && banner8_link.IndexOf(dominio) == -1 ? "target='_blank'" : "" %>><%= banner8_desc %></a></li>
            </ul>
        </nav>
    </div>
    <div id="ultimas_noticias">
        <div id="tile">
            últimas notícias</div>
        <asp:Repeater ID="rptNoticias" runat="server" DataSourceID="ds_noticias">
            <ItemTemplate>
                <div id="feed">
                    <div id="image">
                        <img src="images/noticias/<%# Eval("imagem") %>" width="70" /></div>
                    <div id="description">
                        <a href="<%# Server.UrlEncode(Eval("nm_titulo").ToString().Replace(":","_").Replace("?","")).Replace("+","_")%>,n,<%# Eval("id_conteudo") %>.aspx">
                            <%# Eval("nm_titulo")%></a> <font class="feed_date">
                                <%# Convert.ToDateTime(Eval("dt_conteudo")).ToString("dd/MM/yyyy")%></font>
                        <%# Eval("ds_resumo").ToString().Substring(0, Eval("ds_resumo").ToString().Length > 150 ? 150 : Eval("ds_resumo").ToString().Length) + (Eval("ds_resumo").ToString().Length > 150 ? "..." : "")%>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <p>
            <a href="noticias.aspx">LEIA + NOTÍCIAS</a></p>
    </div>
    <div id="trabalhe">
        <div id="image">
            <img src="images/trabalhe.jpg" /></div>
        <div id="description">
            <div id="tile">
                trabalhe conosco</div>
            <p>
                A Rede D'Or São Luiz busca talentos que estejam alinhados aos valores da instituição.</p>
            <p>
                <a href="http://zeus.e-hunter.com.br/rededor/view/frameset.asp" target="_blank">Acesse nosso Portal </a><a href="http://zeus.e-hunter.com.br/rededor/view/frameset.asp"></a> e conheça as vagas disponíveis.</p>

        </div>
    </div>
    <div id="newsletter">
        <div id="image">
            <img src="images/Newsletter_CopaDor.jpg" /></div>
        <div id="description">
            <div id="tile">
                receba nossa newsletter</div>
            <asp:TextBox ID="txt_newsletter" runat="server" CssClass="inputDefault"></asp:TextBox>
            <asp:Button AlternateText="Cadastrar" ID="ImageButton1" 
                CssClass="buttonDefault" runat="server" Text="Cadastrar" 
                onclick="ImageButton1_Click1" />
        </div>
    </div>
    <div id="unidades">
        <div id="tile">
            Conheça outras Unidades Rede D'Or São Luiz</div>
        <asp:DropDownList ID="drpUnidades" runat="server" CssClass="inputDefault" DataSourceID="SqlDataSource1" DataTextField="nm_hospital" DataValueField="ds_site_hospital" onchange="OpenUnidade()" ></asp:DropDownList>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="SELECT ' Selecione uma unidade' nm_hospital, '' ds_site_hospital UNION SELECT [nm_hospital], [ds_site_hospital] FROM [TB_HOSPITAL] WHERE id_status = 1 ORDER BY [nm_hospital]">
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_noticias" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="SELECT top 3 a.[id_conteudo], [nm_titulo], [dt_conteudo], [id_noticia], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] a INNER JOIN [TB_PORTAL_CONTEUDO_HOSPITAL] b ON a.id_conteudo = b.id_conteudo WHERE (([id_tipo] = @id_tipo) AND ([id_sessao] = @id_sessao) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma) AND b.id_hospital = @idHosp) order by dt_conteudo desc">
        <SelectParameters>
            <asp:Parameter DefaultValue="5" Name="id_sessao" Type="Int32" />
            <asp:Parameter DefaultValue="5" Name="id_tipo" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
            <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
