# 🧑‍💼 03 – HR System: Employees Hired in 2025

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce aşağıdaki SQL dosyasını indirip kendi SQL Server ortamınızda çalıştırmalısınız:

> **🎯 Dosya:** [`03_dataset.sql`](./03_dataset.sql)

Bu dosyada:
- `Departments`, `Positions`, `Employees` tabloları yer almaktadır
- Her çalışanın pozisyonu, her pozisyonun da bir departmanı bulunmaktadır

---

## ❓ Soru

**2025 yılında işe alınan tüm çalışanların adlarını, departmanlarını, pozisyonlarını ve işe alım tarihlerini listeleyin.**

---

## 🔍 Adım Adım Sorgu Gelişimi

### 🧩 Adım 1: Çalışanları ve işe alım tarihlerini görelim

```sql
SELECT * FROM s03.Employees;
```

---

### 🧩 Adım 2: 2025 yılında işe alınanları filtreleyelim

```sql
SELECT * 
FROM s03.Employees
WHERE HireDate >= '2025-01-01' AND HireDate < '2026-01-01';
```

---

### 🧩 Adım 3: Pozisyonları dahil etmek için `JOIN` kullanalım

```sql
SELECT emp.FirstName, pos.PositionTitle, emp.HireDate
FROM s03.Employees AS emp
INNER JOIN s03.Positions AS pos ON emp.PositionID = pos.PositionID
WHERE emp.HireDate >= '2025-01-01' AND emp.HireDate < '2026-01-01';
```

---

### 🧩 Adım 4: Departmanları da dahil edelim

```sql
SELECT emp.FirstName, dep.DepartmentName, pos.PositionTitle, emp.HireDate
FROM s03.Employees AS emp
INNER JOIN s03.Positions AS pos ON emp.PositionID = pos.PositionID
INNER JOIN s03.Departments AS dep ON pos.DepartmentID = dep.DepartmentID
WHERE emp.HireDate >= '2025-01-01' AND emp.HireDate < '2026-01-01';
```

---

## ✅ Final Sorgu

```sql
SELECT emp.FirstName, dep.DepartmentName, pos.PositionTitle, emp.HireDate
FROM s03.Employees AS emp
INNER JOIN s03.Positions AS pos ON emp.PositionID = pos.PositionID
INNER JOIN s03.Departments AS dep ON pos.DepartmentID = dep.DepartmentID
WHERE emp.HireDate >= '2025-01-01' AND emp.HireDate < '2026-01-01';
```

---

## 📚 Kullanılan SQL Kavramları

| Yapı / Fonksiyon | Açıklama |
|------------------|----------|
| `INNER JOIN`     | İlişkili verileri bağlamak için kullanılır (eşleşen kayıtlar alınır) |
| `AS`             | Tablolara takma ad vermek için kullanılır |
| `ON`             | JOIN işleminin hangi alanlar üzerinden yapılacağını belirtir |
| `WHERE`          | Belirli bir koşula göre filtreleme yapar |

---

## 🔎 Örnek Kullanımlar

### INNER JOIN ve tarih filtresi

```sql
SELECT e.FirstName, p.PositionTitle
FROM s03.Employees e
JOIN s03.Positions p ON e.PositionID = p.PositionID
WHERE e.HireDate BETWEEN '2025-01-01' AND '2025-12-31';
```

### Çoklu JOIN ile tüm bilgileri alma

```sql
SELECT e.FirstName, d.DepartmentName, p.PositionTitle
FROM s03.Employees e
JOIN s03.Positions p ON e.PositionID = p.PositionID
JOIN s03.Departments d ON p.DepartmentID = d.DepartmentID;
```
