using System;
using Entity.DTO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Entity.Models
{
    public partial class IContext : DbContext
    {
        public IContext()
        {
        }

        public IContext(DbContextOptions<IContext> options)
            : base(options)
        {
        }

        public virtual DbSet<LkpGender> LkpGender { get; set; }
        public virtual DbSet<LkpUserType> LkpUserType { get; set; }
        public virtual DbSet<MovieAssignement> MovieAssignement { get; set; }
        public virtual DbSet<Movies> Movies { get; set; }
        public virtual DbSet<UserDetails> UserDetails { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=ASD-PC\\SQLEXPRESS;Initial Catalog=IMDB_Demo;Integrated Security=True;MultipleActiveResultSets=True;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<LkpGender>(entity =>
            {
                entity.HasKey(e => e.GenderId);

                entity.ToTable("lkpGender");

                entity.Property(e => e.GenderId).HasColumnName("GenderID");

                entity.Property(e => e.GenderCode)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.GenderName)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<LkpUserType>(entity =>
            {
                entity.HasKey(e => e.UtId);

                entity.ToTable("lkpUserType");

                entity.Property(e => e.UtId).HasColumnName("UT_ID");

                entity.Property(e => e.UtTypeName)
                    .HasColumnName("UT_TypeName")
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MovieAssignement>(entity =>
            {
                entity.HasKey(e => e.MaId);

                entity.Property(e => e.MaId).HasColumnName("MA_ID");

                entity.Property(e => e.MaMovieId).HasColumnName("MA_MovieID");

                entity.Property(e => e.MaUserId).HasColumnName("MA_UserID");

                entity.HasOne(d => d.MaMovie)
                    .WithMany(p => p.MovieAssignement)
                    .HasForeignKey(d => d.MaMovieId)
                    .HasConstraintName("fk_MovieAssignement_Movies");

                entity.HasOne(d => d.MaUser)
                    .WithMany(p => p.MovieAssignement)
                    .HasForeignKey(d => d.MaUserId)
                    .HasConstraintName("fk_MovieAssignement_UserDetails");
            });

            modelBuilder.Entity<Movies>(entity =>
            {
                entity.HasKey(e => e.MId);

                entity.Property(e => e.MId).HasColumnName("M_ID");

                entity.Property(e => e.MName)
                    .HasColumnName("M_Name")
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.MPlot)
                    .HasColumnName("M_Plot")
                    .IsUnicode(false);

                entity.Property(e => e.MPoster)
                    .HasColumnName("M_Poster")
                    .IsUnicode(false);

                entity.Property(e => e.MYearOfRelease)
                    .HasColumnName("M_YearOfRelease")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.MIsDeleted).HasColumnName("M_IsDeleted");
            });

            modelBuilder.Entity<UserDetails>(entity =>
            {
                entity.HasKey(e => e.UdId);

                entity.Property(e => e.UdId).HasColumnName("UD_ID");

                entity.Property(e => e.UdBio)
                    .HasColumnName("UD_Bio")
                    .IsUnicode(false);

                entity.Property(e => e.UdDob)
                    .HasColumnName("UD_DOB")
                    .HasColumnType("datetime");

                entity.Property(e => e.UdIsDeleted).HasColumnName("UD_IsDeleted");

                entity.Property(e => e.UdName)
                    .HasColumnName("UD_Name")
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.UdSex).HasColumnName("UD_Sex");

                entity.Property(e => e.UdUserType).HasColumnName("UD_UserType");

                entity.HasOne(d => d.UdSexNavigation)
                    .WithMany(p => p.UserDetails)
                    .HasForeignKey(d => d.UdSex)
                    .HasConstraintName("fk_UserDetails_lkpGender");

                entity.HasOne(d => d.UdUserTypeNavigation)
                    .WithMany(p => p.UserDetails)
                    .HasForeignKey(d => d.UdUserType)
                    .HasConstraintName("fk_UserDetails_lkpUserType");
            });
            modelBuilder.Query<MovieDTO>();
        }
    }
}
