namespace ImportApplication
{
    partial class ImportForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtPackageURL = new System.Windows.Forms.TextBox();
            this.txtFolderURL = new System.Windows.Forms.TextBox();
            this.lstvRecordFile = new System.Windows.Forms.ListView();
            this.btnImport = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btnFolderURL = new System.Windows.Forms.Button();
            this.btnPackageURL = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.lblInfo = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // txtPackageURL
            // 
            this.txtPackageURL.Location = new System.Drawing.Point(119, 16);
            this.txtPackageURL.Name = "txtPackageURL";
            this.txtPackageURL.Size = new System.Drawing.Size(407, 20);
            this.txtPackageURL.TabIndex = 0;
            // 
            // txtFolderURL
            // 
            this.txtFolderURL.Location = new System.Drawing.Point(119, 59);
            this.txtFolderURL.Name = "txtFolderURL";
            this.txtFolderURL.Size = new System.Drawing.Size(407, 20);
            this.txtFolderURL.TabIndex = 1;
            // 
            // lstvRecordFile
            // 
            this.lstvRecordFile.Location = new System.Drawing.Point(119, 104);
            this.lstvRecordFile.Name = "lstvRecordFile";
            this.lstvRecordFile.Size = new System.Drawing.Size(407, 97);
            this.lstvRecordFile.TabIndex = 2;
            this.lstvRecordFile.UseCompatibleStateImageBehavior = false;
            this.lstvRecordFile.View = System.Windows.Forms.View.List;
            // 
            // btnImport
            // 
            this.btnImport.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnImport.Location = new System.Drawing.Point(558, 104);
            this.btnImport.Name = "btnImport";
            this.btnImport.Size = new System.Drawing.Size(75, 97);
            this.btnImport.TabIndex = 3;
            this.btnImport.Text = "Import";
            this.btnImport.UseVisualStyleBackColor = true;
            this.btnImport.Click += new System.EventHandler(this.btnImport_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Package URL";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 62);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(93, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Import Folder URL";
            // 
            // btnFolderURL
            // 
            this.btnFolderURL.Location = new System.Drawing.Point(558, 57);
            this.btnFolderURL.Name = "btnFolderURL";
            this.btnFolderURL.Size = new System.Drawing.Size(75, 23);
            this.btnFolderURL.TabIndex = 6;
            this.btnFolderURL.Text = "Choose";
            this.btnFolderURL.UseVisualStyleBackColor = true;
            this.btnFolderURL.Click += new System.EventHandler(this.btnFolderURL_Click);
            // 
            // btnPackageURL
            // 
            this.btnPackageURL.Location = new System.Drawing.Point(558, 14);
            this.btnPackageURL.Name = "btnPackageURL";
            this.btnPackageURL.Size = new System.Drawing.Size(75, 23);
            this.btnPackageURL.TabIndex = 7;
            this.btnPackageURL.Text = "Choose";
            this.btnPackageURL.UseVisualStyleBackColor = true;
            this.btnPackageURL.Click += new System.EventHandler(this.btnPackageURL_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 142);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(61, 13);
            this.label3.TabIndex = 8;
            this.label3.Text = "Record File";
            // 
            // lblInfo
            // 
            this.lblInfo.AutoSize = true;
            this.lblInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblInfo.ForeColor = System.Drawing.Color.Green;
            this.lblInfo.Location = new System.Drawing.Point(116, 215);
            this.lblInfo.Name = "lblInfo";
            this.lblInfo.Size = new System.Drawing.Size(34, 13);
            this.lblInfo.TabIndex = 9;
            this.lblInfo.Text = "*Info";
            this.lblInfo.Visible = false;
            // 
            // ImportForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(645, 246);
            this.Controls.Add(this.lblInfo);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnPackageURL);
            this.Controls.Add(this.btnFolderURL);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnImport);
            this.Controls.Add(this.lstvRecordFile);
            this.Controls.Add(this.txtFolderURL);
            this.Controls.Add(this.txtPackageURL);
            this.Name = "ImportForm";
            this.Text = "Import Record";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtPackageURL;
        private System.Windows.Forms.TextBox txtFolderURL;
        private System.Windows.Forms.ListView lstvRecordFile;
        private System.Windows.Forms.Button btnImport;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnFolderURL;
        private System.Windows.Forms.Button btnPackageURL;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label lblInfo;
    }
}