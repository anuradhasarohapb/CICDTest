<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ClientMaster.aspx.cs" Inherits="MasterFarm.ClientReg.ClientMaster" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <form id="frmAccMaster" runat="server">
        <div id="MainDiv">
            <table id="tAccMaster" border="0" cellpadding="0" cellspacing="0" style="width: 100%;
                height: 100%; vertical-align: top;" align="left">
                <tr>
                    <td width="85%" height="95%" valign="top" align="left">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" style="padding-left: 10px;
                            padding-right: 10px;">
                            <tr>
                                <td style="height: 2px">
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 0.3%">
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="38%" valign="top">
                                    <table border="0" width="100%" cellpadding="0" height="99%" cellspacing="0" class="DataTable">
                                        <tr>
                                            <td class="DataTableTitle" colspan="4" height="7.5%">
                                                <asp:Label ID="lblAccount" runat="server" Text="<%$ Resources:BRLabel, lblAccount%>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="25%; height:1%">
                                            </td>
                                            <td width="25%">
                                            </td>
                                            <td width="25%">
                                            </td>
                                            <td width="25%">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblShortName" runat="Server" Text="<%$ Resources:BRLabel, lblShortName%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtName" MaxLength="20" runat="server" Width="90%" CssClass="TextBox"
                                                    EnableViewState="False" TabIndex="6">
                                                    <ClientSideEvents KeyDown="fnAlphaNumKeyPress" />
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblAddress1" runat="Server" Text="<%$ Resources:BRLabel, lblAddress1%>"
                                                    CssClass="Mandatory"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAddress1" runat="server" Width="90%" CssClass="TextBox"
                                                    MaxLength="255" EnableViewState="False" TabIndex="7">
                                                </asp:TextBox>
                                            </td>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblAddress2" runat="Server" Text="<%$ Resources:BRLabel, lblAddress2%>"
                                                    CssClass="Label" EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAddress2" runat="server" Width="90%" CssClass="TextBox"
                                                    MaxLength="255" EnableViewState="False" TabIndex="8">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblCityID" runat="Server" Text="<%$ Resources:BRLabel, lblCity%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cboUserCityID" CssClass="ComboBox" runat="server" Width="91%"
                                                     EnableViewState="False" TabIndex="9">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblCountryID" runat="Server" Text="<%$ Resources:BRLabel, lblCountry%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cboUserCountryID" CssClass="ComboBox" runat="server" Width="91%"
                                                     EnableViewState="False" TabIndex="10">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblPhone1" runat="Server" Text="<%$ Resources:BRLabel, lblPhone1%>"
                                                    CssClass="Label" EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPhone1" runat="server" EnableViewState="False" Visible="true" MaxLength="30" Width="90%" CssClass="TextBox"
                                                    TabIndex="11"></asp:TextBox>
                                                <%--<igtxt:WebTextEdit ID="txtPhone1" runat="server" Width="90%" CssClass="TextBox" MaxLength="30"  EnableViewState="False"  TabIndex=11>
                                        <ClientSideEvents KeyDown="fnPhoneValidFF(event)"/>
                                        </igtxt:WebTextEdit>--%>
                                            </td>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblPhone2" runat="Server" Text="<%$ Resources:BRLabel, lblPhone2%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPhone2" runat="server" EnableViewState="False" Visible="true" MaxLength="30" Width="90%" CssClass="TextBox"
                                                    TabIndex="12"></asp:TextBox>
                                                <%--<igtxt:WebTextEdit ID="txtPhone2" runat="server" Width="90%" CssClass="TextBox" MaxLength="30" EnableViewState="False"  TabIndex=12>
                                        <ClientSideEvents KeyDown="fnPhoneValidFF(event)" />
                                        </igtxt:WebTextEdit>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="1%">
                                            </td>
                                        </tr>
                                        <%--<tr>
                                    <td class="tdAlign">
					                    <asp:Label ID="lblComment" runat="Server" Text ="Comments" CssClass="Label" EnableViewState="False" ></asp:Label>
				                    </td>
                                    <td colspan=3>
                                        <igtxt:WebTextEdit ID="txtComment" runat="server" Width="96.8%" CssClass="TextBox" ToolTip="Please Enter Your Comments" TabIndex="23" MaxLength="255">
                                        </igtxt:WebTextEdit>
                                    </td>
                                </tr> --%>
                                        <tr>
                                            <td height="0.5%">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="0.5%">
                                </td>
                            </tr>
                            <tr>
                                <td height="0.5%">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="BottomDisplayMsg" id="divErrorMessage" height="5%" valign="Middle" style="width: 85%;">
                        <table border="0" width="100%" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 4%" align="center">
                                    <img id="Prev" src="../Images/ButtonIcons/CS-Previous.gif" onclick="fnErrorNavi(-1)"
                                        align="left" style="cursor: hand; cursor: pointer; visibility: hidden;" />
                                </td>
                                <td style="width: 92%" align="left">
                                    <asp:Label ID="lblMessage" runat="server" EnableViewState="False" ForeColor="Red"
                                        CssClass="ErrMessage"></asp:Label>
                                </td>
                                <td style="width: 4%" align="center">
                                    <img id="Next" src="../Images/ButtonIcons/CS-Next.gif" onclick="fnErrorNavi(1)" align="left"
                                        style="cursor: hand; cursor: pointer; visibility: hidden;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        
    </form>
    
    
    
    
    </asp:Content>
