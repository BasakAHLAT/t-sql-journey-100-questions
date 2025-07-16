-- 06_convert.sql – CONVERT() Fonksiyonu Örnekleri

-- 1. Sipariş tarihini sadece tarih formatına çevir (DATETIME → DATE)
SELECT OrderID, CONVERT(DATE, OrderDate) AS OrderDateOnly
FROM s0.Orders;

-- 2. Ödeme tarihini 'dd.mm.yyyy' biçiminde göster (stil 104)
SELECT PaymentID, CONVERT(VARCHAR, PaymentDate, 104) AS PaymentDateFormatted
FROM s0.Payments;

-- 3. Yayın tarihini 'yyyy-mm-dd' formatında göster (stil 120)
SELECT BookID, Title, CONVERT(VARCHAR, PublishedDate, 120) AS IsoDate
FROM s0.Books;

-- 4. FLOAT değeri metne çevir
SELECT ProductID, Price, CONVERT(VARCHAR, Price) AS PriceText
FROM s0.Products;

-- 5. Metin olarak yazılmış sayıların INT'e çevrilmesi (örnek sabit veri)
SELECT CONVERT(INT, '12345') AS NumberFromText;

-- 6. Tarihi saatli formatla göster (stil 113)
SELECT GETDATE() AS Raw, CONVERT(VARCHAR, GETDATE(), 113) AS BritishStyle;

-- 7. Ödeme tutarını metin olarak yazdır
SELECT Amount, CONVERT(VARCHAR, Amount) AS AmountText
FROM s0.Payments;

-- 8. Etkinlik tarihini özel formatta raporla (stil 103 – dd/mm/yyyy)
SELECT EventID, EventName, CONVERT(VARCHAR, EventDate, 103) AS EventDateFormatted
FROM s0.Events;

-- 9. Müşteri kaydına tarih girerken CONVERT ile GETDATE kullanımı
-- INSERT INTO s0.Customers (CustomerID, FirstName, LastName, Email, RegisteredAt, MembershipType)
-- VALUES (999, 'Ali', 'Can', 'ali@example.com', CONVERT(DATETIME, GETDATE()), 'Premium');

-- 10. Yazar doğum yılını string olarak göster (INT → VARCHAR)
SELECT AuthorID, FirstName, CONVERT(VARCHAR, BirthYear) AS BirthYearText
FROM s0.Authors;