using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    string ConnectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["current"] == "running")
        {
            Response.Redirect("Home.aspx");
        }
        else if (Request.Cookies["UserInfo"] != null)
        {
            Session["current"] = "running";
            Session["email"] = Request.Cookies["UserInfo"]["email"];
            Response.Redirect("Home.aspx");
        }
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ToString()))
        {
            con.Open();
            string commandString = "SELECT email, password FROM UserInfo WHERE email='" + EmailTB.Text + "'";
            SqlCommand command = new SqlCommand(commandString, con);
            SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);

            if (!reader.Read())
            {
                Message.Text = "User does not exist!";
                MessagePanel.Visible = true;
            }
            else if ((String.Compare(reader["email"].ToString(), "Admin", false) == 0 && PassTB.Text.Equals(reader["password"].ToString())))
            {
                Session["email"] = "Admin";
                Response.Redirect("Admin.aspx");
            }
            else if (reader["password"].ToString() != PassTB.Text)
            {
                Message.Text = "Wrong password";
                MessagePanel.Visible = true;
            }
            else
            {
                Session["current"] = "running";
                Session["email"] = reader["email"];
                if (RememberMeCB.Checked)
                {
                    HttpCookie MyCookie = new HttpCookie("UserInfo");
                    MyCookie["email"] = reader["email"].ToString();
                    MyCookie.Expires = DateTime.Now.AddDays(7);
                    Response.Cookies.Add(MyCookie);
                }
                Response.Redirect("Home.aspx");
            }
        }
    }
    protected void homebutton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}