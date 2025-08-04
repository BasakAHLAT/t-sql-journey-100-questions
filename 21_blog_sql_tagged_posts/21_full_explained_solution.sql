
-- 📝 21 – Blog: SQL Etiketli Yazılar
-- Bu dosya, sorgunun adım adım nasıl geliştirildiğini gösterir.

-- 🎯 Amaç:
-- “SQL” etiketiyle paylaşılmış yazıların başlıklarını, yayın tarihlerini ve yazar adlarını listelemek.

-- 🔹 Adım 1: Yazılar, etiketler ve yazarlar tablolarını birleştir

SELECT *
FROM s21.Posts p
JOIN s21.PostTags pt ON p.PostID = pt.PostID
JOIN s21.Tags t ON pt.TagID = t.TagID
JOIN s21.Authors a ON p.AuthorID = a.AuthorID;

-- Bu sorgu tüm yazılar ile etiketlerini ve yazarlarını getirir.
-- Ancak henüz sadece SQL etiketine özel bir filtre yok.

-- 🔹 Adım 2: Sadece “SQL” etiketi olan yazıları filtrele

SELECT *
FROM s21.Posts p
JOIN s21.PostTags pt ON p.PostID = pt.PostID
JOIN s21.Tags t ON pt.TagID = t.TagID
JOIN s21.Authors a ON p.AuthorID = a.AuthorID
WHERE t.TagName = 'SQL';

-- Artık sadece 'SQL' etiketiyle etiketlenmiş yazılar geliyor.
-- Ancak hâlâ tüm kolonları çekiyoruz. Sadece istenen alanları seçelim.

-- 🔹 Adım 3: Sadece başlık, tarih ve yazar adı getirilecek şekilde kolonlar daraltılır

SELECT 
    p.Title AS PostTitle,
    p.PublishDate,
    a.AuthorName
FROM s21.Posts p
JOIN s21.PostTags pt ON p.PostID = pt.PostID
JOIN s21.Tags t ON pt.TagID = t.TagID
JOIN s21.Authors a ON p.AuthorID = a.AuthorID
WHERE t.TagName = 'SQL';

-- ✅ Bu final sorgu, istenen formatta sonucu döndürür.
