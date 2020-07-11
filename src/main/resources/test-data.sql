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
                     (10, N'7e577732-1757-4fa2-bdf1-f651470943fb', 1, NULL, N'B360'),
                     (11, N'4efbc799-616e-48b4-8d43-a3ff486a9579', 1, NULL, N'Z270')
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
                     (5, N'0c36cc8e-5c23-4c6c-bd45-edb4256f7c5d', 1, NULL, N'AM4'),
                     (6, N'c7510cee-73e0-4ed4-b772-39c5695e7305', 1, NULL, N'TR4')
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
-- CASE SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[pc_case] ON
    MERGE [dbo].[pc_case] AS T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'7683e5f9-baa0-473f-ab3c-4257219c6011', 1, NULL, N'H510 Elite', 170, N'https://sta3-nzxtcorporation.netdna-ssl.com/uploads/product_image/image/2428/large_b2feaa953e1c78d9.jpg', 210, 435, 428, 4, N'ATX', 8),
                     (2, N'2af48151-aa9c-4af1-b7e2-0155a0e79e0c', 1, NULL, N'H710i', 200, N'https://sta3-nzxtcorporation.netdna-ssl.com/uploads/product_image/image/2462/large_caaa8ad6b19de81c.jpg', 230, 516, 494, 5, N'ATX', 8),
                     (3, N'6c8262ad-16b5-40d4-bfac-551e3abd73d5', 1, NULL, N'H500', 75, N'https://www.scan.co.uk/images/products/2948278-a.jpg', 210, 435, 428, 4, N'ATX', 8),
                     (4, N'59461cf6-a903-482f-a1ee-ed3875df5365', 1, NULL, N'H210i', 120, N'https://sta3-nzxtcorporation.netdna-ssl.com/uploads/product_image/image/2262/large_2fbdddad9178e815.jpg', 210, 349, 372, 4, N'MICRO_ATX', 8),
                     (5, N'553bf349-a26b-4625-bc8f-c363a6ff7e79', 1, NULL, N'H510', 80, N'https://sta3-nzxtcorporation.netdna-ssl.com/uploads/product_image/image/2385/large_119c49cc79b97b94.jpg', 210, 435, 428, 4, N'ATX', 8),
                     (6, N'5988db65-d85d-42b4-b1bb-82169491a49a', 1, NULL, N'Obsidian 500D RGB SE', 280, N'https://images-eu.ssl-images-amazon.com/images/I/41tzS2mBxyL.jpg', 210, 435, 428, 6, N'ATX', 19),
                     (7, N'84465106-8d18-4127-98f1-32d7244adcc8', 1, NULL, N'200R', 70, N'http://ecx.images-amazon.com/images/I/41qTCywCUvL.jpg', 497, 210, 429, 4, N'ATX', 19),
                     (8, N'055c38db-89a6-420e-8a8a-00277b3ac83f', 1, NULL, N'MasterBox Pro 5 RGB', 95, N'https://images-eu.ssl-images-amazon.com/images/I/41Foz%2B%2BKvmL.jpg', 500, 223, 475, 5, N'ATX', 6),
                     (9, N'37ef16bb-4bf5-470f-b736-fccfb1d1612a', 1, NULL, N'Master MasterCase H500', 120, N'https://cdn.pcpartpicker.com/static/forever/images/product/8058a5658a08dbd68ed2f88ab8e70df7.1600.jpg', 210, 435, 428, 4, N'ATX', 6),
                     (10, N'c4ece413-dae7-4d5b-a0da-ba81875c92ad', 1, NULL, N'SPEC-DELTA RGB', 90, N'https://cdn.pcpartpicker.com/static/forever/images/product/b35ad4944a6207c0e307154137834af6.1600.jpg', 440, 210, 450, 6, N'ATX', 19),
                     (11, N'9dfada59-0090-4bfb-afe3-01d1f5eb135d', 1, NULL, N'Master MasterBox Lite 5', 55, N'https://cdn.pcpartpicker.com/static/forever/images/product/17fa8a2537f9c8b4daed00429246ba26.1600.jpg', 210, 435, 428, 4, N'ATX', 6),
                     (12, N'5dd57ddd-2351-4fdd-880f-9b5c7505a047', 1, NULL, N'Crystal Series 680X RGB', 250, N'https://cdn.pcpartpicker.com/static/forever/images/product/6c64c4140c5b621d9e2177d0498cd43a.1600.jpg', 210, 435, 428, 6, N'ATX', 19),
                     (13, N'6bda411a-fc85-4bad-abcb-962e09fa0941', 1, NULL, N'MasterCase H500M', 200, N'https://cdn.pcpartpicker.com/static/forever/images/product/3b22338d08cddc21f3cd6150ec431a31.1600.jpg', 248, 544, 546, 4, N'ATX', 6),
                     (14, N'9b1f47a2-954a-406d-aaa6-e83a6ef9ada3', 1, NULL, N'1000D', 500, N'https://cdn.pcpartpicker.com/static/forever/images/product/a7a0359ad235cd8cb78730230deb4666.1600.jpg', 248, 544, 546, 6, N'ATX', 19),
                     (15, N'fd66e7ba-f199-4745-a48e-d97c551bb1b4', 1, NULL, N'Master MasterBox Q300P', 92, N'https://cdn.pcpartpicker.com/static/forever/images/product/d5515cc352c490650ff658bd3608857f.1600.jpg', 230, 455, 458, 4, N'MICRO_ATX', 6),
                     (16, N'ef8661c8-7cd3-483f-a7b3-1777d379b5cd', 1, NULL, N'H400i', 150, N'https://cdn.pcpartpicker.com/static/forever/images/product/6eefe518c7238492e201cad2e26ac36a.1600.jpg', 210, 435, 428, 4, N'MICRO_ATX', 8),
                     (17, N'dffa36a0-574f-44bb-99dd-dab5fd1506d0', 1, NULL, N'H400', 115, N'https://cdn.pcpartpicker.com/static/forever/images/product/6eefe518c7238492e201cad2e26ac36a.1600.jpg', 210, 435, 428, 4, N'MICRO_ATX', 8),
                     (18, N'787974b1-c9fd-41d1-9b4f-2930c6b83f6b', 1, NULL, N'SILENCIO S400', 90, N'https://cdn.pcpartpicker.com/static/forever/images/product/7c65bcaf0b488afa25432eac27991ce0.1600.jpg', 210, 435, 428, 4, N'MICRO_ATX', 6),
                     (19, N'd796c284-a0be-49c8-b089-d97bdde17096', 1, NULL, N'Manta', 75, N'http://ecx.images-amazon.com/images/I/41s6YuZbkKL.jpg', 210, 335, 328, 2, N'MINI_ATX', 8),
                     (20, N'c040779a-18ad-4676-a435-6b1ef3b66b25', 1, NULL, N'Elite 130', 100, N'https://cdn.pcpartpicker.com/static/forever/images/product/f23d251fb57394eedf211f122d84e934.1600.jpg', 210, 235, 228, 4, N'MINI_ATX', 6)
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [width], [height], [depth], [number_of_fans_supported], [motherboard_type], [manufacturer_fk])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name],
                                 T.[price] = S.[price],
                                 T.[image_url] = S.[image_url],
                                 T.[width] = S.[width],
                                 T.[height] = S.[height],
                                 T.[depth] = S.[depth],
                                 T.[number_of_fans_supported] = S.[number_of_fans_supported],
                                 T.[motherboard_type] = S.[motherboard_type],
                                 T.[manufacturer_fk] = S.[manufacturer_fk]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [width], [height], [depth], [number_of_fans_supported], [motherboard_type], [manufacturer_fk])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name], S.[price], S.[image_url], S.[width], S.[height], S.[depth], S.[number_of_fans_supported], S.[motherboard_type], S.[manufacturer_fk]);

    SET IDENTITY_INSERT [dbo].[pc_case] OFF
