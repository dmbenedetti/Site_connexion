<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="foto_bebe.aspx.cs" Inherits="foto_bebe" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>
    <link rel='stylesheet' type='text/css' href='css/BabySearch.css' />
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>
<script>
    function mascara(o, f) {
        v_obj = o
        v_fun = f
        setTimeout("execmascara()", 1)
    }

    function execmascara() {
        v_obj.value = v_fun(v_obj.value)
    }

    function data(v) {

        v = v.replace(/\D/g, "")
        v = v.replace(/(\d{2})(\d)/, "$1/$2")
        v = v.replace(/(\d{2})(\d)/, "$1/$2")
        return v
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container_interna">
    
        <h1>Espaço Baby</h1>
            <div id="bbsearch_Campos">
        	    <div id="bbsearch_Campos_Div">
            	    Data de nascimento<br />
                    <asp:TextBox ID="txtDataNascimento" runat="server" CssClass="inputDefault" onKeyUp="mascara(this,data);"></asp:TextBox>
                    <asp:CalendarExtender ID="txtDataNascimento_CalendarExtender" runat="server" TargetControlID="txtDataNascimento" Enabled="true"></asp:CalendarExtender>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="txtDataNascimento" Display="Dynamic" 
                        ErrorMessage="RangeValidator" ForeColor="Red" Type="Date"><br/>Data de 
                    nascimento inválida.<br></br>
                    </asp:RangeValidator>
                </div>
                <div id="bbsearch_Campos_Div">
            	    Nome dos pais<br />
                    <asp:TextBox ID="txtNomePais" runat="server" CssClass="inputDefault" />
                </div>
                <div id="bbsearch_Campos_Div">
            	    Nome do Bebê<br />
            	    <asp:TextBox ID="txtNomeBebe" runat="server" CssClass="inputDefault" /><%-- <img onclick="window.open('dynamic_page.aspx?id=1582', 'ajudafotobebe');" style="cursor:pointer;" src="images/help_bebe.jpg" title="Clique no ícone para ver  guia de uso do espaço baby" name="Clique no ícone para ver  guia de uso do espaço baby" alt="Clique no ícone para ver  guia de uso do espaço baby" /> --%>
                    <asp:Button ID="btnBuscar" runat="server" CssClass="buttonDefault" 
                        Text="Buscar" onclick="btnBuscar_Click" />
                </div>
                <div style="width: 169px; height: 54px; float: left;">
                    <asp:HyperLink ID="hpkBanner" runat="server" Target="_blank" Width="169" Height="54" Visible="false"></asp:HyperLink>
                </div>
            </div>
             
                <div id="bbsearch_Paginacao"><div id="Div1"> 
                    <asp:DataPager ID="ItemDataPager" runat="server" PageSize="8" PagedControlID="ListView1">
                        <Fields>
                              <asp:NumericPagerField ButtonCount="3" />
                        </Fields>
                    </asp:DataPager></div>
                    </div>
        
            <asp:ListView ID="ListView1" runat="server" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" OnPagePropertiesChanged="Page_Load">
                <EmptyDataTemplate>
                    <span>Nenhum bebê encontrado.</span>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div id="bbsearch_Item">
        	            <div id="bbsearch_imagem">
            	            <img src="http://www.rededor.com.br/images/foto_bebe/thumb/<%# Eval("ds_foto_thumb")%>" />
                        </div>
                        <div id="bbsearch_descricao">
            	            <span class="bbsearch_TitleBoy"><%# Eval("ds_nome_bebe")%></span> <span class="bbsearch_DataBoy">- <%# Convert.ToDateTime(Eval("dt_nascimento")).ToString("dd/MM/yyyy")%></span><br /><br />
                            Nome dos pais<br />
                            <strong><%# Eval("ds_nome_mae")%> <%# String.IsNullOrEmpty(Eval("ds_nome_pai").ToString()) ? "" : "&"%> <%# Eval("ds_nome_pai")%></strong><br /><br />
                            Unidade<br />
                            <strong><%# Eval("ds_hospital")%></strong><br /><br />
               	            <a href="foto_bebe_detalhe.aspx?id=<%# Eval("id_foto")%>"> ver mais detalhes</a><br /><br />
                            <img src="images/btn_portaRetrato.jpg" onclick="window.open('foto_bebe_portaretrato.aspx?id=<%# Eval("id_foto")%>', 'fotobebe');" style="cursor:pointer;" />
                
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                </LayoutTemplate> 
            </asp:ListView>
                <div id="bbsearch_Paginacao"><div id="Div3"> 
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="8" PagedControlID="ListView1">
                        <Fields>
                              <asp:NumericPagerField ButtonCount="3" />
                        </Fields>
                    </asp:DataPager></div>
                    </div>
            <br />
            A inclusão é totalmente gratuita e estará disponível em até dois dias úteis após a realização da foto.
            <asp:SqlDataSource ID="ds_paginas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
                SelectCommandType="StoredProcedure"
            
                SelectCommand="spFotoBebeBusca">
                <SelectParameters>
                    <asp:ControlParameter ConvertEmptyStringToNull="true" DefaultValue="" Name="dtNascimento" Type="String" ControlID="txtDataNascimento" PropertyName="Text" />
                    <asp:ControlParameter ConvertEmptyStringToNull="true" DefaultValue="" Name="NomePais" Type="String" ControlID="txtNomePais" PropertyName="Text" />
                    <asp:ControlParameter ConvertEmptyStringToNull="true" DefaultValue="" Name="NomeBebe" Type="String" ControlID="txtNomeBebe" PropertyName="Text" />
                    <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

     
 
    </div></asp:Content>

