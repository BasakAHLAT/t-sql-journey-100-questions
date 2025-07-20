# 🍗 16 – Recipe App: Chicken-Based Recipes (Relational)

## 📥 Dataset Kurulumu

Bu problemi çözmeden önce aşağıdaki SQL dosyasını indirip çalıştırmalısınız:

> **🎯 Dosya:** [`16_dataset.sql`](./16_dataset.sql)

Bu dosyada:
- `Recipes`, `Ingredients`, `Categories`, `RecipeIngredients` tabloları tanımlanmıştır
- Tarifler, malzemeler ve kategoriler arasında ilişki kurulmuştur
- Açıklamalarda birden fazla kez "tavuk" geçen tarifler bulunmaktadır

---

## ❓ Soru

**Açıklamasında “tavuk” kelimesi birden fazla geçen tariflerin isimlerini, kategori ismini,  
toplam hazırlanma süresini (hazırlık + pişirme) ve açıklamanın karakter sayısını listeleyin.**

---

## 🔍 Adım Adım Sorgu Gelişimi

### 🧩 Adım 1: Tarif açıklamalarını görüntüleyelim

```sql
SELECT RecipeName, Description FROM s16.Recipes;
```

---

### 🧩 Adım 2: Açıklamasında "tavuk" kelimesi geçenleri filtreleyelim

```sql
SELECT RecipeName
FROM s16.Recipes
WHERE Description LIKE '%tavuk%';
```

---

### 🧩 Adım 3: Toplam süre ve açıklama uzunluğu hesaplayalım

```sql
SELECT 
    RecipeName,
    PrepTime + CookTime AS TotalTime,
    LEN(Description) AS DescriptionLength
FROM s16.Recipes
WHERE Description LIKE '%tavuk%';
```

---

### 🧩 Adım 4: Kategori ismini ilişkilendirelim

```sql
SELECT 
    r.RecipeName,
    c.CategoryName,
    r.PrepTime + r.CookTime AS TotalTime,
    LEN(r.Description) AS DescriptionLength
FROM s16.Recipes AS r
JOIN s16.Categories AS c ON r.CategoryID = c.CategoryID
WHERE r.Description LIKE '%tavuk%';
```

---

## ✅ Final Sorgu

```sql
SELECT 
    r.RecipeName,
    c.CategoryName,
    r.PrepTime + r.CookTime AS TotalTime,
    LEN(r.Description) AS DescriptionLength
FROM s16.Recipes AS r
JOIN s16.Categories AS c ON r.CategoryID = c.CategoryID
WHERE r.Description LIKE '%tavuk%';
```

---

## 📚 Kullanılan SQL Kavramları

| Fonksiyon / Komut | Açıklama |
|-------------------|----------|
| `JOIN` | İlişkili tablolardan veri çekmek için kullanılır |
| `LEN()` | Metnin karakter uzunluğunu verir |
| `+` | Sayısal sütunları toplar |
| `LIKE` | Metin içi filtreleme yapar |
| `WHERE` | Koşullu filtreleme yapar |

---

## 🔎 Örnek Kullanımlar

```sql
-- LIKE ile metin filtreleme
SELECT * FROM s16.Recipes WHERE Description LIKE '%tavuk%';

-- Açıklama uzunluğunu ölçme
SELECT LEN('Bu tarifte tavuk göğsü, tavuk suyu ve tavuk parçaları kullanılır.');

-- JOIN ile kategori eşleme
SELECT r.RecipeName, c.CategoryName
FROM s16.Recipes r
JOIN s16.Categories c ON r.CategoryID = c.CategoryID;
```
