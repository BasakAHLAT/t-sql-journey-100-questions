# 🧑‍💼 14 – HR System: Sales Department Employees

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce aşağıdaki SQL dosyasını indirip kendi SQL Server ortamınızda çalıştırmalısınız:

> **🎯 Dosya:** [`14_dataset.sql`](./14_dataset.sql)

Bu dosyada:
- `Departments`, `Positions`, `Employees` tabloları tanımlanır
- Gerçekçi çalışan verileri içerir

---

## ❓ Soru

**“Satış” departmanında görevli çalışanların isimlerini ve pozisyonlarını listeleyin.  
Ayrıca maaşı 20000 TL’nin altında olanlar için “Zam Öner”, diğerleri için “Yeterli” şeklinde yorumlayan bir sütun oluşturun.**

---


## 🔍 Adım Adım Sorgu Gelişimi

### 🧩 Adım 1: Çalışan verilerini görelim

```sql
SELECT * FROM s14.Employees;
```

İlk olarak `Employees` tablosundaki tüm çalışanları görüyoruz. Bu tabloda çalışan adı, departman ID'si, pozisyon ID'si ve maaş bilgileri yer alır. Ancak departman adı ve pozisyon unvanı doğrudan görünmez.

---

### 🧩 Adım 2: Departman adını eklemek için `JOIN`

```sql
SELECT e.FullName, d.DepartmentName
FROM s14.Employees AS e
JOIN s14.Departments AS d ON e.DepartmentID = d.DepartmentID;
```

Bu adımda `Employees` tablosunu `Departments` ile birleştiriyoruz. Artık çalışanın hangi departmanda olduğunu görebiliyoruz.

---

### 🧩 Adım 3: Sadece “Satış” departmanını filtrele

```sql
SELECT e.FullName, d.DepartmentName
FROM s14.Employees AS e
JOIN s14.Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Satış';
```

Bu filtre sayesinde yalnızca “Satış” departmanındaki çalışanlar listelenir.

---

### 🧩 Adım 4: Pozisyon unvanını da dahil et

```sql
SELECT e.FullName, d.DepartmentName, p.PositionTitle
FROM s14.Employees AS e
JOIN s14.Departments AS d ON e.DepartmentID = d.DepartmentID
JOIN s14.Positions AS p ON e.PositionID = p.PositionID
WHERE d.DepartmentName = 'Satış';
```

Bu sorguda artık her çalışanın departmanı ve pozisyon bilgisi birlikte listelenir.

---

### 🧩 Adım 5: Maaş durumunu değerlendiren `CASE` ifadesi ekleyelim

```sql
SELECT 
    e.FullName,
    p.PositionTitle,
    CASE 
        WHEN e.Salary < 20000 THEN 'Zam Öner'
        ELSE 'Yeterli'
    END AS MaaşDurumu
FROM s14.Employees AS e
JOIN s14.Departments AS d ON e.DepartmentID = d.DepartmentID
JOIN s14.Positions AS p ON e.PositionID = p.PositionID
WHERE d.DepartmentName = 'Satış';
```

`CASE` ifadesi, her çalışanın maaşına göre bir yorum ekler. 20000 TL altında ise “Zam Öner”, değilse “Yeterli” yazılır.

---

## ✅ Final Sorgu

```sql
SELECT 
    e.FullName,
    p.PositionTitle,
    CASE 
        WHEN e.Salary < 20000 THEN 'Zam Öner'
        ELSE 'Yeterli'
    END AS MaaşDurumu
FROM s14.Employees AS e
JOIN s14.Departments AS d ON e.DepartmentID = d.DepartmentID
JOIN s14.Positions AS p ON e.PositionID = p.PositionID
WHERE d.DepartmentName = 'Satış';
```

---


## 📚 Kullanılan SQL Kavramları

| Fonksiyon / Komut | Açıklama |
|-------------------|----------|
| `SELECT` | Belirli alanları sorgulamak için kullanılır |
| `JOIN` | Tablolar arası ilişki kurmak için kullanılır |
| `WHERE` | Koşullu filtreleme yapar |
| `CASE` | Koşula göre farklı değer döndüren sütun oluşturur |
| `AS` | Sütuna takma ad verir |

---

## 🔎 Fonksiyon Örnekleri

### `CASE` – Maaş değerlendirmesi

```sql
SELECT 
    FullName,
    Salary,
    CASE 
        WHEN Salary < 20000 THEN 'Zam Öner'
        ELSE 'Yeterli'
    END AS Durum
FROM s14.Employees;
```

### `JOIN` – Tabloları birleştirme

```sql
SELECT e.FullName, d.DepartmentName
FROM s14.Employees e
JOIN s14.Departments d ON e.DepartmentID = d.DepartmentID;
```
