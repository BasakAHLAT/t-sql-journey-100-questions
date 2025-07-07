-- 🛒 01 – E-commerce: Recent Customer Registrations

-- 📥 Dataset Kurulumu
-- Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:
-- 🎯 Dosya: 01_dataset.sql
-- Bu dosya içerisinde:
-- - Gerekli tabloların yapısı (Cities, Customers, Products, Orders, OrderDetails)
-- - Gerçekçi ve çeşitli test verileri
-- 🧠 Not: Bu veri seti, bu GitHub reposuna özel olarak, senaryo tabanlı SQL problemlerinin çözümünü desteklemek amacıyla yapay zeka tarafından oluşturulmuştur.
-- Tüm verileri başarıyla yükledikten sonra sorgularınızı rahatlıkla test edebilirsiniz.

-- ❓ Soru
-- 1. Bir e-ticaret sisteminde müşterilerin kayıt tarihleri tutulmaktadır. Son 7 gün içinde kaydolan tüm müşterilerin adlarını ve e-posta adreslerini listeleyin.

-- ✅ Çözüm

-- 🧩 Adım 1: Temel sorguyla başlıyoruz
SELECT * 
FROM dbo.Customers;

-- Bu sorgu, Customers tablosundaki tüm verileri getirir.
-- Henüz herhangi bir filtre uygulanmadı; tarih ya da kayıt bilgisi dikkate alınmaz.

-- 🧩 Adım 2: Filtre eklemeye başlıyoruz – WHERE kullanımı
SELECT * 
FROM dbo.Customers
WHERE RegistrationDate >= GETDATE();

-- Bu, sadece şu anki tarih ve saatten sonra kayıt olan müşterileri getirir.
-- Ama bu mantıklı değildir çünkü gelecek zamanda kayıt olan kullanıcı olmaz.
-- 🔴 Bu haliyle sorgu büyük ihtimalle boş sonuç döner.

-- 🧩 Adım 3: 7 gün öncesine gitmek için DATEADD
SELECT * 
FROM dbo.Customers
WHERE RegistrationDate >= DATEADD(DAY, -7, GETDATE());

-- Bu sorgu:
-- - GETDATE() ile bugünün tarih ve saatini alır
-- - DATEADD(DAY, -7, ...) ile 7 gün geri gider
-- - Yani sadece 7 gün öncesinden itibaren kayıt olanlar gelir
-- 📌 Ancak burada saat bilgisi olduğu için o gün içinde kayıt olan bazı müşteriler dışarıda kalabilir.

-- 🧩 Adım 4: Sadece tarihi dikkate almak için CAST
SELECT * 
FROM dbo.Customers
WHERE RegistrationDate >= CAST(DATEADD(DAY, -7, GETDATE()) AS DATE);

-- Bu haliyle:
-- - DATEADD ile 7 gün önceki tarih ve saat alınır
-- - CAST(... AS DATE) ile saat kısmı atılır
-- ✅ Bu haliyle filtre güvenlidir ve saat farkından etkilenmez.

-- 🧩 Final Sorgu
SELECT * 
FROM dbo.Customers
WHERE RegistrationDate >= CAST(DATEADD(DAY, -7, GETDATE()) AS DATE);

-- Bu sorgu:
-- - Son 7 güne giren tüm kayıtları yakalar
-- - Tarih filtrelemesi hatasız çalışır
-- - Gerçek dünya senaryolarında en güvenli çözümdür

-- 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

-- | Fonksiyon | Açıklama |
-- |-----------|----------|
-- | GETDATE() | Şu anki tarih ve saat bilgisini döndürür |
-- | DATEADD() | Bir tarihe gün/ay/yıl/saat ekler veya çıkarır |
-- | CAST(... AS DATE) | DATETIME verisini sadece DATE tipine çevirir (saat kısmını siler) |

-- 🔍 Kavramlara Göre Kullanım Örnekleri

-- 1️⃣ GETDATE() – Şu Anki Tarih ve Saat
SELECT GETDATE();  -- Örn: 2025-07-05 23:06:00.000

-- 2️⃣ DATEADD() – Tarihe Zaman Eklemek veya Çıkarmak
SELECT DATEADD(DAY, -7, GETDATE());   -- 7 gün önce
SELECT DATEADD(DAY, -30, GETDATE());  -- 30 gün önce
SELECT DATEADD(DAY, 10, GETDATE());   -- 10 gün sonrası
SELECT DATEADD(MONTH, -1, GETDATE()); -- 1 ay önce
SELECT DATEADD(MONTH, 2, GETDATE());  -- 2 ay sonra
SELECT DATEADD(YEAR, -1, GETDATE());  -- Geçen yıl bu zaman
SELECT DATEADD(YEAR, 5, GETDATE());   -- 5 yıl sonra
SELECT DATEADD(HOUR, -5, GETDATE());   -- 5 saat önce
SELECT DATEADD(MINUTE, 30, GETDATE()); -- 30 dakika sonra

-- 💡 DATEADD fonksiyonunda kullanılabilecek datepart değerleri: YEAR, QUARTER, MONTH, DAY, HOUR, MINUTE, SECOND, vb.

-- 3️⃣ CAST(... AS DATE) – Saat Bilgisini Atmak
SELECT CAST(GETDATE() AS DATE);  -- Şu anki tarih
SELECT CAST(DATEADD(DAY, -7, GETDATE()) AS DATE);  -- 7 gün önceki tarih
