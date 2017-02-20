using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    string ConnectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
    string UserEmail;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataBind();
        if ((string)Session["current"] != "running" && Request.Cookies["UserInfo"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if ((string)Session["current"] == "running")
        {
            UserEmail = Session["email"].ToString();
            /*categorylabel.Text = Session["category"].ToString();
            categorylabel.Visible = true;*/
        }
        else if (Request.Cookies["UserInfo"] != null)
        {
            UserEmail = Request.Cookies["UserInfo"]["email"];
            Session["current"] = "running";
            Session["email"] = UserEmail;
            /*UserEmail = Session["email"].ToString();
            categorylabel.Text = Session["category"].ToString();
            categorylabel.Visible = true;*/
        }
        if (!IsPostBack)
        {
            Session["category"] = "islamic";
        }
    }
    protected void Islamic_Click(object sender, EventArgs e)
    {
        Session["category"] = "islamic";
        //Response.Write(e.ToString());
    }
    protected void Engineering_Click(object sender, EventArgs e)
    {
        Session["category"] = "engr";
    }
    protected void Literature_Click(object sender, EventArgs e)
    {
        Session["category"] = "literature";
    }
    protected void Novel_Click(object sender, EventArgs e)
    {
        Session["category"] = "novel";
    }
    protected void Programming_Click(object sender, EventArgs e)
    {
        Session["category"] = "programming";
    }
    protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string FiringCommand = e.CommandName;
        if (FiringCommand == "DownloadCommand")
        {
            using (SqlConnection Connection = new SqlConnection(ConnectionString))
            {
                Connection.Open();
                string CommandString = "SELECT filename, filesize FROM Files WHERE Id='" + e.CommandArgument.ToString() + "'";
                SqlCommand Command = new SqlCommand(CommandString, Connection);

                SqlDataReader Reader = Command.ExecuteReader(CommandBehavior.CloseConnection);
                Reader.Read();
                string path = Server.MapPath("~");
                path += (String.Format("\\FILES\\{0}\\{1}", (string)Session["category"], @Reader["filename"]));
                FileInfo FileInfo = new FileInfo(path);

                Response.ClearContent();
                Response.AddHeader("Content-Disposition", string.Format("attachment; filename = {0}", System.IO.Path.GetFileName(path)));
                Response.TransmitFile(path);
                Response.End();
            }
        }
    }
    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Text = (e.Row.DataItemIndex + 1).ToString();
            string FileSizeString = e.Row.Cells[2].Text;
            Int64 FileSize = Int64.Parse(FileSizeString);

            if (FileSize > 1048576)
                FileSizeString = String.Format("{0:0.00} MB", (double)FileSize / 1048576);
            else if (FileSize > 1024)
                FileSizeString = String.Format("{0:0.00} KB", (double)FileSize / 1024);
            else
                FileSizeString = String.Format("{0} B", FileSize);

            e.Row.Cells[2].Text = FileSizeString;
        }
    }
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfo"] != null)
        {
            HttpCookie newCookie = new HttpCookie("UserInfo");
            newCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(newCookie);
        }
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    protected void homebutton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}