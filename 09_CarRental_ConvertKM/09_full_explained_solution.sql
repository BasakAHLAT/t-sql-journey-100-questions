
-- 🚗 09 – Car Rental: Cars Under 50,000 KM

-- 📥 Dataset Kurulumu

-- Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:
-- 🎯 Dosya: [09_dataset.sql](./09_dataset.sql)

-- Bu dosya içerisinde:
-- - Gerekli tabloların yapısı (Cars)
-- - Gerçekçi ve çeşitli test verileri yer almaktadır.

-- 🧠 Not: Kilometre değerleri NVARCHAR olarak saklanmış, bu da veri tipi dönüşümünü gerektirir.

-- ❓ Soru
-- 9. Araç kiralama sisteminde, TRY_CONVERT kullanarak kilometresi 50.000’den az olan araçların model, plaka ve km bilgilerini yazdırın.

-- ✅ Çözüm

-- 🧩 Adım 1: Veri tipini çevirmeden sorgu
SELECT *
FROM s09.Cars;

-- 🧩 Adım 2: TRY_CONVERT ile kilometre dönüşümünü test et
SELECT CarID, Model, Plate, Kilometer, TRY_CONVERT(INT, Kilometer) AS DönüşmüşKM
FROM s09.Cars;

-- Bu adımda:
-- - Kilometer verisi NVARCHAR olduğu için doğrudan filtrelenemez
-- - TRY_CONVERT fonksiyonu, yalnızca geçerli dönüşümleri başarıyla gerçekleştirir
-- - Geçersiz veriler için NULL döner (örneğin '48000 KM', 'NaN' gibi)

-- 🧩 Adım 3: 50.000 km altındaki araçları filtrele
SELECT Model, Plate, Kilometer
FROM s09.Cars
WHERE TRY_CONVERT(INT, Kilometer) < 50000;

-- Bu sorgu:
-- - Kilometer verisini güvenli şekilde INT’e çevirir
-- - Sadece dönüşebilen ve 50.000’den küçük olanları döndürür
-- - TRY_CONVERT başarısız olursa NULL döner ve WHERE filtresine takılmaz (yani dışlanır)

-- 📚 Bu Problemde Öğrenilen Ana SQL Kavramları
-- Fonksiyon / Konsept     | Açıklama
-- TRY_CONVERT(data_type, value) | Değer uygun biçimdeyse dönüştürür, aksi halde NULL döner
-- WHERE <               | Sayısal karşılaştırma filtresi uygulamak için kullanılır
-- NVARCHAR              | Karakter tipi veri saklar; sayısal gibi görünse bile SQL tarafından sayı olarak tanınmaz

-- 🔍 TRY_CONVERT ile Güvenli Dönüşüm

-- TRY_CONVERT fonksiyonu, özellikle hatalı veri girişlerini dışlamak için çok yararlıdır. Veri kalitesini test etmek için kullanılır.

-- TRY_CONVERT(hedef_veri_tipi, dönüştürülecek_değer)

-- - Eğer dönüşüm başarılıysa, dönüştürülmüş değeri verir.
-- - Eğer dönüşüm başarısızsa, hata vermez, bunun yerine NULL döndürür.

-- 🎯 Ne zaman kullanılır?
-- Eğer bir kolonda sayı gibi görünen ama aslında yazı (string) olarak saklanan değerler varsa ve bu değerlerin bazıları hatalıysa, TRY_CONVERT hatasız çalışmak için idealdir.

-- 🔬 Örnekler

-- Veri sütunu: Kilometer (NVARCHAR)
-- İçerik:
-- '48000'
-- '49999'
-- '48000 KM'
-- 'NaN'
-- '50.000'
-- 'abc'

-- Bu çalışmaz (hata verir)
-- SELECT CAST(Kilometer AS INT) FROM s09.Cars;

-- Bu güvenlidir
SELECT TRY_CONVERT(INT, Kilometer) AS SayisalKM FROM s09.Cars;

-- Sonuç tablosu:
-- '48000'       → 48000
-- '49999'       → 49999
-- '48000 KM'    → NULL
-- 'NaN'         → NULL
-- '50.000'      → NULL
-- 'abc'         → NULL

-- ✅ Filtrelemede Nasıl Kullanılır?
SELECT Model, Plate, Kilometer
FROM s09.Cars
WHERE TRY_CONVERT(INT, Kilometer) < 50000;

-- Bu sorgu:
-- - Sayıya çevrilebilen verilerde filtre yapar
-- - Hatalı girilmiş değerler (NULL olanlar) otomatik olarak dışlanır
