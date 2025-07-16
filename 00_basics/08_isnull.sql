-- 08_isnull.sql – ISNULL() Fonksiyonu Örnekleri

-- 1. NULL olan sipariş tutarlarını 0 olarak göster
SELECT OrderID, ISNULL(TotalAmount, 0) AS SafeAmount
FROM s0.Orders;

-- 2. Müşteri e-posta adresi yoksa 'Belirsiz' olarak göster
SELECT FirstName, ISNULL(Email, 'Belirsiz') AS EmailInfo
FROM s0.Customers;

-- 3. NULL maaşları 'Tanımsız' yaz (örnek amaçlı varsayım: bazı maaşlar NULL)
SELECT FirstName, ISNULL(CAST(Salary AS VARCHAR), 'Tanımsız') AS MaasDurumu
FROM s0.Employees;

-- 4. CONCAT işlemi içinde NULL'ları önle
SELECT ISNULL(FirstName, '') + ' ' + ISNULL(LastName, '') AS FullName
FROM s0.Employees;

-- 5. Ödeme tarihi boşsa 'Henüz Ödenmedi' mesajı ver (örnek sabit)
SELECT ISNULL(CONVERT(VARCHAR, PaymentDate, 104), 'Henüz Ödenmedi') AS PaymentDateFormatted
FROM s0.Payments;

-- 6. NULL olan abonelik planlarını 'Standart' olarak göster
SELECT SubscriptionID, ISNULL(PlanType, 'Standart') AS [Plan]
FROM s0.Subscriptions;

-- 7. NULL stokları 0 ile değiştir
SELECT ProductName, ISNULL(Stock, 0) AS AdjustedStock
FROM s0.Products;

-- 8. COUNT içinde NULL varsa sıfırla (örnek amaçlı: COALESCE de kullanılabilir)
SELECT DepartmentID, ISNULL(COUNT(EmployeeID), 0) AS TotalEmployees
FROM s0.Employees
GROUP BY DepartmentID;

-- 9. LEFT JOIN sonrası gelen boş departman adlarını 'Yok' olarak göster
SELECT e.FirstName, ISNULL(d.DepartmentName, 'Yok') AS DepartmentName
FROM s0.Employees e
LEFT JOIN s0.Departments d ON e.DepartmentID = d.DepartmentID;

-- 10. CASE ifadesiyle birlikte ISNULL kullanımı
SELECT FirstName, Salary,
       CASE 
            WHEN ISNULL(Salary, 0) > 10000 
                THEN 'Yüksek Maaş' 
                ELSE 'Normal' 
       END AS MaasYorum
FROM s0.Employees;