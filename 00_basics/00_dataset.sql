-- Şema Oluşturma
CREATE SCHEMA s0;
GO

-- Müşteri Tablosu
CREATE TABLE s0.Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    RegisteredAt DATETIME,
    MembershipType NVARCHAR(20)
);
GO

-- Siparişler Tablosu
CREATE TABLE s0.Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES s0.Customers(CustomerID),
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2),
    Status NVARCHAR(20)
);
GO

-- Ürünler Tablosu
CREATE TABLE s0.Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT,
    CategoryID INT
);
GO

-- Kategoriler Tablosu
CREATE TABLE s0.Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(100)
);
GO

-- Çalışanlar Tablosu
CREATE TABLE s0.Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    HireDate DATE,
    Position NVARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentID INT
);
GO

-- Departmanlar Tablosu
CREATE TABLE s0.Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);
GO

-- Kitaplar Tablosu
CREATE TABLE s0.Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(200),
    PageCount INT,
    AuthorID INT,
    PublishedDate DATE
);
GO

-- Yazarlar Tablosu
CREATE TABLE s0.Authors (
    AuthorID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    BirthYear INT
);
GO

-- Ödemeler Tablosu
CREATE TABLE s0.Payments (
    PaymentID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES s0.Customers(CustomerID),
    PaymentDate DATETIME,
    Amount DECIMAL(10,2),
    PaymentMethod NVARCHAR(50)
);
GO

-- Abonelikler Tablosu
CREATE TABLE s0.Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES s0.Customers(CustomerID),
    StartDate DATE,
    EndDate DATE,
    PlanType NVARCHAR(50)
);
GO

-- Uçuşlar Tablosu
CREATE TABLE s0.Flights (
    FlightID INT PRIMARY KEY,
    FlightNumber NVARCHAR(10),
    Departure NVARCHAR(100),
    Arrival NVARCHAR(100),
    DepartureTime DATETIME
);
GO

-- Etkinlikler Tablosu
CREATE TABLE s0.Events (
    EventID INT PRIMARY KEY,
    EventName NVARCHAR(200),
    Location NVARCHAR(100),
    EventDate DATE,
    EventType NVARCHAR(50)
);
GO


-- Sample Data for s0.Customers

INSERT INTO s0.Customers VALUES (1, 'John', 'Wright', 'katherine19@gmail.com', '2025-03-04 17:51:52', 'Gold');
INSERT INTO s0.Customers VALUES (2, 'Emily', 'Love', 'aperry@hotmail.com', '2024-05-27 04:48:38', 'Basic');
INSERT INTO s0.Customers VALUES (3, 'Brooke', 'Fuller', 'brownpatty@hotmail.com', '2024-03-26 03:35:31', 'Basic');
INSERT INTO s0.Customers VALUES (4, 'Rebecca', 'Johnson', 'rita63@hotmail.com', '2024-04-23 18:04:34', 'Gold');
INSERT INTO s0.Customers VALUES (5, 'Shannon', 'Yoder', 'andersenjeremy@mills.net', '2024-07-16 17:11:01', 'Premium');
INSERT INTO s0.Customers VALUES (6, 'Candace', 'Ferguson', 'ymendoza@yahoo.com', '2023-08-02 06:14:57', 'Basic');
INSERT INTO s0.Customers VALUES (7, 'Kenneth', 'Cohen', 'jharris@gmail.com', '2023-10-25 03:21:47', 'Basic');
INSERT INTO s0.Customers VALUES (8, 'Sarah', 'Jackson', 'peterstaylor@morris.biz', '2024-08-04 18:14:35', 'Basic');
INSERT INTO s0.Customers VALUES (9, 'George', 'Cooper', 'jessica40@mueller.com', '2024-07-11 18:33:40', 'Gold');
INSERT INTO s0.Customers VALUES (10, 'Jennifer', 'Black', 'bcarroll@farmer.com', '2025-04-29 05:07:00', 'Basic');
INSERT INTO s0.Customers VALUES (11, 'Elizabeth', 'Silva', 'sharonjones@hotmail.com', '2025-02-06 06:31:33', 'Gold');
INSERT INTO s0.Customers VALUES (12, 'Nancy', 'Mooney', 'ananguyen@yahoo.com', '2025-03-01 00:29:00', 'Gold');
INSERT INTO s0.Customers VALUES (13, 'Dustin', 'Webster', 'milessarah@walters.com', '2025-06-19 06:30:29', 'Gold');
INSERT INTO s0.Customers VALUES (14, 'Michael', 'Obrien', 'aguilaryolanda@diaz.com', '2024-04-26 11:04:09', 'Basic');
INSERT INTO s0.Customers VALUES (15, 'Jacob', 'Murray', 'xstokes@gonzales.com', '2024-02-26 14:10:37', 'Gold');
INSERT INTO s0.Customers VALUES (16, 'Robert', 'Wright', 'jacobbean@bauer.net', '2024-02-26 11:06:49', 'Premium');
INSERT INTO s0.Customers VALUES (17, 'Preston', 'Brooks', 'anthony23@gmail.com', '2024-11-09 16:32:15', 'Basic');
INSERT INTO s0.Customers VALUES (18, 'Taylor', 'Obrien', 'fullerdavid@lawrence-hansen.net', '2023-08-04 20:34:29', 'Basic');
INSERT INTO s0.Customers VALUES (19, 'Connor', 'Acosta', 'rossderek@yahoo.com', '2023-11-27 10:06:33', 'Basic');
INSERT INTO s0.Customers VALUES (20, 'Tina', 'Rodriguez', 'danleonard@hayes-hayes.net', '2023-12-30 21:04:18', 'Basic');
INSERT INTO s0.Customers VALUES (21, 'Andrea', 'Branch', 'sparksmark@hotmail.com', '2024-06-09 13:11:54', 'Basic');
INSERT INTO s0.Customers VALUES (22, 'Morgan', 'Evans', 'madisonmccarthy@hotmail.com', '2023-11-07 11:04:01', 'Gold');
INSERT INTO s0.Customers VALUES (23, 'Matthew', 'Miller', 'rprice@kelly.biz', '2025-05-28 22:11:00', 'Gold');
INSERT INTO s0.Customers VALUES (24, 'Nicholas', 'Weaver', 'pwoods@benson.org', '2025-02-10 22:18:14', 'Basic');
INSERT INTO s0.Customers VALUES (25, 'Timothy', 'Clements', 'kathydrake@bender-hughes.com', '2024-07-01 05:40:19', 'Gold');
INSERT INTO s0.Customers VALUES (26, 'Michelle', 'Taylor', 'johnsonjeffrey@anderson-dunlap.com', '2024-05-19 20:12:18', 'Basic');
INSERT INTO s0.Customers VALUES (27, 'Ethan', 'Woods', 'howardlisa@hotmail.com', '2025-06-01 08:53:26', 'Gold');
INSERT INTO s0.Customers VALUES (28, 'Dillon', 'Mitchell', 'ashleyreed@yahoo.com', '2024-06-05 13:02:19', 'Gold');
INSERT INTO s0.Customers VALUES (29, 'Mark', 'Williams', 'jennifer94@ramirez.net', '2024-03-19 12:44:32', 'Gold');
INSERT INTO s0.Customers VALUES (30, 'Rodney', 'Mccoy', 'natashaherrera@figueroa-navarro.com', '2024-08-18 09:32:29', 'Gold');
INSERT INTO s0.Customers VALUES (31, 'Carolyn', 'Williamson', 'kennethcook@henson.com', '2025-04-24 13:36:21', 'Premium');
INSERT INTO s0.Customers VALUES (32, 'Brian', 'Gonzalez', 'xlara@gmail.com', '2023-10-19 23:22:52', 'Basic');
INSERT INTO s0.Customers VALUES (33, 'Robert', 'Miller', 'vcarroll@nelson.net', '2025-06-21 22:40:30', 'Premium');
INSERT INTO s0.Customers VALUES (34, 'Kathy', 'Richmond', 'smueller@peterson-cortez.com', '2023-10-25 14:03:03', 'Gold');
INSERT INTO s0.Customers VALUES (35, 'Troy', 'Phillips', 'jason78@cannon.com', '2024-12-23 04:53:03', 'Premium');
INSERT INTO s0.Customers VALUES (36, 'Bryan', 'Martin', 'garyvelasquez@mitchell.biz', '2025-03-14 18:37:38', 'Basic');
INSERT INTO s0.Customers VALUES (37, 'Larry', 'Harris', 'whitetaylor@hotmail.com', '2024-12-15 19:42:42', 'Basic');
INSERT INTO s0.Customers VALUES (38, 'Shawn', 'Mcdonald', 'dana85@watson.com', '2025-05-20 09:56:58', 'Gold');
INSERT INTO s0.Customers VALUES (39, 'Mark', 'King', 'hernandezcarol@lopez-kirk.com', '2025-03-04 01:59:27', 'Premium');
INSERT INTO s0.Customers VALUES (40, 'Lauren', 'Patton', 'marilyn64@huff.info', '2024-05-28 23:37:37', 'Premium');
INSERT INTO s0.Customers VALUES (41, 'Shannon', 'Mcdonald', 'wilsonpaul@hotmail.com', '2024-09-06 11:02:03', 'Premium');
INSERT INTO s0.Customers VALUES (42, 'Rachel', 'Hill', 'hbrown@gmail.com', '2025-05-31 03:23:05', 'Basic');
INSERT INTO s0.Customers VALUES (43, 'Robert', 'Cox', 'joshuasoto@floyd-freeman.com', '2024-10-25 02:48:37', 'Basic');
INSERT INTO s0.Customers VALUES (44, 'Toni', 'Church', 'heathjames@yahoo.com', '2024-01-12 14:30:51', 'Premium');
INSERT INTO s0.Customers VALUES (45, 'Linda', 'Vaughn', 'lisafowler@day.biz', '2024-07-15 15:16:32', 'Basic');
INSERT INTO s0.Customers VALUES (46, 'Brett', 'Farrell', 'tiffanymills@gmail.com', '2024-05-24 07:05:25', 'Basic');
INSERT INTO s0.Customers VALUES (47, 'Robert', 'Lynch', 'donna86@yahoo.com', '2025-05-27 00:17:29', 'Premium');
INSERT INTO s0.Customers VALUES (48, 'Chelsea', 'Evans', 'kevin68@gmail.com', '2023-10-15 10:59:26', 'Basic');
INSERT INTO s0.Customers VALUES (49, 'Jared', 'Williams', 'williamdavis@gmail.com', '2025-02-24 14:26:18', 'Premium');
INSERT INTO s0.Customers VALUES (50, 'Jill', 'Thompson', 'fcunningham@gmail.com', '2024-05-30 20:55:35', 'Premium');

