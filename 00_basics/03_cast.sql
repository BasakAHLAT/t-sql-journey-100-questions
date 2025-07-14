-- 03_cast.sql – CAST() Fonksiyonu Örnekleri

-- 1. Sipariş tarihinden sadece tarih kısmını al (DATETIME → DATE)
SELECT OrderID, CAST(OrderDate AS DATE) AS OrderOnlyDate
FROM s0.Orders;

-- 2. Sayı metnini tamsayıya çevir (örnek sabit değerle)
SELECT CAST('12345' AS INT) AS ConvertedNumber;

-- 3. Müşteri ID'lerini metin olarak göster (INT → VARCHAR)
SELECT CustomerID, CAST(CustomerID AS VARCHAR) AS CustomerID_Text
FROM s0.Customers;

-- 4. Ürün fiyatını tam sayıya çevir (DECIMAL → INT)
SELECT ProductID, Price, CAST(Price AS INT) AS RoundedPrice
FROM s0.Products;

-- 5. Ödeme tutarını metin olarak göster (FLOAT → VARCHAR)
SELECT PaymentID, Amount, CAST(Amount AS VARCHAR) AS AmountText
FROM s0.Payments;

-- 6. Çalışan maaşını string olarak göstermek
SELECT EmployeeID, Salary, CAST(Salary AS NVARCHAR) AS SalaryLabel
FROM s0.Employees;

-- 7. Yayın tarihini string formatta birleştir (DATE → VARCHAR)
SELECT BookID, Title, CAST(PublishedDate AS VARCHAR) + ' Yayınlandı' AS PublishedText
FROM s0.Books;

-- 8. Farklı veri tipindeki sütunlar arasında dönüşümle JOIN yapmak (örnek sabit)
SELECT * FROM s0.Customers c
JOIN s0.Payments p 
ON CAST(c.CustomerID AS VARCHAR) = CAST(p.CustomerID AS VARCHAR);

-- 9. Saat etkisini sıfırlayarak tarih karşılaştırması yapmak
SELECT *
FROM s0.Events
WHERE CAST(EventDate AS DATE) = CAST(GETDATE() AS DATE);

-- 10. Hatalı veri yerine dönüşümle çalışmayı sağlamak (örnek sabit değerle)
SELECT CAST('2025-01-01' AS DATE) AS SafeDate;