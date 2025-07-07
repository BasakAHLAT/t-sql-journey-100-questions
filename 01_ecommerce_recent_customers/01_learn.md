# 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

Aşağıdaki kavramlar, bu problemin çözümünde kullanılmış ve SQL'de tarih/tarih-saat işlemlerini öğrenmek için oldukça temel konulardır:

| 🧠 Öğrenilen Fonksiyon / Konsept | 💬 Açıklama |
|----------------------------------|------------|
| `GETDATE()`                      | Şu anki tarih ve saat bilgisini döndürür |
| `DATEADD()`                      | Bir tarihe gün/ay/yıl/saat ekler veya çıkarır |
| `CAST(... AS DATE)`             | `DATETIME` verisini sadece `DATE` tipine çevirir (saat kısmını siler) |
| `WHERE` + `>=`                  | Belirli bir tarih veya değerle karşılaştırma yaparak filtreleme sağlar |
| Tarih karşılaştırması            | Saat bilgili ve sadece tarih içeren değerlerin karşılaştırılması |

---

## 🔍 Kavramlara Göre Kullanım Örnekleri

---

### 1️⃣ `GETDATE()` – Şu Anki Tarih ve Saat

```sql
SELECT GETDATE();  -- Örn: 2025-07-05 23:06:00.000
```

---

### 2️⃣ `DATEADD()` – Tarihe Zaman Eklemek veya Çıkarmak

```sql
-- 🔙 Gün bazında geri gitme
SELECT DATEADD(DAY, -7, GETDATE());   -- 7 gün önce
SELECT DATEADD(DAY, -30, GETDATE());  -- 30 gün önce

-- 🔜 Gün bazında ileri gitme
SELECT DATEADD(DAY, 10, GETDATE());   -- 10 gün sonrası

-- 📆 Ay bazında ileri ve geri gitme
SELECT DATEADD(MONTH, -1, GETDATE()); -- 1 ay önce
SELECT DATEADD(MONTH, 2, GETDATE());  -- 2 ay sonra

-- 📅 Yıl bazında zaman ekleme ve çıkarma
SELECT DATEADD(YEAR, -1, GETDATE());  -- Geçen yıl bu zaman
SELECT DATEADD(YEAR, 5, GETDATE());   -- 5 yıl sonra

-- ⏱ Saat/dakika bazında oynamak
SELECT DATEADD(HOUR, -5, GETDATE());   -- 5 saat önce
SELECT DATEADD(MINUTE, 30, GETDATE()); -- 30 dakika sonra
```

💡 `DATEADD()` fonksiyonunda kullanılabilecek `datepart` değerleri: `YEAR`, `QUARTER`, `MONTH`, `DAY`, `HOUR`, `MINUTE`, `SECOND`, vb.

---

### 3️⃣ `CAST(... AS DATE)` – Saat Bilgisini Atmak

```sql
-- Şu anki tarih (saat olmadan)
SELECT CAST(GETDATE() AS DATE);

-- 7 gün önce sadece tarih
SELECT CAST(DATEADD(DAY, -7, GETDATE()) AS DATE);
```

---

### 4️⃣ `WHERE` + `>=` – Tarih Filtresi

```sql
-- Son 7 günde kayıt olanları getir
SELECT *
FROM Customers
WHERE RegistrationDate >= CAST(DATEADD(DAY, -7, GETDATE()) AS DATE);
```

---

### 5️⃣ Tarih Karşılaştırması – Saatli vs. Saatsiz

```sql
-- DATETIME karşılaştırma (saat dahil)
WHERE RegistrationDate >= DATEADD(DAY, -7, GETDATE());

-- Sadece tarih karşılaştırması (saat hariç)
WHERE RegistrationDate >= CAST(DATEADD(DAY, -7, GETDATE()) AS DATE);
```

Saat bilgisi içeriyorsa 7 gün önceki günün bazı saatleri dışarıda kalabilir. Bu nedenle `CAST(... AS DATE)` ile sadece tarih karşılaştırması daha güvenlidir.

---