-- Sample Data for s0.Categories

INSERT INTO s0.Categories VALUES (1, 'Electronics');
INSERT INTO s0.Categories VALUES (2, 'Books');
INSERT INTO s0.Categories VALUES (3, 'Clothing');
INSERT INTO s0.Categories VALUES (4, 'Home');
INSERT INTO s0.Categories VALUES (5, 'Toys');

-- Sample Data for s0.Products

INSERT INTO s0.Products VALUES (1, 'Sound', 303.84, 11, 4);
INSERT INTO s0.Products VALUES (2, 'Fall', 270.43, 96, 1);
INSERT INTO s0.Products VALUES (3, 'Officer', 278.26, 160, 5);
INSERT INTO s0.Products VALUES (4, 'Adult', 443.3, 92, 5);
INSERT INTO s0.Products VALUES (5, 'Environment', 100.18, 17, 1);
INSERT INTO s0.Products VALUES (6, 'Probably', 332.33, 197, 3);
INSERT INTO s0.Products VALUES (7, 'Body', 492.68, 59, 1);
INSERT INTO s0.Products VALUES (8, 'Skill', 193.16, 116, 3);
INSERT INTO s0.Products VALUES (9, 'Painting', 85.51, 90, 2);
INSERT INTO s0.Products VALUES (10, 'Parent', 336.74, 179, 1);
INSERT INTO s0.Products VALUES (11, 'Song', 306.52, 43, 5);
INSERT INTO s0.Products VALUES (12, 'Available', 365.92, 41, 4);
INSERT INTO s0.Products VALUES (13, 'Purpose', 192.83, 163, 5);
INSERT INTO s0.Products VALUES (14, 'Result', 113.71, 83, 1);
INSERT INTO s0.Products VALUES (15, 'Money', 118.38, 8, 3);
INSERT INTO s0.Products VALUES (16, 'After', 203.58, 16, 2);
INSERT INTO s0.Products VALUES (17, 'Usually', 457.0, 145, 3);
INSERT INTO s0.Products VALUES (18, 'Fly', 110.25, 127, 4);
INSERT INTO s0.Products VALUES (19, 'Direction', 442.92, 164, 4);
INSERT INTO s0.Products VALUES (20, 'Carry', 75.72, 35, 2);
INSERT INTO s0.Products VALUES (21, 'Most', 373.77, 137, 3);
INSERT INTO s0.Products VALUES (22, 'Everyone', 374.77, 109, 5);
INSERT INTO s0.Products VALUES (23, 'These', 202.7, 56, 2);
INSERT INTO s0.Products VALUES (24, 'Subject', 257.22, 23, 1);
INSERT INTO s0.Products VALUES (25, 'Risk', 431.25, 39, 2);
INSERT INTO s0.Products VALUES (26, 'Idea', 397.08, 108, 5);
INSERT INTO s0.Products VALUES (27, 'Blue', 36.45, 97, 5);
INSERT INTO s0.Products VALUES (28, 'Help', 498.08, 135, 3);
INSERT INTO s0.Products VALUES (29, 'Activity', 485.68, 2, 1);
INSERT INTO s0.Products VALUES (30, 'Health', 342.45, 137, 3);
INSERT INTO s0.Products VALUES (31, 'Show', 385.46, 87, 1);
INSERT INTO s0.Products VALUES (32, 'Score', 150.28, 40, 4);
INSERT INTO s0.Products VALUES (33, 'That', 6.61, 184, 3);
INSERT INTO s0.Products VALUES (34, 'Me', 486.08, 195, 2);
INSERT INTO s0.Products VALUES (35, 'Series', 256.3, 27, 3);
INSERT INTO s0.Products VALUES (36, 'Success', 421.63, 129, 5);
INSERT INTO s0.Products VALUES (37, 'Technology', 103.46, 95, 2);
INSERT INTO s0.Products VALUES (38, 'Election', 271.99, 199, 5);
INSERT INTO s0.Products VALUES (39, 'Subject', 459.65, 153, 3);
INSERT INTO s0.Products VALUES (40, 'Place', 246.86, 28, 3);
INSERT INTO s0.Products VALUES (41, 'Serious', 439.97, 78, 2);
INSERT INTO s0.Products VALUES (42, 'Month', 33.67, 145, 1);
INSERT INTO s0.Products VALUES (43, 'Single', 47.4, 124, 1);
INSERT INTO s0.Products VALUES (44, 'Industry', 489.1, 136, 2);
INSERT INTO s0.Products VALUES (45, 'Do', 68.55, 121, 5);
INSERT INTO s0.Products VALUES (46, 'Stage', 86.74, 135, 5);
INSERT INTO s0.Products VALUES (47, 'Sell', 214.45, 54, 5);
INSERT INTO s0.Products VALUES (48, 'Opportunity', 378.86, 176, 2);
INSERT INTO s0.Products VALUES (49, 'Fight', 357.91, 102, 3);
INSERT INTO s0.Products VALUES (50, 'Society', 221.86, 132, 4);

