-- 🏨 13 – Hotel System: High-Rated Hotels

-- Hedef: Puanı 4.0'ın üzerinde olan otellerin şehir ismini, yorum sayısını ve
-- ortalama yorum uzunluğunu karakter bazında getirmek.

-- Adım 1: Otel verilerini alıyoruz
-- SELECT * FROM s13.Hotels;

-- Adım 2: Yüksek puanlı otelleri filtreliyoruz
-- SELECT * FROM s13.Hotels WHERE Rating > 4.0;

-- Adım 3: Şehir ismini almak için Cities ile JOIN
-- SELECT h.HotelName, c.CityName FROM s13.Hotels h JOIN s13.Cities c ON h.CityID = c.CityID;

-- Adım 4: Yorumları da dahil etmek için Reviews tablosuna LEFT JOIN
-- SELECT h.HotelName, c.CityName, r.ReviewText FROM ... LEFT JOIN s13.Reviews r ...

-- Adım 5: Yorum sayısı ve ortalama yorum uzunluğunu hesaplıyoruz

SELECT 
    h.HotelName, 
    c.CityName, 
    COUNT(r.ReviewID) AS ReviewCount,
    AVG(LEN(r.ReviewText)) AS AvgReviewLength
FROM s13.Hotels AS h
JOIN s13.Cities AS c ON h.CityID = c.CityID
LEFT JOIN s13.Reviews AS r ON h.HotelID = r.HotelID
WHERE h.Rating > 4.0
GROUP BY h.HotelName, c.CityName;

-- Açıklamalar:
-- COUNT() → Otelin aldığı toplam yorum sayısını verir
-- AVG(LEN()) → Yorumların ortalama karakter uzunluğunu hesaplar
-- LEFT JOIN → Yorumu olmayan otellerin de dahil olmasını sağlar
-- GROUP BY → Her bir otel ve şehir kombinasyonu için toplu veri sunar