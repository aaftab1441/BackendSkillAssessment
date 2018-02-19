using Microsoft.EntityFrameworkCore;

namespace BackendSkillAssessment.EntityFrameworkCore.Models
{
    public partial class BackendSkillAssessmentContext : DbContext
    {
        public virtual DbSet<Address> Address { get; set; }
        public virtual DbSet<Owner> Owner { get; set; }
        public virtual DbSet<OwnerProperties> OwnerProperties { get; set; }
        public virtual DbSet<Property> Property { get; set; }
        
        public BackendSkillAssessmentContext(DbContextOptions<BackendSkillAssessmentContext> options):base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Address>(entity =>
            {
                entity.Property(e => e.Address1)
                    .HasColumnName("Address")
                    .IsUnicode(false);

                entity.Property(e => e.MunicipalityName)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.OwnerCity)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.OwnerState)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.StreetName)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Suffix)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Township)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.HasOne(d => d.Property)
                    .WithMany(p => p.Address)
                    .HasForeignKey(d => d.PropertyId)
                    .HasConstraintName("FK_Address_Owner");
            });

            modelBuilder.Entity<Owner>(entity =>
            {
                entity.Property(e => e.AbsenteeOwnerCode).HasColumnType("char(10)");

                entity.Property(e => e.OwnerCarrierRoute)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.OwnerMatchCode)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.OwnerName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.OwnerName2)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.OwnerSuite)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.OwnerUnparsedName1)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.OwnerUnparsedName2)
                    .HasMaxLength(200)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<OwnerProperties>(entity =>
            {
                entity.HasKey(e => new { e.OwnerId, e.PropertyId });

                entity.HasOne(d => d.Owner)
                    .WithMany(p => p.OwnerProperties)
                    .HasForeignKey(d => d.OwnerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OwnerProperties_Owner");

                entity.HasOne(d => d.Property)
                    .WithMany(p => p.OwnerProperties)
                    .HasForeignKey(d => d.PropertyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OwnerProperties_Property");
            });

            modelBuilder.Entity<Property>(entity =>
            {
                entity.Property(e => e.AirConditioningCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.BasementCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.BuildingAreaCode).HasColumnType("char(10)");

                entity.Property(e => e.BuildingCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.BuildingStyleCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CalculatedImprovementValueCode).HasColumnType("char(10)");

                entity.Property(e => e.CalculatedLandValueCode).HasColumnType("char(10)");

                entity.Property(e => e.CalculatedTotalValueCode).HasColumnType("char(10)");

                entity.Property(e => e.ConditionCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ConstructionCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DeedCategoryCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.DeedTypeCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ElectricityCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ExteriorWallCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FipsSubCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FireplaceCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FlooringCode).HasColumnType("char(10)");

                entity.Property(e => e.FormattedApn)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.FoundationCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FuelCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.GarageCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.HeatingCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ImprovementCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LenderName)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.LocationInfluenceCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MortgageDate).HasColumnType("datetime");

                entity.Property(e => e.MortgageDeedTypeCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MortgageDueDate).HasColumnType("datetime");

                entity.Property(e => e.MortgageLoanTypeCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MortgageTermCode).HasColumnType("char(10)");

                entity.Property(e => e.MultiApnCode).HasColumnType("char(10)");

                entity.Property(e => e.ParkingCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PoolCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PostDirectional)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Predirectional)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PriorMultiApnCode).HasColumnType("char(10)");

                entity.Property(e => e.PriorMultiApnCount)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.PriorRecordingDate).HasColumnType("datetime");

                entity.Property(e => e.PriorSaleCode).HasColumnType("char(10)");

                entity.Property(e => e.PriorSaleDate).HasColumnType("datetime");

                entity.Property(e => e.PropertyResults).IsUnicode(false);

                entity.Property(e => e.QualityCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.QuarterSection)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Range)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.RecordingDate).HasColumnType("datetime");

                entity.Property(e => e.ResidentalModel)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.RoofFramingCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.RoofTypeCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SaleCode).HasColumnType("char(10)");

                entity.Property(e => e.SaleDate).HasColumnType("datetime");

                entity.Property(e => e.SecondMortgageDeedTypeCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SecondMortgageLoanTypeCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SellerName)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.SewerCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.StoriesCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SuiteName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.SuiteRange)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.ViewCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.WaterCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Zoning)
                    .HasMaxLength(200)
                    .IsUnicode(false);
            });
        }
    }
}
