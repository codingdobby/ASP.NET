using System.Data.OleDb;
using System.IO;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mysite_1712124.board
{
    public partial class Write : System.Web.UI.Page
    {
         string pub = "~/file";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("~/board");
            }

            if (!IsPostBack)
            {
                string phygical_pub = Server.MapPath(pub);
                if (!Directory.Exists(phygical_pub))
                    Directory.CreateDirectory(phygical_pub);

                if (Request["mode"] != null)
                {
                    if (Request["mode"].ToString() == "edit")
                    {
                        lblTitle.Text = "글 변경";
                        string selectString = "select * from board where serial_no=" + Request["sn"];

                        DBConn conn = new DBConn();
                        OleDbDataReader dr = conn.ExecuteReader(selectString);
                        if (dr.Read())
                        {
                            txtTitle.Text = dr["title"].ToString();
                            txtMessage.Text = dr["message"].ToString();
                        }
                        dr.Close();
                        conn.Close();
                    }
                }
                else
                {
                    lblTitle.Text = "글 쓰기";

                }
            }




        }

        public string DuplicateFile(string dir, string filename)
        {
            string file = Path.GetFileNameWithoutExtension(filename);
            string ext = Path.GetExtension(filename);
            string newFilePath = dir + "\\" + filename;
            int n = 1;
            while (File.Exists(newFilePath))
            {
                string temp = string.Format("{0} ({1})", file, n++);
                newFilePath = Path.Combine(dir, temp + ext);
            }
            return newFilePath;
        }



        protected void btnSave_Click(object sender, ImageClickEventArgs e)
        {
            if (txtTitle.Text == "")
            {
                txtTitle.Focus();
                return;
            }
            if (txtMessage.Text == "")
            {
                txtMessage.Focus();
                return;
            }
            // 파일 첨부1 - 이미지
            string file1 = "", file2 = "";
            int file1_size = 0, file2_size = 0;
            if (FileUpload1.HasFile)
            {
                string filename = Server.MapPath(pub) + "\\" + FileUpload1.FileName;
                if (File.Exists(filename))
                    filename = DuplicateFile(Server.MapPath("~/file"), FileUpload1.FileName);
                FileUpload1.SaveAs(filename);
                file1 = FileUpload1.FileName;
                file1_size = FileUpload1.PostedFile.ContentLength;
            }

            if (FileUpload2.HasFile)
            {
                string filename = Server.MapPath(pub) + "\\" + FileUpload2.FileName;
                if (File.Exists(filename))
                    filename = DuplicateFile(Server.MapPath("~/file"), FileUpload1.FileName);

                FileUpload2.SaveAs(filename);
                file2 = FileUpload2.FileName;
                file2_size = FileUpload2.PostedFile.ContentLength;
            }

            // 저장 - title, message,imgfile1, file1 - writer_id, ...
            string sql = "";
            if (Request["mode"] != null)
                sql = "update board set writer=@writer,title=@title," +
                    "file1=@file1,file2=@file2,file1_size=@file1_size,file2_size=@file2_size," +
                    "message=@message, reg_date=@reg_date " +
                "where serial_no=" + Request["sn"];
            else
                sql = "insert into board(writer,title,file1,file2,file1_size,file2_size," +
                    "message,ref_id,inner_id,depth,read_count,del_flag,reg_date) " +
                    "values(@writer,@title,@file1,@file2,@file1_size,@file2_size," +
                    "@message,0,0,0,0,'N',@reg_date)";

            string sql_i = "update board set ref_id=serial_no where ref_id=0";


            DBConn conn = new DBConn();
            OleDbCommand cmd = new OleDbCommand(sql, conn.GetConn());

            cmd.Parameters.AddWithValue("@writer", Session["id"].ToString());
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@file1", file1);
            cmd.Parameters.AddWithValue("@file2", file2);
            cmd.Parameters.AddWithValue("@file1_size", file1_size);
            cmd.Parameters.AddWithValue("@file2_size", file2_size);
            cmd.Parameters.AddWithValue("@message", txtMessage.Text);
            cmd.Parameters.AddWithValue("@reg_date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
            try
            {

                cmd.ExecuteNonQuery();
                if (Request["mode"] == null)
                    conn.ExecuteNonQuery(sql_i);
            }
            finally
            {
                conn.Close();
            }
            Response.Redirect("~/Board");
        }
    }
}