USE [master]
GO
/****** Object:  Database [BackendSkillAssessment]    Script Date: 2/20/2018 3:06:11 AM ******/
CREATE DATABASE [BackendSkillAssessment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BackendSkillAssessment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BackendSkillAssessment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BackendSkillAssessment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BackendSkillAssessment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BackendSkillAssessment] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BackendSkillAssessment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BackendSkillAssessment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET ARITHABORT OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BackendSkillAssessment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BackendSkillAssessment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BackendSkillAssessment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BackendSkillAssessment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BackendSkillAssessment] SET  MULTI_USER 
GO
ALTER DATABASE [BackendSkillAssessment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BackendSkillAssessment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BackendSkillAssessment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BackendSkillAssessment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BackendSkillAssessment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BackendSkillAssessment] SET QUERY_STORE = OFF
GO
USE [BackendSkillAssessment]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BackendSkillAssessment]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2/20/2018 3:06:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [varchar](200) NULL,
	[OwnerState] [varchar](250) NULL,
	[OwnerCity] [varchar](250) NULL,
	[Address] [varchar](max) NULL,
	[Zip] [int] NULL,
	[MunicipalityName] [varchar](500) NULL,
	[Township] [varchar](500) NULL,
	[Suffix] [varchar](200) NULL,
	[OwnerId] [int] NULL,
	[PropertyId] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Owner]    Script Date: 2/20/2018 3:06:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnerId] [int] IDENTITY(1,1) NOT NULL,
	[OwnerName] [varchar](250) NULL,
	[OwnerUnparsedName1] [varchar](200) NULL,
	[OwnerUnparsedName2] [varchar](200) NULL,
	[OwnerMatchCode] [varchar](200) NULL,
	[OwnerMailOptOut] [bit] NULL,
	[OwnerName2] [varchar](200) NULL,
	[AbsenteeOwnerCode] [char](10) NULL,
	[CorporateOwner] [bit] NULL,
	[OwnerCarrierRoute] [varchar](200) NULL,
	[OwnerPhoneOptOut] [bit] NULL,
	[OwnerSuite] [varchar](50) NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[OwnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OwnerProperties]    Script Date: 2/20/2018 3:06:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnerProperties](
	[OwnerId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
 CONSTRAINT [PK_OwnerProperties] PRIMARY KEY CLUSTERED 
(
	[OwnerId] ASC,
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property]    Script Date: 2/20/2018 3:06:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyId] [int] IDENTITY(1,1) NOT NULL,
	[SaleCode] [char](10) NULL,
	[PriorMultiApnCode] [char](10) NULL,
	[LandUseCode] [int] NULL,
	[HeatingCode] [varchar](50) NULL,
	[BuildingArea] [int] NULL,
	[RoofTypeCode] [varchar](50) NULL,
	[TaxAmount] [float] NULL,
	[RoofCoverCode] [int] NULL,
	[ResidentalModel] [varchar](100) NULL,
	[FireplaceCode] [varchar](50) NULL,
	[Zoning] [varchar](200) NULL,
	[DepthFootage] [int] NULL,
	[Fireplace] [bit] NULL,
	[LivingSpace] [int] NULL,
	[HalfBaths] [int] NULL,
	[GroundFloor] [int] NULL,
	[MortgageAssumptionAmount] [float] NULL,
	[EffectiveYearBuilt] [int] NULL,
	[ParsedRange] [int] NULL,
	[AppraisedLandValue] [float] NULL,
	[CalculatedLandValue] [float] NULL,
	[ViewCode] [varchar](50) NULL,
	[PriorTransactionId] [int] NULL,
	[Section] [int] NULL,
	[GarageCode] [varchar](50) NULL,
	[MortgageTerm] [int] NULL,
	[MobileHome] [bit] NULL,
	[PriorMultiApnCount] [varchar](200) NULL,
	[MultiApnCount] [int] NULL,
	[ParkingSpaces] [int] NULL,
	[Pool] [bit] NULL,
	[SecondMortgageDeedTypeCode] [varchar](50) NULL,
	[CensusTract] [int] NULL,
	[BathFixtures] [int] NULL,
	[Basement] [int] NULL,
	[SaleDate] [datetime] NULL,
	[MortgageDate] [datetime] NULL,
	[ConstructionCode] [varchar](50) NULL,
	[MultiApnCode] [char](10) NULL,
	[PriorMortgageAmount] [int] NULL,
	[CalculatedLandValueCode] [char](10) NULL,
	[PriorSaleDate] [datetime] NULL,
	[FrontFootage] [int] NULL,
	[Bedrooms] [int] NULL,
	[ElectricityCode] [varchar](50) NULL,
	[MarketLandValue] [float] NULL,
	[PriorRecordingDate] [datetime] NULL,
	[Acreage] [float] NULL,
	[Units] [int] NULL,
	[AppraisedTotalValue] [float] NULL,
	[TotalBathsCalculated] [int] NULL,
	[AssessedImprovementValue] [float] NULL,
	[TotalRooms] [int] NULL,
	[Fireplaces] [int] NULL,
	[FlooringCode] [char](10) NULL,
	[FipsSubCode] [varchar](50) NULL,
	[DeedTypeCode] [varchar](50) NULL,
	[LenderName] [varchar](500) NULL,
	[PriorDeedCategoryCode] [int] NULL,
	[CalculatedTotalValue] [float] NULL,
	[Longitude] [float] NULL,
	[TotalBaths] [float] NULL,
	[PoolCode] [varchar](50) NULL,
	[BuildingAreaCode] [char](10) NULL,
	[SewerCode] [varchar](50) NULL,
	[AssessedLandValue] [float] NULL,
	[SecondMortgageLoanTypeCode] [varchar](50) NULL,
	[ExteriorWallCode] [varchar](50) NULL,
	[PropertyIndicatorCode] [int] NULL,
	[CalculatedImprovementValue] [float] NULL,
	[RecordingDate] [datetime] NULL,
	[ParkingCode] [varchar](50) NULL,
	[SquareFootage] [int] NULL,
	[DeedCategoryCode] [varchar](50) NULL,
	[Latitude] [float] NULL,
	[QualityCode] [varchar](50) NULL,
	[MarketImprovementValue] [float] NULL,
	[PriorSaleCode] [char](10) NULL,
	[BuildingCode] [varchar](50) NULL,
	[PriorDocumentYear] [int] NULL,
	[AssessedTotalValue] [float] NULL,
	[PostDirectional] [varchar](50) NULL,
	[AdjustedGross] [float] NULL,
	[CalculatedImprovementValueCode] [char](10) NULL,
	[SellerName] [varchar](500) NULL,
	[ConditionCode] [varchar](50) NULL,
	[MortgageLoanTypeCode] [varchar](50) NULL,
	[CountyLandUse1] [int] NULL,
	[NumberOfBuildings] [int] NULL,
	[CountyLandUse2] [int] NULL,
	[FuelCode] [varchar](50) NULL,
	[TransactionId] [int] NULL,
	[ThreeQuarterBaths] [int] NULL,
	[Predirectional] [varchar](50) NULL,
	[SecondMortgageAmount] [float] NULL,
	[SalePrice] [float] NULL,
	[UniversalBuilding] [int] NULL,
	[BuildingStyleCode] [varchar](50) NULL,
	[OriginalApn] [int] NULL,
	[GarageOrParking] [int] NULL,
	[StoriesCode] [varchar](50) NULL,
	[MortgageDueDate] [datetime] NULL,
	[TransactionId1] [int] NULL,
	[FipsCode] [int] NULL,
	[MarketTotalValue] [float] NULL,
	[OneQuarterBaths] [int] NULL,
	[WaterCode] [varchar](50) NULL,
	[LenderCode] [int] NULL,
	[UnformattedApn] [int] NULL,
	[FullBaths] [int] NULL,
	[MortgageDeedTypeCode] [varchar](50) NULL,
	[AirConditioningCode] [varchar](50) NULL,
	[FormattedApn] [varchar](200) NULL,
	[FoundationCode] [varchar](50) NULL,
	[YearBuilt] [int] NULL,
	[PriorSalePrice] [float] NULL,
	[BasementCode] [varchar](50) NULL,
	[Range] [varchar](250) NULL,
	[DocumentYear] [int] NULL,
	[ImprovementCode] [varchar](50) NULL,
	[MortgageAmount] [float] NULL,
	[Stories] [int] NULL,
	[QuarterSection] [varchar](50) NULL,
	[RoofFramingCode] [varchar](50) NULL,
	[LocationInfluenceCode] [varchar](50) NULL,
	[Gross] [int] NULL,
	[AppraisedImprovementValue] [float] NULL,
	[ApnSequenceNo] [int] NULL,
	[HomesteadExempt] [bit] NULL,
	[CalculatedTotalValueCode] [char](10) NULL,
	[TaxYear] [int] NULL,
	[MortgageTermCode] [char](10) NULL,
	[SuiteName] [varchar](250) NULL,
	[SuiteRange] [varchar](200) NULL,
	[PropertyResults] [varchar](max) NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Address]  WITH NOCHECK ADD  CONSTRAINT [FK_Address_Owner] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Owner]
GO
ALTER TABLE [dbo].[OwnerProperties]  WITH CHECK ADD  CONSTRAINT [FK_OwnerProperties_Owner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Owner] ([OwnerId])
GO
ALTER TABLE [dbo].[OwnerProperties] CHECK CONSTRAINT [FK_OwnerProperties_Owner]
GO
ALTER TABLE [dbo].[OwnerProperties]  WITH CHECK ADD  CONSTRAINT [FK_OwnerProperties_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Property] ([PropertyId])
GO
ALTER TABLE [dbo].[OwnerProperties] CHECK CONSTRAINT [FK_OwnerProperties_Property]
GO
USE [master]
GO
ALTER DATABASE [BackendSkillAssessment] SET  READ_WRITE 
GO
