--Drop 

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Parts_TotalMiles]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Parts] DROP CONSTRAINT [DF_Parts_TotalMiles]
END

GO


GO

/****** Object:  Index [_dta_index_Parts_17_1229247434__K13_K3_1_2_4_5_6_7_8_10_11_12_14_15_16_17_18_19_20]    Script Date: 03/05/2015 11:08:51 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Parts]') AND name = N'_dta_index_Parts_17_1229247434__K13_K3_1_2_4_5_6_7_8_10_11_12_14_15_16_17_18_19_20')
DROP INDEX [_dta_index_Parts_17_1229247434__K13_K3_1_2_4_5_6_7_8_10_11_12_14_15_16_17_18_19_20] ON [dbo].[Parts] WITH ( ONLINE = OFF )
GO


GO

/****** Object:  Index [IX_Parts_pd_p_th_cm_cma_tm_etal]    Script Date: 03/05/2015 11:09:57 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Parts]') AND name = N'IX_Parts_pd_p_th_cm_cma_tm_etal')
DROP INDEX [IX_Parts_pd_p_th_cm_cma_tm_etal] ON [dbo].[Parts] WITH ( ONLINE = OFF )
GO

--Alter table

begin tran

alter table Parts
alter column TotalMiles decimal(18,2)

Commit 

--Add


GO

ALTER TABLE [dbo].[Parts] ADD  CONSTRAINT [DF_Parts_TotalMiles]  DEFAULT ((0)) FOR [TotalMiles]
GO


GO

/****** Object:  Index [_dta_index_Parts_17_1229247434__K13_K3_1_2_4_5_6_7_8_10_11_12_14_15_16_17_18_19_20]    Script Date: 03/05/2015 11:08:45 ******/
CREATE NONCLUSTERED INDEX [_dta_index_Parts_17_1229247434__K13_K3_1_2_4_5_6_7_8_10_11_12_14_15_16_17_18_19_20] ON [dbo].[Parts] 
(
	[NumericId] ASC,
	[PartDesignID] ASC
)
INCLUDE ( [PartID],
[TemplateHierarchy],
[CurrentMiles],
[CurrentMilesAdjustment],
[TotalMiles],
[CurrentInstallCount],
[InstallCountAdjustment],
[LocationID],
[TeamID],
[CreateDate],
[Notes],
[IsActive],
[LegacyId],
[VendorSerialNumber],
[StatusTypeID]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


GO

/****** Object:  Index [IX_Parts_pd_p_th_cm_cma_tm_etal]    Script Date: 03/05/2015 11:09:24 ******/
CREATE NONCLUSTERED INDEX [IX_Parts_pd_p_th_cm_cma_tm_etal] ON [dbo].[Parts] 
(
	[PartDesignID] ASC
)
INCLUDE ( [PartID],
[TemplateHierarchy],
[CurrentMiles],
[CurrentMilesAdjustment],
[TotalMiles],
[CurrentInstallCount],
[InstallCountAdjustment],
[LocationID],
[TeamID],
[CreateDate],
[NumericId],
[Notes],
[IsActive],
[LegacyId],
[VendorSerialNumber],
[StatusTypeID],
[SerialString]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO






