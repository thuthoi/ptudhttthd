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

namespace App_Import_NhanVien_1542267
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(txtImport_File_Patch.Text =="")
            {
                MessageBox.Show("Chưa chọn thư mục chứa file muốn import");
            }
            else if(txtPackage_Patch.Text =="")
            {
                MessageBox.Show("Chưa chọn package muốn gọi thực hiện import");
            }
            else if(lv_sub_folder_import.Items.Count == 0)
            {
                MessageBox.Show("Thư mục chọn không có file để import");
            }
            else
            {
                MessageBox.Show("Tiến hành import toàn bộ file trong thư mục" + txtImport_File_Patch.Text);
            //string strCmdText;
            //strCmdText = @"/C dtexec -f C:\Users\Win7\Desktop\Package_1542267\Package_1542267\Package_NhanVien.dtsx";
            //System.Diagnostics.Process.Start("CMD.exe", strCmdText);
            foreach(ListViewItem import_file_name in lv_sub_folder_import.Items)
            {
                string file_import_path = txtImport_File_Patch.Text.Replace(@"\", "\\");
                file_import_path += string.Format("\\{0}", import_file_name.Text);

                string lenh_comandline = string.Format(@"/C dtexec -f {0} /set \package.variables[file_path_import];{1} ", txtPackage_Patch.Text, file_import_path);

                System.Diagnostics.Process process = new System.Diagnostics.Process();
                System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
                startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
                startInfo.FileName = "cmd.exe";
                startInfo.Arguments = lenh_comandline;
                process.StartInfo = startInfo;
                process.Start();
                MessageBox.Show("Import thành công file" + import_file_name.Text);
            }
            }

            
            
        }

        private void button2_Click(object sender, EventArgs e)
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

        private void button3_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog fbd = new FolderBrowserDialog();
            fbd.Description = "Chọn folder chứa tập tin import";

            if (fbd.ShowDialog() == DialogResult.OK)
            {
                txtImport_File_Patch.Text = fbd.SelectedPath;
            }

            DirectoryInfo dir = new DirectoryInfo(txtImport_File_Patch.Text);
            FileInfo[] TXTFiles = dir.GetFiles("*.txt");
            if (TXTFiles.Length == 0)
            {
                MessageBox.Show("thư mục import không chứa file có đuôi .txt");
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
    }
}
