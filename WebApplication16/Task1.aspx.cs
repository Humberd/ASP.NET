using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication16 {
    public partial class Task1 : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void CustomerChoiceList_SelectedIndexChanged(object sender, EventArgs e) {
            MultiView2.ActiveViewIndex = int.Parse(CustomerChoiceList.SelectedValue);
        }

        protected void currentSubmit_Click(object sender, EventArgs e) {
            MultiView2.ActiveViewIndex = -1;
            MultiView1.ActiveViewIndex = 1;
        }

        protected void newSubmit_Click(object sender, EventArgs e) {
            MultiView2.ActiveViewIndex = -1;
            MultiView1.ActiveViewIndex = 1;
        }

        protected void endSubmit_Click(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = 2;
        }
    }
}