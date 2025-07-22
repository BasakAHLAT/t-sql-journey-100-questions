# ✈️ 18 – Airline System: Tomorrow's Flights

## 📥 Dataset Kurulumu

Bu problemi çözmeden önce aşağıdaki SQL dosyasını indirip kendi SQL Server ortamınızda çalıştırmalısınız:

> **🎯 Dosya:** [`18_dataset.sql`](./18_dataset.sql)

Bu dosyada:
- `Cities` ve `Flights` tabloları tanımlanmıştır
- Uçuş saatleri bugünden, yarına ve ileri tarihlere göre çeşitlendirilmiştir

---

## ❓ Soru

**Yarın gerçekleşecek uçuşların uçuş numaralarını, kalkış saatlerini ve varış şehirlerini listeleyin.**

---

## 🔍 Adım Adım Sorgu Gelişimi

### 🧩 Adım 1: Tüm uçuşlara bakalım

```sql
SELECT * FROM s18.Flights;
```

---

### 🧩 Adım 2: Tarihi sadece yarın olan uçuşları filtreleyelim

```sql
SELECT * 
FROM s18.Flights
WHERE CAST(DepartureTime AS DATE) = CAST(DATEADD(DAY, 1, GETDATE()) AS DATE);
```

---

### 🧩 Adım 3: Varış şehir bilgilerini de ekleyelim

```sql
SELECT 
    f.FlightNumber,
    f.DepartureTime,
    c.CityName AS ArrivalCity
FROM s18.Flights AS f
JOIN s18.Cities AS c ON f.ArrivalCityID = c.CityID
WHERE CAST(f.DepartureTime AS DATE) = CAST(DATEADD(DAY, 1, GETDATE()) AS DATE);
```

---

## ✅ Final Sorgu

```sql
SELECT 
    f.FlightNumber,
    f.DepartureTime,
    c.CityName AS ArrivalCity
FROM s18.Flights AS f
JOIN s18.Cities AS c ON f.ArrivalCityID = c.CityID
WHERE CAST(f.DepartureTime AS DATE) = CAST(DATEADD(DAY, 1, GETDATE()) AS DATE);
```

---

## 📚 Kullanılan SQL Kavramları

| Fonksiyon / Komut | Açıklama |
|-------------------|----------|
| `DATEADD(DAY, 1, GETDATE())` | Bugünün tarihine 1 gün ekleyerek yarını verir |
| `CAST(... AS DATE)` | Tarih-saat değerini sadece tarih kısmına çevirir |
| `JOIN` | İlişkili tablodan bilgi almak için kullanılır |
| `WHERE` | Koşullu filtreleme sağlar |

---

## 🔎 Örnek Kullanımlar

### Yarınki Tarihi Hesaplama

```sql
SELECT CAST(DATEADD(DAY, 1, GETDATE()) AS DATE);
```

### Uçuş ve şehir ilişkisi

```sql
SELECT f.FlightNumber, c.CityName
FROM s18.Flights f
JOIN s18.Cities c ON f.ArrivalCityID = c.CityID;
```