-- Sample Data for s0.Orders

INSERT INTO s0.Orders VALUES (1, 8, '2024-12-02 19:48:34', 262.95, 'Pending');
INSERT INTO s0.Orders VALUES (2, 22, '2025-05-01 19:44:38', 40.61, 'Shipped');
INSERT INTO s0.Orders VALUES (3, 38, '2025-03-21 10:24:23', 235.81, 'Pending');
INSERT INTO s0.Orders VALUES (4, 46, '2024-07-15 03:26:21', 638.48, 'Shipped');
INSERT INTO s0.Orders VALUES (5, 5, '2025-02-22 14:57:09', 907.31, 'Delivered');
INSERT INTO s0.Orders VALUES (6, 5, '2024-10-31 19:43:54', 523.87, 'Delivered');
INSERT INTO s0.Orders VALUES (7, 43, '2025-01-18 19:06:28', 495.71, 'Shipped');
INSERT INTO s0.Orders VALUES (8, 47, '2024-11-17 05:10:42', 936.8, 'Cancelled');
INSERT INTO s0.Orders VALUES (9, 16, '2025-01-12 22:38:49', 788.93, 'Cancelled');
INSERT INTO s0.Orders VALUES (10, 13, '2024-09-06 05:11:01', 112.44, 'Cancelled');
INSERT INTO s0.Orders VALUES (11, 23, '2025-06-03 02:48:05', 435.11, 'Cancelled');
INSERT INTO s0.Orders VALUES (12, 47, '2024-07-31 06:53:37', 73.09, 'Pending');
INSERT INTO s0.Orders VALUES (13, 4, '2025-06-16 16:03:13', 414.57, 'Delivered');
INSERT INTO s0.Orders VALUES (14, 7, '2024-11-19 05:34:14', 263.68, 'Shipped');
INSERT INTO s0.Orders VALUES (15, 35, '2025-03-02 12:26:32', 459.64, 'Cancelled');
INSERT INTO s0.Orders VALUES (16, 12, '2024-10-31 22:04:43', 292.97, 'Shipped');
INSERT INTO s0.Orders VALUES (17, 5, '2024-11-30 13:03:32', 454.27, 'Pending');
INSERT INTO s0.Orders VALUES (18, 4, '2025-03-05 11:05:53', 659.1, 'Pending');
INSERT INTO s0.Orders VALUES (19, 6, '2025-04-20 02:35:08', 927.84, 'Shipped');
INSERT INTO s0.Orders VALUES (20, 11, '2025-03-21 01:19:39', 418.29, 'Cancelled');
INSERT INTO s0.Orders VALUES (21, 14, '2024-08-31 07:42:13', 867.36, 'Pending');
INSERT INTO s0.Orders VALUES (22, 11, '2025-05-26 05:12:35', 391.39, 'Cancelled');
INSERT INTO s0.Orders VALUES (23, 17, '2025-02-13 05:39:06', 927.99, 'Cancelled');
INSERT INTO s0.Orders VALUES (24, 19, '2025-01-28 20:08:54', 434.55, 'Cancelled');
INSERT INTO s0.Orders VALUES (25, 10, '2024-11-17 02:40:30', 206.1, 'Shipped');
INSERT INTO s0.Orders VALUES (26, 4, '2024-07-27 06:13:19', 587.6, 'Pending');
INSERT INTO s0.Orders VALUES (27, 48, '2025-06-13 18:13:48', 327.33, 'Pending');
INSERT INTO s0.Orders VALUES (28, 38, '2024-07-15 00:53:35', 487.25, 'Shipped');
INSERT INTO s0.Orders VALUES (29, 4, '2024-08-16 06:05:22', 961.56, 'Pending');
INSERT INTO s0.Orders VALUES (30, 12, '2025-07-04 15:36:36', 87.15, 'Pending');
INSERT INTO s0.Orders VALUES (31, 44, '2025-04-09 11:29:18', 864.58, 'Cancelled');
INSERT INTO s0.Orders VALUES (32, 8, '2025-04-02 03:42:44', 942.76, 'Shipped');
INSERT INTO s0.Orders VALUES (33, 38, '2025-07-02 23:18:11', 602.63, 'Pending');
INSERT INTO s0.Orders VALUES (34, 27, '2025-02-04 09:55:13', 664.23, 'Delivered');
INSERT INTO s0.Orders VALUES (35, 17, '2025-02-25 01:16:31', 220.17, 'Delivered');
INSERT INTO s0.Orders VALUES (36, 16, '2025-02-21 12:15:39', 280.3, 'Shipped');
INSERT INTO s0.Orders VALUES (37, 43, '2025-05-02 05:14:11', 652.59, 'Cancelled');
INSERT INTO s0.Orders VALUES (38, 21, '2025-01-31 16:22:43', 930.44, 'Pending');
INSERT INTO s0.Orders VALUES (39, 1, '2025-04-12 13:04:17', 469.12, 'Pending');
INSERT INTO s0.Orders VALUES (40, 5, '2024-09-29 06:47:11', 546.88, 'Delivered');
INSERT INTO s0.Orders VALUES (41, 9, '2025-05-23 18:09:28', 934.59, 'Pending');
INSERT INTO s0.Orders VALUES (42, 16, '2024-09-19 15:46:43', 382.14, 'Shipped');
INSERT INTO s0.Orders VALUES (43, 29, '2024-08-10 07:23:34', 837.07, 'Delivered');
INSERT INTO s0.Orders VALUES (44, 40, '2025-01-20 14:51:00', 984.18, 'Pending');
INSERT INTO s0.Orders VALUES (45, 43, '2024-11-18 15:12:53', 820.76, 'Delivered');
INSERT INTO s0.Orders VALUES (46, 43, '2024-12-05 07:30:24', 121.51, 'Shipped');
INSERT INTO s0.Orders VALUES (47, 17, '2024-11-04 11:37:11', 133.12, 'Pending');
INSERT INTO s0.Orders VALUES (48, 48, '2025-02-13 19:42:41', 562.16, 'Delivered');
INSERT INTO s0.Orders VALUES (49, 19, '2025-02-12 10:12:27', 612.73, 'Delivered');
INSERT INTO s0.Orders VALUES (50, 14, '2024-12-18 23:01:00', 693.75, 'Delivered');

-- Sample Data for s0.Departments

INSERT INTO s0.Departments VALUES (1, 'IT');
INSERT INTO s0.Departments VALUES (2, 'HR');
INSERT INTO s0.Departments VALUES (3, 'Finance');
INSERT INTO s0.Departments VALUES (4, 'Sales');
INSERT INTO s0.Departments VALUES (5, 'Logistics');

-- Sample Data for s0.Employees

