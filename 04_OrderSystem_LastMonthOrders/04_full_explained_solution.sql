-- 📦 04 – Order System: Last Month's Orders

-- ## 📥 Dataset Kurulumu
-- Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:
-- 🎯 Dosya: 04_dataset.sql
-- Bu dosya içerisinde:
-- - Gerekli tabloların yapısı (Customers, Orders)
-- - Gerçekçi ve çeşitli test verileri yer almaktadır.

-- 🧠 Not: Bu veri seti, bu GitHub reposuna özel olarak, senaryo tabanlı SQL problemlerinin çözümünü desteklemek amacıyla yapay zeka tarafından oluşturulmuştur.

-- Tüm verileri başarıyla yükledikten sonra sorgularınızı rahatlıkla test edebilirsiniz.

-- ❓ Soru
-- 4. Bir sipariş yönetim sisteminde, son 1 ayda oluşturulmuş siparişlerin ID’sini ve sipariş tarihini listeleyin.

-- ✅ Çözüm

-- 🧩 Adım 1: Sipariş verilerini görelim
SELECT * 
FROM s04.Orders;
-- Bu sorgu, Orders tablosundaki tüm siparişleri getirir. Ancak henüz tarihe göre filtreleme yapılmamıştır.

-- 🧩 Adım 2: Tarih filtresi ekliyoruz – DATEADD ve GETDATE()
SELECT * 
FROM s04.Orders
WHERE OrderDate >= DATEADD(MONTH, -1, GETDATE());
-- Bu sorgu:
-- - GETDATE() ile bugünün tarihini alır (örneğin 2025-07-09)
-- - DATEADD(MONTH, -1, GETDATE()) ile 1 ay geriye gider → 2025-06-09
-- - OrderDate >= ... filtresiyle son 1 ayda oluşturulmuş siparişleri listeler
-- ✅ Bu haliyle doğru tarih aralığı yakalanır.

-- 🧩 Final Sorgu
SELECT OrderID, OrderDate 
FROM s04.Orders
WHERE OrderDate >= DATEADD(MONTH, -1, GETDATE());
-- Bu sorgu:
-- - OrderID ve OrderDate alanlarını seçer
-- - Son 1 ayda oluşturulan siparişleri listeler
-- - Gerçek dünya kullanımında önerilen ve dinamik bir çözümdür

-- 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

-- 🧠 Fonksiyon / Yapı | 💬 Açıklama
-- ---------------------|-------------
-- GETDATE()         | Şu anki tarih ve saat bilgisini döndürür
-- DATEADD()         | Bir tarihe gün/ay/yıl/saat ekler veya çıkarır

-- 🔍 Kavramlara Göre Kullanım Örnekleri

-- 1️⃣ GETDATE() – Şu Anki Tarih ve Saat
SELECT GETDATE();  -- Örn: 2025-07-09 13:45:00.000

-- 2️⃣ DATEADD() – Tarihe Zaman Eklemek veya Çıkarmak

-- 📆 Ay bazında geri gitme (son 1 ayı filtrelemek için)
SELECT DATEADD(MONTH, -1, GETDATE());  -- Örn: 2025-06-09

-- 🔙 Gün bazında geri gitme
SELECT DATEADD(DAY, -30, GETDATE());   -- Son 30 günü almak için

-- 💡 DATEADD() fonksiyonunda kullanılabilecek datepart değerleri: YEAR, MONTH, DAY, HOUR, MINUTE, vb.
