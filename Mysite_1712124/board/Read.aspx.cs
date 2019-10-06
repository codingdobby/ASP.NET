using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
//using System.Drawing.Image;
using System.Drawing;
using Image = System.Drawing.Image;



namespace Mysite_1712124.board
{
    public partial class Read : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["sn"] == null)
            {
                Response.Redirect("~/Board");
            }

            

            if (!IsPostBack)
            {
                //msg.Text = "";

                string updateString = "update board set read_count=read_count+1 where serial_no=" + Request["sn"];
                string selectString = "select * from board where serial_no=" + Request["sn"];

                DBConn conn = new DBConn();
                conn.ExecuteNonQuery(updateString);
                OleDbDataReader dr = conn.ExecuteReader(selectString);
                if (dr.Read())
                {
                    lblWriter.Text = dr["writer"].ToString();
                    lblRegDate.Text = dr["reg_date"].ToString();
                    lblTitle.Text = dr["title"].ToString();
                    lblCount.Text = dr["read_count"].ToString();
                    //txtMessage.Text = dr["message"].ToString();
                    lblMessage.Text = dr["message"].ToString().Replace("\n", "<br/>");

                    // file1 - 이미지
                    if (dr["file1"].ToString() != "")
                    {
                        string ext = System.IO.Path.GetExtension(dr["file1"].ToString().ToLower());

                        if (ext == ".jpg" || ext == ".gif" || ext == ".png")
                        {
                            string imgfile = Server.MapPath("~/file/" + dr["file1"].ToString());
                            Image img = Image.FromFile(imgfile);
                            if (img.Width > 400) imgFile1.Width = 400;
                            {
                                imgFile1.ImageUrl = "~/file/" + dr["file1"].ToString();
                                //imgFile1.Dispose();
                            }
                            img.Dispose();
                        }
                    }

                    // file1 - 이미지
                    if (dr["file2"].ToString() != "")
                    {
                        lblFile2.Text = dr["file2"].ToString();
                        //lblFile2.PostBackUrl = "~/file/" + dr["file1"].ToString();
                    }
                    else
                    {
                        lblFile2.Text = "첨부파일 없음";
                        btnDownload.Enabled = false;
                    }
                    btnEdit.PostBackUrl = "~/board/Write.aspx?mode=edit&sn=" + dr["serial_no"].ToString();
                    btnReply.PostBackUrl = "~/board/Reply.aspx?sn=" + dr["serial_no"].ToString();
                }
                dr.Close();
                conn.Close();

                if (Session["id"] == null)
                {
                    btnEdit.Enabled = false;
                    btnDelete.Enabled = false;
                    btnReply.Enabled = false;
                }
                else if ((Session["id"].ToString().Trim() == lblWriter.Text.Trim()) ||
                    (Session["id"].ToString() == "admin"))  // 그수정
                {
                    // 로그인한 다른 사용자: Reply는 가능
                    btnEdit.Enabled = true;
                    btnDelete.Enabled = true;
                    btnReply.Enabled = true;
                }
                else
                {
                    btnReply.Enabled = true;
                    btnEdit.Enabled = false;
                    btnDelete.Enabled = false;
                }
            }





        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            // 삭제권한이 있는지 확인
           
            if(Session["userID"].ToString() != lblWriter.Text  && 
                Session["userID"].ToString() != "admin")
            {
                Response.Write("<script>삭제할 권한이 없습니다</script>");
               
                return;
            }
            


            DBConn conn = new DBConn();
            string selectRefId = "select ref_id from board where serial_no=" + Request["sn"];
            string refString = conn.ExecuteScalar(selectRefId).ToString();

            // 참조번호가 같으면서 삭제되지 않은 글 수
            string selectString = "select count(*) from board where ref_id=" + refString +
                " AND del_flag<>'Y'";
            int count = (int)conn.ExecuteScalar(selectString);

            // 참조번호가 같은 삭제되지 않은 글이 있으면 del_flag만 갱신
            if (count > 1)
            {
                string updateString = "update board set del_flag='Y' where serial_no=" + Request["sn"];
                conn.ExecuteNonQuery(updateString);
            }
            else
            {
                // 파일 삭제
                string selectFile = "select file1,file2 from board where serial_no=" + Request["sn"];
                OleDbDataReader dr = conn.ExecuteReader(selectFile);
                if (dr.Read())
                {
                    if (dr["file1"].ToString() != "")
                    {
                        string file = Server.MapPath("~/file/" + dr["file1"]);
                        try
                        {
                            //Label1.Text = file;
                            System.IO.File.Delete(file);
                        }
                        catch { }
                    }
                    if (dr["file2"].ToString() != "")
                    {
                        string file = Server.MapPath("~/file") + "\\" + dr["file2"];
                        System.IO.File.Delete(file);
                    }
                }

                //
                string deleteString = "delete from board where ref_id=" + refString;
                conn.ExecuteNonQuery(deleteString);

            }
            conn.Close();
            Response.Redirect("~/Board/");
        }

        protected void btnEdit_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Write.aspx?mode=edit&sn=" + Request["sn"]);
        }

        private void SendFile(string ppath, string filename)
        {
            Response.AddHeader("Content-Disposition",
            String.Format("attachment;filename=\"{0}\"", HttpUtility.UrlPathEncode(filename)));
            Response.ContentType = "multipart/form-data";
            Response.WriteFile(ppath + "\\" + filename);
            //msg.Text = ppath + "\\" + filename;
        }

    }
}