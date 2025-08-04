
-- 🛠️ 22 – Support: Open Requests and Last Update Info
-- Bu dosya, adım adım çözüm açıklamalarını içerir.

-- 🔹 Adım 1: Tüm talepleri görüntüleyelim

SELECT *
FROM s22.SupportRequests;

-- Bu sorgu destek taleplerini gösterir. Henüz filtreleme veya kullanıcı bilgisi yok.

-- 🔹 Adım 2: Sadece durumu “açık” olanları getir

SELECT *
FROM s22.SupportRequests
WHERE Status = 'açık';

-- Burada sadece “açık” durumdaki kayıtları görüntülüyoruz.

-- 🔹 Adım 3: Kullanıcı bilgileriyle birleştir

SELECT *
FROM s22.SupportRequests r
JOIN s22.Users u ON r.UserID = u.UserID
WHERE r.Status = 'açık';

-- Artık her destek talebi ile onu oluşturan kullanıcının bilgileri birleştirildi.

-- 🔹 Adım 4: Sadece gerekli sütunlar seçilsin

SELECT 
    u.FullName,
    r.UpdatedAt
FROM s22.SupportRequests r
JOIN s22.Users u ON r.UserID = u.UserID
WHERE r.Status = 'açık';

-- Bu haliyle kullanıcı adı ve güncelleme tarihi gelir. Bazı kayıtların güncelleme tarihi NULL olabilir.

-- 🔹 Bonus: NULL değerler yerine açıklama göster

SELECT 
    u.FullName,
    ISNULL(r.UpdatedAt, 'Henüz güncellenmedi') AS LastUpdate
FROM s22.SupportRequests r
JOIN s22.Users u ON r.UserID = u.UserID
WHERE r.Status = 'açık';

-- NULL olan güncellemeler “Henüz güncellenmedi” ifadesiyle değiştirilmiştir.
-- ISNULL kullanımı burada anlamlıdır.
