
# 🏨 23 – Hotel: Available Rooms by Date

## 📥 Dataset Kurulumu

Bu problemi çözmeden önce aşağıdaki veri setini kurmanız gerekir:

> **🎯 Dosya:** [`23_dataset.sql`](./23_dataset.sql)

---

## ❓ Soru

**23. Otel rezervasyon sisteminde, belirli bir tarihte müsait olan odaların numaralarını, oda tiplerini ve kişi kapasitesini gösterin.**

---

## ✅ Çözüm

### 🧩 Adım 1: Tüm odaları görelim

```sql
SELECT * FROM s23.Rooms;
```

---

### 🧩 Adım 2: Belirli bir tarih için rezerve edilmiş odaları bul

```sql
SELECT RoomID 
FROM s23.Reservations
WHERE '2025-08-04' BETWEEN CheckInDate AND DATEADD(DAY, -1, CheckOutDate);
```

📌 Not: CheckOutDate günü çıkış yapıldığı için o gün artık müsait sayılır. Bu yüzden -1 gün çıkarıldı.

---

### 🧩 Adım 3: Bu listedeki odaları hariç tut

```sql
SELECT RoomNumber, RoomType, Capacity
FROM s23.Rooms
WHERE RoomID NOT IN (
    SELECT RoomID 
    FROM s23.Reservations
    WHERE '2025-08-04' BETWEEN CheckInDate AND DATEADD(DAY, -1, CheckOutDate)
);
```

---

## 🧾 Final Sorgu

```sql
SELECT RoomNumber, RoomType, Capacity
FROM s23.Rooms
WHERE RoomID NOT IN (
    SELECT RoomID 
    FROM s23.Reservations
    WHERE '2025-08-04' BETWEEN CheckInDate AND DATEADD(DAY, -1, CheckOutDate)
);
```

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Konsept / Fonksiyon | Açıklama |
|----------------------|----------|
| `NOT IN`             | Belirli bir kümenin dışındaki verileri seçer |
| `BETWEEN ... AND`    | İki tarih (veya sayı) aralığında kontrol yapar |
| `DATEADD`            | Tarih aritmetiği işlemleri yapmak için kullanılır |

---

### 🔍 DATEADD Kullanım Örneği

```sql
-- 1 gün önceye gitmek:
SELECT DATEADD(DAY, -1, '2025-08-05');  -- Çıktı: 2025-08-04
```

---

Bu sorgu otel sistemlerinde belirli bir tarihteki müsait odaları tespit etmek için yaygın olarak kullanılır.
