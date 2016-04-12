<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zad5.Task1.aspx.cs" Inherits="WebApplication16.Zad5_Task1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style>
        .active {
            background-color: aliceblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="myDiv" runat="server">
        </div>
        <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1">--%>
        <%--<Columns>--%>
        <%--<asp:TemplateField HeaderText="DVD">--%>
        <%--<ItemTemplate>--%>
        <%--<b><%# XPath("Title") %></b><br />
                        <%# XPath("Director") %><br />--%>
        <%--<%# XPath(".") %>--%>
        <%--</ItemTemplate>--%>
        <%--</asp:TemplateField>--%>
        <%--</Columns>--%>
        <%--</asp:GridView>--%>
        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="text-center">Films</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-7">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" CssClass="table table-hover table-bordered"
                                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="Title">
                                        <ItemTemplate>
                                            <%# XPath("Title") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />

                                    <asp:CommandField SelectText="Details" ShowSelectButton="True" ButtonType="Button">
                                        <ControlStyle CssClass="btn btn-primary btn-sm" />
                                    </asp:CommandField>

                                </Columns>
                                <SelectedRowStyle CssClass="active" />
                            </asp:GridView>
                        </div>
                        <div class="col-sm-5">
                            <h4 class="text-center"><strong>Details</strong></h4>
                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="XmlDataSource1" CssClass="table table-bordered" PageIndex="1">
                                <Fields>
                                    <asp:TemplateField HeaderText="ID: ">
                                        <ItemTemplate>
                                            <%# XPath("@ID") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Title: ">
                                        <ItemTemplate>
                                            <%# XPath("Title") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category: ">
                                        <ItemTemplate>
                                            <%# XPath("@Category") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Price: ">
                                        <ItemTemplate>
                                            <%# XPath("Price") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Stars: ">
                                        <ItemTemplate>
                                            <asp:DataList ID="DataList1" runat="server" DataSource='<%# XPathSelect("Starring/Star") %>' RepeatLayout="Flow">
                                                <ItemTemplate>
                                                    <%# XPath(".") %>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/DvdList.xml"></asp:XmlDataSource>
    </form>
</body>
</html>
