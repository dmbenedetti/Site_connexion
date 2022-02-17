<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_espacoSaude.master" AutoEventWireup="true" CodeFile="saude_com_hospitais_rede_dor_sao_Luiz.aspx.cs" Inherits="saude_com_hospitais_rede_dor_sao_Luiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.especialista
{
    padding-top:5px;

}
.tema
{
    padding:5px;
	margin:10px 0;
    color:#fff;
    background:#8fb7d8;
    margin:5px 0;
}
.podcast
{
    padding:30px 20px;
    border-bottom:solid 1px #efefef;
    /*height:100px;*/
    min-height:70px;
   }
  audio { width: 300px;}
  .ico_podcast
  {
      width:50px;
      height:40px; float:left;
      margin-top:20px;
      margin-right:15px;
      }

</style>
<script>
    function Play_podcast(id, audio, div) {
        var div_show = document.getElementById(div).style.display;
        if (div_show == "block") {
            document.getElementById(div).style.display = "none";
            document.getElementById(id).pause();
        } else {
            document.getElementById(id).src = audio;
            document.getElementById(id).autoplay = "autoplay";
            document.getElementById(div).style.display = "block";
          }

        
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Saúde com os Hospitais Rede D’Or São Luiz</h2>
    <p>Ouça informações sobre saúde divulgadas pelos especialistas da Rede D’Or São Luiz. Você pode buscar um boletim específico no quadro abaixo por tema, especialista ou data.<br /><br /></p>
    <div style="background:#f1f1f1;padding:15px;height:85px;">
        <div style="float:left;">
            Tema<br />
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        onprerender="DropDownList1_PreRender" Height="30px" 
                        AutoPostBack="True" CssClass="selectDefault" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ds_tema" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
                        SelectCommand="SELECT [id_tema], [nm_tema] FROM [TB_PORTAL_TEMA] WHERE ([id_status] = @id_status)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        </div>
        <div style="float:left">
            Especialista<br />
            <asp:DropDownList ID="DropDownList2" runat="server" onprerender="DropDownList2_PreRender" 
                        Height="30px" CssClass="selectDefault" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="ds_especialista" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
                        SelectCommand="SELECT [id_especialista], [nm_especialista] FROM [TB_PORTAL_ESPECIALISTA] WHERE ([id_status] = @id_status)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
        </div>
    </div>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id_saude" 
            onpagepropertieschanging="ListView1_PagePropertiesChanging">
        
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        
        <ItemTemplate>
            <div class="podcast">
            <div class="ico_podcast">
               <img src="podcast/ico_podcast.jpg" onclick="Play_podcast('<%# Eval("id_saude") %>','../podcast/<%# Eval("ds_audio") %>', 'div<%# Eval("id_saude") %>');" style="cursor:pointer"/> 
            </div>
            <div style="float:left; height:80px; width: calc(100% - 65px);">
            <h3><%# Eval("nm_titulo") %></h3>
            <div>
                <div class="especialista"><h4><%# Eval("nm_especialista") %></h4></div>
                <div style="margin-top:10px;"><span class="tema"><%# Eval("nm_tema")%></span></div>
            </div>
            </div>
            <div style="height:40px;margin-top:5px; display:none; clear:both" id="div<%# Eval("id_saude") %>" >
            <audio id="<%# Eval("id_saude") %>" controls="controls"></audio>
            </div>
        </div>
        <div style="clear:both"></div>
        </ItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        
    </asp:ListView>
    <br />
    <br />
    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" 
        onprerender="DataPager1_PreRender" PageSize="5">
        <Fields>
            <asp:NumericPagerField />
            
        </Fields>
    </asp:DataPager>


    <br />
</asp:Content>

