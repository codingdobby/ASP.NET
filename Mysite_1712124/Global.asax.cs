using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;


namespace Mysite_1712124
{
    public class Global : System.Web.HttpApplication
    {

        public int Counter {
            set {
                string sql = "update [counter] set [count]=" + Application["counter"].ToString() + " where page_name='main'";
                DBConn conn = new DBConn();
                    conn.ExecuteNonQuery(sql);
                conn.Close();

            }
            get {
                string sql = "select [count] from [counter]"+ " where page_name='main'";
                DBConn conn = new DBConn();
                Application["counter"] = (int)conn.ExecuteScalar(sql);
                          
                conn.Close();
                return (int)Application["counter"];

            }

        }

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["counter"] = Counter;//누적
            Application["active_counter"] = 0;//현재 접속자
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //세션시자
            Application.Lock();
            Application["counter"] = (int)Application["counter"]+1;//누적
            Application["active_counter"] = (int)Application["active_counter"] + 1;//현재 접속자
            Counter = (int)Application["active_counter"];
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
           
            Application["active_counter"] = (int)Application["active_counter"] - 1;//현재 접속자
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}