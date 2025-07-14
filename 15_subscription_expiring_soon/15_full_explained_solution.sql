-- 📅 15 – Subscription System: Expiring Soon

-- Bu sorgunun amacı:
-- Bugün ile abonelik bitiş tarihi arasındaki fark 30 gün ve daha az olan kullanıcıları bulmak
-- ve kalan gün sayılarını listelemektir.

-- Adım 1: Abonelik bitiş tarihlerini ve bugünü görelim
-- SELECT *, GETDATE() AS Today
-- FROM s15.Subscriptions;

-- Adım 2: Tarihler arası farkı hesaplayalım
-- SELECT 
--     UserID,
--     DATEDIFF(DAY, GETDATE(), EndDate) AS DaysLeft
-- FROM s15.Subscriptions;

-- Adım 3: Kalan gün sayısı 0-30 arası olanları filtrele
-- SELECT 
--     UserID,
--     DATEDIFF(DAY, GETDATE(), EndDate) AS DaysLeft
-- FROM s15.Subscriptions
-- WHERE DATEDIFF(DAY, GETDATE(), EndDate) <= 30
--   AND DATEDIFF(DAY, GETDATE(), EndDate) >= 0;

-- Adım 4: Kullanıcı ismini dahil et
-- Tabloları JOIN ile birleştirip kullanıcı adı ve kalan gün sayısını getir

SELECT 
    u.UserName,
    DATEDIFF(DAY, GETDATE(), s.EndDate) AS DaysLeft
FROM s15.Subscriptions AS s
JOIN s15.Users AS u ON s.UserID = u.UserID
WHERE DATEDIFF(DAY, GETDATE(), s.EndDate) BETWEEN 0 AND 30;

-- Açıklamalar:
-- GETDATE(): Sistemdeki mevcut tarih ve saat
-- DATEDIFF(): Belirli iki tarih arasındaki farkı gün olarak verir
-- JOIN: Kullanıcı ve abonelik tablolarını eşleştirir
-- BETWEEN: Değerin belirtilen iki sınır arasında olup olmadığını kontrol eder