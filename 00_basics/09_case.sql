-- 09_case.sql – CASE WHEN Kullanımı Örnekleri

-- 1. Maaşı 10.000 üzeri olanlara 'Yüksek Maaş' etiketi ver
SELECT FirstName, Salary,
       CASE
           WHEN Salary >= 10000 THEN 'Yüksek Maaş'
           ELSE 'Normal'
       END AS MaasDurumu
FROM s0.Employees;

-- 2. Sipariş tutarına göre sınıflandırma
SELECT OrderID, TotalAmount,
       CASE
           WHEN TotalAmount >= 500 THEN 'Büyük Sipariş'
           WHEN TotalAmount >= 100 THEN 'Orta Sipariş'
           ELSE 'Küçük Sipariş'
       END AS SiparisTipi
FROM s0.Orders;

-- 3. Ürün stoğu yoksa 'Tükenmiş', varsa 'Var'
SELECT ProductName, Stock,
       CASE
           WHEN Stock = 0 THEN 'Tükenmiş'
           ELSE 'Stokta Var'
       END AS StokDurumu
FROM s0.Products;

-- 4. Abonelik tipi 'Annual' ise indirim uygula
SELECT PlanType,
       CASE
           WHEN PlanType = 'Annual' THEN 'İndirimli'
           ELSE 'Standart'
       END AS UcretTipi
FROM s0.Subscriptions;

-- 5. Ödeme tutarına göre puan hesapla
SELECT Amount,
       CASE
           WHEN Amount >= 400 THEN 100
           WHEN Amount >= 200 THEN 50
           ELSE 10
       END AS BonusPuan
FROM s0.Payments;

-- 6. Etkinlik türünü etiketle
SELECT EventName, EventType,
       CASE
           WHEN EventType = 'Webinar' THEN 'Çevrimiçi'
           ELSE 'Fiziksel'
       END AS EtkinlikDurumu
FROM s0.Events;

-- 7. NULL email varsa 'Eksik', değilse 'Tamam'
SELECT FirstName, Email,
       CASE
           WHEN Email IS NULL THEN 'Eksik'
           ELSE 'Tamam'
       END AS EmailDurumu
FROM s0.Customers;

-- 8. Kitapların sayfa sayısına göre sınıflandırılması
SELECT Title, PageCount,
       CASE
           WHEN PageCount > 600 THEN 'Uzun'
           WHEN PageCount >= 300 THEN 'Orta'
           ELSE 'Kısa'
       END AS KitapTuru
FROM s0.Books;

-- 9. Çalışan pozisyonuna göre mesaj üret
SELECT FirstName, Position,
       CASE
           WHEN Position = 'Manager' THEN 'Yönetici Yetkisi'
           WHEN Position = 'Developer' THEN 'Teknik Kadro'
           ELSE 'Diğer'
       END AS RolYorumu
FROM s0.Employees;

-- 10. ISNULL ile birlikte CASE kullanımı
SELECT FirstName,
       CASE
           WHEN ISNULL(Salary, 0) = 0 THEN 'Maaş Bilgisi Eksik'
           ELSE 'Maaş Girilmiş'
       END AS MaasDurumu
FROM s0.Employees;