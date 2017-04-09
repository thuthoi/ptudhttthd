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
using Microsoft.SqlServer.Dts.Runtime;

namespace ImportApplication
{
    public partial class ImportForm : Form
    {
        public ImportForm()
        {
            InitializeComponent();
        }

        private void btnPackageURL_Click(object sender, EventArgs e)
        {
            OpenFileDialog choosefile = new OpenFileDialog();
            choosefile.Filter = "dtsx|*.dtsx";
            choosefile.FilterIndex = 1;
            choosefile.Multiselect = true;

            if (choosefile.ShowDialog() == DialogResult.OK)
            {
                txtPackageURL.Text = choosefile.FileName;
            }
        }

        private void btnFolderURL_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog folderBrowser = new FolderBrowserDialog();
            folderBrowser.Description = "Chọn folder chứa tập tin import dạng .txt";

            if (folderBrowser.ShowDialog() == DialogResult.OK)
            {
                txtFolderURL.Text = folderBrowser.SelectedPath;

                DirectoryInfo dir = new DirectoryInfo(txtFolderURL.Text);
                FileInfo[] TXTFiles = dir.GetFiles("*.txt");
                if (TXTFiles.Length == 0)
                {
                    lstvRecordFile.Items.Clear();
                }
                foreach (var file in TXTFiles)
                {
                    if (file.Exists)
                    {
                        lstvRecordFile.Items.Add(file.Name);
                    }
                }
            }
        }

        private void btnImport_Click(object sender, EventArgs e)
        {
            if (txtFolderURL.Text == "")
            {
                MessageBox.Show("Chưa chọn thư mục chứa file muốn import!", "Thông báo");
            }
            else if (txtPackageURL.Text == "")
            {
                MessageBox.Show("Chưa chọn package muốn gọi thực hiện import!", "Thông báo");
            }
            else if (lstvRecordFile.Items.Count == 0)
            {
                MessageBox.Show("Thư mục chọn không có file để import!", "Thông báo");
            }
            else
            {
                lblInfo.Visible = true;
                lblInfo.Text = "Tiến hành import toàn bộ file trong thư mục " + txtFolderURL.Text;

                string pkgLocation = txtPackageURL.Text.Replace(@"\", "\\");;

                Package pkg;
                Microsoft.SqlServer.Dts.Runtime.Application app;
                DTSExecResult pkgResults;
                Variables vars;

                app = new Microsoft.SqlServer.Dts.Runtime.Application();
                pkg = app.LoadPackage(pkgLocation, null);

                vars = pkg.Variables;
                foreach (ListViewItem file in lstvRecordFile.Items)
                {
                     string fileURL = txtFolderURL.Text + @"\" + file.Text;
                     vars["file_path_import"].Value = fileURL.Replace(@"\", "\\"); ;

                     pkgResults = pkg.Execute(null, vars, null, null, null);

                     if (pkgResults == DTSExecResult.Success)
                            lblInfo.Text = "Package ran successfully on " + file.Text;
                      else
                            lblInfo.Text = "Package failed on " + file.Text;
                }

                lblInfo.Text = "Processing completed!";
            }
        }
    }
}