END
-----------------------------------------------------------------------------------------------
-- COOLING SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[cooling] ON
    MERGE [dbo].[cooling] AS T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'ed3212a1-4f61-4404-941d-b277521d8f25', 1, NULL, N'AER RGB', 28, N'https://cdn.pcpartpicker.com/static/forever/images/product/b19d6a6fea838158bcca998fcae5e6b0.1600.jpg', 120, 1, 1500, N'AIR', 8),
                     (2, N'04f93841-baee-4362-9c75-549b10404f6f', 1, NULL, N'LL120 RGB LED', 30, N'https://cdn.pcpartpicker.com/static/forever/images/product/4e2045757086fab56d2420d84fcf9619.1600.jpg', 120, 1, 1500, N'AIR', 19),
                     (3, N'a1ba99b7-7baa-4b55-a3dd-5239aefa2e55', 1, NULL, N'LL140 RGB', 40, N'https://cdn.pcpartpicker.com/static/forever/images/product/af0e3ae9695b1702e6e1b5d4f6200db6.1600.jpg', 140, 1, 1300, N'AIR', 19),
                     (4, N'79f1a002-1712-46ff-8f77-8f35c4d7e5ef', 1, NULL, N'SickleFlow', 10, N'https://images-na.ssl-images-amazon.com/images/I/4187AIcuisL._SX466_.jpg', 120, 0, 2000, N'AIR', 6),
                     (5, N'ad765c1b-0b02-4226-832f-4f4b4b08c38f', 1, NULL, N'ML120 PRO RGB', 30, N'https://cdn.pcpartpicker.com/static/forever/images/product/637d55a951c6564584edaa513645859e.1600.jpg', 120, 1, 1600, N'AIR', 19),
                     (6, N'79bac514-61ee-401a-b4ef-5b136913621a', 1, NULL, N'ML120 PRO', 24, N'http://ecx.images-amazon.com/images/I/51cneTiL46L.jpg', 120, 0, 1600, N'AIR', 19),
                     (7, N'c1ef7095-221f-43d5-88c2-dd4b02b7f533', 1, NULL, N'iCUE SP120', 25, N'https://cdn.pcpartpicker.com/static/forever/images/product/a26d9e55f89e849dbb15cbcb5e327e72.1600.jpg', 120, 1, 1400, N'AIR', 19),
                     (8, N'baa481b8-5e48-49fd-acda-74331ecc0653', 1, NULL, N'NF-A14 PWM', 20, N'http://ecx.images-amazon.com/images/I/51uz3Oi-I8L.jpg', 140, 0, 1500, N'AIR', 20),
                     (9, N'730dd903-6d8f-4296-acdd-9bf81b521334', 1, NULL, N'NF-F12 PWM', 20, N'http://ecx.images-amazon.com/images/I/51u748R1j1L.jpg', 140, 0, 1500, N'AIR', 20),
                     (10, N'e3327123-4e24-4d42-be1a-64ebc9323924', 1, NULL, N'NF-P12 redux', 13, N'https://images-na.ssl-images-amazon.com/images/I/513cdf4%2B-SL.jpg', 140, 0, 1700, N'AIR', 20),
                     (11, N'd65456e1-0a4f-4a9f-829c-390f66d0ddea', 1, NULL, N'ML140 PRO', 25, N'http://ecx.images-amazon.com/images/I/514BYMyIhbL.jpg', 140, 0, 2000, N'AIR', 19),
                     (12, N'cfd2c327-534f-4c1e-9e2f-4f1c9e088df6', 1, NULL, N'ML120 PRO', 28, N'http://ecx.images-amazon.com/images/I/51Iktd3q0jL.jpg', 120, 0, 1700, N'AIR', 19),
                     (13, N'804efd54-0353-4a51-bc6d-b149803a65db', 1, NULL, N'ML120 PRO LED', 27, N'https://cdn.pcpartpicker.com/static/forever/images/product/ae67a9e317a6e28209c2f276f2609bd4.1600.jpg', 120, 1, 1500, N'AIR', 6),
                     (14, N'3eebc1c2-f91c-4fbc-889c-ba22f421612f', 1, NULL, N'SP120 RGB', 17, N'https://cdn.pcpartpicker.com/static/forever/images/product/204befc450a5aa5cc5d2f9b980481d9f.1600.jpg', 120, 1, 1400, N'AIR', 19),
                     (15, N'01ad04e7-c05d-4aff-bf6b-ad1d3de52d40', 1, NULL, N'NF-R8 redux', 9, N'http://ecx.images-amazon.com/images/I/51IUhpueJWL.jpg', 80, 0, 1800, N'AIR', 20)
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [size], [is_rgb], [speed], [cooling_type], [manufacturer_fk])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name],
                                 T.[price] = S.[price],
                                 T.[image_url] = S.[image_url],
                                 T.[size] = S.[size],
                                 T.[is_rgb] = S.[is_rgb],
                                 T.[speed] = S.[speed],
                                 T.[cooling_type] = S.[cooling_type],
                                 T.[manufacturer_fk] = S.[manufacturer_fk]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [size], [is_rgb], [speed], [cooling_type], [manufacturer_fk])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name], S.[price], S.[image_url], S.[size], S.[is_rgb], S.[speed], S.[cooling_type], S.[manufacturer_fk]);

    SET IDENTITY_INSERT [dbo].[cooling] OFF