INSERT INTO s0.Employees VALUES (1, 'Cindy', 'Snyder', '2020-10-29', 'HR', 6013.46, 1);
INSERT INTO s0.Employees VALUES (2, 'Melissa', 'Miller', '2021-03-08', 'Developer', 10611.41, 3);
INSERT INTO s0.Employees VALUES (3, 'Peter', 'Cole', '2019-05-23', 'Developer', 3042.55, 2);
INSERT INTO s0.Employees VALUES (4, 'Sarah', 'Martin', '2018-07-28', 'Analyst', 4938.98, 4);
INSERT INTO s0.Employees VALUES (5, 'Candice', 'Wright', '2021-06-24', 'Sales', 11468.01, 5);
INSERT INTO s0.Employees VALUES (6, 'James', 'Spence', '2016-08-20', 'Developer', 4342.49, 2);
INSERT INTO s0.Employees VALUES (7, 'Douglas', 'Chung', '2023-07-06', 'Sales', 3432.34, 3);
INSERT INTO s0.Employees VALUES (8, 'Michael', 'Watson', '2020-05-19', 'Sales', 9630.3, 4);
INSERT INTO s0.Employees VALUES (9, 'Justin', 'Swanson', '2018-09-03', 'Manager', 3501.95, 3);
INSERT INTO s0.Employees VALUES (10, 'Eddie', 'Fowler', '2024-08-16', 'Developer', 13787.1, 2);
INSERT INTO s0.Employees VALUES (11, 'Eric', 'Smith', '2023-05-14', 'Manager', 11003.2, 3);
INSERT INTO s0.Employees VALUES (12, 'Michelle', 'Stewart', '2021-04-24', 'Sales', 13609.62, 4);
INSERT INTO s0.Employees VALUES (13, 'Monica', 'Powell', '2023-11-20', 'Sales', 11993.73, 2);
INSERT INTO s0.Employees VALUES (14, 'Sydney', 'Proctor', '2016-06-28', 'Manager', 14714.47, 2);
INSERT INTO s0.Employees VALUES (15, 'Michael', 'Day', '2015-10-06', 'HR', 3297.44, 3);
INSERT INTO s0.Employees VALUES (16, 'Jennifer', 'Keller', '2016-07-02', 'HR', 12626.82, 2);
INSERT INTO s0.Employees VALUES (17, 'Debra', 'Bell', '2018-12-22', 'Analyst', 4910.37, 1);
INSERT INTO s0.Employees VALUES (18, 'Todd', 'Peters', '2019-09-18', 'HR', 13466.0, 4);
INSERT INTO s0.Employees VALUES (19, 'Nicole', 'Moran', '2024-07-29', 'Manager', 5394.87, 4);
INSERT INTO s0.Employees VALUES (20, 'Kayla', 'Atkins', '2023-05-12', 'Analyst', 6662.29, 2);
INSERT INTO s0.Employees VALUES (21, 'Karen', 'Mccullough', '2020-09-06', 'Manager', 3283.97, 2);
INSERT INTO s0.Employees VALUES (22, 'Linda', 'Thompson', '2016-09-05', 'HR', 6939.14, 1);
INSERT INTO s0.Employees VALUES (23, 'Jeffrey', 'Morales', '2024-03-13', 'Analyst', 7213.75, 5);
INSERT INTO s0.Employees VALUES (24, 'Denise', 'Johnson', '2016-09-11', 'HR', 11154.22, 5);
INSERT INTO s0.Employees VALUES (25, 'Angela', 'Miller', '2018-08-25', 'Analyst', 14270.85, 1);
INSERT INTO s0.Employees VALUES (26, 'Margaret', 'Miller', '2019-12-16', 'Analyst', 5142.81, 3);
INSERT INTO s0.Employees VALUES (27, 'Megan', 'Ritter', '2016-05-06', 'Developer', 4300.83, 4);
INSERT INTO s0.Employees VALUES (28, 'Michael', 'Castro', '2018-05-08', 'Analyst', 11742.54, 3);
INSERT INTO s0.Employees VALUES (29, 'Amanda', 'Lynch', '2018-05-14', 'HR', 10274.51, 5);
INSERT INTO s0.Employees VALUES (30, 'Kimberly', 'Klein', '2018-09-22', 'Developer', 7622.35, 5);
INSERT INTO s0.Employees VALUES (31, 'Mary', 'Gardner', '2023-06-28', 'Manager', 6056.67, 4);
INSERT INTO s0.Employees VALUES (32, 'Melissa', 'Hernandez', '2020-01-01', 'Developer', 9239.04, 5);
INSERT INTO s0.Employees VALUES (33, 'Karen', 'Kim', '2025-06-25', 'Manager', 7370.66, 1);
INSERT INTO s0.Employees VALUES (34, 'Randy', 'Gutierrez', '2024-05-08', 'Analyst', 10477.86, 1);
INSERT INTO s0.Employees VALUES (35, 'Natasha', 'West', '2019-02-17', 'Analyst', 9085.47, 4);
INSERT INTO s0.Employees VALUES (36, 'Ricardo', 'Copeland', '2018-10-27', 'Analyst', 7828.8, 3);
INSERT INTO s0.Employees VALUES (37, 'Julie', 'Frank', '2019-08-06', 'Sales', 4527.45, 4);
INSERT INTO s0.Employees VALUES (38, 'Danielle', 'Jordan', '2022-12-03', 'HR', 11127.82, 2);
INSERT INTO s0.Employees VALUES (39, 'Stephanie', 'Henry', '2023-05-11', 'Sales', 9829.26, 4);
INSERT INTO s0.Employees VALUES (40, 'Brett', 'Jimenez', '2022-05-09', 'Sales', 13004.7, 3);
INSERT INTO s0.Employees VALUES (41, 'Daniel', 'Cameron', '2020-02-26', 'Analyst', 5522.19, 5);
INSERT INTO s0.Employees VALUES (42, 'Alexander', 'Ramos', '2018-02-14', 'Sales', 10856.47, 4);
INSERT INTO s0.Employees VALUES (43, 'John', 'Douglas', '2024-01-29', 'HR', 8305.92, 2);
INSERT INTO s0.Employees VALUES (44, 'Michael', 'Campbell', '2017-02-20', 'Sales', 8678.23, 2);
INSERT INTO s0.Employees VALUES (45, 'Kathleen', 'Nelson', '2016-08-01', 'Developer', 6405.44, 5);
INSERT INTO s0.Employees VALUES (46, 'Sarah', 'Martin', '2024-01-06', 'Analyst', 4120.65, 2);
INSERT INTO s0.Employees VALUES (47, 'Christina', 'Contreras', '2015-09-16', 'Analyst', 5695.69, 2);
INSERT INTO s0.Employees VALUES (48, 'Jessica', 'Rush', '2017-01-13', 'Manager', 3293.1, 2);
INSERT INTO s0.Employees VALUES (49, 'Louis', 'Roberts', '2023-11-27', 'HR', 10335.29, 1);
INSERT INTO s0.Employees VALUES (50, 'Andrea', 'Mitchell', '2023-06-25', 'HR', 7973.29, 5);

-- Sample Data for s0.Authors

