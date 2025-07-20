-- 🍗 16 – Recipe App: Chicken-Based Recipes (Relational)

-- Soru: Açıklamasında “tavuk” kelimesi geçen tariflerin isimlerini,
-- kategori adını, toplam hazırlanma süresini ve açıklama uzunluğunu listeleyin.

-- Adım 1: Tüm tarifleri ve açıklamaları listele
-- SELECT RecipeName, Description FROM s16.Recipes;

-- Adım 2: "tavuk" kelimesi geçen açıklamalara filtre uygula
-- SELECT * FROM s16.Recipes WHERE Description LIKE '%tavuk%';

-- Adım 3: Süreleri toplayıp açıklama uzunluğu ölç
-- SELECT RecipeName, PrepTime + CookTime AS TotalTime, LEN(Description) AS DescriptionLength
-- FROM s16.Recipes WHERE Description LIKE '%tavuk%';

-- Adım 4: Kategori ismini ekle

SELECT 
    r.RecipeName,
    c.CategoryName,
    r.PrepTime + r.CookTime AS TotalTime,
    LEN(r.Description) AS DescriptionLength
FROM s16.Recipes AS r
JOIN s16.Categories AS c ON r.CategoryID = c.CategoryID
WHERE r.Description LIKE '%tavuk%';

-- Açıklamalar:
-- JOIN → Recipes ve Categories tablolarını birleştirir
-- LEN() → Açıklamanın karakter uzunluğunu hesaplar
-- PrepTime + CookTime → Toplam süre
-- LIKE '%tavuk%' → Açıklamada tavuk kelimesi geçenleri bulur