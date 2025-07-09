-- 🧑‍💼 03 – HR: Employees Hired in 2025

-- 📥 Dataset Kurulumu
-- Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:
-- 🎯 Dosya: 03_dataset.sql
-- Bu dosya içerisinde:
-- - Gerekli tabloların yapısı (Departments, Positions, Employees)
-- - Gerçekçi ve çeşitli test verileri
-- 🧠 Not: Bu veri seti, bu GitHub reposuna özel olarak, senaryo tabanlı SQL problemlerinin çözümünü desteklemek amacıyla yapay zeka tarafından oluşturulmuştur.
-- Tüm verileri başarıyla yükledikten sonra sorgularınızı rahatlıkla test edebilirsiniz.

-- ❓ Soru
-- 3. Bir insan kaynakları sisteminde, 2025 yılında işe alınan tüm çalışanların isimlerini, departmanlarını ve pozisyonlarını ve işe alım tarihlerini listeleyin.

-- ✅ Çözüm
SELECT emp.FirstName, dep.DepartmentName, pos.PositionTitle, emp.HireDate
FROM s03.Employees AS emp
INNER JOIN s03.Positions AS pos
ON emp.PositionID = pos.PositionID
INNER JOIN s03.Departments AS dep
ON pos.DepartmentID = dep.DepartmentID
WHERE emp.HireDate >= '2025-01-01' AND emp.HireDate < '2026-01-01';

-- 📚 Bu Problemde Öğrenilen Ana SQL Kavramları
-- Aşağıdaki kavramlar, bu problemin çözümünde kullanılmıştır:
-- INNER JOIN        : Yalnızca eşleşen kayıtları getirir. Her çalışanın bir pozisyonu, her pozisyonun da bir departmanı vardır varsayımıyla kullanılır.
-- AS                : Tabloya takma ad vererek sorgunun okunabilirliğini artırır.
-- ON                : JOIN işleminin hangi sütunlara göre yapılacağını tanımlar.

-- 1️⃣ INNER JOIN – İlişkili Verileri Eşleştir
SELECT emp.FirstName, pos.PositionTitle
FROM Employees AS emp
INNER JOIN Positions AS pos ON emp.PositionID = pos.PositionID;
-- ✅ Yalnızca pozisyonu bulunan çalışanlar listelenir.
-- ❌ Pozisyonu olmayan çalışanlar varsa sorguya dahil edilmez.

-- 2️⃣ AS – Takma Ad Kullanımı
-- FROM Employees AS emp
-- JOIN Positions AS pos ON emp.PositionID = pos.PositionID
-- 🧠 emp ve pos kısa adları sorguyu okunabilir hale getirir.
-- Büyük tablolarla çalışırken bu yapı daha yönetilebilir hale gelir.

-- 3️⃣ ON – JOIN Bağlantı Koşulu
-- ON emp.PositionID = pos.PositionID
-- 🔗 Tabloların nasıl bağlanacağını belirler.
-- Eşleşme doğru tanımlanmazsa veri anlamsız olur ya da boş döner.
