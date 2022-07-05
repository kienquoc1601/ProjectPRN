namespace CalendarProject
{
    partial class UserControlDay
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lbDay = new System.Windows.Forms.Label();
            this.lbEvent = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lbDay
            // 
            this.lbDay.AutoSize = true;
            this.lbDay.Location = new System.Drawing.Point(17, 25);
            this.lbDay.Name = "lbDay";
            this.lbDay.Size = new System.Drawing.Size(19, 15);
            this.lbDay.TabIndex = 0;
            this.lbDay.Text = "00";
            // 
            // lbEvent
            // 
            this.lbEvent.AutoSize = true;
            this.lbEvent.Location = new System.Drawing.Point(17, 63);
            this.lbEvent.Name = "lbEvent";
            this.lbEvent.Size = new System.Drawing.Size(50, 15);
            this.lbEvent.TabIndex = 1;
            this.lbEvent.Text = "0 events";
            // 
            // UserControlDay
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLight;
            this.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Controls.Add(this.lbEvent);
            this.Controls.Add(this.lbDay);
            this.Name = "UserControlDay";
            this.Size = new System.Drawing.Size(149, 100);
            this.Load += new System.EventHandler(this.UserControlDay_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Label lbDay;
        private Label lbEvent;
    }
}
