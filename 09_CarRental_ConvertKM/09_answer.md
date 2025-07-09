
# 🚗 09 – Car Rental: Cars Under 50,000 KM

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

> **🎯 Dosya:** [`09_dataset.sql`](./09_dataset.sql)

Bu dosya içerisinde:
- Gerekli **tabloların yapısı** (`Cars`)
- Gerçekçi ve çeşitli **test verileri**
yer almaktadır.

> 🧠 **Not:** Kilometre değerleri `NVARCHAR` olarak saklanmış, bu da veri tipi dönüşümünü gerektirir.

---

## ❓ Soru

**9. Araç kiralama sisteminde, `TRY_CONVERT` kullanarak kilometresi 50.000’den az olan araçların model, plaka ve km bilgilerini yazdırın.**

---

## ✅ Çözüm

### 🧩 Adım 1: Veri tipini çevirmeden sorgu

```sql
SELECT *
FROM s09.Cars;
```

---

### 🧩 Adım 2: `TRY_CONVERT` ile kilometre dönüşümünü test et

```sql
SELECT CarID, Model, Plate, Kilometer, TRY_CONVERT(INT, Kilometer) AS DönüşmüşKM
FROM s09.Cars;
```

Bu adımda:
- `Kilometer` verisi `NVARCHAR` olduğu için doğrudan filtrelenemez
- `TRY_CONVERT` fonksiyonu, yalnızca **geçerli** dönüşümleri başarıyla gerçekleştirir
- Geçersiz veriler için `NULL` döner (örneğin `'48000 KM'`, `'NaN'` gibi)

---

### 🧩 Adım 3: 50.000 km altındaki araçları filtrele

```sql
SELECT Model, Plate, Kilometer
FROM s09.Cars
WHERE TRY_CONVERT(INT, Kilometer) < 50000;
```

Bu sorgu:
- `Kilometer` verisini güvenli şekilde `INT`’e çevirir
- Sadece dönüşebilen ve 50.000’den küçük olanları döndürür
- `TRY_CONVERT` başarısız olursa `NULL` döner ve `WHERE` filtresine takılmaz (yani dışlanır)

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Fonksiyon / Konsept     | Açıklama |
|--------------------------|----------|
| `TRY_CONVERT(data_type, value)` | Değer uygun biçimdeyse dönüştürür, aksi halde `NULL` döner |
| `WHERE <`               | Sayısal karşılaştırma filtresi uygulamak için kullanılır |
| `NVARCHAR`              | Karakter tipi veri saklar; sayısal gibi görünse bile SQL tarafından sayı olarak tanınmaz |

---

## 🔍 TRY_CONVERT ile Güvenli Dönüşüm

`TRY_CONVERT` fonksiyonu, özellikle **hatalı veri girişlerini dışlamak** için çok yararlıdır.

```sql
-- Geçerli dönüşüm (döner)
SELECT TRY_CONVERT(INT, '49000');  -- Sonuç: 49000

-- Geçersiz dönüşüm (NULL döner)
SELECT TRY_CONVERT(INT, '49.000');    -- Sonuç: NULL
SELECT TRY_CONVERT(INT, 'NaN');       -- Sonuç: NULL
SELECT TRY_CONVERT(INT, '48000 KM');  -- Sonuç: NULL
```

Bu örneklerde olduğu gibi, hatalı değerler filtre dışında kalır.

---

## ❗ Alternatif: TRY_CAST

`TRY_CAST()` de benzer şekilde çalışır ancak SQL Server’ın sürümüne göre farklı davranışlar gösterebilir.  
Genelde `TRY_CONVERT()` daha geniş tip desteğine sahiptir.

---

### Geçersiz veri kontrolü

```sql
SELECT *
FROM s09.Cars
WHERE TRY_CONVERT(INT, Kilometer) IS NULL;
```

Bu sorgu:
- Sayıya çevrilemeyen değerleri yakalar
- Veri kalitesini test etmek için kullanışlıdır
