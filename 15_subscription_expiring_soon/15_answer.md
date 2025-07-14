# 📅 15 – Subscription System: Expiring Soon

## 📥 Dataset Kurulumu

Bu problemi çözmeden önce aşağıdaki SQL dosyasını indirip kendi SQL Server ortamınızda çalıştırmalısınız:

> **🎯 Dosya:** [`15_dataset.sql`](./15_dataset.sql)

Bu dosyada:
- `Users` ve `Subscriptions` tabloları tanımlanır
- Gerçek kullanıcı ve abonelik senaryolarını içeren veriler eklenmiştir

---

## ❓ Soru

**Bugün ile abonelik bitiş tarihi arasındaki fark 30 gün ve daha az olan tüm aboneliklerin kullanıcı adlarını ve kalan gün sayılarını listeleyin.**

---

## 🔍 Adım Adım Sorgu Gelişimi

### 🧩 Adım 1: Abonelik bitiş tarihlerini ve bugünü görelim

```sql
SELECT *, GETDATE() AS Today
FROM s15.Subscriptions;
```

Bu sorgu ile tüm aboneliklerin bitiş tarihini bugünkü tarih ile birlikte görürüz.

---

### 🧩 Adım 2: Tarihler arası farkı hesaplayalım

```sql
SELECT 
    UserID,
    DATEDIFF(DAY, GETDATE(), EndDate) AS DaysLeft
FROM s15.Subscriptions;
```

Burada `DATEDIFF` ile bugünden itibaren aboneliğin bitmesine kaç gün kaldığını hesaplıyoruz.

---

### 🧩 Adım 3: Kalan gün sayısı 30’dan küçük ya da eşit olanları filtreleyelim

```sql
SELECT 
    UserID,
    DATEDIFF(DAY, GETDATE(), EndDate) AS DaysLeft
FROM s15.Subscriptions
WHERE DATEDIFF(DAY, GETDATE(), EndDate) <= 30
  AND DATEDIFF(DAY, GETDATE(), EndDate) >= 0;
```

Kalan gün 0 (bugün bitiyor) ile 30 arasında olanlar dahil edilir.

---

### 🧩 Adım 4: Kullanıcı ismini dahil edelim

```sql
SELECT 
    u.UserName,
    DATEDIFF(DAY, GETDATE(), s.EndDate) AS DaysLeft
FROM s15.Subscriptions AS s
JOIN s15.Users AS u ON s.UserID = u.UserID
WHERE DATEDIFF(DAY, GETDATE(), s.EndDate) BETWEEN 0 AND 30;
```

---

## ✅ Final Sorgu

```sql
SELECT 
    u.UserName,
    DATEDIFF(DAY, GETDATE(), s.EndDate) AS DaysLeft
FROM s15.Subscriptions AS s
JOIN s15.Users AS u ON s.UserID = u.UserID
WHERE DATEDIFF(DAY, GETDATE(), s.EndDate) BETWEEN 0 AND 30;
```

---

## 📚 Kullanılan SQL Kavramları

| Fonksiyon / Komut | Açıklama |
|-------------------|----------|
| `GETDATE()` | Sistem tarihini verir |
| `DATEDIFF()` | İki tarih arasındaki farkı (gün, ay, yıl vs.) hesaplar |
| `JOIN` | Tabloları birleştirir |
| `BETWEEN` | Belirli bir aralıkta filtreleme yapmak için kullanılır |

---

## 🔎 Örnek Kullanımlar

### `GETDATE()` – Bugünün tarihi

```sql
SELECT GETDATE();
```

### `DATEDIFF()` – Tarih farkı bulma

```sql
SELECT DATEDIFF(DAY, GETDATE(), '2025-08-01');  -- örnek çıktı: 17
```

### `JOIN` – Tabloları birleştirme

```sql
SELECT u.UserName, s.EndDate
FROM s15.Users u
JOIN s15.Subscriptions s ON u.UserID = s.UserID;
```
