-- CHIPSET SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[chipset] ON
    MERGE [dbo].[chipset] AS T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'cd8aaf53-f3db-4a0d-bb29-3299036ac663', 1, NULL, N'X570'),
                     (2, N'af6dcb61-f54e-4111-a82f-02a52292b00c', 1, NULL, N'X470'),
                     (3, N'7bec65bb-3fc1-465a-8217-d790d9d80c97', 1, NULL, N'X370'),
                     (4, N'2a72f8d1-b236-4481-b30b-40706448d71a', 1, NULL, N'B550'),
                     (5, N'630b91e3-4930-45be-ae09-79821da62fb2', 1, NULL, N'B450'),
                     (6, N'932333e7-a976-4c80-aaab-6ea88cc92238', 1, NULL, N'B350'),
                     (7, N'b2c1e015-6085-4cf1-86e8-5ea5d585b8ee', 1, NULL, N'Z370'),
                     (8, N'74846613-695b-4717-af41-44b2c19b6c85', 1, NULL, N'Z390'),
                     (9, N'9c865368-5e47-43aa-a4c3-c3d8b7e1ffda', 1, NULL, N'H370'),
                     (10, N'7e577732-1757-4fa2-bdf1-f651470943fb', 1, NULL, N'B360')
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

    SET IDENTITY_INSERT [dbo].[chipset] OFF
END
-----------------------------------------------------------------------------------------------
-- MANUFACTURER SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[manufacturer] ON
    MERGE [dbo].[manufacturer] AS T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'75c3e6f7-b0e3-4313-b75d-5322e6513a5b', 1, NULL, N'Nvidia', N'Nvidia Corporation focuses on personal computer (PC) graphics, graphics processing unit (GPU) and also on artificial intelligence (AI). ... The Company''s processor has created platforms that address four markets: Gaming, Professional Visualization, Datacenter, and Automotive.'),
                     (2, N'fd5c2d21-3457-4b5c-b187-cf2fe8a6433d', 1, NULL, N'AMD', N'(AMD) is an American multinational semiconductor company based in Santa Clara, California that develops computer processors and related technologies for business and consumer markets.'),
                     (3, N'c5696105-49e7-45e2-9bb2-22d6469cd175', 1, NULL, N'Intel', N'Intel Corp. engages in the design, manufacture, and sale of computer products and technologies. It delivers computer, networking, data storage, and communications platforms.'),
                     (4, N'cdbbf544-44bc-4fb7-8918-1abcbc0bfb53', 1, NULL, N'MSI', N'Micro-Star International Co., Ltd (MSI; Chinese: 微星科技股份有限公司) is a Taiwanese multinational information technology corporation headquartered in New Taipei City, Taiwan. ... The earliest Beat IT tournament can be traced back to 2010, featuring Evil Geniuses winning the championship.'),
                     (5, N'7900f07f-7cb4-4452-ae28-0f9d89bb3c87', 1, NULL, N'EVGA', N'EVGA Corporation is an American computer hardware company that produces Nvidia-GPU-based video cards as well as Intel-chipset-based motherboards.'),
                     (6, N'bdb4b8e2-16a2-433e-8c0c-3e2504050fc1', 1, NULL, N'Cooler Master', N'The simple desire to make something better is exactly why Cooler Master is the standard in thermal innovation today. The aspiration to provide better cooling was a matter of personal preference, inspired by the freedom and enjoyment in building and creating something new.'),
                     (7, N'9581e96a-f3f0-4afb-8276-f0864a4c7fa6', 1, NULL, N'Deep Cool', N'Deepcool (Chinese: 九州风神) is a Chinese manufacturer and provider of thermal products for desktops, laptops and servers. It was founded in Beijing in 1996. ... Deepcool''s factory employs around 700 people and has a construction area of 20,000 square meters. It is recognized by ISO9001:2000 and ISO14001.'),
                     (8, N'21f2cf3b-8a9d-457a-9722-c0bbaedf807b', 1, NULL, N'NZXT', N'We relentlessly evolve products and services of the highest quality to make extraordinary gaming experiences achievable and fun'),
                     (9, N'c44b768f-6d58-499b-a215-afaf10612fb2', 1, NULL, N'Samsung', N'Samsung, South Korean company that is one of the world''s largest producers of electronic devices. Samsung specializes in the production of a wide variety of consumer and industry electronics, including appliances, digital media devices, semiconductors, memory chips, and integrated systems.'),
                     (10, N'14372f02-2739-4c0b-8be4-d260dd17df8c', 1, NULL, N'Kingston', N'Kingston Technology Corporation is an American multinational computer technology corporation that develops, manufactures, sells and supports flash memory products and other computer-related memory products, as well as the HyperX brand of headsets, solid-state drives, keyboards, mouse-pads and other gaming equipment.'),
                     (11, N'322693d0-16d3-4c8d-81d4-c77776be7139', 1, NULL, N'Gigabyte', N'GIGABYTE is an industry leader in HPC, delivering systems with the highest GPU density combined with excellent cooling performance, power efficiency and superior networking flexibility. These systems can provide massive parallel computing capabilities to power your next AI breakthrough.'),
                     (12, N'5a4f94f7-14ea-41b7-87ca-8488b67f516a', 1, NULL, N'G Skill', N'G. Skill International Enterprise is a Taiwanese computer hardware manufacturing company. The company''s target customers are overclocking computer users. It produces a variety of high-end PC products and is best known for its RAM products.'),
                     (13, N'04038f3e-b8fa-454e-a597-40ae054337a9', 1, NULL, N'Toshiba', N'Toshiba is a world leader and innovator in pioneering high technology, a diversified manufacturer and marketer of advanced electronic and electrical products and systems spanning energy systems, infrastructure systems, storage devices and Industrial ICT solutions.'),
                     (14, N'929b1623-71b2-4546-b1ec-ebbc764c3531', 1, NULL, N'Western Digital', N'Western Digital Corporation (abbreviated WDC, commonly known as simply Western Digital and WD) is an American computer hard disk drive manufacturer and data storage company. It designs, manufactures and sells data technology products, including storage devices, data center systems and cloud storage services.'),
                     (15, N'9b579aee-a916-4c83-96e8-dfee78b50af6', 1, NULL, N'Fractal Design', N'Fractal Design is a computer hardware manufacturer from Sweden. Founded in 2007, the company manufactures computer cases, water coolers, fans and power supplies. All products are designed and engineered in Sweden. ... Fractal Design manufactures all their products in China.'),
                     (16, N'e6ba45c1-2932-45db-ba82-94716f6faf1e', 1, NULL, N'Sharkoon', N'Sharkoon - About Us. Since 2003, Sharkoon has been developing “Designed in Germany” gaming products, which are popular in the worldwide gaming community due to an exceptional combination of high-performance and affordability. ... With Sharkoon, nothing stands in the way to the next level.'),
                     (17, N'b2465c08-a5d0-458c-8ea8-494870808a8a', 1, NULL, N'A-Data', N'ADATA Technology Co., Ltd. (Chinese: 威剛科技股份有限公司) is a publicly listed (3260:TAI) fabless[1] Taiwanese memory and storage manufacturer, founded in May 2001 by Simon Chen (Traditional Chinese: 陳立白). Its main product line consists of DRAM modules, USB Flash drives, hard disk drives, solid state drives, memory cards and mobile accessories. ADATA is also expanding into new areas, including robotics and electric powertrain systems. In addition to its main ADATA brand, the company also sells PC gaming hardware and accessories under its XPG brand.'),
                     (18, N'4ce502f6-932c-47be-81ab-0d4599ea3a7f', 1, NULL, N'Asus', N'ASUS is a Taiwan-based, multinational computer hardware and consumer electronics company that was established in 1989. Dedicated to creating products for today''s and tomorrow''s smart life, ASUS is the world''s No. 1 motherboard and gaming brand as well as a top-three consumer notebook vendor.'),
                     (19, N'f649a3e4-561a-41dd-9d54-26d5d17cd347', 1, NULL, N'Corsair', N'Corsair Components, Inc. designs, manufactures, and supplies computer peripherals. The Company offers memory modules, flash drives, power supply units, cooling systems, gaming headsets, speakers, gaming keyboards, mice, headsets, mouse mats, and wireless drives.'),
                     (20, N'43fc4792-da9b-449f-bb6d-7872b2ce5427', 1, NULL, N'Noctua',  N'Noctua is an Austrian computer hardware manufacturer of CPU coolers and computer fans primarily for the enthusiast market. The company was founded in 2005 and is a joint venture between Austrian company Rascom Computer Distribution GmbH and the Taiwanese Kolink International Corporation.')
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name], [description])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name],
                                 T.[description] = S.[description]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name], [description])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name], S.[description]);

    SET IDENTITY_INSERT [dbo].[manufacturer] OFF
