-- 🧑‍💼 03 – HR: Employees Hired in 2025

-- Bu sorgunun amacı, 2025 yılında işe alınan çalışanların:
-- adını, pozisyonunu, departmanını ve işe alım tarihini listelemektir.

-- Adım 1: Tüm çalışanları ve işe alım tarihlerini görelim
-- SELECT * FROM s03.Employees;

-- Adım 2: 2025 yılında işe alınanları filtreleyelim
-- SELECT * FROM s03.Employees
-- WHERE HireDate >= '2025-01-01' AND HireDate < '2026-01-01';

-- Adım 3: Çalışan pozisyon bilgisi için JOIN kullanalım
-- SELECT emp.FirstName, pos.PositionTitle, emp.HireDate
-- FROM s03.Employees AS emp
-- INNER JOIN s03.Positions AS pos ON emp.PositionID = pos.PositionID
-- WHERE emp.HireDate >= '2025-01-01' AND emp.HireDate < '2026-01-01';

-- Adım 4: Departman bilgisi için ikinci bir JOIN yapalım

SELECT 
    emp.FirstName,
    dep.DepartmentName,
    pos.PositionTitle,
    emp.HireDate
FROM s03.Employees AS emp
INNER JOIN s03.Positions AS pos ON emp.PositionID = pos.PositionID
INNER JOIN s03.Departments AS dep ON pos.DepartmentID = dep.DepartmentID
WHERE emp.HireDate >= '2025-01-01' AND emp.HireDate < '2026-01-01';

-- Açıklamalar:
-- INNER JOIN: Yalnızca eşleşen verileri getirir (her çalışanın pozisyonu ve pozisyonun departmanı olmalı)
-- AS: Tabloya kısa isim vererek okunabilirliği artırır
-- ON: İki tabloyu hangi alan üzerinden ilişkilendireceğimizi belirtir
-- WHERE: Yalnızca 2025 yılı içinde işe alınanları seçmek için tarih filtresi