END
-----------------------------------------------------------------------------------------------
-- CPU SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[cpu] ON
    MERGE [dbo].[cpu] AS T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'7028ef48-43e7-4702-8356-e4b1f8458287', 1, NULL, N'Ryzen 5 3600', 193, N'https://cdn.pcpartpicker.com/static/forever/images/product/c7baf2c9c9cc15ae23adb24c2f4316fc.1600.jpg', 6, 12, 3.0, 32, 1, 5, 2),
                     (2, N'e9a6e619-61d6-454e-a1ff-d82f426e069f', 1, NULL, N'Ryzen 7 3700X', 350, N'https://cdn.pcpartpicker.com/static/forever/images/product/23cd3adfd50037c1b44d6d53edb15248.1600.jpg', 8, 16, 4.0, 32, 1, 5, 2),
                     (3, N'df019e7c-111a-48ba-8027-f05e7b96e3ca', 1, NULL, N'Ryzen 9 3900X', 500, N'https://cdn.pcpartpicker.com/static/forever/images/product/14adcd1fc88ebf386b746037c966b6af.1600.jpg', 12, 24, 4.0, 64, 1, 5, 2),
                     (4, N'9429bfec-4bdd-41e9-9d3d-7817faec5c6b', 1, NULL, N'Core i7-9700K', 340, N'https://cdn.pcpartpicker.com/static/forever/images/product/3760e89d1820da393f084e2c18a62e3b.1600.jpg', 8, 8, 4.9, 12, 0, 2, 3),
                     (5, N'2d53bb87-1c28-46a8-a77a-750e03003df3', 1, NULL, N'Core i9-9900K', 500, N'https://images-na.ssl-images-amazon.com/images/I/41EDFtP5hpL.jpg', 8, 16, 5.0, 32, 0, 2, 3),
                     (6, N'8c1d5da7-4962-4707-95c4-04589e4bfa80', 1, NULL, N'Ryzen 5 2600', 130, N'https://cdn.pcpartpicker.com/static/forever/images/product/55aea2dd64e2e3a3e3b1d678048d8d76.1600.jpg', 6, 12, 3.4, 32, 1, 5, 2),
                     (7, N'89233759-d8e7-4c6c-9587-f27bc25f9083', 1, NULL, N'Core i5-9400F', 140, N'https://cdn.pcpartpicker.com/static/forever/images/product/3b2d769c28b9890779f87a7568887dfc.1600.jpg', 6, 6, 2.9, 32, 1, 2, 3),
                     (8, N'54161376-55e6-44ec-8c0f-f869ce823df2', 1, NULL, N'Ryzen 5 2600X', 150, N'https://cdn.pcpartpicker.com/static/forever/images/product/55aea2dd64e2e3a3e3b1d678048d8d76.1600.jpg', 6, 12, 3.6, 32, 1, 5, 2),
                     (9, N'b3d9b83a-edd2-4a66-a0d3-2e8960b07401', 1, NULL, N'Ryzen 7 2700X', 200, N'https://cdn.pcpartpicker.com/static/forever/images/product/4e84967ef18c9b42e543b58c836d73ef.1600.jpg', 8, 16, 4.3, 32, 1, 5, 2),
                     (10, N'c44c4114-eb3a-42b2-b507-58781ab21d0a', 1, NULL, N'Ryzen 3 2200G', 80, N'https://cdn.pcpartpicker.com/static/forever/images/product/ad2e56d88c77de3053dcc5dada363f58.1600.jpg', 4, 8, 3.5, 32, 1, 5, 2),
                     (11, N'97dc7d6c-e693-4b84-84cf-8a8a024fc789', 1, NULL, N'Ryzen 5 3600X', 240, N'https://cdn.pcpartpicker.com/static/forever/images/product/c7baf2c9c9cc15ae23adb24c2f4316fc.1600.jpg', 6, 12, 3.8, 32, 1, 5, 2),
                     (12, N'fa3050c7-d68d-4ed3-8606-f3b0cbdfdc04', 1, NULL, N'Core i7-8700K', 350, N'https://cdn.pcpartpicker.com/static/forever/images/product/3760e89d1820da393f084e2c18a62e3b.1600.jpg', 6, 12, 3.7, 12, 0, 2, 3),
                     (13, N'1b90934a-f011-49c1-8ffc-9d6b005eea1f', 1, NULL, N'Ryzen 7 2700', 180, N'https://cdn.pcpartpicker.com/static/forever/images/product/4e84967ef18c9b42e543b58c836d73ef.1600.jpg', 8, 16, 4.1, 32, 1, 5, 2),
                     (14, N'31af5bf4-3165-4924-87a3-c230e25127c4', 1, NULL, N'Ryzen 5 3400G', 140, N'https://cdn.pcpartpicker.com/static/forever/images/product/43e2914b40ccb9ab7ce39eb656db3b44.1600.jpg', 4, 8, 3.7, 32, 1, 5, 2),
                     (15, N'a9723595-7c73-4543-8d43-f858c9e19c8d', 1, NULL, N'Core i5-9600K', 230, N'https://cdn.pcpartpicker.com/static/forever/images/product/33f96aec821c5c10f4b1fd636a7d1881.1600.jpg', 6, 12, 4.6, 32, 0, 2, 3),
                     (16, N'08c5b25f-5ebd-4db7-9ca1-082e12f1e1fd', 1, NULL, N'Core i3-9100F', 170, N'https://cdn.pcpartpicker.com/static/forever/images/product/0d74fb44f832ad674549787311aafa0f.1600.jpg', 4, 8, 4.2, 32, 1, 2, 3),
                     (17, N'a32de93c-c0de-46c3-921a-61787b822890', 1, NULL, N'Core i7-6700K', 170, N'https://cdn.pcpartpicker.com/static/forever/images/product/614a9c530cce56d1fafbc5ba97920ab1.1600.jpg', 4, 8, 4.0, 32, 0, 2, 3),
                     (18, N'0ed817c7-a945-4e84-a4d1-ac48785bd826', 1, NULL, N'Core i5-8400', 140, N'https://images-eu.ssl-images-amazon.com/images/I/515kqMHI1IL.jpg', 6, 12, 2.8, 32, 1, 2, 3),
                     (19, N'1813f03c-4a48-452e-86f4-44b77a17ce8e', 1, NULL, N'Core i7-7700K', 330, N'https://cdn.pcpartpicker.com/static/forever/images/product/3760e89d1820da393f084e2c18a62e3b.1600.jpg', 4, 8, 4.2, 16, 1, 2, 3),
                     (20, N'9c9abf04-dbf2-49a8-8473-9ce1f8b108e2', 1, NULL, N'Ryzen 7 1700X', 165, N'https://cdn.pcpartpicker.com/static/forever/images/product/4e84967ef18c9b42e543b58c836d73ef.1600.jpg', 8, 16, 3.4, 32, 1, 5, 2),
                     (21, N'b0d17247-d838-4229-9d1e-f381f0ea1bab', 1, NULL, N'Core i7-9700', 330, N'https://cdn.pcpartpicker.com/static/forever/images/product/3760e89d1820da393f084e2c18a62e3b.1600.jpg', 8, 8, 3.0, 14, 1, 2, 3),
                     (22, N'b9b068b5-632a-4dbb-834a-0f6949c3ffba', 1, NULL, N'Core i5-9400', 170, N'https://cdn.pcpartpicker.com/static/forever/images/product/64bf363daabaca441f6b8f07b54005cc.1600.jpg', 6, 6, 2.9, 16, 1, 2, 3),
                     (23, N'8bf482ae-31b4-4374-a425-3146c639299b', 1, NULL, N'Core i5-8600K', 260, N'https://cdn.pcpartpicker.com/static/forever/images/product/64bf363daabaca441f6b8f07b54005cc.1600.jpg', 6, 12, 3.9, 12, 1, 2, 3),
                     (24, N'e75911a6-2da3-4cfe-bea2-2e7710e979c7', 1, NULL, N'Core i3-8100F', 120, N'https://cdn.pcpartpicker.com/static/forever/images/product/0d74fb44f832ad674549787311aafa0f.1600.jpg', 4, 8, 3.6, 32, 1, 2, 3),
                     (25, N'86b63159-4c41-42b4-9390-64e685749224', 1, NULL, N'Core i5-6600K', 220, N'https://cdn.pcpartpicker.com/static/forever/images/product/64bf363daabaca441f6b8f07b54005cc.1600.jpg', 4, 8, 3.5, 16, 0, 2, 3),
                     (26, N'509afef4-789c-49fd-9630-9cfbb7f4a726', 1, NULL, N'Threadripper 2950X', 400, N'https://cdn.pcpartpicker.com/static/forever/images/product/09734bbf8632da3f135375bbb4ea6f94.1600.jpg', 16, 32, 3.5, 64, 0, 6, 2),
                     (27, N'b700172e-995a-4e35-8d38-983711e7e327', 1, NULL, N'Core i7-7700', 300, N'https://cdn.pcpartpicker.com/static/forever/images/product/3760e89d1820da393f084e2c18a62e3b.1600.jpg', 4, 8, 3.6, 12, 1, 2, 3),
                     (28, N'3b471323-7dd8-41e9-9458-1d304c79c70d', 1, NULL, N'Core i5-9600KF', 220, N'https://cdn.pcpartpicker.com/static/forever/images/product/658de8a85dd1c0af16b8f020ed5bb2da.1600.jpg', 6, 12, 3.7, 12, 0, 2, 3),
                     (29, N'd150985b-5112-4d24-9fb7-e6895845444a', 1, NULL, N'Core i5-7400', 180, N'https://cdn.pcpartpicker.com/static/forever/images/product/658de8a85dd1c0af16b8f020ed5bb2da.1600.jpg', 4, 8, 3.0, 12, 1, 2, 3),
                     (30, N'6b0af910-cb31-4ec2-b742-06adcad5356b', 1, NULL, N'Ryzen 7 1700', 224, N'https://cdn.pcpartpicker.com/static/forever/images/product/4e84967ef18c9b42e543b58c836d73ef.1600.jpg', 8, 16, 3.0, 32, 1, 5, 2),
                     (31, N'e93176b5-af2f-42c3-b45a-e8ff015626c7', 1, NULL, N'Core i7-8086K', 350, N'https://cdn.pcpartpicker.com/static/forever/images/product/452fefc7712153b364268a36d1674efb.1600.jpg', 6, 12, 4.0, 12, 1, 2, 3)
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [cores], [threads], [frequency], [cache], [cooling_solution], [socket_fk], [manufacturer_fk])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name],
                                 T.[price] = S.[price],
                                 T.[image_url] = S.[image_url],
                                 T.[cores] = S.[cores],
                                 T.[threads] = S.[threads],
                                 T.[frequency] = S.[frequency],
                                 T.[cache] = S.[cache],
                                 T.[cooling_solution] = S.[cooling_solution],
                                 T.[socket_fk] = S.[socket_fk],
                                 T.[manufacturer_fk] = S.[manufacturer_fk]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [cores], [threads], [frequency], [cache], [cooling_solution], [socket_fk], [manufacturer_fk])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name], S.[price], S.[image_url], S.[cores], S.[threads], S.[frequency], S.[cache], S.[cooling_solution], S.[socket_fk], S.[manufacturer_fk]);

    SET IDENTITY_INSERT [dbo].[cpu] OFF
