BEGIN
    SET IDENTITY_INSERT [dbo].[user] ON
    MERGE [dbo].[user] AS T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'd8768f87-2d2f-4586-b056-2cd9657cf498', 1, NULL, N'demo-admin@buildy.com', N'demo-admin', N'$2a$10$.Am/x3KXIdGCt1mP7TkO1.d5uHD1IlZcqGz3pUgdVtbZ1zAe8DMnG', N'MALE', CONVERT(datetime, '1998-06-18 00:00:00.000'), 1, 1, 1, 1),
                     (2, N'655133e1-cd1c-4451-b3c8-7c73910f02ee', 1, NULL, N'demo-user@buildy.com', N'demo-user', N'$2a$10$.Am/x3KXIdGCt1mP7TkO1.d5uHD1IlZcqGz3pUgdVtbZ1zAe8DMnG', N'MALE', CONVERT(datetime, '1998-06-18 00:00:00.000'), 1, 1, 1, 1)
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [email_address], [username], [password_hash], [gender], [date_of_birth], [is_account_non_expired], [is_account_non_locked], [is_credentials_non_expired], [is_enabled])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[email_address] = S.[email_address],
                                 T.[username] = S.[username],
                                 T.[password_hash] = S.[password_hash],
                                 T.[gender] = S.[gender],
                                 T.[date_of_birth] = S.[date_of_birth],
                                 T.[is_account_non_expired] = S.[is_account_non_expired],
                                 T.[is_account_non_locked] = S.[is_account_non_locked],
                                 T.[is_credentials_non_expired] = S.[is_credentials_non_expired],
                                 T.[is_enabled] = S.[is_enabled]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [email_address], [username], [password_hash], [gender], [date_of_birth], [is_account_non_expired], [is_account_non_locked], [is_credentials_non_expired], [is_enabled])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[email_address], S.[username], S.[password_hash], S.[gender], S.[date_of_birth], S.[is_account_non_expired], S.[is_account_non_locked], S.[is_credentials_non_expired], S.[is_enabled]);

    SET IDENTITY_INSERT [dbo].[user] OFF
END
