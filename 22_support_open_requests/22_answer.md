
# 🛠️ 22 – Support: Open Requests and Last Update Info

## 📥 Dataset Kurulumu

Problemi çözmeden önce aşağıdaki veri setini kurmanız gerekir:

> **🎯 Dosya:** [`22_dataset.sql`](./22_dataset.sql)

---

## ❓ Soru

**22. Bir destek sisteminde, durumu “açık” olan taleplerin kim tarafından oluşturulduğunu ve en son ne zaman güncellendiğini gösterin.**

---

## ✅ Çözüm

### 🧩 Adım 1: Temel tabloyu gözlemleyelim

```sql
SELECT * FROM s22.SupportRequests;
```

Bu sorgu tüm destek taleplerini getirir. Henüz herhangi bir filtre uygulanmadı.

---

### 🧩 Adım 2: Sadece "açık" talepleri filtrele

```sql
SELECT * 
FROM s22.SupportRequests
WHERE Status = 'açık';
```

Bu adımda sadece durumu "açık" olan talepler listelenir.

---

### 🧩 Adım 3: Kullanıcı bilgilerini de dahil edelim (JOIN)

```sql
SELECT * 
FROM s22.SupportRequests r
JOIN s22.Users u ON r.UserID = u.UserID
WHERE r.Status = 'açık';
```

Artık her destek talebine ait kullanıcı bilgileri de geldi.

---

### 🧩 Adım 4: Gerekli kolonları seç

```sql
SELECT 
    u.FullName,
    r.UpdatedAt
FROM s22.SupportRequests r
JOIN s22.Users u ON r.UserID = u.UserID
WHERE r.Status = 'açık';
```

Bu haliyle çıktıda sadece kullanıcı adı ve son güncelleme tarihi yer alır.

---

## 🧾 Final Sorgu

```sql
SELECT 
    u.FullName,
    r.UpdatedAt
FROM s22.SupportRequests r
JOIN s22.Users u ON r.UserID = u.UserID
WHERE r.Status = 'açık';
```

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Fonksiyon / Konsept | Açıklama |
|---------------------|----------|
| `JOIN`              | Tabloları birleştirir |
| `WHERE`             | Belirli kriterlere göre filtreleme yapar |
| `Alias`             | Takma ad kullanımı (r, u gibi) |
| `NULL` kontrolü     | `UpdatedAt` alanı bazı kayıtlar için NULL olabilir |

---

### 🔍 Ekstra: NULL Değerler Nasıl Ele Alınır?

```sql
-- NULL olanları “Henüz güncellenmedi” olarak göstermek için:
SELECT 
    u.FullName,
    ISNULL(r.UpdatedAt, 'Henüz güncellenmedi') AS LastUpdate
FROM s22.SupportRequests r
JOIN s22.Users u ON r.UserID = u.UserID
WHERE r.Status = 'açık';
```

---

Bu sorgu, destek sistemlerinde aktif talepleri takip etmek için oldukça faydalıdır.

