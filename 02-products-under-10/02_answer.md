# 💡 Problem 02 – Fiyatı 10 Doların Altındaki Ürünler

## 📁 Gerekli Dosya
Bu problemi çalıştırmadan önce `02_dataset.sql` dosyasını indirip çalıştırmalısınız. Bu dosya, gerekli tabloları oluşturur ve test verilerini ekler.

---

## 🎯 Soru
> Bir ürün kataloğunda, fiyatı 10 doların altında olan tüm ürünlerin adlarını, fiyatlarını ve kategorilerini listeleyin.

---

## 🪜 Sorgunun Gelişim Aşamaları

### 1️⃣ Tüm Ürünleri Listeleme (Başlangıç)
```sql
SELECT * FROM dbo.Products;
```

---

### 2️⃣ Fiyatı 10 Doların Altında Olan Ürünleri Filtreleme
```sql
SELECT * 
FROM dbo.Products 
WHERE Price < 10;
```

---

### 3️⃣ Kategori Tablosu ile JOIN Kullanımı
```sql
SELECT * 
FROM dbo.Products AS P
INNER JOIN dbo.Categories AS C
    ON P.CategoryID = C.CategoryID
WHERE P.Price < 10;
```

---

### 4️⃣ Nihai ve Optimize Sorgu
```sql
SELECT 
    P.ProductName,
    P.Price,
    C.CategoryName
FROM dbo.Products AS P
INNER JOIN dbo.Categories AS C
    ON P.CategoryID = C.CategoryID
WHERE P.Price < 10;
```