INSERT INTO s0.Authors VALUES (1, 'Keith', 'Jackson', 1952);
INSERT INTO s0.Authors VALUES (2, 'Daniel', 'Mccarthy', 1985);
INSERT INTO s0.Authors VALUES (3, 'Jenna', 'Davidson', 1984);
INSERT INTO s0.Authors VALUES (4, 'Robert', 'Anderson', 1964);
INSERT INTO s0.Authors VALUES (5, 'Michael', 'Franco', 1971);
INSERT INTO s0.Authors VALUES (6, 'Nancy', 'Sanchez', 1965);
INSERT INTO s0.Authors VALUES (7, 'Albert', 'Fisher', 1955);
INSERT INTO s0.Authors VALUES (8, 'Jorge', 'Davis', 1949);
INSERT INTO s0.Authors VALUES (9, 'Dennis', 'Clarke', 1981);
INSERT INTO s0.Authors VALUES (10, 'Andrew', 'Bradshaw', 1984);
INSERT INTO s0.Authors VALUES (11, 'Jonathon', 'Lewis', 1940);
INSERT INTO s0.Authors VALUES (12, 'Angela', 'Carson', 1988);
INSERT INTO s0.Authors VALUES (13, 'Karen', 'Schaefer', 1995);
INSERT INTO s0.Authors VALUES (14, 'Chad', 'Guzman', 1989);
INSERT INTO s0.Authors VALUES (15, 'Connie', 'Vazquez', 1946);
INSERT INTO s0.Authors VALUES (16, 'Geoffrey', 'Young', 1989);
INSERT INTO s0.Authors VALUES (17, 'Christopher', 'Brown', 1967);
INSERT INTO s0.Authors VALUES (18, 'Kelsey', 'Holmes', 1954);
INSERT INTO s0.Authors VALUES (19, 'Kristine', 'Cardenas', 1951);
INSERT INTO s0.Authors VALUES (20, 'Jacqueline', 'Orozco', 1991);
INSERT INTO s0.Authors VALUES (21, 'Alexander', 'Young', 1984);
INSERT INTO s0.Authors VALUES (22, 'Jesse', 'Morgan', 1973);
INSERT INTO s0.Authors VALUES (23, 'Victoria', 'Lyons', 1969);
INSERT INTO s0.Authors VALUES (24, 'Jennifer', 'Jensen', 1943);
INSERT INTO s0.Authors VALUES (25, 'Donna', 'Moore', 1975);
INSERT INTO s0.Authors VALUES (26, 'Michelle', 'King', 1955);
INSERT INTO s0.Authors VALUES (27, 'Daniel', 'Hampton', 1994);
INSERT INTO s0.Authors VALUES (28, 'Kristin', 'Davis', 1947);
INSERT INTO s0.Authors VALUES (29, 'Brian', 'Chandler', 1969);
INSERT INTO s0.Authors VALUES (30, 'Tracey', 'Pena', 1948);

-- Sample Data for s0.Books

INSERT INTO s0.Books VALUES (1, 'Young.', 920, 15, '2020-12-11');
INSERT INTO s0.Books VALUES (2, 'Prove those sure church.', 783, 17, '2018-04-28');
INSERT INTO s0.Books VALUES (3, 'Analysis number leg.', 672, 20, '2018-05-11');
INSERT INTO s0.Books VALUES (4, 'Push wish.', 424, 25, '2017-09-08');
INSERT INTO s0.Books VALUES (5, 'Before deep.', 553, 20, '2020-07-23');
INSERT INTO s0.Books VALUES (6, 'Despite agent shake.', 934, 24, '2020-06-22');
INSERT INTO s0.Books VALUES (7, 'Else of base.', 616, 14, '2022-09-19');
INSERT INTO s0.Books VALUES (8, 'Guess.', 950, 30, '2024-09-21');
INSERT INTO s0.Books VALUES (9, 'Door serve some guy.', 661, 15, '2019-09-27');
INSERT INTO s0.Books VALUES (10, 'Chance student from.', 262, 24, '2016-09-14');
INSERT INTO s0.Books VALUES (11, 'Fine throughout within.', 982, 16, '2019-11-03');
INSERT INTO s0.Books VALUES (12, 'Security him.', 560, 9, '2024-10-28');
INSERT INTO s0.Books VALUES (13, 'Agency we score news.', 869, 8, '2018-03-03');
INSERT INTO s0.Books VALUES (14, 'Paper should certainly.', 960, 21, '2019-11-10');
INSERT INTO s0.Books VALUES (15, 'Kitchen during official.', 383, 25, '2019-03-13');
INSERT INTO s0.Books VALUES (16, 'Movie raise.', 896, 17, '2015-11-21');
INSERT INTO s0.Books VALUES (17, 'Population me fight.', 596, 21, '2025-05-16');
INSERT INTO s0.Books VALUES (18, 'Situation create.', 344, 9, '2024-10-29');
INSERT INTO s0.Books VALUES (19, 'Official wear.', 550, 3, '2024-04-26');
INSERT INTO s0.Books VALUES (20, 'Red blue drug.', 830, 10, '2025-05-18');
INSERT INTO s0.Books VALUES (21, 'Commercial fear.', 340, 9, '2021-05-24');
INSERT INTO s0.Books VALUES (22, 'Than turn.', 443, 11, '2016-05-18');
INSERT INTO s0.Books VALUES (23, 'Sometimes much.', 653, 3, '2020-08-21');
INSERT INTO s0.Books VALUES (24, 'Under describe white.', 241, 5, '2017-09-23');
INSERT INTO s0.Books VALUES (25, 'Wait program.', 336, 13, '2024-11-05');
INSERT INTO s0.Books VALUES (26, 'Market suggest.', 810, 5, '2016-03-18');
INSERT INTO s0.Books VALUES (27, 'Though know far.', 823, 7, '2017-03-21');
INSERT INTO s0.Books VALUES (28, 'Give close.', 165, 14, '2019-12-24');
INSERT INTO s0.Books VALUES (29, 'Front board.', 517, 11, '2025-05-26');
INSERT INTO s0.Books VALUES (30, 'Five action.', 655, 15, '2018-07-19');
INSERT INTO s0.Books VALUES (31, 'Unit marriage.', 525, 2, '2021-03-09');
INSERT INTO s0.Books VALUES (32, 'Stage.', 311, 27, '2015-10-14');
INSERT INTO s0.Books VALUES (33, 'Door interesting discuss.', 530, 13, '2019-10-29');
INSERT INTO s0.Books VALUES (34, 'Fear billion.', 888, 19, '2015-12-25');
INSERT INTO s0.Books VALUES (35, 'Sport yes beautiful.', 812, 1, '2024-01-02');
INSERT INTO s0.Books VALUES (36, 'Student student item.', 977, 29, '2016-10-22');
INSERT INTO s0.Books VALUES (37, 'Interest team.', 883, 19, '2018-02-27');
INSERT INTO s0.Books VALUES (38, 'Research painting those thank.', 489, 16, '2024-10-22');
INSERT INTO s0.Books VALUES (39, 'Personal concern politics.', 106, 12, '2016-12-10');
INSERT INTO s0.Books VALUES (40, 'Available box officer.', 405, 25, '2017-10-03');
INSERT INTO s0.Books VALUES (41, 'Direction.', 499, 28, '2024-01-20');
INSERT INTO s0.Books VALUES (42, 'Successful friend.', 955, 14, '2021-09-08');
INSERT INTO s0.Books VALUES (43, 'Follow new test news.', 651, 24, '2018-02-28');
INSERT INTO s0.Books VALUES (44, 'Information structure.', 852, 18, '2019-12-19');
INSERT INTO s0.Books VALUES (45, 'Itself decade.', 919, 20, '2025-05-18');
INSERT INTO s0.Books VALUES (46, 'Reveal environment bad.', 325, 16, '2019-12-25');
INSERT INTO s0.Books VALUES (47, 'However fast.', 324, 9, '2022-03-06');
INSERT INTO s0.Books VALUES (48, 'Those audience from.', 546, 16, '2024-03-23');
INSERT INTO s0.Books VALUES (49, 'Wrong generation.', 129, 13, '2019-08-02');
INSERT INTO s0.Books VALUES (50, 'Certainly soldier.', 444, 22, '2017-09-10');

-- Sample Data for s0.Payments

