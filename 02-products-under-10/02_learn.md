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

---

### 1️⃣ `INNER JOIN` – Ortak Olan Kayıtları Getir

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
INNER JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

**Ne yapar?**
- Sadece `Products` ve `Categories` tablolarında **eşleşen** `CategoryID` kayıtlarını döner.

**Ne zaman kullanılır?**
- Eşleşmeyen veriler sizin için önemsizse.
- Örn: Sadece kategorisi tanımlanmış ürünleri listelemek istiyorsanız.

---

### 2️⃣ `LEFT JOIN` – Sol Tablo Öncelikli

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
LEFT JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

**Ne yapar?**
- `Products` tablosundaki **tüm kayıtlar** gelir.
- Eğer ürünün kategorisi yoksa `CategoryName` NULL olur.

**Ne zaman kullanılır?**
- Ana tablonuz (örneğin ürünler) eksiksiz listelenmeli ama eşleşen bilgiler varsa eklensin istiyorsanız.
- Örn: Tüm ürünleri listele ama bazıları henüz kategoriye atanmadıysa bile dahil et.

---

### 3️⃣ `RIGHT JOIN` – Sağ Tablo Öncelikli

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
RIGHT JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

**Ne yapar?**
- `Categories` tablosundaki **tüm kayıtlar** gelir.
- Hiçbir ürünle eşleşmeyen kategorilerde `ProductName` NULL olur.

**Ne zaman kullanılır?**
- Ana tablonuz `Categories` ise ve tüm kategorilerin durumunu görmek istiyorsanız.
- Örn: Sistemde tanımlı tüm kategoriler listelensin, ürün yoksa bile gösterilsin.

---

### 4️⃣ `FULL JOIN` – Her İki Tarafı da Kapsar

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
FULL JOIN Categories AS C
    ON P.CategoryID = C.CategoryID;
```

**Ne yapar?**
- Hem `Products` hem de `Categories` tablolarındaki **tüm kayıtları** getirir.
- Eşleşmeyen taraflar için diğer sütunlar `NULL` olur.

**Ne zaman kullanılır?**
- Her iki tabloyu da eksiksiz görmek istiyorsanız.
- Örn: Hem kategorisi olmayan ürünleri, hem de hiç ürün içermeyen kategorileri analiz etmek için.

---

### 5️⃣ `CROSS JOIN` – Tüm Kombinasyonları Döner

```sql
SELECT P.ProductName, C.CategoryName
FROM Products AS P
CROSS JOIN Categories AS C;
```

**Ne yapar?**
- Her ürün ile her kategoriyi eşleştirir.
- Örn: 5 ürün × 3 kategori = 15 satır

**Ne zaman kullanılır?**
- Kombinasyon üretmek istediğinizde.
- Nadir kullanılır, genellikle test verisi üretme, varyasyon oluşturma gibi amaçlarla kullanılır.

---

## 🔧 Diğer Yardımcı Yapılar

---

### 🔁 `ON` – Hangi Alanlarla Eşleştirilecek?

```sql
... ON P.CategoryID = C.CategoryID
```

- JOIN'in hangi sütunlara göre çalışacağını belirtir.
- Mantıklı ve anlamlı bir eşleşme yapılmazsa sonuçlar bozulur.

---

### ✍️ `AS` – Tabloya Takma Ad Verme

```sql
FROM Products AS P
INNER JOIN Categories AS C ...
```

- `Products` → `P`  
- `Categories` → `C`  
- Sorguyu kısaltır, daha okunabilir hale getirir.
