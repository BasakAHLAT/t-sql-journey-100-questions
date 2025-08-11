
-- 🏨 23 – Hotel: Available Rooms by Date
-- Bu dosya, adım adım sorgu gelişimini açıklar.

-- 🔹 Adım 1: Odaları görelim

SELECT * 
FROM s23.Rooms;

-- Odalarla ilgili temel bilgiler geldi (numara, tip, kapasite).

-- 🔹 Adım 2: Belirli tarihte dolu olan odaları bulalım

SELECT RoomID 
FROM s23.Reservations
WHERE '2025-08-04' BETWEEN CheckInDate AND DATEADD(DAY, -1, CheckOutDate);

-- Bu sorgu, 4 Ağustos 2025 tarihinde hâlâ rezerve edilmiş odaları getirir.
-- Çıkış yapılan gün artık dolu kabul edilmez, bu nedenle DATEADD ile 1 gün çıkarılır.

-- 🔹 Adım 3: Dolu olmayan odaları filtrele

SELECT RoomNumber, RoomType, Capacity
FROM s23.Rooms
WHERE RoomID NOT IN (
    SELECT RoomID 
    FROM s23.Reservations
    WHERE '2025-08-04' BETWEEN CheckInDate AND DATEADD(DAY, -1, CheckOutDate)
);

-- 🔹 Final: Bu sorgu 2025-08-04 tarihinde müsait olan odaların listesini verir.
-- NOT IN kullanarak dolu odaları hariç tutarız.
