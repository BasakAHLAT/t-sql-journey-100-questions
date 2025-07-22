# 📦 19 – Cargo Tracking System: Packages Sent in Last 24 Hours

## 📥 Dataset Kurulumu

Bu problemi çözmeden önce aşağıdaki SQL dosyasını indirip çalıştırmalısınız:

> **🎯 Dosya:** [`19_dataset.sql`](./19_dataset.sql)

Bu dosyada:
- `Senders` ve `Packages` tabloları tanımlanmıştır
- Kargo gönderim tarihleri gerçekçi ve farklı saat dilimlerini kapsayacak şekilde çeşitlendirilmiştir

---

## ❓ Soru

**Son 24 saat içinde gönderilmiş kargoların takip numarasını, gönderici adını ve kaç saat önce gönderildiğini listeleyin.**

---

## 🔍 Adım Adım Sorgu Gelişimi

### 🧩 Adım 1: Tüm kargo gönderim tarihlerini görelim

```sql
SELECT * FROM s19.Packages;
```

---

### 🧩 Adım 2: Son 24 saatlik gönderileri filtreleyelim

```sql
SELECT *
FROM s19.Packages
WHERE SentDate >= DATEADD(HOUR, -24, GETDATE());
```

---

### 🧩 Adım 3: Gönderici bilgilerini ekleyelim

```sql
SELECT 
    p.TrackingNumber,
    s.SenderName,
    DATEDIFF(HOUR, p.SentDate, GETDATE()) AS HoursAgo
FROM s19.Packages AS p
JOIN s19.Senders AS s ON p.SenderID = s.SenderID
WHERE p.SentDate >= DATEADD(HOUR, -24, GETDATE());
```

---

## ✅ Final Sorgu

```sql
SELECT 
    p.TrackingNumber,
    s.SenderName,
    DATEDIFF(HOUR, p.SentDate, GETDATE()) AS HoursAgo
FROM s19.Packages AS p
JOIN s19.Senders AS s ON p.SenderID = s.SenderID
WHERE p.SentDate >= DATEADD(HOUR, -24, GETDATE());
```

---

## 📚 Kullanılan SQL Kavramları

| Fonksiyon / Komut | Açıklama |
|-------------------|----------|
| `GETDATE()` | Geçerli tarih ve saat |
| `DATEADD(HOUR, -24, GETDATE())` | Şu andan 24 saat öncesini verir |
| `DATEDIFF(HOUR, SentDate, GETDATE())` | Kaç saat önce gönderildiğini hesaplar |
| `JOIN` | Gönderici bilgilerini almak için tabloları birleştirir |

---

## 🔎 Örnek Kullanımlar

```sql
-- Son 24 saatte gönderilenler
SELECT * FROM s19.Packages
WHERE SentDate >= DATEADD(HOUR, -24, GETDATE());

-- Saat farkı hesaplama
SELECT DATEDIFF(HOUR, SentDate, GETDATE()) FROM s19.Packages;
```
