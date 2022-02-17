<%@ Page Language="C#" AutoEventWireup="true" CodeFile="foto_bebe_portaretrato.aspx.cs"
    Inherits="foto_bebe_portaretrato" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>
        <asp:Literal ID="ltlNomeTitulo" runat="server"></asp:Literal>
        | Espaço Baby</title>
    <style>
        body
        {
            background-color: #fff;
        }
        #content
        {
            margin: 30px auto;
            width: 780px;
        }
        p
        {
            margin: 0px;
            padding: 0px;
        }
        #photo
        {
            width: 780px;
            height: 490px;
        }
        #footer
        {
            padding-top: 20px;
            position: absolute;
            width: 780px;
            margin-top: 70px;
        }
        #left
        {
            width: 300px;
            float: left;
            padding-left: 10px;
        }
        #right
        {
            width: 90px;
            float: right;
            text-align: right;
        }
        .addthis_toolbox a, #right a
        {
            font: 12px Verdana, roboto;
            text-decoration: none;
            color: #039;
        }
        .portaretrato
        {
            width: 713px;
            height: 415px;
        }
        .portaretratofoto
        {
            width: 243px;
            height: 346px;
            float: left;
        }
        .foto
        {
            width: 230px;
            height: 330px;
            padding-top: 7px;
            padding-left: 7px;
            position: absolute;
            margin-top: -344px;
        }
        .detalhes
        {
            width: 300px;
            height: 346px;
            float: left;
            padding-top: 7px;
            padding-left: 90px;
        }
        .detalhe_interno
        {
        }
        .bebe
        {
            float: left;
            width: 214px;
            color: #74CCE5;
            font-size: 22px;
            font-weight: bold;
            margin-top: 15px;
            margin-left: 10px;
        }
        .detalhecampo
        {
            font-size: 16px;
            font-weight: ;
            color: #cccc33;
        }
        .detalhedados
        {
            font-size: 16px;
            font-weight: ;
			color: #7a7e7f;
        }
    </style>
</head>
<body>
    <div id="content">
        <div class="portaretrato" id="modura" runat="server">
            <asp:Image ID="imgMoldura" runat="server" ImageUrl="images/molduraportaretrato.jpg" />
            <div style="position: absolute; margin-top: -415px; margin-left: 67px;">
                <div class="portaretratofoto">
                    <img src="images/moldurafoto.png" />
                    <div class="foto">
                        <asp:Image Width="230" Height="330" ID="imgRetrato" runat="server" /></div>
                    <%--<div style="float: right; margin-top: -31px; z-index: 1; position: absolute; margin-left: 215px;">
                        <img src="images/urso.gif" />
                    </div>--%>
                </div>
                <div class="detalhes">
                    <div class="detalhe_interno">
                        <div style="width: 290px;">
                            <div style="float: left;">
                                <img src="images/espacobebe.JPG" /></div>
                            <div style="height: 61px; vertical-align: middle;">
                                <span class="bebe">
                                    <asp:Literal ID="ltlBebe" runat="server"></asp:Literal></span></div>
                        </div>
                        <div>
                            <br />
                            <p>
                                <span class="detalhecampo">Nascimento:&nbsp </span>
                                 <asp:Label ID="lblNascimento" runat="server" CssClass="detalhedados"></asp:Label></p>
                            <p>
                                <img src="images/transp.gif" height="4" /></p>
                            <p>
                                <span class="detalhecampo">Horário: &nbsp</span>
                                <asp:Label ID="lblHorario" runat="server" CssClass="detalhedados"></asp:Label></p>
                            <p>
                                <img src="images/transp.gif" height="4" /></p>
                            
                            
                            <p>
                                <span class="detalhecampo">Peso:&nbsp </span>
                                <asp:Label ID="lblPeso" runat="server" CssClass="detalhedados"></asp:Label></p>
                            <p>
                                <img src="images/transp.gif" height="4" /></p>
                            <p>
                                <span class="detalhecampo">Estatura:&nbsp </span>
                                <asp:Label ID="lblEstatura" runat="server" CssClass="detalhedados"></asp:Label></p>
                            <p>
                                <img src="images/transp.gif" height="4" /></p>    
                            <p>
                                <span class="detalhecampo">Nome dos pais:&nbsp </span>
                                <asp:Label ID="lblPai" runat="server" CssClass="detalhedados"></asp:Label></p>
                            <p>
                                <img src="images/transp.gif" height="4" /></p>
                            <p>
                                <span class="detalhecampo">e&nbsp</span>
                                <asp:Label ID="lblMae" runat="server" CssClass="detalhedados"></asp:Label></p>
                            <p>
                                <img src="images/transp.gif" height="4" /></p>
                            <p>
                                <span class="detalhecampo">Obstetra: &nbsp</span>
                                <asp:Label ID="lblObstetra" runat="server" CssClass="detalhedados"></asp:Label></p>
                            <p>
                                <img src="images/transp.gif" height="4" /></p>
                            <p>
                                <span class="detalhecampo">Pediatra: &nbsp</span>
                                <asp:Label ID="lblPediatra" runat="server" CssClass="detalhedados"></asp:Label></p>
                            <p>
                                <img src="images/transp.gif" height="4" /></p>
                            <p>
                                <span class="detalhecampo">Unidade: &nbsp</span>
                                <asp:Label ID="lblUnidade" runat="server" CssClass="detalhedados"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
            <div id="left">
                <div class="addthis_toolbox addthis_default_style">
                    <a title="Compartilhar" href="http://www.addthis.com/bookmark.php?v=250&amp;username=bernardocw"
                        class="addthis_button_compact">Compartilhar</a> <span class="addthis_separator">|</span>
                    <a title="Facebook" class="addthis_button_facebook"></a><a title="Twitter" class="addthis_button_twitter">
                    </a><a title="Orkut" class="addthis_button_orkut"></a><a title="Email" class="addthis_button_email">
                    </a><a title="Favorites" class="addthis_button_favorites"></a>
                </div>
            </div>
            <div>
                <div id="right">
                    <div class="addthis_toolbox addthis_default_style">
                        <a title="Print" class="addthis_button_print">&nbsp;Imprimir</a>
                    </div>
                </div>
                <script type="text/javascript">
                    var addthis_config = {
                        ui_language: "pt"
                    }
                </script>
                <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=bernardocw"></script>
            </div>
        </div>
    </div>
</body>
</html>
