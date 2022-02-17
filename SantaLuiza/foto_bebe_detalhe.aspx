<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="foto_bebe_detalhe.aspx.cs" Inherits="foto_bebe_detalhe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel='stylesheet' type='text/css' href='css/BabySearch.css' />
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container_interna">
        <h1>Espaço Baby</h1>
       
        
        <div id="bbsearch_Item">
        	<div id="bbsearch_imagem">
            	<asp:Image ID="imgBebe" runat="server" />
            </div>
            <div id="bbsearch_descricao">
            	<span class="bbsearch_TitleBoy"><asp:Literal ID="ltlNomeBebe" runat="server"></asp:Literal></span> <span class="bbsearch_DataBoy">- <asp:Literal ID="ltlNascimento" runat="server"></asp:Literal></span><br /><br />
                Horário<br />
                <strong><asp:Literal ID="ltlHorario" runat="server"></asp:Literal></strong><br /><br />
                Peso<br />
                <strong><asp:Literal ID="ltlPeso" runat="server"></asp:Literal></strong><br /><br />
                Estatura<br />
                <strong><asp:Literal ID="ltlEstatura" runat="server"></asp:Literal></strong><br /><br />
                
                Nome dos pais<br />
                <strong><asp:Literal ID="ltlPais" runat="server"></asp:Literal></strong><br /><br />
                
                Obstetra<br />
                <strong><asp:Literal ID="ltlObstetra" runat="server"></asp:Literal></strong><br /><br />
                
                 Pediatra<br />
                <strong><asp:Literal ID="ltlPediatra" runat="server"></asp:Literal></strong><br /><br />
                
                Unidade<br />
                <strong><asp:Literal ID="ltlHospital" runat="server"></asp:Literal></strong><br /><br />
                
                <img src="images/btn_portaRetrato.jpg" onclick="window.open('foto_bebe_portaretrato.aspx?id=<%= Request["id"]%>', 'fotobebe');" style="cursor:pointer;"/>
                
            </div>
       	</div> 
        <div id="bbsearch_EnviarMensagem">
            <strong>Comunique a chegada do bebê</strong><br /><br />
            
            Seu nome <br />
            <asp:TextBox ID="txtNome" runat="server" CssClass="inputDefault" style="width:180px;" ></asp:TextBox><br /><br />
            
            Seu e-mail <br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="inputDefault" style="width:180px;" ></asp:TextBox><br /><br />
            
            Nome do Amigo <br />
            <asp:TextBox ID="txtNomeAmigo" runat="server" CssClass="inputDefault" style="width:180px;" ></asp:TextBox><br /><br />
            
            E-mail do amigo <br />
            <asp:TextBox ID="txtEmailAmigo" runat="server" CssClass="inputDefault" style="width:180px;" ></asp:TextBox><br /><br />
            
            Mensagem <br />
            <asp:TextBox ID="txtMesnsagem" runat="server" CssClass="inputDefault" style="width:180px;height:70px" TextMode="MultiLine" ></asp:TextBox><br /><br />
            <asp:Button ID="btnEnviar" runat="server" CssClass="bbsearch_buttonDefault" 
                Text="Enviar" onclick="btnEnviar_Click" />
        </div>
    </div>
 </asp:Content>