END
-----------------------------------------------------------------------------------------------
-- GPU SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[gpu] ON
    MERGE [dbo].[gpu] T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'3298d9b7-f11d-4c38-bbf9-ab65954c4992', 1, NULL, N'RTX 2080 Black', 675, N'https://cdn.pcpartpicker.com/static/forever/images/product/8f9aabc24178caf70135e2e6dc2f5445.1600.jpg', 1515.0, 14000.0, N'1', 8.0, N'GDDR6', 5),
                     (2, N'8da138a8-fe2f-4d28-adf8-daf918ddb1e5', 1, NULL, N'RTX 2080 Ti Black', 1070, N'https://cdn.pcpartpicker.com/static/forever/images/product/8f9aabc24178caf70135e2e6dc2f5445.1600.jpg', 1350.0, 14000.0, N'1', 11.0, N'GDDR6', 5),
                     (3, N'c87492e1-d19f-4dc2-8bfa-bd8f280bdcc3', 1, NULL, N'RTX 2080 Ti ULTRA GAMING', 1400, N'https://cdn.pcpartpicker.com/static/forever/images/product/03524d3eecccc31527c359f9de79d9c7.1600.jpg', 1755.0, 14000.0, N'1', 11.0, N'GDDR6', 5),
                     (4, N'2568024a-78b9-4313-b5cb-1ab5b4c6f3d2', 1, NULL, N'RTX 2080 Ti ROG Strix Gaming OC', 1400, N'https://cdn.pcpartpicker.com/static/forever/images/product/0174f5005fe9f34decdf2d379bfe7221.1600.jpg', 1350.0, 14000.0, N'1', 11.0, N'GDDR6', 18),
                     (5, N'780f11fc-98ae-43b9-a905-db548b61086c', 1, NULL, N'RTX 2080 ROG Strix Gaming', 770, N'https://cdn.pcpartpicker.com/static/forever/images/product/d15b18b5b4b518256c4b8003672424c7.1600.jpg', 1515.0, 14000.0, N'1', 8.0, N'GDDR6', 18),
                     (6, N'26785546-074c-4e99-bf62-cedf45dfd440', 1, NULL, N'RTX 2060 6 GB STRIX GAMING OC', 400, N'https://images-na.ssl-images-amazon.com/images/I/41HBsLEE01L.jpg', 1365.0, 14000.0, N'1', 6.0, N'GDDR6', 18),
                     (7, N'31f025d2-1783-4109-8704-be3ddce61fea', 1, NULL, N'GeForce RTX 2060 VENTUS OC', 350, N'https://cdn.pcpartpicker.com/static/forever/images/product/e623089ba2b3010c09c7015f9538a311.1600.jpg', 1300.0, 14000.0, N'1', 6.0, N'GDDR6', 6),
                     (8, N'97650829-b19c-48ff-a0d9-fd46e83d3ece', 1, NULL, N'GeForce RTX 2070 8 GB STRIX GAMING OC', 420, N'https://images-na.ssl-images-amazon.com/images/I/51%2B5qM9Ia3L.jpg', 1410.0, 14000.0, N'1', 8.0, N'GDDR6', 18),
                     (9, N'e8bfef5c-e770-4266-a4e0-1dcc3edf77e3', 1, NULL, N'GeForce RTX 2070 SUPER 8 GB GAMING X TRIO', 580, N'https://cdn.pcpartpicker.com/static/forever/images/product/ca23ff3065e60b6a75ef9443e25b2a31.1600.jpg', 1450.0, 14000.0, N'1', 8.0, N'GDDR6', 6),
                     (10, N'ea90551c-b167-417d-abe0-a5d1e5e5faf7', 1, NULL, N'GeForce RTX 2070 SUPER 8 GB XC GAMING', 540, N'https://images-na.ssl-images-amazon.com/images/I/41lKk8cJ-JL.jpg', 1600.0, 14000.0, N'1', 8.0, N'GDDR6', 5),
                     (11, N'daca39e1-a7e6-4137-9c55-e597b67192c1', 1, NULL, N'GeForce GTX 1080 Ti 11 GB GAMING X', 650, N'https://cdn.pcpartpicker.com/static/forever/images/product/188bc2e653c9415cd65739ccbb223943.1600.jpg', 1400.0, 14000.0, N'1', 11.0, N'GDDR5', 6),
                     (12, N'838f0c2a-6351-4018-8a95-d94759433d75', 1, NULL, N'GeForce GTX 1080 Ti 11 GB STRIX GAMING', 700, N'https://images-na.ssl-images-amazon.com/images/I/81a2aBCgDML._SX466_.jpg', 1450.0, 14000.0, N'1', 11.0, N'GDDR5', 18),
                     (13, N'15c04fc2-52e0-4e5a-9d36-61591394c435', 1, NULL, N'GeForce GTX 1070 Ti 8 GB SC GAMING ACX 3.0 Black Edition', 550, N'https://images-na.ssl-images-amazon.com/images/I/51PLpT-02fL.jpg', 1400.0, 14000.0, N'1', 8.0, N'GDDR5', 5),
                     (14, N'e359303b-6be7-486c-9e91-efcc0b1e864c', 1, NULL, N'GeForce GTX 1070 8 GB G1', 500, N'http://ecx.images-amazon.com/images/I/41lXcLke4GL.jpg', 1380.0, 14000.0, N'1', 8.0, N'GDDR6', 11),
                     (15, N'ebeefae3-28ee-435e-85cc-d199ab1a97bb', 1, NULL, N'Radeon RX 580 8 GB ARMOR OC', 200, N'https://cdn.pcpartpicker.com/static/forever/images/product/d53db7190559b6287a4ff549f3bf5904.1600.jpg', 1300.0, 8000.0, N'1', 8.0, N'GDDR5', 6),
                     (16, N'dacf0b6e-3913-4b74-b4e3-3b8f37416020', 1, NULL, N'Radeon RX 580 8 GB ROG STRIX', 350, N'https://images-na.ssl-images-amazon.com/images/I/91q5KBUBiaL._SX425_.jpg', 1400.0, 8000.0, N'1', 8.0, N'GDDR5', 18),
                     (17, N'cf291f16-785f-48af-b02c-cea80bb416cd', 1, NULL, N'Radeon RX 580 8 GB Gaming 8G', 350, N'https://images-na.ssl-images-amazon.com/images/I/410U1dG4GtL.jpg', 1380.0, 8000.0, N'1', 8.0, N'GDDR5', 11),
                     (18, N'aaf7bfa3-423c-43a6-84a3-7571c927e6f9', 1, NULL, N'Radeon RX 5700 XT 8 GB GAMING OC', 420, N'https://cdn.pcpartpicker.com/static/forever/images/product/1b6084a197c46a295eb03b6ed062eda2.1600.jpg', 1400.0, 14000.0, N'1', 8.0, N'GDDR6', 11),
                     (19, N'74af02eb-d61a-4604-a679-e485bfc0e758', 1, NULL, N'Radeon RX 5700 8 GB MECH OC', 360, N'https://cdn.pcpartpicker.com/static/forever/images/product/f35fedb0450427dec520c5efb19d9c46.1600.jpg', 1380.0, 14000.0, N'1', 8.0, N'GDDR6', 6),
                     (20, N'36e37a36-1499-4fb8-a1f3-2c378b8298d8', 1, NULL, N'GeForce GTX 1050 Ti 4 GB', 150, N'https://cdn.pcpartpicker.com/static/forever/images/product/05cdbb665a59f5f73dcaf1a414c8ad04.1600.jpg', 1350.0, 8000.0, N'1', 4.0, N'GDDR5', 6),
                     (21, N'b48e092e-d7bd-45f0-be9f-5470cd1167ed', 1, NULL, N'GeForce GTX 1050 Ti 4 GB GAMING X 4G', 170, N'https://cdn.pcpartpicker.com/static/forever/images/product/2fab0ac0a13fef6a74ca8171b62e28dc.1600.jpg', 1380.0, 8000.0, N'1', 4.0, N'GDDR5', 6),
                     (22, N'f6dcff58-0595-41b8-844d-fd0d3774c996', 1, NULL, N'GeForce GTX 1050 2 GB', 100, N'https://cdn.pcpartpicker.com/static/forever/images/product/d622ea150f25f44d91631a29c59f42a8.1600.jpg', 1300.0, 8000.0, N'1', 2.0, N'GDDR5', 6)
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [frequency], [memory_clock], [timing], [ram_size], [memory_type], [manufacturer_fk])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name],
                                 T.[price] = S.[price],
                                 T.[image_url] = S.[image_url],
                                 T.[frequency] = S.[frequency],
                                 T.[memory_clock] = S.[memory_clock],
                                 T.[timing] = S.[timing],
                                 T.[ram_size] = S.[ram_size],
                                 T.[memory_type] = S.[memory_type],
                                 T.[manufacturer_fk] = S.[manufacturer_fk]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [frequency], [memory_clock], [timing], [ram_size], [memory_type], [manufacturer_fk])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name], S.[price], S.[image_url], S.[frequency], S.[memory_clock], S.[timing], S.[ram_size], S.[memory_type], S.[manufacturer_fk]);

    SET IDENTITY_INSERT [dbo].[gpu] OFF
