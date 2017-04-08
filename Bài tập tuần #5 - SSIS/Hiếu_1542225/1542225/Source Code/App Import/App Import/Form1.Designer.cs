namespace App_Import
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtPackage = new System.Windows.Forms.TextBox();
            this.txtImport = new System.Windows.Forms.TextBox();
            this.btnLinkPackage = new System.Windows.Forms.Button();
            this.btnLinkImport = new System.Windows.Forms.Button();
            this.btnImport = new System.Windows.Forms.Button();
            this.listView = new System.Windows.Forms.ListView();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(25, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(69, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "File Package";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(25, 92);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(68, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Folder Import";
            // 
            // txtPackage
            // 
            this.txtPackage.Location = new System.Drawing.Point(28, 53);
            this.txtPackage.Name = "txtPackage";
            this.txtPackage.Size = new System.Drawing.Size(360, 20);
            this.txtPackage.TabIndex = 2;
            // 
            // txtImport
            // 
            this.txtImport.Location = new System.Drawing.Point(28, 120);
            this.txtImport.Name = "txtImport";
            this.txtImport.Size = new System.Drawing.Size(360, 20);
            this.txtImport.TabIndex = 3;
            // 
            // btnLinkPackage
            // 
            this.btnLinkPackage.Location = new System.Drawing.Point(401, 51);
            this.btnLinkPackage.Name = "btnLinkPackage";
            this.btnLinkPackage.Size = new System.Drawing.Size(94, 23);
            this.btnLinkPackage.TabIndex = 4;
            this.btnLinkPackage.Text = "Chọn file";
            this.btnLinkPackage.UseVisualStyleBackColor = true;
            this.btnLinkPackage.Click += new System.EventHandler(this.btnLinkPackage_Click);
            // 
            // btnLinkImport
            // 
            this.btnLinkImport.Location = new System.Drawing.Point(401, 118);
            this.btnLinkImport.Name = "btnLinkImport";
            this.btnLinkImport.Size = new System.Drawing.Size(94, 23);
            this.btnLinkImport.TabIndex = 5;
            this.btnLinkImport.Text = "Chọn Folder";
            this.btnLinkImport.UseVisualStyleBackColor = true;
            this.btnLinkImport.Click += new System.EventHandler(this.btnLinkImport_Click);
            // 
            // btnImport
            // 
            this.btnImport.Location = new System.Drawing.Point(202, 159);
            this.btnImport.Name = "btnImport";
            this.btnImport.Size = new System.Drawing.Size(106, 30);
            this.btnImport.TabIndex = 6;
            this.btnImport.Text = "IMPORT";
            this.btnImport.UseVisualStyleBackColor = true;
            this.btnImport.Click += new System.EventHandler(this.btnImport_Click);
            // 
            // listView
            // 
            this.listView.Location = new System.Drawing.Point(388, 159);
            this.listView.Name = "listView";
            this.listView.Size = new System.Drawing.Size(107, 30);
            this.listView.TabIndex = 7;
            this.listView.UseCompatibleStateImageBehavior = false;
            this.listView.Visible = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(507, 201);
            this.Controls.Add(this.listView);
            this.Controls.Add(this.btnImport);
            this.Controls.Add(this.btnLinkImport);
            this.Controls.Add(this.btnLinkPackage);
            this.Controls.Add(this.txtImport);
            this.Controls.Add(this.txtPackage);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "App Import";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtPackage;
        private System.Windows.Forms.TextBox txtImport;
        private System.Windows.Forms.Button btnLinkPackage;
        private System.Windows.Forms.Button btnLinkImport;
        private System.Windows.Forms.Button btnImport;
        private System.Windows.Forms.ListView listView;
    }
}

