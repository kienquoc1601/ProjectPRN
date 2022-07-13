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
    
    public partial class AddEventFrm : Form
    {
        calendarDBContext context = new calendarDBContext();
        User currentUser;
        public AddEventFrm(DateTime dt , User inputUser)
        {
            InitializeComponent();
            dtDate.Value = dt;
            currentUser = inputUser;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            Event newEvent = new Event();
            newEvent.EventName = txtName.Text;
            newEvent.Description = txtDesc.Text;
            newEvent.Date = dtDate.Value;
            newEvent.UserId = currentUser.UserId;
            context.Events.Add(newEvent);
            context.SaveChanges();
            
            this.Close();
        }
    }
}
