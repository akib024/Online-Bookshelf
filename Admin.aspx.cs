using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    string ConnectionString = ConfigurationManager.ConnectionStrings["Connection"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            Session["category"] = CategoryList.SelectedValue.ToString();
            string FileName = FileUploadControl.PostedFile.FileName;
            Int64 FileSize = FileUploadControl.PostedFile.ContentLength;

            string FileExtension = FileName.Substring(FileName.LastIndexOf('.'));

            if (!String.Equals(FileExtension, ".pdf", StringComparison.OrdinalIgnoreCase))
            {
                StatusLabel.Text = "Upload status: Sorry, only '.pdf' files uploading is allowed";
            }
            else if (String.Equals(FileExtension, ".aspx", StringComparison.OrdinalIgnoreCase) || String.Equals(FileExtension, ".asp", StringComparison.OrdinalIgnoreCase))
            {
                StatusLabel.Text = "Upload status: Sorry, '.aspx' or '.asp' file uploading is not allowed";
            }
            else
            {
                string Path = Server.MapPath("~") + "FILES\\" + Session["category"].ToString();
                DirectoryInfo Directory = new DirectoryInfo(Path);
                if (!Directory.Exists)
                {
                    bool Created = CreateDirectory(Session["category"].ToString());
                    if (!Created)
                    {
                        StatusLabel.Text = "CRITICAL ERROR: User folder could not be created!";
                        return;
                    }
                }
                int StatusUpdateDB = AddFileToDatabase(Session["category"].ToString(), FileName, FileSize);
                Path += "\\";

                if (StatusUpdateDB == 0)
                {
                    FileUploadControl.SaveAs(Path + FileName);
                    StatusLabel.Text = "File uploaded successfully";
                }

                else if (StatusUpdateDB == 1)
                    StatusLabel.Text = "Updoad Failed!<br />Reason: You have another file with the same name!";

                else if (StatusUpdateDB == 2)
                    StatusLabel.Text = "Updoad Failed!<br />Reason: Table \"UserInfo\" could not be updated";

                else if (StatusUpdateDB == 3)
                    StatusLabel.Text = "Updoad Failed!<br />Reason: Table \"Files\" could not be updated";
            }
            StatusLabel.Visible = true;
        }

    }

    private bool CreateDirectory(string category)
    {
        string Path = Server.MapPath("~") + "FILES\\";
        DirectoryInfo Directory = new DirectoryInfo(Path);
        try
        {
            Directory.CreateSubdirectory(category);
        }
        catch
        {
            return false;
        }
        return true;
    }

    private int AddFileToDatabase(string Category, string FileName, Int64 Filesize)
    {
        string CommandString;

        if (FileName.Contains("'"))
            FileName = FileName.Replace("'", "''");

        using (SqlConnection Connection = new SqlConnection(ConnectionString))
        {
            Connection.Open();
            CommandString = "SELECT filename FROM Files WHERE category='" + Session["category"].ToString() + "' and filename='" + FileName + "'";
            SqlCommand CheckCommand = new SqlCommand(CommandString, Connection);
            SqlDataReader Reader = CheckCommand.ExecuteReader();

            // if file exists with the same name as parameter FileName, return 1
            if (Reader.Read())
            {
                if (Reader["filename"].ToString().Equals(FileName))
                {
                    return 1;
                }
            }
        }
        using (SqlConnection Connection = new SqlConnection(ConnectionString))
        {
            Connection.Open();
            CommandString = "INSERT INTO Files (filename, filepath, category, filesize) values('" + FileName + "','" + Session["category"].ToString() + "','" + Session["category"].ToString() + "'," + Filesize + ")";
            SqlCommand Command = new SqlCommand(CommandString, Connection);
            try
            {
                if (Command.ExecuteNonQuery() == 0)
                {
                    return 3;
                }
            }
            catch
            {
                // if update of Files table fails, return 3
                return 3;
            }
        }
        // if succeeded, return 0
        return 0;
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