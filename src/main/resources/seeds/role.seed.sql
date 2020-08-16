BEGIN
    SET IDENTITY_INSERT [dbo].[role] ON
    MERGE [dbo].[role] AS T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'897f3076-958b-4213-ae8a-6d4263f77f33', 1, NULL, N'ADMIN'),
                     (2, N'2ba58f54-89d6-4ce3-b004-346a7840fa72', 1, NULL, N'USER')
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name]);

    SET IDENTITY_INSERT [dbo].[role] OFF
END
