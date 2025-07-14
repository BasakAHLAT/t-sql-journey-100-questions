-- 🧑‍💼 14 – HR System: Sales Department Employees

-- Bu sorgunun amacı: Satış departmanındaki çalışanların isimlerini ve pozisyonlarını listelemek.
-- Ayrıca maaşı 20000 TL’nin altında olanlar için “Zam Öner”, diğerleri için “Yeterli” diyen bir sütun eklemektir.

-- Adım 1: Çalışan verilerini görelim
-- SELECT * FROM s14.Employees;

-- Adım 2: Departman adını eklemek için JOIN
-- SELECT e.FullName, d.DepartmentName
-- FROM s14.Employees AS e
-- JOIN s14.Departments AS d ON e.DepartmentID = d.DepartmentID;

-- Adım 3: Sadece “Satış” departmanını filtrele
-- SELECT e.FullName, d.DepartmentName
-- FROM s14.Employees AS e
-- JOIN s14.Departments AS d ON e.DepartmentID = d.DepartmentID
-- WHERE d.DepartmentName = 'Satış';

-- Adım 4: Pozisyon unvanını da dahil et
-- SELECT e.FullName, d.DepartmentName, p.PositionTitle
-- FROM s14.Employees AS e
-- JOIN s14.Departments AS d ON e.DepartmentID = d.DepartmentID
-- JOIN s14.Positions AS p ON e.PositionID = p.PositionID
-- WHERE d.DepartmentName = 'Satış';

-- Adım 5: Maaş durumunu değerlendiren CASE ifadesi ekleyelim

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

-- Kullanılan Fonksiyonlar ve Komutlar:
-- SELECT: Belirli alanları sorgulamak için kullanılır
-- JOIN: Tablolar arası ilişki kurmak için
-- WHERE: Satırları filtrelemek için
-- CASE: Koşula bağlı sütun oluşturmak için
-- AS: Sütunlara takma ad vermek için