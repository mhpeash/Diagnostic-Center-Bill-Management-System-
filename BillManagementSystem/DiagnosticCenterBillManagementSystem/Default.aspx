<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DiagnosticCenterBillManagementSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

            <fieldset>
        
        <legend style="color: #2f4f4f">Home Page</legend>
        
        
              
              
<div class="row" style="margin-left=100px">
    <div class="col-md-4 margin-top-20">
     
                <asp:Button ID="testTypeSetupButton" CssClass="btn btn-default btn-sm btn-block" runat="server" Text="Test Type Setup" Width="1000px" Height="45px" OnClick="testTypeSetupButton_Click1" />

                <asp:Button ID="testSetupButton" CssClass="btn btn-default btn-sm btn-block" runat="server" Text="Test Setup" Width="1000px" Height="45px" OnClick="testSetupButton_Click" />

                <asp:Button ID="testRequestEntryButton" CssClass="btn btn-default btn-sm btn-block" runat="server" Text="Test Request Entry" Width="1000px" Height="45px" OnClick="testRequestEntryButton_Click" />

                <asp:Button ID="paymentButton" CssClass="btn btn-default btn-sm btn-block" runat="server" Text="Payment" Width="1000px" Height="45px" OnClick="paymentButton_Click" />
 
                <asp:Button ID="testWiseReportButton" CssClass="btn btn-default btn-sm btn-block" runat="server" Text="Test Wise Report" Width="1000px" Height="45px" OnClick="testWiseReportButton_Click" />

                <asp:Button ID="typeWiseReportButton" CssClass="btn btn-default btn-sm btn-block" runat="server" Text="Type Wise Report" Width="1000px" Height="45px" OnClick="typeWiseReportButton_Click" />

                <asp:Button ID="unpaidBillReportButton" CssClass="btn btn-default btn-sm btn-block" runat="server" Text="Unpaid Bill Report" Width="1000px" Height="45px" OnClick="unpaidBillReportButton_Click" />

        </div>
</div>        

    </fieldset>
    <b></b>
</asp:Content>