END
-----------------------------------------------------------------------------------------------
-- MOTHERBOARD SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[motherboard] ON
    MERGE [dbo].[motherboard] T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'c3116a8d-6343-46c6-9df8-2185f92f2996', 1, NULL, N'B450 TOMAHAWK', 115, N'https://cdn.pcpartpicker.com/static/forever/images/product/76a05556b1231db294600c672f605747.1600.jpg', 4, 64, N'ATX', 5, 5, 4),
                     (2, N'1527db2e-0c8f-4e87-8384-ffca4a1ff585', 1, NULL, N'ROG STRIX B450-F GAMING', 120, N'https://cdn.pcpartpicker.com/static/forever/images/product/ae3eca9a74b37b6a2dafadcc948c208d.1600.jpg', 4, 64, N'ATX', 5, 5, 18),
                     (3, N'4b95c03a-5500-432f-b6b3-50bf3627679c', 1, NULL, N'B450M DS3H', 73, N'https://cdn.pcpartpicker.com/static/forever/images/product/75eae1d6254dc2bd453a2cf64b601ede.1600.jpg', 4, 64, N'MICRO_ATX', 5, 5, 11),
                     (4, N'8d4946bf-2aa4-47a0-8ac2-7abd36e47c04', 1, NULL, N'ROG STRIX Z390-E', 115, N'https://images-eu.ssl-images-amazon.com/images/I/51mDZNleLaL.jpg', 4, 64, N'ATX', 2, 8, 18),
                     (5, N'dce4529b-0332-4fad-8c22-1d1b4a9585dc', 1, NULL, N'Z390-A PRO', 130, N'https://cdn.pcpartpicker.com/static/forever/images/product/fcc113830e84371c4f0f83c5ed5f4ae4.1600.jpg', 4, 64, N'ATX', 2, 8, 4),
                     (6, N'b7ab8da6-4c3a-4f8d-8f36-f49418a031c0', 1, NULL, N'B450 Gaming Pro', 130, N'https://cdn.pcpartpicker.com/static/forever/images/product/a6ae20785466eef236198522ad3a4fa5.1600.jpg', 4, 64, N'ATX', 5, 5, 4),
                     (7, N'35e0d0dd-087c-44a2-9352-cfa9f8aa9285', 1, NULL, N'B450M MORTAR TITANIUM', 70, N'https://cdn.pcpartpicker.com/static/forever/images/product/00d01d92abc6b855882834ca3a480d98.1600.jpg', 4, 64, N'MICRO_ATX', 5, 5, 4),
                     (8, N'9f253ce5-e127-48be-ada2-1b01a53d913c', 1, NULL, N'GA-AB350-GAMING 3', 70, N'https://images-eu.ssl-images-amazon.com/images/I/51IFLBU8jpL.jpg', 4, 128, N'ATX', 5, 6, 4),
                     (9, N'c95f444e-098a-42c0-b389-ddb68c4e9a80', 1, NULL, N'X570 AORUS XTREME', 370, N'https://cdn.pcpartpicker.com/static/forever/images/product/7d5e0519ee3f05ab4720ae4d15ea14c1.1600.jpg', 4, 64, N'ATX', 5, 1, 11),
                     (10, N'c54bc01e-7604-474b-aab7-b0bd7c68e1a8', 1, NULL, N'ROG STRIX X470-I GAMING', 105, N'https://cdn.pcpartpicker.com/static/forever/images/product/2d6aec01983abcfd48c2d450cc27ce1b.1600.jpg', 2, 32, N'ATX', 5, 2, 18),
                     (11, N'6870c725-782a-4df2-a44f-c4be257b9022', 1, NULL, N'PRIME B450-PLUS', 200, N'https://cdn.pcpartpicker.com/static/forever/images/product/a6ae20785466eef236198522ad3a4fa5.1600.jpg', 4, 64, N'ATX', 5, 5, 18),
                     (12, N'e49e0cb0-65f0-4017-8b2e-34ad9a137050', 1, NULL, N'MEG X570 ACE', 80, N'https://cdn.pcpartpicker.com/static/forever/images/product/ef675852c52dc65806e9e2edf192436c.1600.jpg', 4, 128, N'ATX', 5, 1, 4),
                     (13, N'4ec0e5ee-67d5-4a5a-a30f-9be14b9130cf', 1, NULL, N'ROG STRIX B360-I GAMING', 110, N'https://images-na.ssl-images-amazon.com/images/I/51k0l-O2gqL.jpg', 2, 32, N'MINI_ATX', 2, 10, 18),
                     (14, N'a6ba70a5-68df-4b49-9c1c-dfa25727d3e1', 1, NULL, N'MPG Z390 GAMING EDGE AC', 180, N'https://images-eu.ssl-images-amazon.com/images/I/51DZf-KOjZL.jpg', 4, 128, N'MINI_ATX', 2, 8, 4),
                     (15, N'be33eaed-7272-4be8-8d4d-90091468b211', 1, NULL, N'PG Z390 GAMING PRO CARBON', 185, N'https://cdn.pcpartpicker.com/static/forever/images/product/91d7402ac6c9d16afc48f31c5165cf3d.1600.jpg', 4, 128, N'ATX', 2, 8, 4),
                     (16, N'96c2ff3c-d909-45a8-91a5-46b8041ae4ea', 1, NULL, N'Z390 AORUS ULTRA ATX', 130, N'https://cdn.pcpartpicker.com/static/forever/images/product/a6ae20785466eef236198522ad3a4fa5.1600.jpg', 4, 64, N'ATX', 2, 8, 4),
                     (17, N'ff3074e0-58a8-47e9-a51d-25639927fa95', 1, NULL, N'ROG MAXIMUS XI FORMULA', 425, N'https://images-na.ssl-images-amazon.com/images/I/51a%2BH%2BWRXPL.jpg', 4, 128, N'ATX', 2, 8, 18),
                     (18, N'79b8319f-332c-4cf7-b665-0ed3daa1041a', 1, NULL, N'MPG Z390 GAMING PRO CARBON AC', 200, N'https://cdn.pcpartpicker.com/static/forever/images/product/cd20ba2d9fea29fc03b304c320510e7d.1600.jpg', 4, 128, N'ATX', 2, 8, 4),
                     (19, N'276edc25-80e8-4e3b-8605-229b690f1d1e', 1, NULL, N'B360 HD3', 95, N'https://cdn.pcpartpicker.com/static/forever/images/product/11ea676aa40218876173f6fa1020ba00.1600.jpg', 4, 64, N'ATX', 2, 10, 11),
                     (20, N'67facc81-a6e1-4930-8736-b598b89df0ae', 1, NULL, N'PRIME Z270-P', 145, N'https://images-na.ssl-images-amazon.com/images/I/91mMGp3pTPL._SX466_.jpg', 4, 64, N'ATX', 2, 11, 18),
                     (21, N'407ff667-4bf4-4f60-9ddc-158db3aaf1b0', 1, NULL, N'B450I GAMING PLUS AC', 130, N'https://cdn.pcpartpicker.com/static/forever/images/product/813923da0e8510b2adaec8e131b8c7fd.1600.jpg', 2, 32, N'MINI_ATX', 5, 5, 4),
                     (22, N'f67afb09-92b7-4e5a-94d5-20e0543ffc7a', 1, NULL, N'PRIME X570-PRO', 240, N'https://cdn.pcpartpicker.com/static/forever/images/product/b06a90d7ec5a485121a21751cdc3d9b9.1600.jpg', 4, 128, N'ATX', 5, 1, 18),
                     (23, N'671f7b77-1df7-40bf-8a8e-e19373a68bcd', 1, NULL, N'ROG Strix X570-E Gaming', 320, N'https://cdn.pcpartpicker.com/static/forever/images/product/8edda8b2608b4fe4e5c3777f9e6df4fd.1600.jpg', 4, 128, N'ATX', 5, 1, 18),
                     (24, N'ea8523cc-41a2-4720-a737-04b555ae2177', 1, NULL, N'TUF GAMING X570-PLUS', 190, N'https://cdn.pcpartpicker.com/static/forever/images/product/c96321a1e039a1f7fd1bc917c5ae72b7.1600.jpg', 4, 64, N'ATX', 5, 1, 18),
                     (25, N'6eeaab9b-be1f-468d-855b-e2b850c6ab23', 1, NULL, N'MPG Z390 GAMING PLUS', 130, N'https://cdn.pcpartpicker.com/static/forever/images/product/a6ae20785466eef236198522ad3a4fa5.1600.jpg', 4, 64, N'ATX', 2, 8, 4)
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [number_of_dimm_slots], [memory_supported], [motherboard_type], [socket_fk], [chipset_fk], [manufacturer_fk])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name],
                                 T.[price] = S.[price],
                                 T.[image_url] = S.[image_url],
                                 T.[number_of_dimm_slots] = S.[number_of_dimm_slots],
                                 T.[memory_supported] = S.[memory_supported],
                                 T.[motherboard_type] = S.[motherboard_type],
                                 T.[socket_fk] = S.[socket_fk],
                                 T.[chipset_fk] = S.[chipset_fk],
                                 T.[manufacturer_fk] = S.[manufacturer_fk]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [number_of_dimm_slots], [memory_supported], [motherboard_type], [socket_fk], [chipset_fk], [manufacturer_fk])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name], S.[price], S.[image_url], S.[number_of_dimm_slots], S.[memory_supported], S.[motherboard_type], S.[socket_fk], S.[chipset_fk], S.[manufacturer_fk]);

    SET IDENTITY_INSERT [dbo].[motherboard] OFF
