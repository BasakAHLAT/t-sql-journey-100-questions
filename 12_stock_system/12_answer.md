# 🏷️ 12 – Stock System: Out-of-Stock Products

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

> **🎯 Dosya:** [`12_dataset.sql`](./12_dataset.sql)

Bu dosya içerisinde:
- Gerekli **tabloların yapısı** (`Categories`, `Products`)
- Gerçekçi ve çeşitli **test verileri**
yer almaktadır.

---

## ❓ Soru

**Bir stok sisteminde, stoğu kalmamış (0 veya boş) ürünlerin adlarını, ait oldukları kategori isimlerini ve son stok güncelleme tarihlerini listeleyin.**  
**Stok bilgisi eksikse bunu “Tükenmiş” olarak etiketleyin.**

---

## ✅ Çözüm

### 🧩 Adım 1: Ürünleri ve stok bilgilerini görelim

```sql
SELECT * FROM s12.Products;
```

---

### 🧩 Adım 2: Stok miktarı 0 olan ürünleri filtreleyelim

```sql
SELECT * FROM s12.Products
WHERE StockQuantity = 0;
```

---

### 🧩 Adım 3: Eksik stok (NULL) verilerini de dahil edelim

```sql
SELECT * FROM s12.Products
WHERE StockQuantity = 0 OR StockQuantity IS NULL;
```

---

### 🧩 Adım 4: Kategori adlarını göstermek için JOIN kullanalım

```sql
SELECT p.ProductName, c.CategoryName
FROM s12.Products AS p
JOIN s12.Categories AS c ON p.CategoryID = c.CategoryID
WHERE p.StockQuantity = 0 OR p.StockQuantity IS NULL;
```

---

### 🧩 Adım 5: Son stok güncelleme tarihini ekleyelim ve tarih formatını düzenleyelim

```sql
SELECT p.ProductName, c.CategoryName,
       CONVERT(VARCHAR, p.LastStockUpdate, 23) AS LastUpdate
FROM s12.Products AS p
JOIN s12.Categories AS c ON p.CategoryID = c.CategoryID
WHERE p.StockQuantity = 0 OR p.StockQuantity IS NULL;
```

---

### 🧩 Adım 6: NULL olan güncelleme tarihlerine etiket ekleyelim

```sql
SELECT p.ProductName, c.CategoryName,
       ISNULL(CONVERT(VARCHAR, p.LastStockUpdate, 23), 'Bilgi Yok') AS LastUpdate
FROM s12.Products AS p
JOIN s12.Categories AS c ON p.CategoryID = c.CategoryID
WHERE p.StockQuantity = 0 OR p.StockQuantity IS NULL;
```

---

### 🧩 Adım 7: Stok durumu etiketini ekleyelim

```sql
SELECT 
    p.ProductName,
    c.CategoryName,
    ISNULL(CONVERT(VARCHAR, p.LastStockUpdate, 23), 'Bilgi Yok') AS LastUpdate,
    CASE 
        WHEN p.StockQuantity IS NULL THEN 'Tükenmiş'
        ELSE 'Stokta Yok'
    END AS StockStatus
FROM s12.Products AS p
JOIN s12.Categories AS c ON p.CategoryID = c.CategoryID
WHERE p.StockQuantity = 0 OR p.StockQuantity IS NULL;
```

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Fonksiyon / Konsept | Açıklama |
|---------------------|----------|
| `ISNULL()`          | NULL olan değerlere varsayılan bir değer atar |
| `CASE`              | Koşullu durumları yönetmek için kullanılır |
| `JOIN`              | Tabloları birleştirmek için kullanılır |
| `CONVERT(..., 23)`  | Tarihi `yyyy-mm-dd` formatına çevirir |

---

## 🧪 Kullanım Örnekleri

---

### 1️⃣ `ISNULL()` – NULL Değerler İçin Varsayılan Atama

`ISNULL()` fonksiyonu, bir sütun veya ifadenin değeri `NULL` ise onun yerine belirtilen değeri döndürür.

```sql
-- NULL değeri yerine 'Yok' yazdırılır
SELECT ISNULL(NULL, 'Yok') AS Sonuc;  -- Çıktı: 'Yok'

-- Gerçek senaryo: ürün açıklaması boş olanlara varsayılan değer atama
SELECT ProductName, ISNULL(Description, 'Açıklama eklenmemiş') AS Aciklama
FROM s12.Products;
```

---

### 2️⃣ `CASE` – Koşullu Durumlara Göre Etiketleme

`CASE` ifadesi, belirli bir duruma göre farklı değerler üretmek için kullanılır.

```sql
-- Basit örnek
SELECT 
  CASE 
    WHEN 1 = 1 THEN 'Doğru'
    ELSE 'Yanlış'
  END AS Durum;

-- Gerçek senaryo: stok durumunu etiketlemek
SELECT ProductName,
  CASE 
    WHEN StockQuantity IS NULL THEN 'Tükenmiş'
    WHEN StockQuantity = 0 THEN 'Stokta Yok'
    ELSE 'Stokta Var'
  END AS StokDurumu
FROM s12.Products;
```

---

### 3️⃣ `CONVERT(..., style)` – Tarihi Biçimli Metne Çevirme

SQL Server’da `CONVERT` fonksiyonu, tarih ve saat bilgilerini farklı görsel formatlarda dönüştürmek için kullanılır.

```sql
-- Şu anki tarihi ISO formatında yazdır
SELECT CONVERT(VARCHAR, GETDATE(), 23) AS Bugun;  -- Çıktı: 2025-07-13

-- Stok güncelleme tarihi olmayan ürünlere 'Bilgi Yok' yaz
SELECT ProductName,
  ISNULL(CONVERT(VARCHAR, LastStockUpdate, 23), 'Bilgi Yok') AS GuncellemeTarihi
FROM s12.Products;
```

📝 `23` stil kodu `yyyy-mm-dd` formatı sağlar. Başka kodlarla tarih görünümü değiştirilebilir.

```sql
-- Alman formatı
SELECT CONVERT(VARCHAR, GETDATE(), 104) AS AlmanFormat;  -- 13.07.2025
```

---

### Bonus: Bileşik Kullanım

Gerçek sorgularda bu fonksiyonlar birlikte de kullanılabilir:

```sql
SELECT ProductName,
       c.CategoryName,
       ISNULL(CONVERT(VARCHAR, LastStockUpdate, 23), 'Bilgi Yok') AS SonGuncelleme,
       CASE 
           WHEN StockQuantity IS NULL THEN 'Tükenmiş'
           WHEN StockQuantity = 0 THEN 'Stokta Yok'
           ELSE 'Var'
       END AS StokDurumu
FROM s12.Products p
JOIN s12.Categories c ON p.CategoryID = c.CategoryID;
```
