using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace CalendarProject.Models
{
    public partial class calendarDBContext : DbContext
    {
        public calendarDBContext()
        {
        }

        public calendarDBContext(DbContextOptions<calendarDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Event> Events { get; set; }
        public virtual DbSet<GroupEvent> GroupEvents { get; set; }
        public virtual DbSet<GroupUser> GroupUsers { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=DESKTOP-HIDQ1HV\\SQLEXPRESS;Database=calendarDB;uid=sa;pwd=quoc1601");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Account>(entity =>
            {
                entity.HasKey(e => e.Username);

                entity.ToTable("Account");

                entity.Property(e => e.Username)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.Property(e => e.Admin).HasColumnName("admin");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("password");
            });

            modelBuilder.Entity<Admin>(entity =>
            {
                entity.ToTable("Admin");

                entity.Property(e => e.AdminId).HasColumnName("admin_id");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.HasOne(d => d.UsernameNavigation)
                    .WithMany(p => p.Admins)
                    .HasForeignKey(d => d.Username)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Admin_Account");
            });

            modelBuilder.Entity<Event>(entity =>
            {
                entity.ToTable("Event");

                entity.Property(e => e.EventId).HasColumnName("event_id");

                entity.Property(e => e.Date)
                    .HasColumnType("date")
                    .HasColumnName("date");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .IsUnicode(false)
                    .HasColumnName("description");

                entity.Property(e => e.EventName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("event_name");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Events)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Event_User");
            });

            modelBuilder.Entity<GroupEvent>(entity =>
            {
                entity.HasKey(e => e.GroupId);

                entity.ToTable("GroupEvent");

                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.AdminId).HasColumnName("admin_id");

                entity.Property(e => e.Date)
                    .HasColumnType("date")
                    .HasColumnName("date");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .IsUnicode(false)
                    .HasColumnName("description");

                entity.Property(e => e.EventName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("event_name");

                entity.HasOne(d => d.Admin)
                    .WithMany(p => p.GroupEvents)
                    .HasForeignKey(d => d.AdminId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupEvent_Admin");
            });

            modelBuilder.Entity<GroupUser>(entity =>
            {
                entity.HasKey(e => new { e.GroupId, e.UserId });

                entity.ToTable("GroupUser");

                entity.Property(e => e.GroupId).HasColumnName("group_id");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Group)
                    .WithMany(p => p.GroupUsers)
                    .HasForeignKey(d => d.GroupId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupUser_GroupEvent");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.GroupUsers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_GroupUser_User");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.HasOne(d => d.UsernameNavigation)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.Username)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_User_Account");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
