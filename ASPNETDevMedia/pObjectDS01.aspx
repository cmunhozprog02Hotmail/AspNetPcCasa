<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pObjectDS01.aspx.cs" Inherits="ASPNETDevMedia.pObjectDS01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        
        <asp:Button runat="server" ID="btnSearch" Text="Pesquisar" OnClick="btnSearch_Click" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS01">
            <Columns>
                <asp:BoundField DataField="idPessoa" HeaderText="idPessoa" SortExpression="idPessoa" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                <asp:BoundField DataField="telefone" HeaderText="telefone" SortExpression="telefone" />
                <asp:BoundField DataField="obs" HeaderText="Obs." SortExpression="obs" />
            </Columns>
        </asp:GridView>
        
    
        <asp:ObjectDataSource ID="ODS01" runat="server" SelectMethod="GetPessoas" TypeName="ASPNETDevMedia.SampleContext">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" PropertyName="Text" Name="search" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
    
        <br />
        <br />
        
        <asp:ObjectDataSource ID="ODS02" runat="server" DataObjectTypeName="ASPNETDevMedia.Pessoa" 
            InsertMethod="AddPessoa" 
            SelectMethod="GetPessoas" 
            TypeName="ASPNETDevMedia.SampleContext"></asp:ObjectDataSource>
        
        <asp:FormView runat="server" ID="FVPessoa" DataSourceID="ODS02" DefaultMode="Insert">
            <EditItemTemplate>
                
                nome:
                <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                <br />
                telefone:
                <asp:TextBox ID="telefoneTextBox" runat="server" Text='<%# Bind("telefone") %>' />
                <br />
                Obs.:
                <asp:TextBox ID="obsTextBox" runat="server" Text='<%# Bind("obs") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                
                nome:
                <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                <br />
                telefone:
                <asp:TextBox ID="telefoneTextBox" runat="server" Text='<%# Bind("telefone") %>' />
                <br />
                Obs.:
                <asp:TextBox ID="obsTextBox" runat="server" Text='<%# Bind("obs") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            

        </asp:FormView>
    
    </div>
    </form>
</body>
</html>