END
-----------------------------------------------------------------------------------------------
-- PSU SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[psu] ON
    MERGE [dbo].[psu] T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'9d836fba-5cba-427d-93ae-9d706508d441', 1, NULL, N'CXM', 70, N'http://ecx.images-amazon.com/images/I/51RxdsALapL.jpg', 550, N'SEMI_MODULAR', 2, 18),
                     (2, N'e4b995da-ca59-46da-8dd9-387dc2e316e3', 1, NULL, N'SuperNOVA G3', 127, N'https://cdn.pcpartpicker.com/static/forever/images/product/2a2172d1f17661103de901f43d831187.1600.jpg', 750, N'MODULAR', 4, 5),
                     (3, N'1e956d2a-5301-46e3-b661-3841e410f1e8', 1, NULL, N'RMx (2018)', 85, N'https://images-na.ssl-images-amazon.com/images/I/51icxwzI9VL.jpg', 650, N'MODULAR', 4, 18),
                     (4, N'e31af92f-3d5e-4248-afd3-d6c31c5e6043', 1, NULL, N'MASTERWATT MAKER MIJ', 200, N'https://cdn.pcpartpicker.com/static/forever/images/product/244afeb4bd3917774842c887571a9803.1600.jpg', 1200, N'MODULAR', 4, 6),
                     (5, N'ae095713-ad39-4d87-904e-50f38074c1e0', 1, NULL, N'Master V', 180, N'https://cdn.pcpartpicker.com/static/forever/images/product/c28253b1b63474d96ab2f28ff5cdcdce.1600.jpg', 1000, N'MODULAR', 6, 6),
                     (6, N'bbc57f4e-eb67-4927-b2f0-d7b993e4f77b', 1, NULL, N'MasterWatt', 90, N'https://cdn.pcpartpicker.com/static/forever/images/product/d6645bc4330f5a00dabba3d69728af42.1600.jpg', 750, N'SEMI_MODULAR', 5, 6),
                     (7, N'b07521af-a24f-40d7-b4f4-b3bc0ff08176', 1, NULL, N'RMx (2018) 750 W', 120, N'https://images-na.ssl-images-amazon.com/images/I/513mVXq9TiL.jpg', 750, N'MODULAR', 2, 19),
                     (8, N'16ebaecf-90c5-434b-a721-09f27b934ac7', 1, NULL, N'RMx (2018) 850 W', 125, N'https://images-na.ssl-images-amazon.com/images/I/51lUqysCuDL.jpg', 850, N'MODULAR', 2, 19),
                     (9, N'2de20771-7521-45c9-a02b-9d064042ade0', 1, NULL, N'BQ', 50, N'https://images-na.ssl-images-amazon.com/images/I/512voawCsuL.jpg', 600, N'NON_MODULAR', 2, 5),
                     (10, N'87295de7-5b1a-4657-9ee9-61d957995189', 1, NULL, N'CXM (2015) 450 W', 45, N'http://ecx.images-amazon.com/images/I/51ZqerxDFcL.jpg', 450, N'NON_MODULAR', 2, 19),
                     (11, N'cb04d041-57bb-4933-bdc6-3c66f19bef52', 1, NULL, N'1600 W 80+ Titanium Certified', 450, N'https://cdn.pcpartpicker.com/static/forever/images/product/1d57cf53a1289e4dfff1aed9b1cc272a.1600.jpg', 1600, N'MODULAR', 6, 19),
                     (12, N'900f2b9f-478a-4296-a8a9-ab4d447e208b', 1, NULL, N'500 W 80+', 40, N'http://ecx.images-amazon.com/images/I/51PiQrWaNjL.jpg', 500, N'NON_MODULAR', 6, 5),
                     (13, N'f1ea533a-c2fa-4706-bf69-4bfc50aba653', 1, NULL, N'SuperNOVA G1+ 650 W', 100, N'https://cdn.pcpartpicker.com/static/forever/images/product/cef75cc13e5787d7c29760e9087905f4.1600.jpg', 650, N'MODULAR', 4, 5),
                     (14, N'f24ce4be-5a95-4d9f-9c1e-96c3776fce8d', 1, NULL, N'RM (2019) 750 W', 120, N'https://cdn.pcpartpicker.com/static/forever/images/product/02951377c9eed1e21fc3d8ba6092717e.1600.jpg', 750, N'MODULAR', 4, 19),
                     (15, N'22528893-c805-4dc4-ad2c-86ea20761424', 1, NULL, N'SF 600 W', 120, N'https://images-na.ssl-images-amazon.com/images/I/41qUzlhfWKL.jpg', 600, N'MODULAR', 5, 19),
                     (16, N'a22e366f-fe96-47b3-9a61-96f6316381e4', 1, NULL, N'1200 W 80+', 300, N'https://cdn.pcpartpicker.com/static/forever/images/product/5b4d3a0c8ba785ed560565371fb5b0a6.1600.jpg', 1200, N'MODULAR', 5, 18),
                     (17, N'977cd072-17f0-441c-a8b5-7ff027ad18ed', 1, NULL, N'BQ', 60, N'http://ecx.images-amazon.com/images/I/51J5s4nQnWL.jpg', 750, N'NON_MODULAR', 2, 6),
                     (18, N'd86d61e1-bd8a-4c22-a8ca-8dc8fb2eb1d2', 1, NULL, N'CXM 750 W', 90, N'https://cdn.pcpartpicker.com/static/forever/images/product/23a8f923c23d6de30026d889136bf175.1600.jpg', 750, N'SEMI_MODULAR', 2, 19),
                     (19, N'a1f00d87-ebbc-450b-8624-264b4ac0dec4', 1, NULL, N'VS', 35, N'https://images-na.ssl-images-amazon.com/images/I/51pKHarWxGL.jpg', 450, N'NON_MODULAR', 1, 19),
                     (20, N'0c64445b-c682-4ca6-953b-ff0d19320d5f', 1, NULL, N'RMx White (2018)', 130, N'https://cdn.pcpartpicker.com/static/forever/images/product/78afeb3cab692533f7fad2eba2975750.1600.jpg', 750, N'MODULAR', 4, 19)
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [capacity], [modularity_type], [psu_efficiency_fk], [manufacturer_fk])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name],
                                 T.[price] = S.[price],
                                 T.[image_url] = S.[image_url],
                                 T.[capacity] = S.[capacity],
                                 T.[modularity_type] = S.[modularity_type],
                                 T.[psu_efficiency_fk] = S.[psu_efficiency_fk],
                                 T.[manufacturer_fk] = S.[manufacturer_fk]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [capacity], [modularity_type], [psu_efficiency_fk], [manufacturer_fk])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name], S.[price], S.[image_url], S.[capacity], S.[modularity_type], S.[psu_efficiency_fk], S.[manufacturer_fk]);

    SET IDENTITY_INSERT [dbo].[psu] OFF