END
-----------------------------------------------------------------------------------------------
-- PSU EFFICIENCY SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[psu_efficiency] ON
    MERGE [dbo].[psu_efficiency] AS T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'c5d9ab56-372b-47bf-82f6-42e3e0e88729', 1, NULL, N'80 Plus'),
                     (2, N'cc938cc8-2363-450e-ab7f-68dc903a7546', 1, NULL, N'80 Plus Bronze'),
                     (3, N'e40a83e2-bb66-4789-9346-98bd6d05b6cb', 1, NULL, N'80 Plus Silver'),
                     (4, N'41153cb7-9761-4711-965a-1e9c1a8a7e8e', 1, NULL, N'80 Plus Gold'),
                     (5, N'ff8c0331-08a1-4843-bdf2-9bac6d6ac045', 1, NULL, N'80 Plus Platinum'),
                     (6, N'88b5cf3e-7cd5-4b7f-8382-ba51ce5f043c', 1, NULL, N'80 Plus Titanium')
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

    SET IDENTITY_INSERT [dbo].[psu_efficiency] OFF
END
-----------------------------------------------------------------------------------------------
-- SOCKET SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[socket] ON
    MERGE [dbo].[socket] AS T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'c8790fbf-baf9-4111-83da-c1bab0b382ea', 1, NULL, N'LGA 1150'),
                     (2, N'82f8d0a4-33f3-4b40-b479-3ec25b010bd4', 1, NULL, N'LGA 1151'),
                     (3, N'584682a6-d627-4d18-859b-8e3e0eff3d1e', 1, NULL, N'PGA'),
                     (4, N'23125f88-eef6-4983-868a-a5af7ba7159a', 1, NULL, N'AM3'),
                     (5, N'0c36cc8e-5c23-4c6c-bd45-edb4256f7c5d', 1, NULL, N'AM4')
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

    SET IDENTITY_INSERT [dbo].[socket] OFF
END
-----------------------------------------------------------------------------------------------