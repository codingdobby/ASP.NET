using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mysite_1712124.member
{
    public partial class Modify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string sql = "select * from member where m_id='" + Session["id"].ToString() + "'";
                DBConn conn = new DBConn();
                OleDbCommand cmd = new OleDbCommand(sql, conn.GetConn());
                OleDbDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {

                    txtID.Text = reader["m_id"].ToString();
                    txtName.Text = reader["m_name"].ToString();
                    txtEmail.Text = reader["m_email"].ToString();
                    txtPhone.Text = reader["m_phone"].ToString();

                    txtID.Enabled=false;
                    
                    txtName.Enabled = false;

                }

                reader.Close();
                conn.Close();
            }



        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {
          
            string sql = String.Empty;

            // --> 암호를 입력하세요.
            if (txtPWD.Text.Trim() == "")
            {
                msg.Text = "암호를 입력하세요";
                txtPWD.Focus();
                return;
            }
            if (txtPWD2.Text.Trim() == "")
            {
                msg.Text = "암호를 입력하세요";
                txtPWD2.Focus();
                return;
            }

            if (txtPWD.Text != txtPWD2.Text)
            {
                msg.Text = "암호가 서로 다릅니다";
                return;
            }
            // --> E-mail을  입력하세요.
            if (txtEmail.Text.Trim() == "")
            {
                msg.Text = "이메일을 입력하세요";
                txtEmail.Focus();
                return;
            }
            //이메일 형식
            if (txtEmail.Text != null)
            {
                Regex regex = new Regex("^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*$");
                Match m = regex.Match(txtEmail.Text);
                if (m.Success)
                {
                    msg.Text = "이메일 통과";

                }

                else
                {
                    msg.Text = "이메일 형식으로 입력하세요";
                    txtEmail.Focus();
                    return;

                }

            }


            if (txtPhone.Text.Trim() == "")
            {

                msg.Text = "전화번호를 입력하세요";
                txtPhone.Focus();
                return;
            }

            //전화번호 정규식

            if (txtPhone.Text.Trim() != null)
            {

                Regex regex = new Regex(@"01[016789]{1}-[0-9]{3,4}-[0-9]{4}");
                Match m = regex.Match(txtPhone.Text);
                if (m.Success) { }

                else
                {
                    msg.Text = "전화번호 형식으로 입력하세요";
                    txtPhone.Focus();
                    return;

                }

            }


            if (txtPWD.Text.Trim() != "" && txtPWD2.Text.Trim() != "")
            {
                sql = "update member set m_pwd=@m_pwd, m_email = @m_email,m_phone = @m_phone where m_id='" + txtID.Text + "'";

            }
            string pwd = MySite.MD5Hash(txtPWD.Text);
            DBConn conn = new DBConn();
            OleDbCommand cmd = new OleDbCommand(sql, conn.GetConn());

            cmd.Parameters.Add("@m_pwd", pwd);
            cmd.Parameters.Add("@m_email", txtEmail.Text);
            cmd.Parameters.Add("@m_phone", txtPhone.Text);



            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('정보 수정 완료.');</script>");
                
            }
            catch (Exception ee)//버튼 이벤트 변수가 e
            {

                Response.Write("<script>alert('정보 수정 실패.');</script>");


            }
            finally
            {

                conn.Close();

            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string sql = "delete from member where m_id='" + txtID.Text + "'";
            //string sql = "delete from hakjuk where hakbun=@hakbun  ";
            //cmd.Parameters.Add("hakbun", textBox1.Text);
           
                DBConn conn = new DBConn();

                conn.ExecuteNonQuery(sql);
                conn.Close();
               Response.Write("<script>alert('탈퇴완료');</script>");
            Session.Abandon();
            Response.Redirect("~/Default.aspx");


        }
    }
}