﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v15.2.Core, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" 
                AppointmentDataSourceID="ObjectDataSourceAppointment" ClientIDMode="AutoID" Start="<%#DateTime.Now %>" 
                GroupType="Date" ResourceDataSourceID="ObjectDataSourceResources"
                OnAppointmentFormShowing="ASPxScheduler1_AppointmentFormShowing"
                OnBeforeExecuteCallbackCommand="ASPxScheduler1_BeforeExecuteCallbackCommand">
                <OptionsForms AppointmentFormTemplateUrl="~/CustomControls/CustomAppointmentForm.ascx" />
                <Storage>
                    <Appointments AutoRetrieveId="True" CommitIdToDataSource="false">
                        <Mappings 
                            AllDay="AllDay" 
                            AppointmentId="Id" 
                            Description="Description" 
                            End="EndTime" 
                            Label="Label" 
                            Location="Location" 
                            RecurrenceInfo="RecurrenceInfo" 
                            ReminderInfo="ReminderInfo" 
                            ResourceId="OwnerId" 
                            Start="StartTime" 
                            Status="Status" 
                            Subject="Subject" 
                            Type="EventType" />
                        <CustomFieldMappings>
                            <dxwschs:ASPxAppointmentCustomFieldMapping Name="AppointmentInfo" Member="CustomInfo" ValueType="String" />
                            <dxwschs:ASPxAppointmentCustomFieldMapping Name="AppointmentAttachment" Member="CustomAttachment" ValueType="Object" />
                            <dxwschs:ASPxAppointmentCustomFieldMapping Name="AppointmentAttachmentFileName" Member="CustomAttachmentFileName" ValueType="String" />
                        </CustomFieldMappings>
                    </Appointments>
                    <Resources>
                        <Mappings 
                            Caption="Name" 
                            ResourceId="ResID" />
                    </Resources>
                </Storage>

                <Views>
                    <DayView>
                        <TimeRulers>
                            <cc1:TimeRuler></cc1:TimeRuler>
                        </TimeRulers>
                        <DayViewStyles ScrollAreaHeight="600px">
                        </DayViewStyles>
                    </DayView>

                    <WorkWeekView>
                        <TimeRulers>
                            <cc1:TimeRuler></cc1:TimeRuler>
                        </TimeRulers>
                    </WorkWeekView>
                </Views>
            </dxwschs:ASPxScheduler>
            <br />
            <br />
            <asp:Button ID="ButtonPostBack" runat="server" Text="Post Back" />

            <asp:ObjectDataSource ID="ObjectDataSourceResources" runat="server" OnObjectCreated="ObjectDataSourceResources_ObjectCreated" SelectMethod="SelectMethodHandler" TypeName="WebApplication1.CustomResourceDataSource"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSourceAppointment" runat="server" DataObjectTypeName="WebApplication1.CustomAppointment" DeleteMethod="DeleteMethodHandler" InsertMethod="InsertMethodHandler" SelectMethod="SelectMethodHandler" TypeName="WebApplication1.CustomAppointmentDataSource" UpdateMethod="UpdateMethodHandler" OnObjectCreated="ObjectDataSourceAppointment_ObjectCreated"></asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
