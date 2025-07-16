-- 07_try_convert.sql – TRY_CONVERT() Fonksiyonu Örnekleri

-- 1. Sayı metnini güvenli şekilde INT'e çevir
SELECT TRY_CONVERT(INT, '12345') AS SafeInt;

-- 2. Geçersiz sayı metnini INT'e çevirmeyi dener (NULL döner)
SELECT TRY_CONVERT(INT, 'abc123') AS FailedInt;

-- 3. Tarih formatındaki metni DATE'e çevir
SELECT TRY_CONVERT(DATE, '2025-01-01') AS SafeDate;

-- 4. Geçersiz tarih metni için dönüşüm (NULL)
SELECT TRY_CONVERT(DATE, '31/31/2024') AS InvalidDate;

-- 5. FLOAT değerini VARCHAR olarak çevir
SELECT TRY_CONVERT(VARCHAR, Amount) AS AmountText
FROM s0.Payments;

-- 6. Yazar doğum yılını metin olarak karşılaştır (INT → VARCHAR → INT)
SELECT AuthorID, FirstName, TRY_CONVERT(INT, CONVERT(VARCHAR, BirthYear)) AS BirthYearInt
FROM s0.Authors;

-- 7. Müşterinin doğum yılı bilgisi olmayan veriyle dönüşüm testi (örnek sabit)
SELECT TRY_CONVERT(INT, NULL) AS NullToInt;

-- 8. CONVERT yerine TRY_CONVERT kullanımı (başarısız dönüşümde hata yerine NULL)
SELECT TRY_CONVERT(DATE, 'geçersiz tarih') AS NoError;

-- 9. TRY_CONVERT ile geçerli tarihleri filtrele
SELECT TRY_CONVERT(DATE, '2022-06-10') AS ValidDate
WHERE TRY_CONVERT(DATE, '2022-06-10') IS NOT NULL;

-- 10. Bozuk değer içeren metin listesini test et
SELECT TRY_CONVERT(INT, '100') AS A,
       TRY_CONVERT(INT, '5a') AS B,
       TRY_CONVERT(INT, '123x') AS C;