using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebApplication16 {
    public partial class Zad5_Task1 : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            //ReadKnownXML();
            GridView1.SelectedIndex = 0;
            DetailsView1.PageIndex = 0;
        }

        private void ReadXML() {
            string xmlFile = Server.MapPath("DvdList.xml");
            XmlTextReader reader = new XmlTextReader(xmlFile);
            StringBuilder str = new StringBuilder();

            while (reader.Read()) {
                switch (reader.NodeType) {
                    case XmlNodeType.XmlDeclaration:
                        break;
                    case XmlNodeType.Element:
                        str.Append("Element: <b>");
                        str.Append(reader.Name);
                        str.Append("</b><br>");
                        break;
                    case XmlNodeType.Text:
                        str.Append(" - Value: <b>");
                        str.Append(reader.Value);
                        str.Append("</b><br>");
                        break;
                }

                if (reader.AttributeCount > 0) {
                    while (reader.MoveToNextAttribute()) {
                        str.Append(" - Attribute: <b>");
                        str.Append(reader.Name);
                        str.Append("</b> Value: <b>");
                        str.Append(reader.Value);
                        str.Append("</b><br>");
                    }
                }
            }
            reader.Close();
            myDiv.InnerHtml = str.ToString();
        }

        private void ReadKnownXML() {
            string xmlFile = Server.MapPath("DvdList.xml");
            XmlTextReader reader = new XmlTextReader(xmlFile);
            StringBuilder str = new StringBuilder();
            reader.ReadStartElement("DvdList");
            while (reader.Read()) {
                if (reader.Name == "DVD" && reader.NodeType == XmlNodeType.Element) {
                    reader.ReadStartElement("DVD");
                    str.Append("<ul><b>");
                    str.Append(reader.ReadElementString("Title"));
                    str.Append("</b><li>");
                    str.Append(reader.ReadElementString("Director"));
                    str.Append("</li><li>");
                    str.Append(reader.ReadElementString("Price"));
                    str.Append("</li></ul>");
                }
            }
            reader.Close();
            myDiv.InnerHtml = str.ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e) {
            DetailsView1.PageIndex = GridView1.SelectedIndex;
        }

    }
}