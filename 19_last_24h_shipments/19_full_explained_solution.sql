-- 📦 19 – Cargo Tracking System: Packages Sent in Last 24 Hours

-- Amaç: Son 24 saat içinde gönderilen kargoların
-- takip numaraları, gönderici bilgileri ve kaç saat önce gönderildiği bilgilerini listelemek.

-- Adım 1: Tüm kargo gönderim tarihlerini görelim
-- SELECT * FROM s19.Packages;

-- Adım 2: Son 24 saat içinde gönderilenleri filtrele
-- DATEADD(HOUR, -24, GETDATE()) son 24 saatin başlangıç noktasını verir
-- SentDate >= bu değere göre filtreleme yapılır

-- SELECT * FROM s19.Packages
-- WHERE SentDate >= DATEADD(HOUR, -24, GETDATE());

-- Adım 3: Gönderici ismini de dahil etmek için JOIN yapılır
-- Saat farkı DATEDIFF ile hesaplanır

SELECT 
    p.TrackingNumber,
    s.SenderName,
    DATEDIFF(HOUR, p.SentDate, GETDATE()) AS HoursAgo
FROM s19.Packages AS p
JOIN s19.Senders AS s ON p.SenderID = s.SenderID
WHERE p.SentDate >= DATEADD(HOUR, -24, GETDATE());

-- Açıklamalar:
-- GETDATE(): Şu anki tarih ve saat
-- DATEADD(HOUR, -24, GETDATE()): Şu andan 24 saat öncesi
-- DATEDIFF(HOUR, p.SentDate, GETDATE()): Kaç saat geçtiğini hesaplar
-- JOIN: Gönderici bilgilerini çekmek için kullanılır