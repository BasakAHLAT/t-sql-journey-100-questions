# 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

Aşağıdaki kavramlar, bu problemin çözümünde kullanılmış ve SQL'de veri birleştirme (JOIN) işlemlerini öğrenmek için oldukça temel konulardır:

| 🧠 Öğrenilen Fonksiyon / Konsept | 💬 Açıklama |
|----------------------------------|------------|
| `INNER JOIN`                     | Sadece iki tabloda eşleşen kayıtları getirir |
| `LEFT JOIN`                      | Sol (ilk) tablodaki tüm kayıtları, sağ tabloyla eşleşenler varsa birlikte getirir |
| `RIGHT JOIN`                     | Sağ (ikinci) tablodaki tüm kayıtları, sol tabloyla eşleşenler varsa birlikte getirir |
| `FULL JOIN`                      | Her iki tabloda olan tüm kayıtları getirir, eşleşmeyenler için NULL döner |
| `CROSS JOIN`                     | Her satırı diğer tabloyla çarpar (kartezyen çarpım) |
| `ON`                             | JOIN işleminin hangi sütunlara göre yapılacağını belirtir |
| `AS`                             | Tabloya takma ad vererek sorgunun okunabilirliğini artırır |

---

## 🔍 Kavramlara Göre Kullanım Örnekleri

---

### 1️⃣ `INNER JOIN` – Ortak Kayıtları Birleştirme

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
INNER JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

- Sadece eşleşen `CategoryID` değerlerine sahip kayıtlar döner.
- Her iki tabloda da karşılığı olmayan kayıtlar dahil edilmez.

---

### 2️⃣ `LEFT JOIN` – Sol Tablo Öncelikli Birleştirme

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
LEFT JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

- `Products` tablosundaki tüm ürünler listelenir.
- Kategorisi olmayan ürünlerde `CategoryName` değeri `NULL` olur.

---

### 3️⃣ `RIGHT JOIN` – Sağ Tablo Öncelikli Birleştirme

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
RIGHT JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

- `Categories` tablosundaki tüm kategoriler listelenir.
- Hiçbir ürünle eşleşmeyen kategorilerde `ProductName` `NULL` olur.

---

### 4️⃣ `FULL JOIN` – Her İki Tarafı da İçeren Birleştirme

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
FULL JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

- Tüm ürünler ve tüm kategoriler gösterilir.
- Eşleşmeyen kayıtlar için eksik olan taraf `NULL` olur.

---

### 5️⃣ `CROSS JOIN` – Kartezyen Çarpım

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
CROSS JOIN Categories AS C;
```

- `Products` tablosundaki her satır, `Categories` tablosundaki her satırla eşleştirilir.
- Örnek: 5 ürün × 3 kategori = 15 satır

---

### 🔁 `ON` Kullanımı

```sql
... ON P.CategoryID = C.CategoryID
```

- JOIN işleminin hangi sütunlara göre yapılacağını belirtir.
- INNER, LEFT, RIGHT, FULL JOIN ile birlikte kullanılır.

---

### ✍️ `AS` Kullanımı

```sql
FROM Products AS P
INNER JOIN Categories AS C ...
```

- `AS P` ile `Products` tablosuna kısa ad verilmiştir.
- Daha okunabilir ve kısa sorgular yazmamıza olanak tanır.

---
