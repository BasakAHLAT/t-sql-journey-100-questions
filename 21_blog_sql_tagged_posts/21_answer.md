
# ✍️ 21 – Blog: SQL Etiketli Yazılar

## 📥 Dataset Kurulumu

Problemi çözmeden önce aşağıdaki veri setini kurmanız gerekir:

> **🎯 Dosya:** [`21_dataset.sql`](./21_dataset.sql)

---

## ❓ Soru

**21. Bir blog sisteminde, “SQL” etiketiyle paylaşılmış yazıların başlıklarını, yazının yayımlandığı tarihi ve yazar adını listeleyin.**

---

## ✅ Çözüm

### 🧩 Adım 1: Gerekli tabloları gözlemleyelim

Bu sorgu için 4 tablo kullanmamız gerekiyor:

- `Posts`: Yazı başlığı ve yayım tarihi
- `Authors`: Yazar bilgileri
- `Tags`: Etiket isimleri
- `PostTags`: Post ve etiket eşlemesi

---

### 🧩 Adım 2: Temel JOIN’ler

```sql
SELECT *
FROM s21.Posts p
JOIN s21.PostTags pt ON p.PostID = pt.PostID
JOIN s21.Tags t ON pt.TagID = t.TagID
JOIN s21.Authors a ON p.AuthorID = a.AuthorID;
```

Bu sorgu tüm yazıları, etiketlerini ve yazarlarını getirir.

---

### 🧩 Adım 3: “SQL” etiketi filtresi

```sql
SELECT *
FROM s21.Posts p
JOIN s21.PostTags pt ON p.PostID = pt.PostID
JOIN s21.Tags t ON pt.TagID = t.TagID
JOIN s21.Authors a ON p.AuthorID = a.AuthorID
WHERE t.TagName = 'SQL';
```

---

### 🧩 Adım 4: Gerekli kolonları seçiyoruz

```sql
SELECT 
    p.Title AS PostTitle,
    p.PublishDate,
    a.AuthorName
FROM s21.Posts p
JOIN s21.PostTags pt ON p.PostID = pt.PostID
JOIN s21.Tags t ON pt.TagID = t.TagID
JOIN s21.Authors a ON p.AuthorID = a.AuthorID
WHERE t.TagName = 'SQL';
```

---

## 🧾 Final Sorgu

```sql
SELECT 
    p.Title AS PostTitle,
    p.PublishDate,
    a.AuthorName
FROM s21.Posts p
JOIN s21.PostTags pt ON p.PostID = pt.PostID
JOIN s21.Tags t ON pt.TagID = t.TagID
JOIN s21.Authors a ON p.AuthorID = a.AuthorID
WHERE t.TagName = 'SQL';
```

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Konsept/Fonksiyon | Açıklama |
|-------------------|----------|
| `JOIN`            | Tabloları birbirine bağlar |
| `WHERE`           | Filtreleme işlemi yapar |
| `Alias (AS)`      | Tablo veya kolonlara takma ad verir |
| `Çok-çok ilişkisi`| `PostTags` gibi ara tablo ile kurulur |

---

### 🔍 Kullanım Örnekleri

#### `JOIN` – Dört tabloyu bağlamak

```sql
FROM s21.Posts p
JOIN s21.PostTags pt ON p.PostID = pt.PostID
JOIN s21.Tags t ON pt.TagID = t.TagID
JOIN s21.Authors a ON p.AuthorID = a.AuthorID
```

#### `WHERE` – Etikete göre filtreleme

```sql
WHERE t.TagName = 'SQL'
```

#### `AS` – Takma ad ile tablo düzeni

```sql
SELECT p.Title AS PostTitle
```

---

Bu sorgu blog sistemlerinde etiket bazlı filtreleme yapma mantığını anlamak için oldukça faydalıdır.

