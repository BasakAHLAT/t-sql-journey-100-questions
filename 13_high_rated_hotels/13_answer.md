# 🏨 13 – Hotel System: High-Rated Hotels

## 📥 Dataset Kurulumu

Bu problemi çözmeden önce aşağıdaki SQL dosyasını indirip çalıştırmalısınız:

> **🎯 Dosya:** [`13_dataset.sql`](./13_dataset.sql)

Bu dosya içerisinde:
- `Cities`, `Hotels`, `Reviews` tabloları
- Gerçekçi şehirler, oteller ve yorum verileri

---

## ❓ Soru

**Kullanıcı puanı 4.0’ın üzerinde olan otellerin şehir bilgisini ve toplam yorum sayısını listeleyin.  
Ayrıca, her otelin aldığı yorumların ortalama uzunluğunu karakter sayısı cinsinden hesaplayın.**

---

## 🔍 Adım Adım Sorgu Gelişimi

### 🧩 Adım 1: Otel verilerine bakalım

```sql
SELECT * FROM s13.Hotels;
```

İlk olarak otellerin temel bilgilerine bakıyoruz: isim, şehir ID'si ve kullanıcı puanı gibi alanları içerir.

---

### 🧩 Adım 2: Yalnızca yüksek puanlı otelleri filtrele

```sql
SELECT * 
FROM s13.Hotels
WHERE Rating > 4.0;
```

Bu sorgu 4.0'dan yüksek puan almış otelleri listeler.

---

### 🧩 Adım 3: Şehir ismini görmek için `Cities` ile `JOIN`

```sql
SELECT h.HotelName, c.CityName
FROM s13.Hotels AS h
JOIN s13.Cities AS c ON h.CityID = c.CityID
WHERE h.Rating > 4.0;
```

Bu adımda `CityID` üzerinden otelleri şehir isimleriyle eşleştiriyoruz.

---

### 🧩 Adım 4: Yorumları da dahil edelim

```sql
SELECT h.HotelName, c.CityName, r.ReviewText
FROM s13.Hotels AS h
JOIN s13.Cities AS c ON h.CityID = c.CityID
LEFT JOIN s13.Reviews AS r ON h.HotelID = r.HotelID
WHERE h.Rating > 4.0;
```

Yorum verisi olan oteller için yorumlar görünür; olmayanlar için `NULL` olur çünkü `LEFT JOIN` kullanılmıştır.

---

### 🧩 Adım 5: Yorum sayısını ve ortalama uzunluğunu hesaplayalım

```sql
SELECT 
    h.HotelName,
    c.CityName,
    COUNT(r.ReviewID) AS ReviewCount,
    AVG(LEN(r.ReviewText)) AS AvgReviewLength
FROM s13.Hotels AS h
JOIN s13.Cities AS c ON h.CityID = c.CityID
LEFT JOIN s13.Reviews AS r ON h.HotelID = r.HotelID
WHERE h.Rating > 4.0
GROUP BY h.HotelName, c.CityName;
```

---


## ✅ Final Sorgu

```sql
SELECT 
    h.HotelName, 
    c.CityName, 
    COUNT(r.ReviewID) AS ReviewCount,
    AVG(LEN(r.ReviewText)) AS AvgReviewLength
FROM s13.Hotels AS h
LEFT JOIN s13.Cities AS c
    ON h.CityID = c.CityID
LEFT JOIN s13.Reviews AS r
    ON h.HotelID = r.HotelID
WHERE h.Rating > 4.0
GROUP BY h.HotelName, c.CityName;
```

---

## 📚 Kullanılan SQL Kavramları

| Fonksiyon / Komut | Açıklama |
|-------------------|----------|
| `JOIN` | Otel ve şehir tablosunu birleştirir |
| `LEFT JOIN` | Otelin yorumu olmasa da listelenmesini sağlar |
| `WHERE` | Sadece belirli koşula uyan kayıtları getirir |
| `COUNT()` | Yorum sayısını verir |
| `AVG()` | Ortalama hesaplar |
| `LEN()` | Metin uzunluğunu karakter cinsinden hesaplar |
| `GROUP BY` | Her bir otel için hesaplama yapılmasını sağlar |

---

## 🧪 Fonksiyon Kullanım Örnekleri

### `LEN()` – Karakter sayısını bulma

```sql
SELECT LEN('Mükemmel bir konaklama');  -- Sonuç: 24
```

### `AVG(LEN(...))` – Ortalama yorum uzunluğu

```sql
SELECT AVG(LEN(ReviewText)) 
FROM s13.Reviews;
```

### `COUNT()` – Yorum sayısı

```sql
SELECT COUNT(*) 
FROM s13.Reviews
WHERE HotelID = 101;
```

### `LEFT JOIN` – Yorum olmayan otelleri de dahil etme

```sql
SELECT h.HotelName, r.ReviewText
FROM s13.Hotels h
LEFT JOIN s13.Reviews r ON h.HotelID = r.HotelID;
```

### `GROUP BY` – Her otel için toplu istatistik

```sql
SELECT HotelID, COUNT(*) 
FROM s13.Reviews
GROUP BY HotelID;
```