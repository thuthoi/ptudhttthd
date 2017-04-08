using System;
using System.IO;
using System.Windows.Forms;

namespace App_Import
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        // Chọn file package
        private void btnLinkPackage_Click(object sender, EventArgs e)
        {
            OpenFileDialog _openFileDialog = new OpenFileDialog();
            _openFileDialog.Filter = "dtsx|*.dtsx"; // chỉ nhận file dtsx
            _openFileDialog.FilterIndex = 1;
            _openFileDialog.Multiselect = true;

            if (_openFileDialog.ShowDialog() == DialogResult.OK)
            {
                txtPackage.Text = _openFileDialog.FileName;
            }
        }

        // Chọn thư mục chứa các file Import
        private void btnLinkImport_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog _folderBrowserDialog = new FolderBrowserDialog();
            if (_folderBrowserDialog.ShowDialog() == DialogResult.OK)
            {
                txtImport.Text = _folderBrowserDialog.SelectedPath;
            }
            DirectoryInfo _directoryInfo = new DirectoryInfo(txtImport.Text);
            FileInfo[] _fileInfo = _directoryInfo.GetFiles("*.txt");
            if(_fileInfo.Length == 0)
            {
                MessageBox.Show("Không có file import");
                listView.Items.Clear();
            }
            foreach(var _file in _fileInfo)
            {
                if (_file.Exists)
                {
                    listView.Items.Add(_file.Name);
                }
            }
        }

        //Kiểm tra trước khi Import
        private bool CheckBeforeImport()
        {
            bool _result = true;
            if(txtImport.Text.Trim() == string.Empty && txtPackage.Text.Trim() == string.Empty && listView.Items.Count == 0)
            {
                _result = false;
            }
            return _result;
        }

        // Import
        private void btnImport_Click(object sender, EventArgs e)
        {
            if (CheckBeforeImport() == true)
            {
                foreach(ListViewItem _importFile in listView.Items)
                {
                    string _importFilePath = txtImport.Text.Replace(@"\", "\\");
                    _importFilePath += string.Format("\\{0}", _importFile.Text);
                    string _invokeCommandLine = string.Format(@"/C dtexec -f {0} /set \package.variables[_importFilePath];{1} ", txtPackage.Text, _importFilePath);
                    System.Diagnostics.Process _process = new System.Diagnostics.Process();
                    System.Diagnostics.ProcessStartInfo _processStartInfo = new System.Diagnostics.ProcessStartInfo();
                    _processStartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
                    _processStartInfo.FileName = "cmd.exe";
                    _processStartInfo.Arguments = _invokeCommandLine;
                    _process.StartInfo = _processStartInfo;
                    _process.Start();
                }
                MessageBox.Show("Import Success");
            }
            else
            {
                MessageBox.Show("Error!!!");
            }
        }
    }
}
