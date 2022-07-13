using System;
using System.Collections.Generic;

#nullable disable

namespace CalendarProject.Models
{
    public partial class GroupUser
    {
        public int GroupId { get; set; }
        public int UserId { get; set; }

        public virtual GroupEvent Group { get; set; }
        public virtual User User { get; set; }
    }
}
