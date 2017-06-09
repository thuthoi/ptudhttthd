using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using Microsoft.SqlServer.Dts.Runtime;
using System.Data.SqlClient;

namespace App_Import_SSIS_Package_CardProcessing
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        List<String> lst_import = new List<string>();
        

        private void btnDir_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog fbd = new FolderBrowserDialog();
            fbd.Description = "Chọn folder chứa tập tin import";

            if (fbd.ShowDialog() == DialogResult.OK)
            {
                txtImport_File_Patch.Text = fbd.SelectedPath;
                Check_Dir(txtImport_File_Patch.Text);
            }
            else
            {
                Clear_ImportFile();
            }

        }

        private void Clear_ImportFile()
        {
            lst_import.Clear();
        }

        private bool Check_Dir(string path)
        {
            Clear_ImportFile();
            //txt_Info.AppendText = "Danh sách các file import ";
            DirectoryInfo dir = new DirectoryInfo(path);
            FileInfo[] TXTFiles = dir.GetFiles("*.csv");
            if (TXTFiles.Length == 0)
            {
                Clear_ImportFile();
                return false;
            }
            else
            {
                txt_Info.AppendText(String.Format("Detected {0} file \r\n", TXTFiles.Count()));
                foreach (var file in TXTFiles)
                {
                    if (file.Exists)
                    {
                        //lv_sub_folder_import.Items.Add(file.Name);
                        lst_import.Add(file.Name);
                        txt_Info.AppendText(String.Format(" - File: {0} \r\n", file.Name));
                    }
                }
            }
            return true;
        }

        private void btnImport_Click(object sender, EventArgs e)
        {
            if (CheckBeforeStart() == true)
            {
                Start_App();
                SrcollToEnd();
            }

        }

        private bool CheckBeforeStart()
        {
            if (txtSerVerName.Text == "")
            {
                MessageBox.Show("Server Name is Emty");
                return false;
            }
            else if (txtDatabase.Text == "")
            {
                MessageBox.Show("Database Name is Emty");
                return false;
            }
            else if (txtImport_File_Patch.Text == "")
            {
                MessageBox.Show("Directory Import File Path is empty");
                return false;
            }
            else if (Directory.Exists(txtImport_File_Patch.Text) == false)
            {
                MessageBox.Show("Directory Import File Path is  not valid");
                return false;
            }
            
            return true;
          
        }

        private void Start_App()
        {
            txt_Info.AppendText(" ---------- Check conection:   \r\n");
            txt_Info.AppendText(" ---------- Stand by   \r\n");
            if (CheckDbConnection(txtSerVerName.Text, txtDatabase.Text) == true)
            {
                txt_Info.AppendText(" ---------- Connection successful   \r\n");
                //MessageBox.Show("Server Name or Database Name is not valid");
                timer1.Start();
                txt_Info.AppendText(" - App started  \r\n");
                txt_Info.AppendText(String.Format(" - Waiting..... \r\n"));
                btnStop.Enabled = true;
                btnStart.Enabled = false;
                btnDir.Enabled = false;
                txtSerVerName.Enabled = false;
                txtDatabase.Enabled = false;
                txtImport_File_Patch.Enabled = false;
                //txtPackage_Patch.Enabled = false;
            }
            else
            {
                txt_Info.AppendText(" ---------- Connection failed   \r\n");
                txt_Info.AppendText(" - App stopped  \r\n");
            }
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            txtSerVerName.Focus();
        }

        private void btnDefault_Click(object sender, EventArgs e)
        {
            //MessageBox.Show("Tiến hành import toàn bộ file trong thư mục" + txtImport_File_Patch.Text);
            string Server_name = ConfigurationManager.AppSettings["Server_name"];
            string Database_name = ConfigurationManager.AppSettings["Database_name"];
            string Dir_path = ConfigurationManager.AppSettings["Dir_path"];
            //string File_path = ConfigurationManager.AppSettings["File_path"];

            txtSerVerName.Text = Server_name;
            txtDatabase.Text = Database_name;
            txtImport_File_Patch.Text = Dir_path;

            if (CheckBeforeStart() == true)
            {
                Start_App();
                SrcollToEnd();
            }
        }

        private void Import_File(string Server_name, string Database_name, string Dir_path)
        {

            txt_Info.AppendText(" \r\n");

            string Success_file_import_path = Dir_path + string.Format(@"\Success Import");
            string Failed_file_import_path = Dir_path + string.Format(@"\Failed Import");
            System.IO.Directory.CreateDirectory(Success_file_import_path);
            System.IO.Directory.CreateDirectory(Failed_file_import_path);
            foreach (string import_file_name in lst_import)
            {

                string file_import_path = Dir_path + string.Format(@"\{0}", import_file_name);

                Success_file_import_path = Dir_path + string.Format(@"\Success Import\{0}", import_file_name);
                Failed_file_import_path = Dir_path + string.Format(@"\Failed Import\{0}", import_file_name);

                string pkgLocation = "Import.dtsx";

                Package pkg;
                Microsoft.SqlServer.Dts.Runtime.Application app;
                DTSExecResult pkgResults;
                Variables vars;

                app = new Microsoft.SqlServer.Dts.Runtime.Application();
                pkg = app.LoadPackage(pkgLocation, null);
                vars = pkg.Variables;

                string fileURL = file_import_path;
                vars["file_path_import"].Value = fileURL;
                vars["ServerName"].Value = Server_name;
                vars["InitiCatalog"].Value = Database_name;

                pkgResults = pkg.Execute(null, vars, null, null, null);

                txt_Info.AppendText("--- Starting import file: " + import_file_name + " \r\n");

                if (pkgResults == DTSExecResult.Success)
                {
                    txt_Info.AppendText("--- Import success,  file: " + import_file_name + " \r\n");
                    MoveFileAfter_Import(Success_file_import_path, file_import_path);
                }
                else
                {
                    txt_Info.AppendText("************ IMPORT FAILED, file: " + import_file_name + "\r\n\r\n");
                    foreach (Microsoft.SqlServer.Dts.Runtime.DtsError local_DtsError in pkg.Errors)
                    {
                        //txt_Info.AppendText("Error: " + local_DtsError.Description + "\r\n";
                        Console.WriteLine("Error: " + local_DtsError.Description + "\r\n");
                    }

                    MoveFileAfter_Import(Failed_file_import_path, file_import_path);
                }
            }

            txt_Info.AppendText(String.Format(" - Waiting..... \r\n"));

            EditAppSetting("Server_name", Server_name);
            EditAppSetting("Database_name", Database_name);
            EditAppSetting("Dir_path", Dir_path);
            //EditAppSetting("File_path", File_path);
            ConfigurationManager.RefreshSection("appSettings");

        }

        private static void MoveFileAfter_Import(string path, string file_import_path)
        {
            if (File.Exists(path))
                File.Delete(path);
            File.Move(file_import_path, path);
        }

        public static void EditAppSetting(string key, string value)
        {
            System.Configuration.Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings[key].Value = value;
            config.Save(ConfigurationSaveMode.Modified);
            ConfigurationManager.RefreshSection("appSettings");
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            bool kq = Check_Dir(txtImport_File_Patch.Text); ;
            if (kq == true)
            {
                //txt_Info.AppendText(String.Format("De");
                Import_File(txtSerVerName.Text, txtDatabase.Text, txtImport_File_Patch.Text);
            }
        }

        private void SrcollToEnd()
        {
            txt_Info.SelectionStart = txt_Info.Text.Length;
            txt_Info.ScrollToCaret();
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            if (timer1.Enabled == true)
            {
                timer1.Stop();

                txtSerVerName.Enabled = true;
                txtDatabase.Enabled = true;
                txtImport_File_Patch.Enabled = true;
                btnDir.Enabled = true;
                //txtPackage_Patch.Enabled = true;
                SrcollToEnd();
                btnStart.Enabled = true;
                btnStop.Enabled = false;

            }
            
        }

        private bool CheckDbConnection(string serverName, string databaseName)
        {
            String connectionString = String.Format(@"Server={0};Database={1};Trusted_Connection=True;", serverName, databaseName);
            try
            {
                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    return true;
                }
            }
            catch (Exception ex)
            {
                //logger.Warn(LogTopicEnum.Agent, "Error in DB connection test on CheckDBConnection", ex);
                return false; // any error is considered as db connection error for now
            }
        }
    }
}
