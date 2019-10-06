using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace Mysite_1712124.member
{
    public partial class FindId : System.Web.UI.Page
    {
        String idcheck;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTitle.Text = "아이디 찾기";
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            string sql = "select m_id from member where m_phone='" + txtNameID.Text + "'";
            DBConn conn = new DBConn();
            OleDbCommand cmd = new OleDbCommand(sql, conn.GetConn());
            OleDbDataReader reader = cmd.ExecuteReader();



            if (reader.Read())
            {

                idcheck = reader["m_id"].ToString();
                lblResult.Text = idcheck;


            }
           
            else
            {
               
                lblResult.Text = "검색 결과가 없습니다.";

            }

            reader.Close();
            conn.Close();
        }
    }
}