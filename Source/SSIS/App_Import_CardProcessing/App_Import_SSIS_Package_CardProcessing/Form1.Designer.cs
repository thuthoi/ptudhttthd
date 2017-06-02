namespace App_Import_SSIS_Package_CardProcessing
{
    partial class Form1
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
            this.label3 = new System.Windows.Forms.Label();
            this.btnDir = new System.Windows.Forms.Button();
            this.btnFile = new System.Windows.Forms.Button();
            this.txtImport_File_Patch = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtPackage_Patch = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnImport = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.txtDatabase = new System.Windows.Forms.TextBox();
            this.txtSerVerName = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.btnDefault = new System.Windows.Forms.Button();
            this.txt_Info = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 199);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(132, 26);
            this.label3.TabIndex = 17;
            this.label3.Text = "Danh sách các file \".csv\" \r\n trong thư mục import";
            // 
            // btnDir
            // 
            this.btnDir.Location = new System.Drawing.Point(457, 154);
            this.btnDir.Name = "btnDir";
            this.btnDir.Size = new System.Drawing.Size(90, 23);
            this.btnDir.TabIndex = 15;
            this.btnDir.Text = "Chọn thư mục";
            this.btnDir.UseVisualStyleBackColor = true;
            this.btnDir.Click += new System.EventHandler(this.btnDir_Click);
            // 
            // btnFile
            // 
            this.btnFile.Location = new System.Drawing.Point(457, 119);
            this.btnFile.Name = "btnFile";
            this.btnFile.Size = new System.Drawing.Size(90, 23);
            this.btnFile.TabIndex = 14;
            this.btnFile.Text = "Chọn file";
            this.btnFile.UseVisualStyleBackColor = true;
            this.btnFile.Click += new System.EventHandler(this.btnFile_Click);
            // 
            // txtImport_File_Patch
            // 
            this.txtImport_File_Patch.Location = new System.Drawing.Point(172, 154);
            this.txtImport_File_Patch.Name = "txtImport_File_Patch";
            this.txtImport_File_Patch.Size = new System.Drawing.Size(268, 20);
            this.txtImport_File_Patch.TabIndex = 13;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 157);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(150, 13);
            this.label2.TabIndex = 12;
            this.label2.Text = "Đường dẫn chứa tập tin import";
            // 
            // txtPackage_Patch
            // 
            this.txtPackage_Patch.Location = new System.Drawing.Point(172, 119);
            this.txtPackage_Patch.Name = "txtPackage_Patch";
            this.txtPackage_Patch.Size = new System.Drawing.Size(268, 20);
            this.txtPackage_Patch.TabIndex = 11;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(10, 122);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(126, 13);
            this.label1.TabIndex = 10;
            this.label1.Text = "Đường dẫn của package";
            // 
            // btnImport
            // 
            this.btnImport.Location = new System.Drawing.Point(469, 334);
            this.btnImport.Name = "btnImport";
            this.btnImport.Size = new System.Drawing.Size(78, 23);
            this.btnImport.TabIndex = 9;
            this.btnImport.Text = "Import";
            this.btnImport.UseVisualStyleBackColor = true;
            this.btnImport.Click += new System.EventHandler(this.btnImport_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(10, 88);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(75, 13);
            this.label4.TabIndex = 18;
            this.label4.Text = "Tên Database";
            // 
            // txtDatabase
            // 
            this.txtDatabase.Location = new System.Drawing.Point(172, 85);
            this.txtDatabase.Name = "txtDatabase";
            this.txtDatabase.Size = new System.Drawing.Size(375, 20);
            this.txtDatabase.TabIndex = 19;
            // 
            // txtSerVerName
            // 
            this.txtSerVerName.Location = new System.Drawing.Point(172, 51);
            this.txtSerVerName.Name = "txtSerVerName";
            this.txtSerVerName.Size = new System.Drawing.Size(375, 20);
            this.txtSerVerName.TabIndex = 20;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(10, 54);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 13);
            this.label5.TabIndex = 21;
            this.label5.Text = "Tên Server";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(99, 9);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(361, 24);
            this.label6.TabIndex = 22;
            this.label6.Text = "App import dữ liệu giao dịch vào hệ thống";
            // 
            // btnDefault
            // 
            this.btnDefault.Location = new System.Drawing.Point(13, 334);
            this.btnDefault.Name = "btnDefault";
            this.btnDefault.Size = new System.Drawing.Size(97, 23);
            this.btnDefault.TabIndex = 23;
            this.btnDefault.Text = "Import Mặc định";
            this.btnDefault.UseVisualStyleBackColor = true;
            this.btnDefault.Click += new System.EventHandler(this.btnDefault_Click);
            // 
            // txt_Info
            // 
            this.txt_Info.Location = new System.Drawing.Point(172, 189);
            this.txt_Info.Multiline = true;
            this.txt_Info.Name = "txt_Info";
            this.txt_Info.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txt_Info.Size = new System.Drawing.Size(375, 126);
            this.txt_Info.TabIndex = 24;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(571, 369);
            this.Controls.Add(this.txt_Info);
            this.Controls.Add(this.btnDefault);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtSerVerName);
            this.Controls.Add(this.txtDatabase);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnDir);
            this.Controls.Add(this.btnFile);
            this.Controls.Add(this.txtImport_File_Patch);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtPackage_Patch);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnImport);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnDir;
        private System.Windows.Forms.Button btnFile;
        private System.Windows.Forms.TextBox txtImport_File_Patch;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtPackage_Patch;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnImport;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtDatabase;
        private System.Windows.Forms.TextBox txtSerVerName;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button btnDefault;
        private System.Windows.Forms.TextBox txt_Info;
    }
}

