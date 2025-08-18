
# ❤️ 24 – Volunteer: Health-Themed Event Participation

## 📥 Dataset Kurulumu

Bu problemi çözmeden önce aşağıdaki veri setini kurmanız gerekir:

> **🎯 Dosya:** [`24_dataset.sql`](./24_dataset.sql)

---

## ❓ Soru

**24. Bir gönüllülük sisteminde, 'Sağlık' temalı etkinliklerde görev almış gönüllülerin ad-soyad bilgisini ve görev aldığı toplam etkinlik sayısını listeleyin.**

---

## ✅ Çözüm

### 🧩 Adım 1: Temel tablo birleşimlerini yapalım

```sql
SELECT *
FROM s24.VolunteerEvents ve
JOIN s24.Volunteers v ON ve.VolunteerID = v.VolunteerID
JOIN s24.Events e ON ve.EventID = e.EventID;
```

---

### 🧩 Adım 2: Sadece 'Sağlık' temalı etkinlikleri filtrele

```sql
SELECT *
FROM s24.VolunteerEvents ve
JOIN s24.Volunteers v ON ve.VolunteerID = v.VolunteerID
JOIN s24.Events e ON ve.EventID = e.EventID
WHERE e.Theme = 'Sağlık';
```

---

### 🧩 Adım 3: Gerekli alanları seç ve grupla

```sql
SELECT 
    v.FirstName + ' ' + v.LastName AS FullName,
    COUNT(*) AS TotalHealthEvents
FROM s24.VolunteerEvents ve
JOIN s24.Volunteers v ON ve.VolunteerID = v.VolunteerID
JOIN s24.Events e ON ve.EventID = e.EventID
WHERE e.Theme = 'Sağlık'
GROUP BY v.FirstName, v.LastName;
```

---

## 🧾 Final Sorgu

```sql
SELECT 
    v.FirstName + ' ' + v.LastName AS FullName,
    COUNT(*) AS TotalHealthEvents
FROM s24.VolunteerEvents ve
JOIN s24.Volunteers v ON ve.VolunteerID = v.VolunteerID
JOIN s24.Events e ON ve.EventID = e.EventID
WHERE e.Theme = 'Sağlık'
GROUP BY v.FirstName, v.LastName;
```

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Konsept / Fonksiyon | Açıklama |
|---------------------|----------|
| `JOIN`              | Tabloları birleştirir |
| `WHERE`             | Temaya göre filtreleme |
| `GROUP BY`          | Gruplama ve toplama işlemleri |
| `COUNT(*)`          | Belirli grup içindeki satır sayısını verir |
| `+` ile birleştirme | Ad ve soyadı birleştirmek için kullanılır |

---

### 🔍 Ekstra Örnek: CONCAT kullanarak ad soyad birleştirme (alternatif yöntem)

```sql
SELECT 
    CONCAT(v.FirstName, ' ', v.LastName) AS FullName
FROM s24.Volunteers v;
```


