<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" CodeFile="Convenios.aspx.cs"  Inherits="Teste"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolKit"  %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style type="text/css">
        .auto-style1 {
            width: 38px;
        }
        
        
        .alt
        {
         background-color:#F7F6F3; 
           
        }
        
        .Normal
        {
         background-color: White;   
        }
        
        .tabela
        {
         border-style:inset;
         border:solid 1px #333;
         border-bottom-style:solid; 
         text-align:left;
         height:20px; 
          
        }
        .cabecalho
        {
         background-color:#436DA2;
         font-style:inherit;
         color:White;
         height:20px;
        }
        
        .altura
        {
           height:20px; 
        }
        
        .txt
        {
            border:solid 1px #333;
        }
        .Accordion_Header
        {
            border: 1px solid #2F4F4F;
            border-style:none;
            color:White;
            background-color: #5D9EC6;
            font-family: Arial, Sans-Serif;
            font-size:12px;
            font-weight:bold;
            padding: 5px;
            margin-top:5px;
            cursor:pointer;
        }
        .Accordion_Conteudo
        {
            background-color: #E4E4E4;    
            border-top:5px;
            padding-top:10px;
            
            
        }
        
        .Invisivel
        {
            visibility:hidden;    
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <AjaxToolKit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" CombineScripts="false">
    </AjaxToolKit:ToolkitScriptManager>

<div  id="titulo_pag">
    <h2><asp:Label ID="lbl_titulo" runat="server" Text="Convênios"></asp:Label></h2>
</div>

<p>Estes são os convênios atendidos pelo Hospital Assunção. São empresas de primeira linha que estabelecem com o Hospital uma sólida relação de parceria em busca da qualidade. </p>

<p>* Senhores clientes, consulte o seu Plano de Saúde para verificar a cobertura para atendimento.</p>



    <AjaxToolKit:Accordion ID="Accordion1" runat="server"
    SelectedIndex="-1"
    FadeTransitions="true"
    HeaderCssClass="Accordion_Header"
    ContentCssClass="Accordion_Conteudo"
    onitemdatabound="Accordion1_ItemDataBound"  
    RequireOpenedPane="false"
    FramesPerSecond="40"
    >
    <HeaderTemplate >
        <%#DataBinder.Eval(Container.DataItem,"DESCRICAO") %>  
    </HeaderTemplate>
   
  
      <ContentTemplate>
          <%# DataBinder.Eval(Container.DataItem,"spot").ToString() == "" ? "" : "<div style=\"padding: 0px 10px 5px 10px;\"><p>" + DataBinder.Eval(Container.DataItem,"spot").ToString().Replace("\n", "<br>") + "</p></div>"%>
      <table>
          <colgroup width="550px">
              <td width="42%"/>
              <td width="11%"/>
              <td width="12%"/>
              <td width="12%"/>
              <td width="11%"/>
              <td width="12%" />
          </colgroup>
          <thead>
             <tr class="cabecalho">
                 <td align="left">Modalidade</td>
                 <td align="center">Ambulatório</td>
                 <td align="center">Exames</td>
                 <td align="center">Hospital</td>
                 <td align="center"> Maternidade</td>
                 <td align="center">Pronto-Socorro</td>


              </tr>
          </thead>
            </table>
      <asp:HiddenField ID="txt_CODCONVENIO"   
           runat="server"   
            Value='<%#DataBinder.Eval(Container.DataItem,"DESCRICAO") %>' />  
         <asp:GridView ID="GridView1"   
            runat="server"   
            RowStyle-BackColor="#ededed"   
            RowStyle-HorizontalAlign="Left"  
            AutoGenerateColumns="false"   
            CellPadding="1"
            CellSpacing="1"
            GridLines="Vertical"
            ShowHeader="false"        
            >  

            <Columns>  

                <asp:TemplateField >  

                    <ItemTemplate> 
               <table width="760">
                        <tr  class='<%# Container.DisplayIndex % 2 == 0  ? "Normal" : "alt" %>'>
                        <td style="width:42%;">
                            <%#DataBinder.Eval(Container.DataItem,"DescPLANO") %>  
                        </td>
                        <td align="center" style="width:11;">
                            <%#DataBinder.Eval(Container.DataItem,"DescAmbulatorio") %>  
                        </td>
                        <td align="center" style="width:12%;">
                            <%#DataBinder.Eval(Container.DataItem,"DescExames") %>  
                        </td>
                        <td align="center" style="width:12%;">
                            <%#DataBinder.Eval(Container.DataItem,"DescHospital") %>  
                        </td>
                        <td align="center" style="width:11%;">
                            <%#DataBinder.Eval(Container.DataItem,"DescMaternidade") %>  
                        </td>
                        <td align="center" style="width:12%;">
                            <%#DataBinder.Eval(Container.DataItem,"DescPS") %>  
                        </td>


                        </tr>
                        </table>
                    </ItemTemplate>  
                </asp:TemplateField>  
            </Columns>  
        </asp:GridView>  

    </ContentTemplate>
   
     <Panes></Panes>

    </AjaxToolKit:Accordion>

</asp:Content>