INSERT INTO s0.Payments VALUES (1, 44, '2024-10-09 21:06:10', 401.09, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (2, 11, '2025-01-28 21:05:25', 421.85, 'Credit Card');
INSERT INTO s0.Payments VALUES (3, 40, '2024-10-28 20:19:00', 271.72, 'PayPal');
INSERT INTO s0.Payments VALUES (4, 38, '2024-08-23 17:08:53', 286.55, 'Credit Card');
INSERT INTO s0.Payments VALUES (5, 6, '2025-04-24 18:32:19', 324.95, 'Credit Card');
INSERT INTO s0.Payments VALUES (6, 30, '2025-05-28 15:39:43', 99.05, 'PayPal');
INSERT INTO s0.Payments VALUES (7, 25, '2025-02-22 15:49:51', 170.4, 'PayPal');
INSERT INTO s0.Payments VALUES (8, 21, '2024-08-22 00:24:44', 175.38, 'PayPal');
INSERT INTO s0.Payments VALUES (9, 18, '2025-04-12 03:05:55', 378.48, 'PayPal');
INSERT INTO s0.Payments VALUES (10, 17, '2025-06-21 19:08:18', 419.11, 'PayPal');
INSERT INTO s0.Payments VALUES (11, 2, '2025-06-28 01:05:31', 377.02, 'Credit Card');
INSERT INTO s0.Payments VALUES (12, 23, '2024-08-20 02:52:00', 119.87, 'Credit Card');
INSERT INTO s0.Payments VALUES (13, 50, '2024-10-13 08:10:41', 479.07, 'Credit Card');
INSERT INTO s0.Payments VALUES (14, 49, '2025-03-31 03:13:42', 25.2, 'Credit Card');
INSERT INTO s0.Payments VALUES (15, 13, '2024-12-01 12:26:51', 421.22, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (16, 10, '2025-03-14 00:41:00', 126.89, 'PayPal');
INSERT INTO s0.Payments VALUES (17, 43, '2025-04-07 18:12:54', 66.05, 'Credit Card');
INSERT INTO s0.Payments VALUES (18, 30, '2025-04-25 23:23:31', 352.74, 'PayPal');
INSERT INTO s0.Payments VALUES (19, 11, '2025-05-10 02:38:38', 306.89, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (20, 46, '2025-05-13 15:16:34', 66.12, 'Credit Card');
INSERT INTO s0.Payments VALUES (21, 20, '2025-02-03 23:27:15', 62.97, 'Credit Card');
INSERT INTO s0.Payments VALUES (22, 20, '2024-11-15 11:41:57', 292.14, 'PayPal');
INSERT INTO s0.Payments VALUES (23, 26, '2024-08-08 00:35:46', 471.32, 'Credit Card');
INSERT INTO s0.Payments VALUES (24, 5, '2025-06-01 12:26:46', 300.13, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (25, 16, '2025-02-12 01:22:50', 59.93, 'PayPal');
INSERT INTO s0.Payments VALUES (26, 44, '2025-03-13 03:59:24', 304.2, 'Credit Card');
INSERT INTO s0.Payments VALUES (27, 37, '2024-12-18 01:11:29', 393.49, 'PayPal');
INSERT INTO s0.Payments VALUES (28, 35, '2024-11-25 02:50:09', 219.91, 'PayPal');
INSERT INTO s0.Payments VALUES (29, 5, '2024-11-10 00:18:08', 257.92, 'PayPal');
INSERT INTO s0.Payments VALUES (30, 1, '2024-07-14 16:25:03', 426.29, 'PayPal');
INSERT INTO s0.Payments VALUES (31, 7, '2025-02-01 01:28:47', 222.43, 'PayPal');
INSERT INTO s0.Payments VALUES (32, 41, '2025-05-29 04:19:32', 446.87, 'PayPal');
INSERT INTO s0.Payments VALUES (33, 46, '2025-01-21 09:54:36', 84.97, 'Credit Card');
INSERT INTO s0.Payments VALUES (34, 47, '2025-01-23 19:46:54', 265.66, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (35, 18, '2024-08-29 02:41:55', 311.8, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (36, 50, '2025-06-20 00:55:15', 246.91, 'PayPal');
INSERT INTO s0.Payments VALUES (37, 47, '2025-06-25 18:24:06', 300.31, 'PayPal');
INSERT INTO s0.Payments VALUES (38, 16, '2025-02-18 20:26:53', 417.06, 'Credit Card');
INSERT INTO s0.Payments VALUES (39, 18, '2024-09-01 13:12:42', 442.0, 'Credit Card');
INSERT INTO s0.Payments VALUES (40, 49, '2025-02-11 07:03:50', 237.71, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (41, 43, '2024-11-22 04:24:23', 195.7, 'Credit Card');
INSERT INTO s0.Payments VALUES (42, 32, '2024-11-02 22:22:41', 426.97, 'Credit Card');
INSERT INTO s0.Payments VALUES (43, 32, '2025-05-10 18:37:54', 113.94, 'PayPal');
INSERT INTO s0.Payments VALUES (44, 22, '2024-10-06 02:18:00', 147.03, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (45, 45, '2024-09-16 21:55:25', 441.25, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (46, 1, '2024-10-10 00:50:03', 263.15, 'Credit Card');
INSERT INTO s0.Payments VALUES (47, 6, '2025-07-12 17:34:59', 128.26, 'PayPal');
INSERT INTO s0.Payments VALUES (48, 32, '2024-08-03 03:04:40', 282.04, 'Credit Card');
INSERT INTO s0.Payments VALUES (49, 45, '2024-07-27 21:45:53', 243.29, 'Bank Transfer');
INSERT INTO s0.Payments VALUES (50, 32, '2025-01-10 18:23:34', 229.61, 'Credit Card');

-- Sample Data for s0.Subscriptions

INSERT INTO s0.Subscriptions VALUES (1, 6, '2024-03-20', '2024-10-10', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (2, 15, '2024-04-14', '2025-07-07', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (3, 45, '2023-07-19', '2024-04-12', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (4, 20, '2023-12-24', '2023-12-27', 'Annual');
INSERT INTO s0.Subscriptions VALUES (5, 38, '2024-04-16', '2025-04-15', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (6, 31, '2024-01-30', '2025-04-21', 'Annual');
INSERT INTO s0.Subscriptions VALUES (7, 34, '2024-03-16', '2024-05-20', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (8, 28, '2023-09-24', '2025-02-26', 'Annual');
INSERT INTO s0.Subscriptions VALUES (9, 36, '2023-09-17', '2024-03-24', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (10, 23, '2023-12-23', '2024-04-05', 'Annual');
INSERT INTO s0.Subscriptions VALUES (11, 30, '2023-08-02', '2024-03-10', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (12, 20, '2023-10-15', '2024-01-12', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (13, 15, '2023-09-27', '2024-12-27', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (14, 47, '2023-12-02', '2025-04-04', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (15, 21, '2024-07-10', '2025-03-16', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (16, 48, '2023-08-28', '2024-04-07', 'Annual');
INSERT INTO s0.Subscriptions VALUES (17, 49, '2024-02-20', '2024-11-21', 'Annual');
INSERT INTO s0.Subscriptions VALUES (18, 12, '2024-04-19', '2024-11-17', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (19, 14, '2023-10-24', '2024-02-05', 'Annual');
INSERT INTO s0.Subscriptions VALUES (20, 31, '2024-03-13', '2024-07-07', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (21, 47, '2024-06-06', '2024-07-27', 'Annual');
INSERT INTO s0.Subscriptions VALUES (22, 49, '2024-01-31', '2025-04-03', 'Annual');
INSERT INTO s0.Subscriptions VALUES (23, 39, '2024-03-17', '2025-03-26', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (24, 7, '2023-12-21', '2025-06-27', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (25, 19, '2024-06-25', '2024-09-22', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (26, 24, '2024-01-18', '2025-06-25', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (27, 20, '2023-11-15', '2024-08-06', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (28, 46, '2023-08-20', '2024-08-21', 'Annual');
INSERT INTO s0.Subscriptions VALUES (29, 9, '2024-05-28', '2024-08-07', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (30, 3, '2024-02-05', '2024-11-03', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (31, 36, '2024-06-29', '2025-06-02', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (32, 45, '2024-05-04', '2024-09-26', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (33, 41, '2023-11-08', '2024-01-20', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (34, 7, '2024-04-27', '2024-11-19', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (35, 37, '2023-11-09', '2024-12-30', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (36, 31, '2023-11-13', '2024-08-31', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (37, 29, '2023-11-07', '2024-02-25', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (38, 12, '2023-08-01', '2023-12-27', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (39, 17, '2023-09-08', '2025-01-22', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (40, 8, '2023-12-26', '2024-11-05', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (41, 26, '2024-03-22', '2025-03-28', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (42, 5, '2024-01-29', '2024-04-15', 'Annual');
INSERT INTO s0.Subscriptions VALUES (43, 41, '2024-01-20', '2024-09-09', 'Annual');
INSERT INTO s0.Subscriptions VALUES (44, 4, '2023-12-20', '2024-07-02', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (45, 10, '2023-11-04', '2024-07-26', 'Annual');
INSERT INTO s0.Subscriptions VALUES (46, 20, '2023-11-06', '2024-05-03', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (47, 16, '2023-08-22', '2025-04-13', 'Monthly');
INSERT INTO s0.Subscriptions VALUES (48, 36, '2024-01-16', '2025-03-20', 'Quarterly');
INSERT INTO s0.Subscriptions VALUES (49, 39, '2024-03-08', '2024-12-20', 'Annual');
INSERT INTO s0.Subscriptions VALUES (50, 40, '2024-01-20', '2024-08-08', 'Monthly');

-- Sample Data for s0.Flights

INSERT INTO s0.Flights VALUES (1, 'TK894', 'Bursa', 'New York', '2025-07-10 01:22:39');
INSERT INTO s0.Flights VALUES (2, 'TK561', 'Antalya', 'Paris', '2025-07-17 10:06:26');
INSERT INTO s0.Flights VALUES (3, 'TK980', 'Bursa', 'New York', '2025-06-24 16:15:09');
INSERT INTO s0.Flights VALUES (4, 'TK412', 'Bursa', 'Tokyo', '2025-08-09 10:47:51');
INSERT INTO s0.Flights VALUES (5, 'TK161', 'Bursa', 'Berlin', '2025-06-20 01:26:47');
INSERT INTO s0.Flights VALUES (6, 'TK881', 'Ankara', 'London', '2025-08-05 15:37:49');
INSERT INTO s0.Flights VALUES (7, 'TK370', 'Istanbul', 'London', '2025-08-11 10:06:03');
INSERT INTO s0.Flights VALUES (8, 'TK345', 'Ankara', 'Tokyo', '2025-07-27 21:17:22');
INSERT INTO s0.Flights VALUES (9, 'TK176', 'Ankara', 'Berlin', '2025-07-27 09:54:16');
INSERT INTO s0.Flights VALUES (10, 'TK518', 'Antalya', 'Tokyo', '2025-08-05 14:22:54');
INSERT INTO s0.Flights VALUES (11, 'TK581', 'Izmir', 'Berlin', '2025-06-21 05:10:38');
INSERT INTO s0.Flights VALUES (12, 'TK337', 'Izmir', 'Paris', '2025-06-23 03:38:28');
INSERT INTO s0.Flights VALUES (13, 'TK819', 'Antalya', 'Berlin', '2025-06-28 02:37:57');
INSERT INTO s0.Flights VALUES (14, 'TK803', 'Ankara', 'Paris', '2025-06-21 16:11:38');
INSERT INTO s0.Flights VALUES (15, 'TK906', 'Bursa', 'London', '2025-08-07 17:01:23');
INSERT INTO s0.Flights VALUES (16, 'TK535', 'Istanbul', 'Tokyo', '2025-06-30 07:40:27');
INSERT INTO s0.Flights VALUES (17, 'TK330', 'Ankara', 'Paris', '2025-07-19 22:32:48');
INSERT INTO s0.Flights VALUES (18, 'TK946', 'Ankara', 'Berlin', '2025-07-20 08:35:46');
INSERT INTO s0.Flights VALUES (19, 'TK161', 'Ankara', 'Paris', '2025-06-27 16:10:34');
INSERT INTO s0.Flights VALUES (20, 'TK709', 'Bursa', 'Paris', '2025-07-26 22:20:54');
INSERT INTO s0.Flights VALUES (21, 'TK549', 'Istanbul', 'New York', '2025-08-11 03:35:28');
INSERT INTO s0.Flights VALUES (22, 'TK805', 'Izmir', 'New York', '2025-06-29 16:35:04');
INSERT INTO s0.Flights VALUES (23, 'TK378', 'Bursa', 'Tokyo', '2025-07-13 12:57:41');
INSERT INTO s0.Flights VALUES (24, 'TK605', 'Antalya', 'Berlin', '2025-07-01 21:50:47');
INSERT INTO s0.Flights VALUES (25, 'TK712', 'Istanbul', 'New York', '2025-06-21 23:55:28');
INSERT INTO s0.Flights VALUES (26, 'TK852', 'Izmir', 'Tokyo', '2025-08-03 00:02:07');
INSERT INTO s0.Flights VALUES (27, 'TK356', 'Istanbul', 'Berlin', '2025-07-13 00:01:41');
INSERT INTO s0.Flights VALUES (28, 'TK334', 'Bursa', 'Tokyo', '2025-07-28 21:35:26');
INSERT INTO s0.Flights VALUES (29, 'TK121', 'Izmir', 'Tokyo', '2025-06-29 15:15:26');
INSERT INTO s0.Flights VALUES (30, 'TK141', 'Ankara', 'New York', '2025-08-08 00:53:32');
INSERT INTO s0.Flights VALUES (31, 'TK631', 'Antalya', 'Paris', '2025-08-09 00:37:26');
INSERT INTO s0.Flights VALUES (32, 'TK285', 'Bursa', 'New York', '2025-06-15 03:10:50');
INSERT INTO s0.Flights VALUES (33, 'TK750', 'Antalya', 'Berlin', '2025-07-25 21:20:22');
INSERT INTO s0.Flights VALUES (34, 'TK581', 'Izmir', 'New York', '2025-06-28 04:29:48');
INSERT INTO s0.Flights VALUES (35, 'TK441', 'Izmir', 'Berlin', '2025-08-06 21:48:18');
INSERT INTO s0.Flights VALUES (36, 'TK978', 'Ankara', 'Paris', '2025-06-17 14:03:10');
INSERT INTO s0.Flights VALUES (37, 'TK521', 'Antalya', 'Paris', '2025-07-23 02:56:22');
INSERT INTO s0.Flights VALUES (38, 'TK778', 'Antalya', 'Tokyo', '2025-08-11 03:37:51');
INSERT INTO s0.Flights VALUES (39, 'TK137', 'Antalya', 'Berlin', '2025-07-29 21:32:13');
INSERT INTO s0.Flights VALUES (40, 'TK422', 'Izmir', 'Paris', '2025-08-05 22:10:05');
INSERT INTO s0.Flights VALUES (41, 'TK218', 'Antalya', 'Tokyo', '2025-07-24 02:15:05');
INSERT INTO s0.Flights VALUES (42, 'TK944', 'Istanbul', 'Tokyo', '2025-07-01 01:48:59');
INSERT INTO s0.Flights VALUES (43, 'TK573', 'Antalya', 'Berlin', '2025-07-18 11:49:21');
INSERT INTO s0.Flights VALUES (44, 'TK292', 'Bursa', 'Paris', '2025-07-09 19:02:56');
INSERT INTO s0.Flights VALUES (45, 'TK737', 'Antalya', 'New York', '2025-07-07 10:48:17');
INSERT INTO s0.Flights VALUES (46, 'TK878', 'Istanbul', 'London', '2025-07-25 03:56:19');
INSERT INTO s0.Flights VALUES (47, 'TK373', 'Bursa', 'London', '2025-06-22 13:43:08');
INSERT INTO s0.Flights VALUES (48, 'TK394', 'Antalya', 'New York', '2025-07-01 10:25:13');
INSERT INTO s0.Flights VALUES (49, 'TK224', 'Istanbul', 'Tokyo', '2025-08-08 23:58:00');
INSERT INTO s0.Flights VALUES (50, 'TK918', 'Ankara', 'London', '2025-07-09 02:21:43');

-- Sample Data for s0.Events

INSERT INTO s0.Events VALUES (1, 'Cross-group leadingedge knowledgebase', 'Izmir', '2025-03-23', 'Conference');
INSERT INTO s0.Events VALUES (2, 'Customizable regional knowledge user', 'Online', '2024-11-28', 'Conference');
INSERT INTO s0.Events VALUES (3, 'User-friendly contextually-based algorithm', 'Ankara', '2025-01-24', 'Conference');
INSERT INTO s0.Events VALUES (4, 'Balanced secondary flexibility', 'Online', '2025-05-24', 'Conference');
INSERT INTO s0.Events VALUES (5, 'Stand-alone background support', 'Ankara', '2024-08-09', 'Webinar');
INSERT INTO s0.Events VALUES (6, 'Configurable 24hour Local Area Network', 'Izmir', '2024-11-28', 'Workshop');
INSERT INTO s0.Events VALUES (7, 'Synergized 24/7 model', 'Online', '2025-04-20', 'Webinar');
INSERT INTO s0.Events VALUES (8, 'Reactive neutral analyzer', 'Online', '2024-07-28', 'Meetup');
INSERT INTO s0.Events VALUES (9, 'Configurable content-based model', 'Online', '2025-03-28', 'Meetup');
INSERT INTO s0.Events VALUES (10, 'Operative disintermediate architecture', 'Online', '2025-07-12', 'Meetup');
INSERT INTO s0.Events VALUES (11, 'Self-enabling leadingedge task-force', 'Ankara', '2025-04-12', 'Conference');
INSERT INTO s0.Events VALUES (12, 'Extended executive website', 'Izmir', '2025-05-11', 'Webinar');
INSERT INTO s0.Events VALUES (13, 'Object-based transitional access', 'Izmir', '2024-10-20', 'Workshop');
INSERT INTO s0.Events VALUES (14, 'Robust demand-driven definition', 'Istanbul', '2024-10-07', 'Workshop');
INSERT INTO s0.Events VALUES (15, 'Secured 5thgeneration alliance', 'Izmir', '2024-10-21', 'Webinar');
INSERT INTO s0.Events VALUES (16, 'Decentralized solution-oriented benchmark', 'Ankara', '2024-09-04', 'Webinar');
INSERT INTO s0.Events VALUES (17, 'Organized analyzing firmware', 'Online', '2024-11-03', 'Workshop');
INSERT INTO s0.Events VALUES (18, 'Expanded multimedia pricing structure', 'Izmir', '2025-05-28', 'Webinar');
INSERT INTO s0.Events VALUES (19, 'Triple-buffered attitude-oriented algorithm', 'Online', '2024-12-20', 'Workshop');
INSERT INTO s0.Events VALUES (20, 'Face-to-face hybrid complexity', 'Ankara', '2024-07-29', 'Meetup');
INSERT INTO s0.Events VALUES (21, 'Assimilated maximized migration', 'Online', '2025-01-12', 'Meetup');
INSERT INTO s0.Events VALUES (22, 'Automated tertiary ability', 'Online', '2024-10-12', 'Conference');
INSERT INTO s0.Events VALUES (23, 'Seamless impactful protocol', 'Izmir', '2025-03-22', 'Webinar');
INSERT INTO s0.Events VALUES (24, 'Inverse explicit model', 'Online', '2024-09-13', 'Webinar');
INSERT INTO s0.Events VALUES (25, 'Decentralized systemic extranet', 'Ankara', '2025-03-03', 'Webinar');
INSERT INTO s0.Events VALUES (26, 'Organic maximized definition', 'Istanbul', '2025-07-11', 'Meetup');
INSERT INTO s0.Events VALUES (27, 'Polarized analyzing data-warehouse', 'Izmir', '2025-04-01', 'Conference');
INSERT INTO s0.Events VALUES (28, 'Cross-group attitude-oriented architecture', 'Online', '2025-05-07', 'Conference');
INSERT INTO s0.Events VALUES (29, 'Proactive responsive application', 'Online', '2024-08-09', 'Conference');
INSERT INTO s0.Events VALUES (30, 'Optimized methodical monitoring', 'Ankara', '2024-09-04', 'Webinar');
INSERT INTO s0.Events VALUES (31, 'Team-oriented value-added complexity', 'Ankara', '2024-12-14', 'Conference');
INSERT INTO s0.Events VALUES (32, 'User-friendly tangible hierarchy', 'Online', '2024-11-10', 'Workshop');
INSERT INTO s0.Events VALUES (33, 'Fully-configurable fresh-thinking open system', 'Izmir', '2025-04-05', 'Webinar');
INSERT INTO s0.Events VALUES (34, 'Cloned responsive emulation', 'Istanbul', '2025-06-15', 'Workshop');
INSERT INTO s0.Events VALUES (35, 'Persevering cohesive success', 'Online', '2025-06-19', 'Workshop');
INSERT INTO s0.Events VALUES (36, 'Visionary logistical contingency', 'Online', '2024-10-13', 'Conference');
INSERT INTO s0.Events VALUES (37, 'Seamless optimal functionalities', 'Istanbul', '2025-05-06', 'Meetup');
INSERT INTO s0.Events VALUES (38, 'Cross-group national migration', 'Izmir', '2025-01-19', 'Meetup');
INSERT INTO s0.Events VALUES (39, 'Cloned eco-centric installation', 'Istanbul', '2025-07-04', 'Webinar');
INSERT INTO s0.Events VALUES (40, 'Extended actuating array', 'Istanbul', '2025-05-26', 'Conference');
INSERT INTO s0.Events VALUES (41, 'Adaptive national frame', 'Online', '2024-10-19', 'Meetup');
INSERT INTO s0.Events VALUES (42, 'Open-architected attitude-oriented focus group', 'Izmir', '2025-05-05', 'Conference');
INSERT INTO s0.Events VALUES (43, 'Organic foreground success', 'Istanbul', '2024-11-07', 'Workshop');
INSERT INTO s0.Events VALUES (44, 'Balanced grid-enabled algorithm', 'Istanbul', '2024-11-08', 'Workshop');
INSERT INTO s0.Events VALUES (45, 'User-friendly web-enabled standardization', 'Izmir', '2025-05-26', 'Workshop');
INSERT INTO s0.Events VALUES (46, 'Optimized tertiary function', 'Online', '2024-12-01', 'Meetup');
INSERT INTO s0.Events VALUES (47, 'Profound methodical circuit', 'Ankara', '2024-12-31', 'Webinar');
INSERT INTO s0.Events VALUES (48, 'Balanced uniform extranet', 'Ankara', '2025-06-12', 'Meetup');
INSERT INTO s0.Events VALUES (49, 'Optimized fresh-thinking circuit', 'Ankara', '2025-04-21', 'Conference');
INSERT INTO s0.Events VALUES (50, 'Exclusive 5thgeneration forecast', 'Online', '2024-07-23', 'Meetup');
