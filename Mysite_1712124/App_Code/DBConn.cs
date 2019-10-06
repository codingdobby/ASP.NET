using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Web.Configuration;

namespace MYSITE_1712124
{
    public class DBConn
    {

        // string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=학사2013.accdb";
         string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=WebDB2019.mdb";
        //string connectionString = WebConfigurationManager.ConnectionStrings["haksa"].ConnectionString;  // for ASP.NET
        //string connectionString = WebConfigurationManager.ConnectionStrings["webdb"].ConnectionString;

        public OleDbConnection conn;

        public DBConn()
        {
            conn = new OleDbConnection(connectionString);
            conn.Open();
        }

        public void Close()
        {
            conn.Close();
        }

        public OleDbConnection GetConn()
        {
            return conn;
        }

        public void ExecuteNonQuery(string sql)
        {
            OleDbCommand cmd = new OleDbCommand(sql, conn);
            cmd.ExecuteNonQuery();
        }

        public OleDbDataReader ExecuteReader(string sql)
        {
            OleDbCommand cmd = new OleDbCommand(sql, conn);
            return cmd.ExecuteReader();
        }

        public object ExecuteScalar(string sql)
        {
            OleDbCommand cmd = new OleDbCommand(sql, conn);
            return cmd.ExecuteScalar();
        }
    }
}