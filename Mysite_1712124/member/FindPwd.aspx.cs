using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Mysite_1712124.member
{
    public partial class FindPwd : System.Web.UI.Page
    {
        string idcheck;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                lblResult.Text = "";
                if (findID.Enabled == true)
                {
                    Panel3.Visible = false;
                }
                else {
                    Panel3.Visible = true;
                }

                Label1.Text = "비밀번호 설정";
            }
        }

        protected void findID_Click(object sender, EventArgs e)
        {
            string sql = "select * from member where m_id='" + txtID.Text + "'";
            DBConn conn = new DBConn();
            OleDbCommand cmd = new OleDbCommand(sql, conn.GetConn());
            OleDbDataReader reader = cmd.ExecuteReader();



            if (reader.Read())
            {

                idcheck = reader["m_id"].ToString();



            }
            if (idcheck == txtID.Text.ToString())
            {
                lblResult.Text = "비밀번호 설정 가능";
                findID.Enabled =false;
                Panel3.Visible = true;

            }
            else
            {
                lblResult.Text = "일치하는 아이디 없음";

            }

            reader.Close();
            conn.Close();
        }

        protected void UpdatePwd_Click(object sender, EventArgs e)
        {

            string sql = String.Empty;

            // --> 암호를 입력하세요.
            if (txtPWD.Text.Trim() == "")
            {
                lblmsg.Text = "암호를 입력하세요";
                txtPWD.Focus();
                return;
            }
            if (txtPWD2.Text.Trim() == "")
            {
                lblmsg.Text = "암호를 입력하세요";
                txtPWD2.Focus();
                return;
            }

            if (txtPWD.Text != txtPWD2.Text)
            {
                lblmsg.Text = "암호가 일치하지 않습니다.";
                return;
            }

            if (txtPWD.Text.Trim() != "" && txtPWD2.Text.Trim() != "")
            {
             sql = "update member set m_pwd=@m_pwd where m_id='" + txtID.Text + "'";

            }
            string pwd = MySite.MD5Hash(txtPWD.Text);
            DBConn conn = new DBConn();
            OleDbCommand cmd = new OleDbCommand(sql, conn.GetConn());

            cmd.Parameters.Add("@m_pwd", pwd);
          
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('재설정 완료.');</script>");

            }
            catch (Exception ee)//버튼 이벤트 변수가 e
            {

                Response.Write("<script>alert('재설정 실패.');</script>");


            }
            finally
            {

                conn.Close();

            }
        }
    }
}
