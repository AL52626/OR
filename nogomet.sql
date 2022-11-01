CREATE TABLE [dbo].[fixtures](
	[IDFixture] [int] IDENTITY(1,1) NOT NULL,
	[Season] [char](9) NOT NULL,
	[HomeTeamID] [int] NOT NULL,
	[AwayTeamID] [int] NOT NULL,
	[HomeGoals] [int] NULL,
	[AwayGoals] [int] NULL,
	[Referee] [nvarchar](50) NOT NULL,
	[Result] [char](1) NULL,
	[Date] [date] NOT NULL,
	[Competition] [nvarchar](50) NOT NULL
) ON [PRIMARY];

CREATE TABLE [dbo].[footballClubs](
	[IDFootballClub] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_footballClubs] PRIMARY KEY CLUSTERED 
(
	[IDFootballClub] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY];

Create view [dbo].[fixtures_names] as
SELECT TOP (1000) [IDFixture]
      ,[Season]
      ,h.Name as HomeTeam
      ,a.Name as AwayTeam
      ,[HomeGoals]
      ,[AwayGoals]
      ,[Referee]
      ,[Result]
      ,[Date]
      ,[Competition]
  FROM [OR_Lab].[dbo].[fixtures]
   join footballClubs h on HomeTeamID=h.IDFootballClub 
   join footballClubs a on AwayTeamID=a.IDFootballClub ;
   
CREATE PROCEDURE [dbo].[fixturesToJson]
AS
SELECT TOP (1000) [IDFixture]
      ,[Season]
      ,[HomeTeam]
      ,[AwayTeam]
      ,[HomeGoals]
      ,[AwayGoals]
      ,[Referee]
      ,[Result]
      ,[Date]
      ,[Competition]
  FROM [OR_Lab].[dbo].[fixtures_names]
  FOR JSON AUTO;