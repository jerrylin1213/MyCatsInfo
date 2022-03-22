
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/22/2022 05:40:14
-- Generated from EDMX file: C:\Users\JerryLin\Desktop\ISIT310FinalProblem\ISIT310FinalProblem\ISIT310Final\CatModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CatsDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cats'
CREATE TABLE [dbo].[Cats] (
    [CatID] int IDENTITY(1,1) NOT NULL,
    [Breed] nvarchar(max)  NOT NULL,
    [PlayfullnessID] int  NOT NULL,
    [ActivityLevelID] int  NOT NULL,
    [ColorID] int  NOT NULL,
    [PlayfullnessPlayfullnessID] int  NOT NULL,
    [ColorColorID] int  NOT NULL,
    [ActivityLevel_ActivityLevelID] int  NOT NULL
);
GO

-- Creating table 'ActivityLevels'
CREATE TABLE [dbo].[ActivityLevels] (
    [ActivityLevelID] int IDENTITY(1,1) NOT NULL,
    [ActivityLevelValue] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Playfullnesses'
CREATE TABLE [dbo].[Playfullnesses] (
    [PlayfullnessID] int IDENTITY(1,1) NOT NULL,
    [PlayfullnessValue] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Colors'
CREATE TABLE [dbo].[Colors] (
    [ColorID] int IDENTITY(1,1) NOT NULL,
    [ColorValue] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CatID] in table 'Cats'
ALTER TABLE [dbo].[Cats]
ADD CONSTRAINT [PK_Cats]
    PRIMARY KEY CLUSTERED ([CatID] ASC);
GO

-- Creating primary key on [ActivityLevelID] in table 'ActivityLevels'
ALTER TABLE [dbo].[ActivityLevels]
ADD CONSTRAINT [PK_ActivityLevels]
    PRIMARY KEY CLUSTERED ([ActivityLevelID] ASC);
GO

-- Creating primary key on [PlayfullnessID] in table 'Playfullnesses'
ALTER TABLE [dbo].[Playfullnesses]
ADD CONSTRAINT [PK_Playfullnesses]
    PRIMARY KEY CLUSTERED ([PlayfullnessID] ASC);
GO

-- Creating primary key on [ColorID] in table 'Colors'
ALTER TABLE [dbo].[Colors]
ADD CONSTRAINT [PK_Colors]
    PRIMARY KEY CLUSTERED ([ColorID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ActivityLevel_ActivityLevelID] in table 'Cats'
ALTER TABLE [dbo].[Cats]
ADD CONSTRAINT [FK_CatActivityLevel]
    FOREIGN KEY ([ActivityLevel_ActivityLevelID])
    REFERENCES [dbo].[ActivityLevels]
        ([ActivityLevelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CatActivityLevel'
CREATE INDEX [IX_FK_CatActivityLevel]
ON [dbo].[Cats]
    ([ActivityLevel_ActivityLevelID]);
GO

-- Creating foreign key on [PlayfullnessPlayfullnessID] in table 'Cats'
ALTER TABLE [dbo].[Cats]
ADD CONSTRAINT [FK_PlayfullnessCat]
    FOREIGN KEY ([PlayfullnessPlayfullnessID])
    REFERENCES [dbo].[Playfullnesses]
        ([PlayfullnessID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayfullnessCat'
CREATE INDEX [IX_FK_PlayfullnessCat]
ON [dbo].[Cats]
    ([PlayfullnessPlayfullnessID]);
GO

-- Creating foreign key on [ColorColorID] in table 'Cats'
ALTER TABLE [dbo].[Cats]
ADD CONSTRAINT [FK_ColorCat]
    FOREIGN KEY ([ColorColorID])
    REFERENCES [dbo].[Colors]
        ([ColorID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ColorCat'
CREATE INDEX [IX_FK_ColorCat]
ON [dbo].[Cats]
    ([ColorColorID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------