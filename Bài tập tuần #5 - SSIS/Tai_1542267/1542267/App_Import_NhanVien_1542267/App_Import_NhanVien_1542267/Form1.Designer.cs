namespace App_Import_NhanVien_1542267
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
            this.btnImport = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtPackage_Patch = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtImport_File_Patch = new System.Windows.Forms.TextBox();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.lv_sub_folder_import = new System.Windows.Forms.ListView();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnImport
            // 
            this.btnImport.Location = new System.Drawing.Point(174, 242);
            this.btnImport.Name = "btnImport";
            this.btnImport.Size = new System.Drawing.Size(75, 23);
            this.btnImport.TabIndex = 0;
            this.btnImport.Text = "Import";
            this.btnImport.UseVisualStyleBackColor = true;
            this.btnImport.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(126, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Đường dẫn của package";
            // 
            // txtPackage_Patch
            // 
            this.txtPackage_Patch.Location = new System.Drawing.Point(174, 21);
            this.txtPackage_Patch.Name = "txtPackage_Patch";
            this.txtPackage_Patch.Size = new System.Drawing.Size(265, 20);
            this.txtPackage_Patch.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 59);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(150, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Đường dẫn chứa tập tin import";
            // 
            // txtImport_File_Patch
            // 
            this.txtImport_File_Patch.Location = new System.Drawing.Point(174, 56);
            this.txtImport_File_Patch.Name = "txtImport_File_Patch";
            this.txtImport_File_Patch.Size = new System.Drawing.Size(265, 20);
            this.txtImport_File_Patch.TabIndex = 4;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(447, 21);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(87, 23);
            this.button2.TabIndex = 5;
            this.button2.Text = "Chọn file";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(447, 56);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(87, 23);
            this.button3.TabIndex = 6;
            this.button3.Text = "Chọn thư mục";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // lv_sub_folder_import
            // 
            this.lv_sub_folder_import.Location = new System.Drawing.Point(174, 91);
            this.lv_sub_folder_import.Name = "lv_sub_folder_import";
            this.lv_sub_folder_import.Size = new System.Drawing.Size(265, 132);
            this.lv_sub_folder_import.TabIndex = 7;
            this.lv_sub_folder_import.UseCompatibleStateImageBehavior = false;
            this.lv_sub_folder_import.View = System.Windows.Forms.View.List;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 101);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(121, 26);
            this.label3.TabIndex = 8;
            this.label3.Text = "Danh sách các file .txt\" \r\n trong thư mục import";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(547, 277);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.lv_sub_folder_import);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.txtImport_File_Patch);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtPackage_Patch);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnImport);
            this.Name = "Form1";
            this.Text = "Bài tập của yêu cầu lần 2";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnImport;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtPackage_Patch;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtImport_File_Patch;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.ListView lv_sub_folder_import;
        private System.Windows.Forms.Label label3;
    }
}

