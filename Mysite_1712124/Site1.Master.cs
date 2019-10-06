using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.OleDb;

namespace Mysite_1712124
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                msg.Text = "";
                LinkButton3.Visible = false;

            }

            if (Session["id"] != null)
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
                lblID.Text = Session["id"].ToString();
                if (Session["id"].ToString() == "admin")
                {
                    LinkButton3.Visible = true;
                }
            }
            else
            {

                Panel2.Visible = false;
                Panel1.Visible = true;
                lblID.Text = "";
                
            }


           
            

          




        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // 로그인


            if (txtID.Text.Trim() == "")
            {
                msg.Text = "아이디를 입력해주세요";
                txtID.Focus();
                return;
            }
            if (txtPWD.Text.Trim() == "")
            {
                msg.Text = "암호를 입력해주세요";
                txtPWD.Focus();
                return;
            }
   
           

            string sql = "select m_pwd from member where m_id=@m_id";
            DBConn conn = new DBConn();
            OleDbCommand cmd = new OleDbCommand(sql, conn.GetConn());
            cmd.Parameters.Add("@m_id", txtID.Text);
            OleDbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string pwd = MySite.MD5Hash(txtPWD.Text);

                if (dr["m_pwd"].ToString() == pwd)
                {
                    //FormsAuthentication.RedirectFromLoginPage(txtID.Text, false);
                    Session["id"] = txtID.Text;
                    lblID.Text = txtID.Text;

                    FormsAuthentication.RedirectFromLoginPage(Session["id"].ToString(), true);


                    Panel1.Visible = false;
                    Panel2.Visible = true;

                 



                    // refresh 로그인하고 값 닷 가져오기
                    Response.Redirect(Request.RawUrl);
                   Response.Redirect(Request.Url.AbsoluteUri);
                }
                else
                {
                    msg.Text = "로그인 오류1";
                }
            }
            else
            {
                msg.Text = "로그인 오류2";
            }
            dr.Close();
            conn.Close();

           

        }

    protected void lnkRegister_Click(object sender, EventArgs e)
        {
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //로그아웃
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("~/Default.aspx");
          

        }

    protected void LinkButton3_Click(object sender, EventArgs e)
        {
         
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/member/Register.aspx?mode=modify");
        }
    }
}