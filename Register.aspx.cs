using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    string ConnectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        using (SqlConnection Connecion = new SqlConnection(ConnectionString))
        {
            Connecion.Open();
            string CommandString = String.Format("INSERT INTO UserInfo values('{0}' , '{1}' , '{2}' )", EmailTB.Text, NameTB.Text, PassTB.Text);
            SqlCommand Command = new SqlCommand(CommandString, Connecion);

            int RowsAffected;

            try
            {
                RowsAffected = Command.ExecuteNonQuery();
                if(RowsAffected == 0)
                {
                    StatusLabel.Text = "User already exists<br />Please choose a different email";
                    StatusPanel.Visible = true;
                    RegistrationTable.Visible = false;
                    Next.Text = "Back";
                }
                else
                {
                    StatusLabel.Text = "Registration successful!<br />Click 'Next' to continue";
                    RegistrationTable.Visible = false;
                    StatusPanel.Visible = true;
                    Next.Text = "Next";
                }
            }
            catch (Exception E)
            {
                StatusLabel.Text = E.StackTrace;
            }
        }
    }
    protected void EmailTB_TextChanged(object sender, EventArgs e)
    {
        using (SqlConnection Connecion = new SqlConnection(ConnectionString))
        {
            Connecion.Open();
            SqlCommand Command = new SqlCommand("SELECT email FROM UserInfo WHERE email='" + EmailTB.Text + "'", Connecion);

            SqlDataReader Reader = Command.ExecuteReader(CommandBehavior.CloseConnection);

            if(Reader.HasRows)
            {
                UserExistLabel.Visible = true;
            }
            else
            {
                UserExistLabel.Visible = false;
            }
        }
    }
    protected void Next_Click(object sender, EventArgs e)
    {
        if(Next.Text == "Back")
        {
            RegistrationTable.Visible = true;
            StatusPanel.Visible = false;
        }
        else
        {
            Session["current"] = "running";
            Session["email"] = EmailTB.Text;
            Response.Redirect("Home.aspx");
        }
        
    }
    protected void homebutton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}