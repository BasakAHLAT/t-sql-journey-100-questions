-- 🎵 17 – Music Platform: Songs Longer Than 5 Minutes

-- Bu sorguda, süresi 5 dakikadan (300 saniye) uzun olan şarkıların
-- isimleri, sanatçıları ve şarkının kaç saniye sürdüğü listelenmektedir.

-- Adım 1: Tüm şarkıları ve sürelerini görelim
-- SELECT * FROM s17.Songs;

-- Adım 2: Süresi 300 saniyeden uzun olan şarkıları filtreleyelim
-- SELECT * FROM s17.Songs WHERE DurationInSeconds > 300;

-- Adım 3: Şarkı adı ve süresini gösterelim
-- SELECT SongName, DurationInSeconds FROM s17.Songs WHERE DurationInSeconds > 300;

-- Adım 4: Sanatçı bilgisini de dahil edelim (JOIN ile)

SELECT 
    s.SongName,
    a.ArtistName,
    s.DurationInSeconds
FROM s17.Songs AS s
JOIN s17.Artists AS a ON s.ArtistID = a.ArtistID
WHERE s.DurationInSeconds > 300;

-- Açıklamalar:
-- DurationInSeconds > 300 → 5 dakikadan uzun şarkılar
-- JOIN → Songs ve Artists tabloları ArtistID üzerinden eşleştirildi
-- SELECT → Şarkı adı, sanatçı adı ve süre gösteriliyor