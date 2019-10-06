using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.OleDb;

namespace Mysite_1712124.board
{
    public partial class Reply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {
            // 답변글 저장
            string selectString = "select ref_id,inner_id,depth from board where serial_no=" + Request["sn"];
            int refId = 0;
            int innerId = 0;
            int depth = 0;

            DBConn conn = new DBConn();
            OleDbDataReader dr = conn.ExecuteReader(selectString);
            if (dr.Read())
            {
                refId = (int)dr["ref_id"];
                innerId = (int)dr["inner_id"];
                depth = (int)dr["depth"];
            }
            dr.Close();

            string updateString = "update board set inner_id=inner_id+1 where ref_id=" + refId.ToString() +
                " AND inner_id > " + innerId.ToString();
            conn.ExecuteNonQuery(updateString);

            // 답변글 저장

            string insertString = "insert into board(writer,title,message,ref_id,inner_id,depth,read_count,del_flag,reg_date) " +
                "values(@writer,@title,@message,@ref_id,@inner_id,@depth,0,'N',@reg_date)";
            string sql_update = "update board set ref_id=serial_no where ref_id=0";

            OleDbCommand cmd = new OleDbCommand(insertString, conn.GetConn());

            cmd.Parameters.AddWithValue("@writer", "aaa");
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@message", txtMessage.Text);
            cmd.Parameters.AddWithValue("@ref_id", refId);
            cmd.Parameters.AddWithValue("@inner_id", ++innerId);
            cmd.Parameters.AddWithValue("@depth", ++depth);

            cmd.Parameters.AddWithValue("@reg_date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
            try
            {
                cmd.ExecuteNonQuery();
                conn.ExecuteNonQuery(sql_update);
            }
            finally
            {
                conn.Close();
            }
            Response.Redirect("~/Board");
        }
    }
}