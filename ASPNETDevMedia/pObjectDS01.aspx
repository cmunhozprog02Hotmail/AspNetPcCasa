<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pObjectDS01.aspx.cs" Inherits="ASPNETDevMedia.pObjectDS01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ODS01">
            <Columns>
                <asp:BoundField DataField="idPessoa" HeaderText="idPessoa" SortExpression="idPessoa" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                <asp:BoundField DataField="telefone" HeaderText="telefone" SortExpression="telefone" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ODS01" runat="server" SelectMethod="GetPessoas" TypeName="ASPNETDevMedia.SampleContext"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
