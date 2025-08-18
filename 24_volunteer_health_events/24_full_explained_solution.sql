
-- ❤️ 24 – Volunteer: Health-Themed Event Participation
-- Adım adım sorgu gelişimi

-- 🔹 Adım 1: Üç tabloyu birleştiriyoruz

SELECT *
FROM s24.VolunteerEvents ve
JOIN s24.Volunteers v ON ve.VolunteerID = v.VolunteerID
JOIN s24.Events e ON ve.EventID = e.EventID;

-- Gönüllülerin görev aldığı etkinlikler ve tema bilgisi dahil oldu.

-- 🔹 Adım 2: Sadece 'Sağlık' temalı etkinlikleri filtreleyelim

SELECT *
FROM s24.VolunteerEvents ve
JOIN s24.Volunteers v ON ve.VolunteerID = v.VolunteerID
JOIN s24.Events e ON ve.EventID = e.EventID
WHERE e.Theme = 'Sağlık';

-- Şimdi sadece sağlık temalı etkinlikler kaldı.

-- 🔹 Adım 3: Ad-soyad birleştir ve toplam etkinlik sayısını hesapla

SELECT 
    v.FirstName + ' ' + v.LastName AS FullName,
    COUNT(*) AS TotalHealthEvents
FROM s24.VolunteerEvents ve
JOIN s24.Volunteers v ON ve.VolunteerID = v.VolunteerID
JOIN s24.Events e ON ve.EventID = e.EventID
WHERE e.Theme = 'Sağlık'
GROUP BY v.FirstName, v.LastName;

-- Her gönüllünün sağlık temalı etkinliklerde kaç kez görev aldığı hesaplandı.

-- ✅ Final: Ad, soyad birleştirilerek FullName olarak gösterildi.
-- COUNT ile sağlık etkinlik sayısı sayıldı.
-- GROUP BY ile isim bazında gruplanarak toplamlar bulundu.
