# 🛒 01 – E-commerce: Recent Customer Registrations

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

> **🎯 Dosya:** [`01_dataset.sql`](./01_dataset.sql)

Bu dosya içerisinde:
- Gerekli **tabloların yapısı** (`Cities`, `Customers`, `Products`, `Orders`, `OrderDetails`)
- Gerçekçi ve çeşitli **test verileri**
yer almaktadır.

> 🧠 **Not:** Bu veri seti, bu GitHub reposuna özel olarak, senaryo tabanlı SQL problemlerinin çözümünü desteklemek amacıyla **yapay zeka tarafından oluşturulmuştur**.

Tüm verileri başarıyla yükledikten sonra sorgularınızı rahatlıkla test edebilirsiniz.

---

## ❓ Soru

**1. Bir e-ticaret sisteminde müşterilerin kayıt tarihleri tutulmaktadır. Son 7 gün içinde kaydolan tüm müşterilerin adlarını ve e-posta adreslerini listeleyin.**

---

## ✅ Çözüm

### 🧩 Adım 1: Temel sorguyla başlıyoruz

```sql
SELECT * 
FROM dbo.Customers;
```

Bu sorgu, `Customers` tablosundaki tüm verileri getirir.  
Henüz herhangi bir filtre uygulanmadı; tarih ya da kayıt bilgisi dikkate alınmaz.

---

### 🧩 Adım 2: Filtre eklemeye başlıyoruz – `WHERE` kullanımı

```sql
SELECT * 
FROM dbo.Customers
WHERE RegistrationDate >= GETDATE();
```

Bu, sadece **şu anki tarih ve saatten sonra** kayıt olan müşterileri getirir.  
Ama bu mantıklı değildir çünkü gelecek zamanda kayıt olan kullanıcı olmaz.  
🔴 Bu haliyle sorgu büyük ihtimalle **boş sonuç döner**.

---

### 🧩 Adım 3: 7 gün öncesine gitmek için `DATEADD`

```sql
SELECT * 
FROM dbo.Customers
WHERE RegistrationDate >= DATEADD(DAY, -7, GETDATE());
```

Bu sorgu:
- `GETDATE()` ile bugünün tarih ve saatini alır (örneğin `2025-07-05 23:06`)
- `DATEADD(DAY, -7, ...)` ile 7 gün geri gider (`2025-06-28 23:06`)
- Yani sadece **28 Haziran 23:06'dan sonra** kayıt olanlar gelir

📌 Ancak burada **saat bilgisi** olduğu için 28 Haziran’da gün içinde kayıt olan bazı müşteriler dışarıda kalabilir.

---

### 🧩 Adım 4: Sadece tarihi dikkate almak için `CAST`

```sql
SELECT * 
FROM dbo.Customers
WHERE RegistrationDate >= CAST(DATEADD(DAY, -7, GETDATE()) AS DATE);
```

Bu haliyle:
- `DATEADD(DAY, -7, GETDATE())` → 7 gün önceki tarih ve saat
- `CAST(... AS DATE)` → saat kısmını siler, sadece tarihi bırakır (`2025-06-28 00:00:00`)
- Böylece 28 Haziran günü içinde **herhangi bir saatte** kayıt olan tüm müşteriler dahil olur

✅ Bu haliyle filtre güvenlidir ve saat farkından etkilenmez.

---

### 🧩 Final Sorgu

```sql
SELECT * 
FROM dbo.Customers
WHERE RegistrationDate >= CAST(DATEADD(DAY, -7, GETDATE()) AS DATE);
```

Bu sorgu:
- Son 7 güne giren tüm kayıtları yakalar
- Tarih filtrelemesi hatasız çalışır
- Gerçek dünya senaryolarında en güvenli çözümdür

---

# 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

Aşağıdaki kavramlar, bu problemin çözümünde kullanılmış ve SQL'de tarih/tarih-saat işlemlerini öğrenmek için oldukça temel konulardır:

| 🧠 Öğrenilen Fonksiyon / Konsept | 💬 Açıklama |
|----------------------------------|------------|
| `GETDATE()`                      | Şu anki tarih ve saat bilgisini döndürür |
| `DATEADD()`                      | Bir tarihe gün/ay/yıl/saat ekler veya çıkarır |
| `CAST(... AS DATE)`             | `DATETIME` verisini sadece `DATE` tipine çevirir (saat kısmını siler) |

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

