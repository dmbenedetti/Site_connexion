<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="exames_especialidades.aspx.cs" Inherits="imprensa_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container_interna">
<h2>
    Exames e Especialidades</h2>
    <link type="image/ico" href="/images/saoluiz.ico " rel="shortcut icon" />
<p>&nbsp;</p>
    Emergência
    <br />
    <br />
   
<div class="exame_especialidades">
  <asp:Repeater ID="rptPontoSocorro" runat="server" DataSourceID="ds_PontoSocorro">
        <HeaderTemplate> <br />
          <p> Nossa emergência oferece as especialidades abaixo listadas durante o tempo integral de atendimento. </p>
          <p><br />
          </p>
        </HeaderTemplate>
        <FooterTemplate> <br />
          <br />
          <p>&nbsp;</p>
<p><br />
            <br />
            <br />
<br />
            As demais especialidades trabalham em sistema de plantão, e são acionadas quando há necessidade. </p>
          <br />
        </FooterTemplate>
        <ItemTemplate>
          <div class="exame_especialidades_ps"><%# Eval("nm_prontosocorro")%></div>
        </ItemTemplate>
      </asp:Repeater>
</div>
    <p>&nbsp;</p>
    <p><br />
    </p>
    <p>Lista de Especialidades
      <br />
      <br />
    </p><div class="exame_especialidades">
        <asp:Repeater ID="rptEspecialidades" runat="server" DataSourceID="ds_especialidade">
        <ItemTemplate>
          <div class="exame_especialidades_lista" style="float:left;"><%# Eval("nm_especialidade")%></div>
          <br />
        </ItemTemplate>
        <AlternatingItemTemplate>
          <div class="exame_especialidades_lista" style="float: right;"><%# Eval("nm_especialidade")%></div>
        </AlternatingItemTemplate>
        <FooterTemplate><br />
          <br />
        </FooterTemplate>
      </asp:Repeater>
      <p></p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      </div>
    <p>&nbsp;</p>
    <p><br />
      Lista de Exames
        <br />
        <br />
    </p><div class="exame_especialidades">
        <asp:Repeater ID="rptExames" runat="server" DataSourceID="ds_exames">
            <ItemTemplate>
                <div class="exame_especialidades_lista" style="float:left;"><%# Eval("nm_exame")%></div>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div class="exame_especialidades_lista" style="float: right;"><%# Eval("nm_exame")%></div>
            </AlternatingItemTemplate>
        </asp:Repeater>
        <p>&nbsp;</p>
    </div>
    <br /><br />
    <div class="exame_especialidades">    </div>
    <br /><br />
    <asp:SqlDataSource ID="ds_exames" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="Select a.nm_exame from TB_EXAME a INNER JOIN TB_EXAME_HOSPITAL b ON a.id_exame = b.id_exame WHERE a.id_status = @id_status AND b.id_hospital = @idHosp ORDER BY a.nm_exame">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
      </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_especialidade" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="Select a.nm_especialidade from TB_EPSECIALIDADE a INNER JOIN TB_ESPECIALIDADE_HOSPITAL b ON a.id_especialidade = b.id_especialidade WHERE a.id_status = @id_status AND b.id_hospital = @idHosp ORDER BY a.nm_especialidade">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_PontoSocorro" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="Select a.nm_prontosocorro from TB_PRONTOSOCORRO a INNER JOIN TB_PRONTOSOCORRO_HOSPITAL b ON a.id_prontosocorro = b.id_prontosocorro WHERE a.id_status = @id_status AND b.id_hospital = @idHosp ORDER BY a.nm_prontosocorro">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>
</asp:Content>

