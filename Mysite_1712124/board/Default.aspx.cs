using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mysite_1712124.board
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["id"] == null)
            {

                btnWrite.Enabled = false;
            }
        

        }

        protected string ShowDepth(int depth)
        {
            string returnString = "";
            for (int i = 0; i < depth; i++)
                returnString += "&nbsp;&nbsp;&nbsp;";
            return returnString;
        }
        protected string ShowReplayIcon(int innerId)
        {
            string returnString = "";
            if (innerId != 0)
                returnString += "<img src='../images/reply_icon.gif' />";
            return returnString;
        }
        protected string ShowTitle(string serialNo, string title, string delFlag)
        {
            string returnString = "";
            if (delFlag == "N")
            {
                returnString += "<a href='Read.aspx?sn=" + serialNo;
                returnString += "' class='a01'>" + title + "</a>";
            }
            else
                returnString += "삭제된 게시물입니다.";
            return returnString;
        }
        protected string ShowDate(string regDate)
        {
            return "<span style='font-size:12px;'>" + regDate.Substring(0, 10) + "</span>";
        }




    }
}