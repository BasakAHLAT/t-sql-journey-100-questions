# 🏥 20 – Hospital System: Today's Appointments

## 📥 Dataset Kurulumu

Bu problemi çözmeden önce aşağıdaki SQL dosyasını indirip çalıştırmalısınız:

> **🎯 Dosya:** [`20_dataset.sql`](./20_dataset.sql)

Bu dosyada:
- `Patients`, `Doctors`, `Appointments` tabloları tanımlanmıştır
- Randevu verileri bugün, dün ve yarına dağılmış şekilde oluşturulmuştur

---

## ❓ Soru

**Bugünkü randevusu olan hastaların adlarını, doktor adlarını ve randevu saatlerini listeleyin.**

---

## 🔍 Adım Adım Sorgu Gelişimi

### 🧩 Adım 1: Tüm randevuları listeleyelim

```sql
SELECT * FROM s20.Appointments;
```

---

### 🧩 Adım 2: Bugünkü tarih filtresi uygulayalım

```sql
SELECT * 
FROM s20.Appointments
WHERE TRY_CONVERT(DATE, AppointmentTime) = TRY_CONVERT(DATE, GETDATE());
```

---

### 🧩 Adım 3: Hasta ve doktor isimlerini JOIN ile ekleyelim

```sql
SELECT 
    p.PatientName,
    d.DoctorName,
    a.AppointmentTime
FROM s20.Appointments AS a
JOIN s20.Patients AS p ON a.PatientID = p.PatientID
JOIN s20.Doctors AS d ON a.DoctorID = d.DoctorID
WHERE TRY_CONVERT(DATE, a.AppointmentTime) = TRY_CONVERT(DATE, GETDATE());
```

---

## ✅ Final Sorgu

```sql
SELECT 
    p.PatientName,
    d.DoctorName,
    a.AppointmentTime
FROM s20.Appointments AS a
JOIN s20.Patients AS p ON a.PatientID = p.PatientID
JOIN s20.Doctors AS d ON a.DoctorID = d.DoctorID
WHERE TRY_CONVERT(DATE, a.AppointmentTime) = TRY_CONVERT(DATE, GETDATE());
```

---

## 📚 Kullanılan SQL Kavramları

| Fonksiyon / Komut        | Açıklama                                 |
|--------------------------|------------------------------------------|
| `GETDATE()`              | Şu anki tarih ve saat                    |
| `TRY_CONVERT(... AS DATE)` | Hatalı verileri NULL döndürerek dönüşüm sağlar |
| `JOIN`                   | Hasta ve doktor bilgilerini eklemek için |
| `WHERE`                  | Tarih filtresi uygulamak için kullanılır |

---

## 🔎 Örnek Kullanımlar

```sql
-- Bugünün tarihi:
SELECT TRY_CONVERT(DATE, GETDATE());

-- Tüm randevular:
SELECT * FROM s20.Appointments;

-- Hasta ve doktor isimleriyle bugünkü randevular:
SELECT p.PatientName, d.DoctorName, a.AppointmentTime
FROM s20.Appointments a
JOIN s20.Patients p ON a.PatientID = p.PatientID
JOIN s20.Doctors d ON a.DoctorID = d.DoctorID
WHERE TRY_CONVERT(DATE, a.AppointmentTime) = TRY_CONVERT(DATE, GETDATE());
```
