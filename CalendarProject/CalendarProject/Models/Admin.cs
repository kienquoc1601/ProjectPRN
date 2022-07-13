using System;
using System.Collections.Generic;

#nullable disable

namespace CalendarProject.Models
{
    public partial class Admin
    {
        public Admin()
        {
            GroupEvents = new HashSet<GroupEvent>();
        }

        public int AdminId { get; set; }
        public string Username { get; set; }

        public virtual Account UsernameNavigation { get; set; }
        public virtual ICollection<GroupEvent> GroupEvents { get; set; }
    }
}
