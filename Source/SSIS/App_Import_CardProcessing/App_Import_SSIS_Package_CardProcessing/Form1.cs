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

namespace App_Import_SSIS_Package_CardProcessing
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        List<String> lst_import = new List<string>();
        private void btnFile_Click(object sender, EventArgs e)
        {
            OpenFileDialog choofdlog = new OpenFileDialog();
            choofdlog.Filter = "File đuôi dtsx|*.dtsx";
            choofdlog.FilterIndex = 1;
            choofdlog.Multiselect = true;

            if (choofdlog.ShowDialog() == DialogResult.OK)
            {
                txtPackage_Patch.Text = choofdlog.FileName;
            }
        }

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
            txt_Info.Text = "";
        }

        private void Check_Dir(string path)
        {
            Clear_ImportFile();
            //txt_Info.Text = "Danh sách các file import ";
            DirectoryInfo dir = new DirectoryInfo(path);
            FileInfo[] TXTFiles = dir.GetFiles("*.csv");
            if (TXTFiles.Length == 0)
            {
                MessageBox.Show("thư mục import không chứa file có đuôi .csv");
                Clear_ImportFile();
            }
            foreach (var file in TXTFiles)
            {
                if (file.Exists)
                {
                    //lv_sub_folder_import.Items.Add(file.Name);
                    lst_import.Add(file.Name);
                    txt_Info.Text += String.Format(" - File: {0} \r\n", file.Name);

                }
            }
        }

        private void btnImport_Click(object sender, EventArgs e)
        {
            if (txtSerVerName.Text == "")
            {
                MessageBox.Show("Chưa nhập tên server");
            }
            else if (txtDatabase.Text == "")
            {
                MessageBox.Show("Chưa nhập tên database");
            }
            if (txtSerVerName.Text == "")
            {
                MessageBox.Show("Chưa nhập tên server");
            }
            else if (txtImport_File_Patch.Text == "")
            {
                MessageBox.Show("Chưa chọn thư mục chứa file muốn import");
            }
            else if (txtPackage_Patch.Text == "")
            {
                MessageBox.Show("Chưa chọn package muốn gọi thực hiện import");
            }
            else if (lst_import.Count == 0)
            {
                MessageBox.Show("Thư mục chọn không có file để import");
            }
            else
            {
                DialogResult result3 = MessageBox.Show("Bạn muốn tiến hành import toàn bộ file trong thư mục" + txtImport_File_Patch.Text,
                                                   "Thông báo",
                                                   MessageBoxButtons.OKCancel,
                                                   MessageBoxIcon.Question,
                                                   MessageBoxDefaultButton.Button2);
                if (result3 == DialogResult.OK)
                {
                    Import_File(txtSerVerName.Text, txtDatabase.Text, txtImport_File_Patch.Text, txtPackage_Patch.Text);

                }

            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnDefault_Click(object sender, EventArgs e)
        {
            //MessageBox.Show("Tiến hành import toàn bộ file trong thư mục" + txtImport_File_Patch.Text);
            string Server_name = ConfigurationManager.AppSettings["Server_name"];
            string Database_name = ConfigurationManager.AppSettings["Database_name"];
            string Dir_path = ConfigurationManager.AppSettings["Dir_path"];
            string File_path = ConfigurationManager.AppSettings["File_path"];
            DialogResult result3 = MessageBox.Show("Bạn muốn tiến hành import toàn bộ file trong thư mục" + txtImport_File_Patch.Text,
                                                   "Thông báo",
                                                   MessageBoxButtons.OKCancel,
                                                   MessageBoxIcon.Question,
                                                   MessageBoxDefaultButton.Button2);
            if (result3 == DialogResult.OK)
            {
                Check_Dir(Dir_path);
                Import_File(Server_name, Database_name, Dir_path, File_path);

            }

        }

        private void Import_File(string Server_name, string Database_name, string Dir_path, string File_path)
        {
            //File_path = File_path.Replace(@"\", "\\");
            //string _SSIS_path = "\"" + File_path + "\""; // _File_path
            txt_Info.Text += " \r\n";

            foreach (string import_file_name in lst_import)
            {
                //string file_import_path = Dir_path.Replace(@"\", "\\");

               // file_import_path += string.Format("\\{0}", import_file_name.Text);
               string file_import_path = Dir_path + string.Format(@"\{0}", import_file_name);
               //file_import_path = "\"" + file_import_path + "\"";


                //string lenh_comandline = string.Format(@"/C dtexec -f {0} /set \package.variables[file_path_import];{1} /set \package.variables[ServerName];{2}  /set \package.variables[InitiCatalog];{3}",
                //                                        _File_path, file_import_path,
                //                                        Server_name, Database_name);

                string pkgLocation = File_path;

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

                txt_Info.Text += "Tiến hành import file: " + import_file_name + " \r\n";

                if (pkgResults == DTSExecResult.Success)
                {
                    //MessageBox.Show("Import thành công file" + import_file_name.Text);
                   // lv_sub_folder_import.Items.Add("Import thành công file" + import_file_name.Text);
                    txt_Info.Text += "Import thành công file: " + import_file_name + " \r\n";

                }
                else
                {
                    //lv_sub_folder_import.Items.Add("Import thất bại file" + import_file_name.Text);
                    txt_Info.Text += "*******Import thất bại file: " + import_file_name + "\r\n";
                    foreach (Microsoft.SqlServer.Dts.Runtime.DtsError local_DtsError in pkg.Errors)
                    {
                        txt_Info.Text += "Lỗi: " + local_DtsError.Description + "\r\n";
                    }
                    
                }

                txt_Info.SelectionStart = txt_Info.TextLength;
                txt_Info.ScrollToCaret();




                //System.Diagnostics.Process process = new System.Diagnostics.Process();
                //System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
                //startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
                //startInfo.FileName = "cmd.exe";
                //startInfo.Arguments = lenh_comandline;
                //process.StartInfo = startInfo;
                //process.StartInfo.UseShellExecute = false;
                //process.StartInfo.RedirectStandardOutput = true;
                //process.Start();

                ////Get program output
                //string strOutput = process.StandardOutput.ReadToEnd();
                ////Wait for process to finish
                //process.WaitForExit();
                //if (process.ExitCode == 0)
                //{
                //    MessageBox.Show("Import thành công file" + import_file_name.Text);

                //    EditAppSetting("Server_name", Server_name);
                //    EditAppSetting("Database_name", Database_name);
                //    EditAppSetting("Dir_path", Dir_path);
                //    EditAppSetting("File_path", File_path);  
                //    ConfigurationManager.RefreshSection("appSettings");  
                //}
                //else
                //{
                //    MessageBox.Show("Lỗi \n" + strOutput);
                //    //MessageBox.Show("Lỗi file hoặc đường dẫn, mời xem lại");
                //}

            }

            EditAppSetting("Server_name", Server_name);
            EditAppSetting("Database_name", Database_name);

            EditAppSetting("Dir_path", Dir_path);
            EditAppSetting("File_path", File_path);
            ConfigurationManager.RefreshSection("appSettings");

        }

        public static void EditAppSetting(string key, string value)
        {
            System.Configuration.Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings[key].Value = value;
            config.Save(ConfigurationSaveMode.Modified);
            ConfigurationManager.RefreshSection("appSettings");
        }
    }
}
