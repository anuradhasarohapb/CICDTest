using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterFarm
{
    public partial class _Default : Page
    {
        public static string strconnection = "Data Source=" + ConfigurationManager.AppSettings["RDS_HOSTNAME"] + "; Database=" + ConfigurationManager.AppSettings["RDS_DATABASE"] + "; User ID=" + ConfigurationManager.AppSettings["RDS_USERNAME"] + "; Password=" + ConfigurationManager.AppSettings["RDS_PASSWORD"];
        SqlConnection con = new SqlConnection(strconnection);
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (TxtUserName.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Please Enter Username');", true);

            }
            else if (TxtPassword.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Please Enter Password');", true);
            }
            else
            {
                string strconnection = "Data Source=" + ConfigurationManager.AppSettings["RDS_HOSTNAME"] + "; Database=" + ConfigurationManager.AppSettings["RDS_DATABASE"] + "; User ID=" + ConfigurationManager.AppSettings["RDS_USERNAME"] + "; Password=" + ConfigurationManager.AppSettings["RDS_PASSWORD"];
                using (SqlConnection con = new SqlConnection(strconnection))
                {
                    SqlCommand cmd = new SqlCommand("Usp_checklogin", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", TxtUserName.Text);
                    cmd.Parameters.AddWithValue("@password", TxtPassword.Text);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables.Contains("Table") == true)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            if (ds.Tables[0].Rows[0]["UserID"].ToString() != "0")
                            {
                                Session["UserID"] = ds.Tables[0].Rows[0]["UserID"].ToString();
                                Session["RoleID"] = ds.Tables[0].Rows[0]["RoleID"].ToString();
                                Response.Redirect("LoginandCheck.aspx");

                            }
                            else
                            {
                                TxtUserName.Text = "";
                                TxtPassword.Text = "";

                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Enter Valid Username and Password');", true);
                            }
                        }
                    }
                }
            }
        }
        protected void btnReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateUsers.aspx");
        }



    }
}