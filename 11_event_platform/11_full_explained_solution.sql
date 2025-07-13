-- # 📅 11 – Event Platform: Today's Database Events

-- ## 📥 Dataset Kurulumu

-- Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

-- > **🎯 Dosya:** [`11_dataset.sql`](./11_dataset.sql)

-- Bu dosya içerisinde:
-- - Gerekli **tabloların yapısı** (`Users`, `Events`)
-- - Gerçekçi ve çeşitli **test verileri**
-- yer almaktadır.

-- ---

-- ## ❓ Soru

-- Bir etkinlik platformunda, bugünün tarihiyle birebir eşleşen ve açıklamasında “veritabanı” kelimesi geçen etkinliklerin isimlerini, başlama saatlerini ve düzenleyen kullanıcıların adlarını listeleyin.

-- ---

-- ## ✅ Çözüm

-- ### 🧩 Adım 1: Etkinlik verilerini görelim

SELECT *
FROM s11.Events;
-- Bu sorgu, sistemdeki tüm etkinlikleri getirir. Henüz filtreleme yapılmamıştır.

-- ---

-- ### 🧩 Adım 2: Bugünkü etkinlikleri filtreleyelim

SELECT *
FROM s11.Events
WHERE EventDate = CAST(GETDATE() AS DATE);
-- Bu adımda sadece bugünün tarihiyle birebir eşleşen etkinlikleri filtreliyoruz.

-- ---

-- ### 🧩 Adım 3: Açıklamasında 'veritabanı' geçen etkinlikleri bulalım

SELECT *
FROM s11.Events
WHERE EventDate = CAST(GETDATE() AS DATE)
  AND Description LIKE '%veritabanı%';
-- Bu adımda, açıklamasında "veritabanı" kelimesi geçen bugünkü etkinlikleri seçiyoruz.

-- ---

-- ### 🧩 Adım 4: Kullanıcı bilgilerini de eklemek için `LEFT JOIN` kullanalım

SELECT e.EventName, e.StartTime, u.FullName
FROM s11.Events AS e
LEFT JOIN s11.Users AS u
ON e.OrganizerID = u.UserID
WHERE e.EventDate = CAST(GETDATE() AS DATE) 
  AND e.Description LIKE '%veritabanı%';
-- Bu son sorgu ile:
-- - `Events` ve `Users` tablolarını birleştiriyoruz (LEFT JOIN ile).
-- - Bugünkü ve "veritabanı" içeren etkinlikleri alıyoruz.
-- - Etkinlik adı, başlama saati ve düzenleyicinin adı gösteriliyor.


-- ## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

-- | Fonksiyon / Konsept | Açıklama |
-- |---------------------|----------|
-- | `CAST(... AS DATE)` | Saat kısmını silip sadece tarihi verir |
-- | `GETDATE()`         | Şu anki tarih ve saati döndürür |
-- | `LIKE '%...%'`      | Metin içerisinde geçen kelimeleri filtrelemek için kullanılır |
-- | `JOIN`              | Tabloları birbirine bağlamak için kullanılır |

-- ---

-- ## 🧪 Kullanım Örnekleri

-- ### `CAST()` ve `GETDATE()`

SELECT CAST(GETDATE() AS DATE);

-- ### `LIKE`

SELECT *
FROM s11.Events
WHERE Description LIKE '%veritabanı%';