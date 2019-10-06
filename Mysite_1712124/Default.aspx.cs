using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mysite_1712124
{
    public partial class Default : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCounter.Text = String.Format("{0:N0}" ,Application["counter"]);
            lblACounter.Text = Application["active_counter"].ToString();

            //이미지 카운터
            string counter = Application["counter"].ToString();
            for (int i = 0; i < counter.Length; i++) {

                Image img = new Image();
                img.ImageUrl = "images/counter/" + counter[i] + ".jpg";
                Panel3.Controls.Add(img);
                img.Width = 20;

            }
       



        }

      
    }
}