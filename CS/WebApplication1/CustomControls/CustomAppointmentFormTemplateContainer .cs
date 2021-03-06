﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Internal;

namespace WebApplication1.CustomControls {
    public class CustomAppointmentFormTemplateContainer : AppointmentFormTemplateContainer {
        public CustomAppointmentFormTemplateContainer(ASPxScheduler control) : base(control) {            
        
        }

        public AppointmentFormController FormController { get { return Controller; } }

        public string CustomInfoField {
            get {
                return System.Convert.ToString(Appointment.CustomFields["AppointmentInfo"]);
            }
        }

        public byte[] CustomAttachment {
            get {
                return Appointment.CustomFields["AppointmentAttachment"] as byte[];
            }
        }

        public string CustomAttachmentFileName {
            get {
                if(Appointment.CustomFields["AppointmentAttachmentFileName"] == null)
                    return "";
                else
                    return "Uploaded file: " + System.Convert.ToString(Appointment.CustomFields["AppointmentAttachmentFileName"]);
            }
        }


        public string Description {
            get {
                return Appointment.Description;
            }
        }
    }
}