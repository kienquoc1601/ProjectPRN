using CalendarProject.Models;

namespace CalendarProject
{
    public partial class Form1 : Form
    {
        calendarDBContext context = new calendarDBContext();
        public Form1()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            User user = (User)context.Users.Where(u => u.Username == txtUname.Text).FirstOrDefault();
            Account account = (Account)context.Accounts.Where(a => a.Username == txtUname.Text).FirstOrDefault();
            if (!txtPass.Text.Equals(account.Password))
            {
                MessageBox.Show("Login failled");
                txtPass.Clear();
                txtUname.Clear();

            }
            else
            {
                CalendarFrm frm = new CalendarFrm(user,account);
                frm.Show();
                
            }
        }
    }
}