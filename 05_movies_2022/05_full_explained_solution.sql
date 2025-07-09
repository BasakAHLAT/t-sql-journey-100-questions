-- 🎬 05 – Movies: Released in 2022

-- ## 📥 Dataset Kurulumu
-- 
-- Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz
-- ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:
-- 
-- 🎯 Dosya: [05_dataset.sql](./05_dataset.sql)
-- 
-- Bu dosya içerisinde:
-- - Gerekli tabloların yapısı (`Directors`, `Movies`)
-- - Gerçekçi ve çeşitli test verileri yer almaktadır.
-- 
-- 🧠 Not: Bu veri seti, senaryo tabanlı SQL öğrenimini desteklemek amacıyla
-- yapay zeka tarafından oluşturulmuştur.

-- ## ❓ Soru
-- 
-- 5. Bir film veritabanında, 2022 yılında vizyona girmiş tüm filmlerin
-- adlarını ve yönetmen isimlerini gösterin.

-- ## ✅ Çözüm

-- 🧩 Adım 1: Filmleri kontrol ediyoruz
SELECT *
FROM s05.Movies;

-- 🧩 Adım 2: 2022 yılına ait olanları filtreliyoruz
SELECT *
FROM s05.Movies
WHERE ReleaseYear = 2022;

-- 🧩 Adım 3: Yönetmen adlarını getirmek için JOIN kullanıyoruz
SELECT m.Title, d.Name
FROM s05.Movies AS m
LEFT JOIN s05.Directors AS d
    ON m.DirectorID = d.DirectorID
WHERE m.ReleaseYear = 2022;

-- # 📚 Bu Problemde Öğrenilen Ana SQL Kavramları
--
-- | Fonksiyon / Konsept | Açıklama |
-- |---------------------|----------|
-- | `LEFT JOIN`         | Tüm filmleri getirir, eşleşen yönetmen adı varsa ekler |
-- | `ON`                | JOIN işlemi için eşleşme şartını belirtir |
-- | `WHERE`             | Belirli koşullara göre satırları filtreler |
-- | `AS`                | Tablo ya da sütuna takma ad verir |

-- ## 💡 Örnek Kullanım
SELECT m.Title, d.Name
FROM s05.Movies AS m
LEFT JOIN s05.Directors AS d
    ON m.DirectorID = d.DirectorID
WHERE m.ReleaseYear = 2022;