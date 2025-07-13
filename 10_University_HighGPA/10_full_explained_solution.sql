
-- 🎓 10 – University: Students with GPA > 3.5

-- 📥 Dataset Kurulumu

-- Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:
-- 🎯 Dosya: [10_dataset.sql](./10_dataset.sql)

-- Bu dosya içerisinde:
-- - Gerekli tabloların yapısı (Students, Departments, Advisors)
-- - Gerçekçi ve çeşitli test verileri yer almaktadır.

-- 🧠 Not: GPA verisi DECIMAL(3,2) türünde saklanmaktadır (0.00 – 4.00 arası)

-- ❓ Soru
-- 10. Üniversite sisteminde, not ortalaması 3.5’tan büyük olan öğrencilerin adlarını, bölümlerini ve danışman hocalarını listeleyin.

-- ✅ Çözüm

-- 🧩 Adım 1: Öğrenci tablosunu görüntüle
SELECT *
FROM s10.Students;

-- Bu sorgu ile tüm öğrenci verilerini gözlemleyerek hangi alanlarla çalışacağımızı tespit ederiz.

-- 🧩 Adım 2: Not ortalaması 3.5’ten büyük öğrencileri filtrele
SELECT *
FROM s10.Students
WHERE GPA > 3.5;

-- GPA alanı üzerinden sayısal filtreleme yapılır.

-- 🧩 Adım 3: Bölüm bilgilerini eklemek için INNER JOIN yap
SELECT s.StudentName, d.DepartmentName
FROM s10.Students AS s
INNER JOIN s10.Departments AS d
ON s.DepartmentID = d.DepartmentID
WHERE s.GPA > 3.5;

-- Bu sorgu:
-- - Öğrencileri bölümleriyle eşleştirir
-- - Sadece not ortalaması 3.5’tan büyük olanları getirir

-- 🧩 Adım 4: Danışman bilgisi de eklenerek final sorgu tamamlanır
SELECT s.StudentName, d.DepartmentName, a.AdvisorName
FROM s10.Students AS s
INNER JOIN s10.Departments AS d ON s.DepartmentID = d.DepartmentID
INNER JOIN s10.Advisors AS a ON s.AdvisorID = a.AdvisorID
WHERE s.GPA > 3.5;

-- Bu sorgu:
-- - Öğrenci, bölüm ve danışman tablolarını birleştirir
-- - Filtreyi sadece GPA > 3.5 olan öğrencilerle sınırlandırır

-- 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

-- Fonksiyon / Konsept | Açıklama
-- INNER JOIN        | İki tabloyu eşleşen kayıtlar üzerinden birleştirir
-- WHERE >           | Sayısal filtreleme yapar
-- ALIAS (AS)        | Tablolara veya sütunlara kısa takma ad verir
-- DECIMAL           | Ondalıklı sayı saklamak için kullanılan veri tipi

-- JOIN Kullanımı Örneği
SELECT *
FROM s10.Students AS s
INNER JOIN s10.Departments AS d ON s.DepartmentID = d.DepartmentID;

-- GPA Filtreleme Örneği
SELECT *
FROM s10.Students
WHERE GPA > 3.5;
