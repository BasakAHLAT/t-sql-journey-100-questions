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

## 🔍 Adım Adım Açıklama

### 🧩 1. Ana Tablomuz: `Hotels`
Sorgu `s13.Hotels` tablosuyla başlıyor çünkü hedefimiz yüksek puanlı oteller.

```sql
FROM s13.Hotels AS h
```

### 🧩 2. Şehir Bilgisi İçin Join
Otellerin hangi şehirde olduğunu göstermek için `Cities` tablosu ile `LEFT JOIN` yaptık:

```sql
LEFT JOIN s13.Cities AS c
ON h.CityID = c.CityID
```

### 🧩 3. Yorum Bilgisi İçin Join
Otellere ait yorumları almak için `Reviews` tablosuna `LEFT JOIN` yapıyoruz. Böylece yorumu olmayan oteller de listelenebilir:

```sql
LEFT JOIN s13.Reviews AS r
ON h.HotelID = r.HotelID
```

### 🧩 4. Filtre: Yüksek Puanlı Oteller
Sadece 4.0 üzerindeki değerlendirme puanına sahip oteller alınır:

```sql
WHERE h.Rating > 4.0
```

### 🧩 5. Gruplama ve Hesaplamalar
Her otel için yorum sayısını ve ortalama yorum uzunluğunu hesaplıyoruz. Grup bazlı işlem yapılacağı için `GROUP BY` gerekiyor:

```sql
GROUP BY h.HotelName, c.CityName
```

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

---

## 📚 Kullanılan SQL Kavramları

| Fonksiyon / Komut | Açıklama |
|-------------------|----------|
| `LEFT JOIN` | Ana tablodaki tüm kayıtları alır, eşleşen varsa diğer tablodan getirir |
| `COUNT()` | Grup başına kaç yorum olduğunu sayar |
| `AVG()` | Ortalama hesaplar (örneğin karakter uzunluğu) |
| `LEN()` | Metnin karakter sayısını verir |
| `GROUP BY` | Gruplama yapılmasını sağlar (otel + şehir bazında) |
| `WHERE` | Sadece belirli koşullara uyan verileri dahil eder |

---

## 🧪 Fonksiyonların Kullanım Örnekleri

### 1️⃣ `LEN()` – Metin Uzunluğu Ölçme

```sql
SELECT LEN('Harika bir otel!');  -- Sonuç: 17
```

### 2️⃣ `AVG()` + `LEN()` – Ortalama Metin Uzunluğu

```sql
SELECT AVG(LEN(ReviewText)) 
FROM s13.Reviews;
```

### 3️⃣ `COUNT()` – Yorum Sayısı Hesaplama

```sql
SELECT COUNT(*) 
FROM s13.Reviews
WHERE HotelID = 101;
```

### 4️⃣ `LEFT JOIN` – Eksik Yorumlar Olsa Bile Otelleri Göster

```sql
SELECT h.HotelName, r.ReviewText
FROM s13.Hotels h
LEFT JOIN s13.Reviews r ON h.HotelID = r.HotelID;
```

### 5️⃣ `GROUP BY` – Otel Bazında Yorum Sayısı

```sql
SELECT HotelID, COUNT(*) 
FROM s13.Reviews
GROUP BY HotelID;
```

---
