# 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

Aşağıdaki kavramlar, bu problemin çözümünde kullanılmış ve SQL'de **veri birleştirme (JOIN)** işlemlerini öğrenmek için oldukça temel konulardır. JOIN'ler, birden fazla tabloyu bir arada kullanarak anlamlı sonuçlar üretmemizi sağlar.

| 🧠 JOIN Türü      | 💬 Açıklama |
|------------------|------------|
| `INNER JOIN`     | Sadece iki tabloda **eşleşen** kayıtları getirir |
| `LEFT JOIN`      | Sol (ilk) tablodaki **tüm kayıtları**, sağ tabloyla eşleşenleri birlikte getirir |
| `RIGHT JOIN`     | Sağ (ikinci) tablodaki **tüm kayıtları**, sol tabloyla eşleşenleri birlikte getirir |
| `FULL JOIN`      | Her iki tabloda olan tüm kayıtları getirir, eşleşmeyenler için `NULL` döner |
| `CROSS JOIN`     | Her satırı diğer tabloyla çarpar (kartezyen çarpım – nadiren kullanılır) |
| `ON`             | JOIN işleminin hangi sütunlara göre yapılacağını belirtir |
| `AS`             | Tabloya kısa ad (takma ad) vererek sorgu okunabilirliğini artırır |

---

## 🔍 JOIN Türleri ve Kullanım Senaryoları

### 1️⃣ `INNER JOIN` – Ortak Olan Kayıtları Getir

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
INNER JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

✅ Sadece eşleşen kayıtlar döner.

✅ Sadece kategorisi olan ürünler gelir.

---

### 2️⃣ `LEFT JOIN` – Sol Tablo Öncelikli

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
LEFT JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

✅ Tüm ürünler gelir.  

❗ Kategorisi olmayan ürünlerde `CategoryName` NULL olur.

---

### 3️⃣ `RIGHT JOIN` – Sağ Tablo Öncelikli

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
RIGHT JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

✅ Tüm kategoriler gelir.  

❗ Ürünü olmayan kategorilerde `ProductName` NULL olur.

---

### 4️⃣ `FULL JOIN` – Her İki Tarafı da Kapsar

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
FULL JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

✅ Hem ürünler hem kategoriler gelir.  

❗ Eşleşmeyen taraflar NULL olur.

---

### 5️⃣ `CROSS JOIN` – Tüm Kombinasyonları Döner

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
CROSS JOIN Categories AS C;
```

- Tablolardaki tüm kayıtlar birbirleriyle çarpılır.
- Örn: 5 ürün × 3 kategori = 15 satır.

---

## 🔧 Diğer Yardımcı Yapılar

### 🔁 `ON` – Hangi Alanlarla Eşleştirilecek?

```sql
... ON P.CategoryID = C.CategoryID
```

- JOIN’in eşleştirme şartıdır.
- Doğru sütunlar eşleştirilmezse veri anlamsız olur.

---

### ✍️ `AS` – Tabloya Takma Ad Verme

```sql
FROM Products AS P
INNER JOIN Categories AS C ...
```

- `Products` → `P`, `Categories` → `C` kısaltmaları yapılır.
- Kod okunabilirliğini artırır.

---

## 🧠 Özet

`SELECT` kısmı sadece **ne göstermek istediğini** belirler.  
`JOIN` kısmı ise **hangi satırların** sorguya dahil edileceğini belirler.

> 👉 `SELECT` → Hangi sütunlar görünsün  
> 👉 `JOIN` → Hangi satırlar listeye dahil edilsin

---


