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

namespace App_Import_SSIS_Package_CardProcessing
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

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
                lv_sub_folder_import.Items.Clear();
            }
            
        }

        private void Check_Dir(string path)
        {
            lv_sub_folder_import.Items.Clear();
            DirectoryInfo dir = new DirectoryInfo(path);
            FileInfo[] TXTFiles = dir.GetFiles("*.csv");
            if (TXTFiles.Length == 0)
            {
                MessageBox.Show("thư mục import không chứa file có đuôi .csv");
                lv_sub_folder_import.Items.Clear();
            }
            foreach (var file in TXTFiles)
            {
                if (file.Exists)
                {
                    lv_sub_folder_import.Items.Add(file.Name);

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
            else if (lv_sub_folder_import.Items.Count == 0)
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
                //MessageBox.Show("Tiến hành import toàn bộ file trong thư mục" + txtImport_File_Patch.Text);

               
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

            //Check_Dir(Dir_path);
            //Import_File(Server_name, Database_name, Dir_path, File_path);
        }

        private void Import_File(string Server_name, string Database_name, string Dir_path, string File_path)
        {
            File_path = File_path.Replace(@"\", "\\");
            string _File_path = "\"" + File_path + "\"";
            foreach (ListViewItem import_file_name in lv_sub_folder_import.Items)
            {
                string file_import_path = Dir_path.Replace(@"\", "\\");
                
                file_import_path += string.Format("\\{0}", import_file_name.Text);
                file_import_path = "\"" + file_import_path + "\"";
                

                string lenh_comandline = string.Format(@"/C dtexec -f {0} /set \package.variables[file_path_import];{1} /set \package.variables[ServerName];{2}  /set \package.variables[InitiCatalog];{3}",
                                                        _File_path, file_import_path,
                                                        Server_name, Database_name);

                System.Diagnostics.Process process = new System.Diagnostics.Process();
                System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
                startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
                startInfo.FileName = "cmd.exe";
                startInfo.Arguments = lenh_comandline;
                process.StartInfo = startInfo;
                process.StartInfo.UseShellExecute = false;
                process.StartInfo.RedirectStandardOutput = true;
                process.Start();

                //Get program output
                string strOutput = process.StandardOutput.ReadToEnd();
                //Wait for process to finish
                process.WaitForExit();
                if (process.ExitCode == 0)
                {
                    MessageBox.Show("Import thành công file" + import_file_name.Text);

                    EditAppSetting("Server_name", Server_name);
                    EditAppSetting("Database_name", Database_name);
                    EditAppSetting("Dir_path", Dir_path);
                    EditAppSetting("File_path", File_path);  
                    ConfigurationManager.RefreshSection("appSettings");  
                }
                else
                {
                    MessageBox.Show("Lỗi \n" + strOutput);
                    //MessageBox.Show("Lỗi file hoặc đường dẫn, mời xem lại");
                }

            }
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
