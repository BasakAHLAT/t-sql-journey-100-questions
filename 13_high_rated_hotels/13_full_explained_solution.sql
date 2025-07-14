-- 🏨 13 – Hotel System: High-Rated Hotels

-- Bu sorguda, kullanıcı puanı 4.0’ın üzerinde olan otellerin şehir bilgisi,
-- toplam yorum sayısı ve ortalama yorum uzunluğunu karakter sayısı olarak alacağız.

-- Ana Tablomuz: Hotels
-- Sorgu, otel bilgilerini içeren s13.Hotels tablosuyla başlar.
-- Hedefimiz yüksek puanlı otellerdir.

-- Şehir Bilgisi İçin Join
-- Her otelin bulunduğu şehri göstermek için Cities tablosuna LEFT JOIN yapılır.

-- Yorum Bilgisi İçin Join
-- Otellere ait yorumları Reviews tablosundan alırız. Bazı otellerin hiç yorumu olmayabileceği için LEFT JOIN kullanılır.

-- Filtre: Yüksek Puanlı Oteller
-- Sadece kullanıcı puanı 4.0 üzeri olan oteller dahil edilir.

-- Gruplama ve Hesaplamalar
-- Her otel için yorum sayısı ve ortalama yorum uzunluğu hesaplanır.
-- GROUP BY kullanılarak otel ve şehir bazında gruplanır.

SELECT 
    h.HotelName, 
    c.CityName, 
    COUNT(r.ReviewID) AS ReviewCount,
    AVG(LEN(r.ReviewText)) AS AvgReviewLength
FROM s13.Hotels AS h
LEFT JOIN s13.Cities AS c
    ON h.CityID = c.CityID
LEFT JOIN s13.Reviews AS r
    ON h.HotelID = r.HotelID
WHERE h.Rating > 4.0
GROUP BY h.HotelName, c.CityName;

-- =========================================
-- 📚 Fonksiyon ve Komut Açıklamaları
-- =========================================

-- LEN(): Bir metnin karakter uzunluğunu verir
SELECT LEN('Harika bir otel!');  -- Sonuç: 17

-- AVG() + LEN(): Ortalama metin uzunluğu
SELECT AVG(LEN(ReviewText)) 
FROM s13.Reviews;

-- COUNT(): Belirli koşula göre yorum sayısını verir
SELECT COUNT(*) 
FROM s13.Reviews
WHERE HotelID = 101;

-- LEFT JOIN: Otellerin yorumları varsa getirir, yoksa NULL döner
SELECT h.HotelName, r.ReviewText
FROM s13.Hotels h
LEFT JOIN s13.Reviews r ON h.HotelID = r.HotelID;

-- GROUP BY: Otel bazında yorumları gruplar
SELECT HotelID, COUNT(*) 
FROM s13.Reviews
GROUP BY HotelID;