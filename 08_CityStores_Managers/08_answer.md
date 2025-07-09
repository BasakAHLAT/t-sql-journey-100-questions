
# 🏙️ 08 – City Management: Stores in İstanbul

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

> **🎯 Dosya:** [`08_dataset.sql`](./08_dataset.sql)

Bu dosya içerisinde:
- Gerekli **tabloların yapısı** (`Regions`, `Managers`, `Stores`)
- Gerçekçi ve çeşitli **test verileri**
yer almaktadır.

> 🧠 **Not:** Bu veri seti, senaryo tabanlı SQL öğrenimini desteklemek amacıyla **yapay zeka tarafından oluşturulmuştur**.

---

## ❓ Soru

**8. Bir şehir yönetimi sisteminde, İstanbul ilindeki mağazaların isimlerini, bağlı olduğu bölgeyi ve mağaza yöneticisinin adını gösterin.**

---

## ✅ Çözüm

### 🧩 Adım 1: İstanbul’daki mağazaları listele

```sql
SELECT * 
FROM s08.Stores
WHERE City = 'İstanbul';
```

---

### 🧩 Adım 2: Region bilgisi ekleyelim

```sql
SELECT s.StoreName, s.City, r.RegionName
FROM s08.Stores AS s
JOIN s08.Regions AS r ON s.RegionID = r.RegionID
WHERE s.City = 'İstanbul';
```

---

### 🧩 Adım 3: Manager bilgisi de ekleyelim

```sql
SELECT s.StoreName, r.RegionName, m.ManagerName 
FROM s08.Stores AS s
INNER JOIN s08.Regions AS r
ON s.RegionID = r.RegionID
INNER JOIN s08.Managers AS m
ON s.ManagerID = m.ManagerID
WHERE s.City = 'İstanbul'
```

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Fonksiyon / Konsept | Açıklama |
|---------------------|----------|
| `JOIN`              | Tablo birleştirme işlemi yapar |
| `WHERE`             | Belirli filtrelemeleri uygular |
| `AS`                | Takma ad verir, okunabilirliği artırır |

---

### JOIN Kullanımı Örneği

```sql
SELECT *
FROM s08.Stores AS s
JOIN s08.Regions AS r ON s.RegionID = r.RegionID;
```

---

### WHERE Kullanımı Örneği

```sql
SELECT *
FROM s08.Stores
WHERE City = 'İstanbul';
```

---

### AS Kullanımı Örneği

```sql
SELECT s.StoreName AS MagazaAdi
FROM s08.Stores AS s;
```
