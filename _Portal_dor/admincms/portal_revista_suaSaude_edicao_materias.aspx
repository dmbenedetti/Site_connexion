<%@ Page Title="" Language="C#" MasterPageFile="~/admincms/MasterPage.master" AutoEventWireup="true" CodeFile="portal_revista_suaSaude_edicao_materias.aspx.cs" Inherits="admincms_ogrupo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" language="javascript">
        //MÁSCARA DE VALORES

        function txtBoxFormat(objeto, sMask, evtKeyPress) {
            var i, nCount, sValue, fldLen, mskLen, bolMask, sCod, nTecla;


            if (document.all) { // Internet Explorer
                nTecla = evtKeyPress.keyCode;
            } else if (document.layers) { // Nestcape
                nTecla = evtKeyPress.which;
            } else {
                nTecla = evtKeyPress.which;
                if (nTecla == 8) {
                    return true;
                }
            }

            sValue = objeto.value;

            // Limpa todos os caracteres de formatação que
            // já estiverem no campo.
            sValue = sValue.toString().replace("-", "");
            sValue = sValue.toString().replace("-", "");
            sValue = sValue.toString().replace(".", "");
            sValue = sValue.toString().replace(".", "");
            sValue = sValue.toString().replace("/", "");
            sValue = sValue.toString().replace("/", "");
            sValue = sValue.toString().replace(":", "");
            sValue = sValue.toString().replace(":", "");
            sValue = sValue.toString().replace("(", "");
            sValue = sValue.toString().replace("(", "");
            sValue = sValue.toString().replace(")", "");
            sValue = sValue.toString().replace(")", "");
            sValue = sValue.toString().replace(" ", "");
            sValue = sValue.toString().replace(" ", "");
            fldLen = sValue.length;
            mskLen = sMask.length;

            i = 0;
            nCount = 0;
            sCod = "";
            mskLen = fldLen;

            while (i <= mskLen) {
                bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".") || (sMask.charAt(i) == "/") || (sMask.charAt(i) == ":"))
                bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " "))

                if (bolMask) {
                    sCod += sMask.charAt(i);
                    mskLen++;
                }
                else {
                    sCod += sValue.charAt(nCount);
                    nCount++;
                }

                i++;
            }

            objeto.value = sCod;

            if (nTecla != 8) { // backspace
                if (sMask.charAt(i - 1) == "9") { // apenas números...
                    return ((nTecla > 47) && (nTecla < 58));
                }
                else { // qualquer caracter...
                    return true;
                }
            }
            else {
                return true;
            }
        }
        // onkeypress="return txtBoxFormat(this, '9', event);"  onclick="this.value='';" MaxLength="3"
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p><strong>Portal Rede D'or > Publicações e Campanhas > Revista Sua Saúde&nbsp; &gt;&nbsp; Edição <asp:Label ID="lbl_nr_edicao" runat="server"></asp:Label></strong>
        
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <h2>Matérias da Edição</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<p>
    <asp:Button ID="Button1" runat="server" BackColor="#666666" Font-Bold="True" 
        ForeColor="White" Height="30px" Text="Inserir Matéria" Width="147px" 
        onclick="Button1_Click" />
</p>
    <p>
        &nbsp;</p>
    <p>

        &nbsp;<asp:ListView ID="ListView1" runat="server" DataKeyNames="id_conteudo" DataSourceID="ds_paginas">
            
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #cccccc; margin-bottom:20px;">
                <img src="../Revista_SuaSaude/materias/<%# Eval("imagem") %>" width="85" height="80" style="float:left;margin:5px;"/>
                <p><strong><%# Eval("nm_titulo") %></strong></span></p>
                <p><%# Eval("ds_resumo") %></p>
                <p><a href="portal_revista_suaSaude_edicao_materias_editar.aspx?id=<%# Eval("id_conteudo") %>">Editar</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="portal_revista_suaSaude_edicao_materias_excluir.aspx?id=<%# Eval("id_conteudo") %>">Excluir</a>
                <div style="clear:both"></div>
             </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
                <asp:DataPager ID="ItemDataPager" runat="server" PageSize="15">
        <Fields>
             <asp:NumericPagerField ButtonCount="8" />
        </Fields>
    </asp:DataPager> 
            </LayoutTemplate>
        </asp:ListView>
     <p>
        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            
             SelectCommand="SELECT id_conteudo, nm_titulo, dt_conteudo, id_noticia, (CASE WHEN [ds_imgDestaque] IS NULL THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END) AS imagem, ds_resumo, nr_edicaorevista FROM TB_PORTAL_CONTEUDO WHERE (id_tipo = @id_tipo) AND (id_sessao = @id_sessao) AND (id_status = @id_status) AND (nr_edicaorevista = @nr_edicaorevista) ORDER BY dt_conteudo DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="9" Name="id_tipo" Type="Int32" />
                <asp:Parameter DefaultValue="3" Name="id_sessao" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="" Name="nr_edicaorevista" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
</asp:Content>