END
-----------------------------------------------------------------------------------------------
-- STORAGE SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[storage] ON
    MERGE [dbo].[storage] T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'ad2dacb5-c2ca-4360-ba9a-66a7acb36e69', 1, NULL, N'660p Series', 185, N'https://images-fe.ssl-images-amazon.com/images/I/41-UBTlEZwL.jpg', 2048, 800, 700, N'M2', 3),
                     (2, N'c4256203-55fe-4969-b812-fea46c97adb1', 1, NULL, N'Caviar Blue', 43, N'http://ecx.images-amazon.com/images/I/51fbLQLVJFL.jpg', 1000, 150, 120, N'HDD', 14),
                     (3, N'ebb83873-7636-42f7-9460-5aba83fa2776', 1, NULL, N'860 Evo', 75, N'https://images-na.ssl-images-amazon.com/images/I/41JX1N9gi1L.jpg', 500, 500, 750, N'SSD', 9),
                     (4, N'045b02aa-75f1-419e-94dc-62bc75f82c72', 1, NULL, N'970 Evo', 90, N'https://images-eu.ssl-images-amazon.com/images/I/41x8zIrgC3L.jpg', 500, 900, 300, N'M2', 9),
                     (5, N'afe86e3c-62ec-4456-9163-0c241e125f2d', 1, NULL, N'A400', 32, N'https://cdn.pcpartpicker.com/static/forever/images/product/97e2bd828644767c8a80b71f8cb14743.1600.jpg', 240, 400, 750, N'SSD', 10),
                     (6, N'05620a09-840a-4b17-b680-3f59a9e2677c', 1, NULL, N'970 Evo', 170, N'https://images-eu.ssl-images-amazon.com/images/I/41x8zIrgC3L.jpg', 1024, 900, 400, N'M2', 9),
                     (7, N'614c8418-f89b-4e18-a05f-5e41566d93c5', 1, NULL, N'A400', 31, N'https://images-na.ssl-images-amazon.com/images/I/41UKoJx2tZL.jpg', 250, 500, 250, N'SSD', 9),
                     (8, N'c7ad40d0-eed6-4762-aac4-d4265472a841', 1, NULL, N'Blue', 65, N'https://cdn.pcpartpicker.com/static/forever/images/product/5d75e5e4274a02ca8924d7c4d2a575b2.1600.jpg', 500, 300, 350, N'M2', 14),
                     (9, N'd2d3f3c0-c764-49ee-b956-155ca0a45fee', 1, NULL, N'660p Series', 190, N'https://cdn.pcpartpicker.com/static/forever/images/product/72ac6b04347d22c2592029d4a49bc5ed.1600.jpg', 2048, 500, 350, N'M2', 3),
                     (10, N'44e7cd4a-3246-4799-afab-063d62b2bcb7', 1, NULL, N'660p Series', 32, N'https://cdn.pcpartpicker.com/static/forever/images/product/72ac6b04347d22c2592029d4a49bc5ed.1600.jpg', 512, 500, 450, N'M2', 3),
                     (11, N'363764d3-a914-489c-a89e-9d7ce1dc9ef0', 1, NULL, N'970 Evo Plus', 110, N'https://images-eu.ssl-images-amazon.com/images/I/41x8zIrgC3L.jpg', 500, 550, 450, N'M2', 9),
                     (12, N'6d9091a3-56b6-4836-b558-2b975762670a', 1, NULL, N'970 Evo Plus', 62, N'https://images-eu.ssl-images-amazon.com/images/I/41x8zIrgC3L.jpg', 250, 550, 400, N'M2', 9),
                     (13, N'3ccee5aa-d2e9-4ab4-aec2-c58461cdd8fb', 1, NULL, N'A400', 52, N'https://images-na.ssl-images-amazon.com/images/I/41UKoJx2tZL.jpg', 480, 500, 450, N'SSD', 9),
                     (14, N'c86aecb6-8efa-4baf-98b4-896caa321705', 1, NULL, N'970 Evo Plus', 215, N'https://images-eu.ssl-images-amazon.com/images/I/41x8zIrgC3L.jpg', 1024, 550, 450, N'M2', 9),
                     (15, N'8fd2ca35-f58a-4feb-be54-7dc9574da1c1', 1, NULL, N'970 Evo Plus', 450, N'https://images-eu.ssl-images-amazon.com/images/I/41x8zIrgC3L.jpg', 2048, 550, 450, N'M2', 9),
                     (16, N'bf760fa2-f182-4d44-bf36-d813482f3aba', 1, NULL, N'860 Evo', 54, N'https://images-na.ssl-images-amazon.com/images/I/41JX1N9gi1L.jpg', 250, 500, 420, N'SSD', 9),
                     (17, N'17da482f-cb6e-46d5-9d08-df21c65cdbff', 1, NULL, N'860 Evo', 900, N'https://images-na.ssl-images-amazon.com/images/I/41JX1N9gi1L.jpg', 4000, 500, 420, N'SSD', 9),
                     (18, N'cf7468b5-88ab-45d3-bce0-04094d18d784', 1, NULL, N'860 Evo', 280, N'https://images-na.ssl-images-amazon.com/images/I/41JX1N9gi1L.jpg', 2048, 500, 420, N'SSD', 9),
                     (19, N'81a3ae35-62c0-40be-9be0-0f93d9fc2756', 1, NULL, N'Blue', 110, N'https://cdn.pcpartpicker.com/static/forever/images/product/5d75e5e4274a02ca8924d7c4d2a575b2.1600.jpg', 1024, 300, 250, N'M2', 14),
                     (20, N'fb12d873-00f2-4545-8847-28d79d0096a7', 1, NULL, N'970 Evo Plus', 400, N'https://images-eu.ssl-images-amazon.com/images/I/41x8zIrgC3L.jpg', 2048, 550, 450, N'M2', 9)
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [capacity], [reading_speed], [writing_speed], [storage_type], [manufacturer_fk])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name],
                                 T.[price] = S.[price],
                                 T.[image_url] = S.[image_url],
                                 T.[capacity] = S.[capacity],
                                 T.[reading_speed] = S.[reading_speed],
                                 T.[writing_speed] = S.[writing_speed],
                                 T.[storage_type] = S.[storage_type],
                                 T.[manufacturer_fk] = S.[manufacturer_fk]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [capacity], [reading_speed], [writing_speed], [storage_type], [manufacturer_fk])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name], S.[price], S.[image_url], S.[capacity], S.[reading_speed], S.[writing_speed], S.[storage_type], S.[manufacturer_fk]);

    SET IDENTITY_INSERT [dbo].[storage] OFF
