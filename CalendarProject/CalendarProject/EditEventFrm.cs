using CalendarProject.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CalendarProject
{
    public partial class EditEventFrm : Form
    {
        calendarDBContext context = new calendarDBContext();    
        Event currentEvent = new Event();
        public EditEventFrm(Event inputEvent)
        {
            InitializeComponent();
            currentEvent = inputEvent;
            dtDate.Value = currentEvent.Date;
            txtName.Text = currentEvent.EventName;
            txtDescription.Text = currentEvent.Description;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            currentEvent.Date = dtDate.Value;   
            currentEvent.EventName = txtName.Text; 
            currentEvent.Description = txtDescription.Text;
            context.Events.Update(currentEvent);
            context.SaveChanges();
            this.Close();
        }
    }
}
