-- ✈️ 18 – Airline System: Tomorrow's Flights

-- Amaç: Yarın gerçekleşecek uçuşların uçuş numaralarını, kalkış saatlerini
-- ve varış şehirlerini listelemektir.

-- Adım 1: Uçuş tablosundaki tüm kayıtları görüntüleyelim
-- SELECT * FROM s18.Flights;

-- Adım 2: Sadece yarına ait uçuşları filtreleyelim
-- Bunun için DepartureTime içinden sadece tarih kısmı alınır ve
-- yarınla eşleştirilir (GETDATE() + 1)

-- SELECT * 
-- FROM s18.Flights
-- WHERE CAST(DepartureTime AS DATE) = CAST(DATEADD(DAY, 1, GETDATE()) AS DATE);

-- Adım 3: Şehir ismini almak için JOIN kullanarak Cities tablosunu dahil edelim

SELECT 
    f.FlightNumber,
    f.DepartureTime,
    c.CityName AS ArrivalCity
FROM s18.Flights AS f
JOIN s18.Cities AS c ON f.ArrivalCityID = c.CityID
WHERE CAST(f.DepartureTime AS DATE) = CAST(DATEADD(DAY, 1, GETDATE()) AS DATE);

-- Açıklamalar:
-- GETDATE(): Geçerli tarih ve saat
-- DATEADD(DAY, 1, GETDATE()): Yarının tarihini verir
-- CAST(... AS DATE): Zaman kısmını atar, sadece tarih ile karşılaştırma yapılır
-- JOIN: Uçuşun varış şehir bilgisiyle eşleşmesini sağlar