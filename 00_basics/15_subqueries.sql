-- 🧩 15 – Subqueries: Alt Sorgularla Çözüm Senaryoları

-- 1. En pahalı ürünü listele (tek değer dönen alt sorgu)
SELECT ProductName, Price
FROM s0.Products
WHERE Price = (SELECT MAX(Price) FROM s0.Products);

-- 2. En son siparişi veren müşterinin adını ve soyadını bul
SELECT c.FirstName, c.LastName
FROM s0.Customers c
WHERE c.CustomerID = (
    SELECT TOP 1 CustomerID
    FROM s0.Orders
    ORDER BY OrderDate DESC
);

-- 3. Hiç siparişi olmayan müşterileri listele
SELECT FirstName, LastName, Email
FROM s0.Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM s0.Orders);

-- 4. Kategori bazında en ucuz ürünü bul (correlated subquery)
SELECT p.ProductName, p.CategoryID, p.Price
FROM s0.Products p
WHERE p.Price = (
    SELECT MIN(p2.Price)
    FROM s0.Products p2
    WHERE p2.CategoryID = p.CategoryID
);

-- 5. Her müşterinin toplam sipariş tutarını göster
SELECT c.FirstName, c.LastName,
    (SELECT SUM(o.TotalAmount) FROM s0.Orders o WHERE o.CustomerID = c.CustomerID) AS TotalSpent
FROM s0.Customers c;

-- 6. Stoğu ortalamanın altında olan ürünleri listele
SELECT ProductName, Stock
FROM s0.Products
WHERE Stock < (SELECT AVG(Stock) FROM s0.Products);

-- 7. Departmanda en erken işe alınan çalışanı bul
SELECT e.FirstName, e.LastName, e.HireDate, e.DepartmentID
FROM s0.Employees e
WHERE e.HireDate = (
    SELECT MIN(e2.HireDate)
    FROM s0.Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);

-- 8. En çok sipariş veren müşterinin bilgisini çek
SELECT TOP 1 c.FirstName, c.LastName, c.Email, o.OrderCount
FROM (
    SELECT CustomerID, COUNT(*) AS OrderCount
    FROM s0.Orders
    GROUP BY CustomerID
) o
JOIN s0.Customers c ON c.CustomerID = o.CustomerID
ORDER BY o.OrderCount DESC;

-- 9. Departmanındaki ortalama maaştan yüksek maaş alan çalışanlar
SELECT e.FirstName, e.LastName, e.Salary, e.DepartmentID
FROM s0.Employees e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM s0.Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);

-- 10. Belirli bir kategoriye ait, ortalamanın üzerinde fiyatlı ürünler
SELECT ProductName, Price, CategoryID
FROM s0.Products
WHERE Price > (
    SELECT AVG(Price) FROM s0.Products p2 WHERE p2.CategoryID = s0.Products.CategoryID
);

-- 11. Hiç çalışanı olmayan departmanları listele
SELECT DepartmentName
FROM s0.Departments
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM s0.Employees);
