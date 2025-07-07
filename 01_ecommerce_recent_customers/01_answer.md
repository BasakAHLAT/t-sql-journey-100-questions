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

> **🎯 Bu Problemde Öğrenilen Ana SQL Kavramları: ** [`01_learn.md`](./01_learn.md)
