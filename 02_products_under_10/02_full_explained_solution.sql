-- 🛍️ 02 – Product Catalog: Price < 10 USD

-- 📥 Dataset Kurulumu
-- Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:
-- 🎯 Dosya: 02_dataset.sql
-- Bu dosya içerisinde:
-- - Gerekli tabloların yapısı (Categories, Products)
-- - Gerçekçi ve çeşitli test verileri
-- 🧠 Not: Bu veri seti, bu GitHub reposuna özel olarak, senaryo tabanlı SQL problemlerinin çözümünü desteklemek amacıyla yapay zeka tarafından oluşturulmuştur.
-- Tüm verileri başarıyla yükledikten sonra sorgularınızı rahatlıkla test edebilirsiniz.

-- ❓ Soru
-- 2. Bir ürün kataloğunda, fiyatı 10 doların altında olan tüm ürünlerin adlarını, fiyatlarını ve kategorilerini listeleyin.

-- ✅ Çözüm

-- 🧩 Adım 1: Temel sorguyla başlıyoruz
SELECT * 
FROM s02.Products;

-- Bu sorgu, Products tablosundaki tüm verileri getirir.
-- Henüz fiyat veya kategoriyle ilgili herhangi bir filtre uygulanmamıştır.

-- 🧩 Adım 2: Fiyat filtresi ekleniyor
SELECT * 
FROM s02.Products
WHERE Price < 10;

-- Bu haliyle yalnızca fiyatı 10 doların altında olan ürünler listelenir.
-- Ancak kategori bilgisi henüz dahil değildir.

-- 🧩 Adım 3: Kategori bilgisi için JOIN
SELECT * 
FROM s02.Products AS P
INNER JOIN s02.Categories AS C
    ON P.CategoryID = C.CategoryID
WHERE P.Price < 10;

-- Bu sorgu:
-- - Products ve Categories tablolarını birleştirir
-- - Ancak SELECT * hâlâ fazla bilgi getirir

-- 🧩 Adım 4: Gerekli sütunlara indirgeme
SELECT 
    P.ProductName,
    P.Price,
    C.CategoryName
FROM s02.Products AS P
INNER JOIN s02.Categories AS C
    ON P.CategoryID = C.CategoryID
WHERE P.Price < 10;

-- Bu haliyle:
-- - Sadece ürün adı, fiyat ve kategori adı gösterilir
-- - En okunabilir ve optimize hali budur

-- 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

-- | JOIN Türü | Açıklama |
-- |-----------|----------|
-- | INNER JOIN | Sadece iki tabloda eşleşen kayıtları getirir |
-- | LEFT JOIN  | Sol (ilk) tablodaki tüm kayıtları, sağ tabloyla eşleşenleri birlikte getirir |
-- | RIGHT JOIN | Sağ (ikinci) tablodaki tüm kayıtları, sol tabloyla eşleşenleri birlikte getirir |
-- | FULL JOIN  | Her iki tabloda olan tüm kayıtları getirir, eşleşmeyenler için NULL döner |
-- | CROSS JOIN | Her satırı diğer tabloyla çarpar (kartezyen çarpım – nadiren kullanılır) |
-- | ON         | JOIN işleminin hangi sütunlara göre yapılacağını belirtir |
-- | AS         | Tabloya kısa ad (takma ad) vererek sorgu okunabilirliğini artırır |

-- 🔍 JOIN Türleri ve Kullanım Senaryoları

-- 1️⃣ INNER JOIN – Ortak Olan Kayıtları Getir
SELECT P.ProductName, C.CategoryName
FROM Products AS P
INNER JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
-- ✅ Sadece eşleşen kayıtlar döner.
-- ✅ Sadece kategorisi olan ürünler gelir.

-- 2️⃣ LEFT JOIN – Sol Tablo Öncelikli
SELECT P.ProductName, C.CategoryName
FROM Products AS P
LEFT JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
-- ✅ Tüm ürünler gelir.
-- ❗ Kategorisi olmayan ürünlerde CategoryName NULL olur.

-- 3️⃣ RIGHT JOIN – Sağ Tablo Öncelikli
SELECT P.ProductName, C.CategoryName
FROM Products AS P
RIGHT JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
-- ✅ Tüm kategoriler gelir.
-- ❗ Ürünü olmayan kategorilerde ProductName NULL olur.

-- 4️⃣ FULL JOIN – Her İki Tarafı da Kapsar
SELECT P.ProductName, C.CategoryName
FROM Products AS P
FULL JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
-- ✅ Hem ürünler hem kategoriler gelir.
-- ❗ Eşleşmeyen taraflar NULL olur.

-- 5️⃣ CROSS JOIN – Tüm Kombinasyonları Döner
SELECT P.ProductName, C.CategoryName
FROM Products AS P
CROSS JOIN Categories AS C;
-- - Tablolardaki tüm kayıtlar birbirleriyle çarpılır.
-- - Örn: 5 ürün × 3 kategori = 15 satır.

-- 🔧 Diğer Yardımcı Yapılar

-- 🔁 ON – Hangi Alanlarla Eşleştirilecek?
-- ... ON P.CategoryID = C.CategoryID
-- - JOIN’in eşleştirme şartıdır.
-- - Doğru sütunlar eşleştirilmezse veri anlamsız olur.

-- ✍️ AS – Tabloya Takma Ad Verme
-- FROM Products AS P
-- INNER JOIN Categories AS C ...
-- - Products → P, Categories → C kısaltmaları yapılır.
-- - Kod okunabilirliğini artırır.

-- 🧠 Özet
-- SELECT kısmı sadece ne göstermek istediğini belirler.
-- JOIN kısmı ise hangi satırların sorguya dahil edileceğini belirler.
-- 👉 SELECT → Hangi sütunlar görünsün
-- 👉 JOIN → Hangi satırlar listeye dahil edilsin
