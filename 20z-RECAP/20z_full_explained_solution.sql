-- 🔍 Son 30 günde kayıt olan müşterileri al
-- 🎯 Kategori bilgisi eksikse "Bilinmiyor" yaz
-- 🧮 Aboneliği geçmiş mi kontrol et
-- 📊 Aynı müşteriden gelen tekrarları önlemek için GROUP BY ile grupla
-- 📌 Ortalama açıklama uzunluğunu, sipariş sayısını, kalan günleri hesapla

SELECT 
    c.FullName,
    c.Email,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    AVG(LEN(p.ProductName)) AS AvgProductNameLength,
    ISNULL(cat.CategoryName, 'Bilinmiyor') AS ProductCategory,
    CASE 
        WHEN DATEDIFF(DAY, GETDATE(), s.EndDate) < 0 THEN 'Süresi Dolmuş'
        ELSE CAST(DATEDIFF(DAY, GETDATE(), s.EndDate) AS VARCHAR)
    END AS DaysUntilEnd
FROM s1to20.Customers AS c
JOIN s1to20.Orders AS o ON c.CustomerID = o.CustomerID
JOIN s1to20.OrderDetails AS od ON o.OrderID = od.OrderID
JOIN s1to20.Products AS p ON od.ProductID = p.ProductID
LEFT JOIN s1to20.Categories AS cat ON p.CategoryID = cat.CategoryID
JOIN s1to20.Subscriptions AS s ON c.CustomerID = s.CustomerID
WHERE c.RegistrationDate >= DATEADD(DAY, -30, GETDATE())
GROUP BY 
    c.FullName, c.Email, cat.CategoryName, s.EndDate;