END
-----------------------------------------------------------------------------------------------
-- RAM SEED DATA
BEGIN
    SET IDENTITY_INSERT [dbo].[ram] ON
    MERGE [dbo].[ram] T
    USING
        (
            SELECT *
            FROM (
                     VALUES
                     (1, N'757b72ad-2c16-40f3-ab5a-2fca555ee7ba', 1, NULL, N'Vengeance LPX', 38, N'https://cdn.pcpartpicker.com/static/forever/images/product/ef1c9d46308283f227a0ba51e4179ff1.1600.jpg', 2400, 8, NULL, N'DDR4', 19),
                     (2, N'ed020b40-62ac-47b6-a953-2de6401fbdb4', 1, NULL, N'Vengeance LPX', 73, N'https://cdn.pcpartpicker.com/static/forever/images/product/897d32aa11f4462641daa6c62d1322f5.1600.jpg', 3000, 16, N'16-20-20-38', N'DDR4', 19),
                     (3, N'8640828d-c74e-453a-bf70-c2723b36b41d', 1, NULL, N'Ripjaws V Series', 66, N'http://ecx.images-amazon.com/images/I/41XcDGwMsBL.jpg', 2400, 16, NULL, N'DDR4', 12),
                     (4, N'1a816054-1262-4b36-b7fd-dc5c262a602e', 1, NULL, N'Ripjaws V', 78, N'https://cdn.pcpartpicker.com/static/forever/images/product/72816e43251cd35c4b3f598eb8fc16e0.1600.jpg', 3600, 16, N'19-20-20-40', N'DDR4', 12),
                     (5, N'234931b6-21da-4da6-bda8-7f1be94be29c', 1, NULL, N'HyperX Predator', 43, N'https://cdn.pcpartpicker.com/static/forever/images/product/f25ee4f0e1776a3d15c2286d35feeb8c.1600.jpg', 2666, 8, NULL, N'DDR4', 10),
                     (6, N'd38ae837-f752-41d4-ae6e-6cfaa67a8594', 1, NULL, N'HyperX Fury', 40, N'https://cdn.pcpartpicker.com/static/forever/images/product/14c2a7f4a3a06e1d0e81f25fb7c2a42a.1600.jpg', 2666, 8, NULL, N'DDR4', 10),
                     (7, N'c75a780c-e294-4c77-9a68-156ab5923860', 1, NULL, N'HyperX Fury', 55, N'https://cdn.pcpartpicker.com/static/forever/images/product/14c2a7f4a3a06e1d0e81f25fb7c2a42a.1600.jpg', 3200, 8, NULL, N'DDR4', 10),
                     (8, N'10681988-c80f-42ac-9343-d7d3e1e5d6a9', 1, NULL, N'Vengeance', 35, N'https://cdn.pcpartpicker.com/static/forever/images/product/6a3b0f143de7182ae0c995ac4b357d19.med.1600.jpg', 1866, 8, NULL, N'DDR4', 19),
                     (9, N'faf3900c-ce08-4a07-a680-959af5929ad6', 1, NULL, N'HyperX Fury', 96, N'https://cdn.pcpartpicker.com/static/forever/images/product/d39bd7cede4c3af6acc60c517645ab7c.1600.jpg', 3200, 16, NULL, N'DDR4', 10),
                     (10, N'2687d5b6-5154-47b3-abbe-34620e95a122', 1, NULL, N'HyperX Fury', 40, N'https://cdn.pcpartpicker.com/static/forever/images/product/14c2a7f4a3a06e1d0e81f25fb7c2a42a.1600.jpg', 2400, 8, NULL, N'DDR4', 10),
                     (11, N'a2dad957-b5b0-41ba-9d6a-6f0f87e88ceb', 1, NULL, N'Vengeance LPX', 170, N'https://cdn.pcpartpicker.com/static/forever/images/product/7c04b120a9d93500b574655bd99b93aa.1600.jpg', 3000, 32, NULL, N'DDR4', 19),
                     (12, N'e2d10037-b68a-496d-b6af-9ddeb133073b', 1, NULL, N'Ripjaws V', 48, N'https://cdn.pcpartpicker.com/static/forever/images/product/c0fe82c5c039e038cd14a5833293d591.1600.jpg', 3600, 8, NULL, N'DDR4', 12),
                     (13, N'b37262ec-6c5b-46ed-aa24-8b795c80b447', 1, NULL, N'Vengeance LPX 8 GB', 40, N'https://cdn.pcpartpicker.com/static/forever/images/product/9b6014a1b219eb2ba07ec3d12c0c639f.1600.jpg', 2666, 8, NULL, N'DDR4', 19),
                     (14, N'a1eb3921-8107-4f2e-b634-596c99d0aa81', 1, NULL, N'Ripjaws V', 80, N'https://cdn.pcpartpicker.com/static/forever/images/product/72816e43251cd35c4b3f598eb8fc16e0.1600.jpg', 3600, 16, NULL, N'DDR4', 12),
                     (15, N'10fef06f-e94a-4603-83bc-021c97a0edd6', 1, NULL, N'HyperX Fury Black', 80, N'http://ecx.images-amazon.com/images/I/41Vkj6Q5vtL.jpg', 2133, 8, NULL, N'DDR4', 10),
                     (16, N'71122a11-c0d2-42a5-b537-2f769121b77e', 1, NULL, N'HyperX Fury Blue', 30, N'https://cdn.pcpartpicker.com/static/forever/images/product/420350537fa9e0e49b1e491fe9c4810d.1600.jpg', 1600, 8, NULL, N'DDR4', 10),
                     (17, N'c0727be8-46e0-4581-b48c-5af3071f5379', 1, NULL, N'Ripjaws V Series 8 GB', 33, N'http://ecx.images-amazon.com/images/I/41UyfTQGqiL.jpg', 2400, 8, NULL, N'DDR4', 12),
                     (18, N'68b4fc7b-080b-440e-a6e1-8de25e66d4ae', 1, NULL, N'Aegis', 47, N'https://cdn.pcpartpicker.com/static/forever/images/product/0c6edb82799a2627d1ea10e7cba3abfb.1600.jpg', 2666, 16, NULL, N'DDR4', 12),
                     (19, N'62e10ae9-8ecd-499b-9bcc-b3aad8e50788', 1, NULL, N'Aegis', 38, N'https://cdn.pcpartpicker.com/static/forever/images/product/cecd6ed1bee7da70050efd4881c95968.1600.jpg', 2666, 8, NULL, N'DDR4', 12)
                 )
                     AS temp ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [frequency], [size], [timing], [memory_type], [manufacturer_fk])
        ) AS S
    ON T.id=S.id
    WHEN MATCHED THEN UPDATE SET
                                 T.[uid] = S.[uid],
                                 T.[version] = S.[version],
                                 T.[deleted_on] = S.[deleted_on],
                                 T.[name] = S.[name],
                                 T.[price] = S.[price],
                                 T.[image_url] = S.[image_url],
                                 T.[frequency] = S.[frequency],
                                 T.[size] = S.[size],
                                 T.[timing] = S.[timing],
                                 T.[memory_type] = S.[memory_type],
                                 T.[manufacturer_fk] = S.[manufacturer_fk]
    WHEN NOT MATCHED THEN
        INSERT
        ([id], [uid], [version], [deleted_on], [name], [price], [image_url], [frequency], [size], [timing], [memory_type], [manufacturer_fk])
        VALUES
        (S.[id], S.[uid], S.[version], S.[deleted_on], S.[name], S.[price], S.[image_url], S.[frequency], S.[size], S.[timing], S.[memory_type], S.[manufacturer_fk]);

    SET IDENTITY_INSERT [dbo].[ram] OFF
END
-----------------------------------------------------------------------------------------------