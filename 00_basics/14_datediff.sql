-- 16_datediff.sql – DATEDIFF() Fonksiyonu Örnekleri

-- 1. Müşterinin kayıt tarihi ile bugünün farkı (gün)
SELECT CustomerID, FirstName, RegisteredAt,
       DATEDIFF(DAY, RegisteredAt, GETDATE()) AS KayıtGunuFarki
FROM s0.Customers;

-- 2. Sipariş tarihi ile teslim tarihi arasındaki fark (varsayım: OrderDate + 3 gün = teslim)
SELECT OrderID, OrderDate,
       DATEDIFF(DAY, OrderDate, DATEADD(DAY, 3, OrderDate)) AS TeslimGunuFarki
FROM s0.Orders;

-- 3. Çalışanın işe giriş tarihi ile bugünün yıl farkı
SELECT FirstName, LastName, HireDate,
       DATEDIFF(YEAR, HireDate, GETDATE()) AS CalismaYili
FROM s0.Employees;

-- 4. Kitap yayın tarihi ile bugünün farkı (gün)
SELECT Title, PublishedDate,
       DATEDIFF(DAY, PublishedDate, GETDATE()) AS GunFarki
FROM s0.Books;

-- 5. Abonelik başlangıç ve bitiş tarihleri arasındaki gün farkı
SELECT SubscriptionID, StartDate, EndDate,
       DATEDIFF(DAY, StartDate, EndDate) AS AbonelikSuresi
FROM s0.Subscriptions;

-- 6. Etkinlik tarihine kaç gün kaldı?
SELECT EventName, EventDate,
       DATEDIFF(DAY, GETDATE(), EventDate) AS KalanGun
FROM s0.Events;

-- 7. Ödeme tarihi ile sistem saati arasındaki saat farkı
SELECT PaymentID, PaymentDate,
       DATEDIFF(HOUR, PaymentDate, GETDATE()) AS SaatFarki
FROM s0.Payments;

-- 8. İki sabit tarih arasındaki hafta farkı
SELECT DATEDIFF(WEEK, '2025-01-01', '2025-07-15') AS HaftaFarki;

-- 9. Bugünden 90 gün önceye göre fark kontrolü
SELECT DATEDIFF(DAY, DATEADD(DAY, -90, GETDATE()), GETDATE()) AS GecenGun;

-- 10. Her müşteri için kayıt süresi (gün olarak)
SELECT CustomerID, FirstName,
       DATEDIFF(DAY, RegisteredAt, GETDATE()) AS KayitSuresiGun
FROM s0.Customers;