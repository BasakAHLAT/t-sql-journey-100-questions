-- 🏥 20 – Hospital System: Today's Appointments

-- Bu sorgunun amacı: Bugün gerçekleşecek randevuların hasta adı, doktor adı ve randevu saatini listelemektir.

-- Adım 1: Randevu kayıtlarını inceleyelim
-- SELECT * FROM s20.Appointments;

-- Adım 2: Sadece bugünkü randevuları almak için tarih filtresi kullanılır.
-- GETDATE() ile mevcut tarih/saat alınır, TRY_CONVERT veya CAST ile sadece tarih kısmı karşılaştırılır.

-- CAST yöntemi:
-- WHERE CAST(a.AppointmentTime AS DATE) = CAST(GETDATE() AS DATE);

-- TRY_CONVERT yöntemi de CAST ile aynı işlevi görür ancak dönüştürülemeyen ifadelerde NULL döndürür.
-- TRY_CONVERT ile yazımı:
-- WHERE TRY_CONVERT(DATE, a.AppointmentTime) = TRY_CONVERT(DATE, GETDATE());

-- Adım 3: Hasta ve doktor bilgilerini JOIN ile dahil edelim:

SELECT 
    p.PatientName,
    d.DoctorName,
    a.AppointmentTime
FROM s20.Appointments AS a
INNER JOIN s20.Doctors AS d ON d.DoctorID = a.DoctorID
INNER JOIN s20.Patients AS p ON p.PatientID = a.PatientID
WHERE TRY_CONVERT(DATE, a.AppointmentTime) = TRY_CONVERT(DATE, GETDATE());

-- Açıklamalar:
-- TRY_CONVERT(DATE, ...): Hatalı dönüşümleri NULL olarak döndürür, CAST daha katıdır ve hata fırlatabilir
-- GETDATE(): Sistem tarih/saatini döndürür
-- INNER JOIN: İlgili hasta ve doktor bilgilerini alır
-- WHERE: Bugüne ait olan kayıtlar filtrelenir