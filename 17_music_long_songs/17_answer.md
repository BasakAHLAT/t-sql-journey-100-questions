# 🎵 17 – Music Platform: Songs Longer Than 5 Minutes

## 📥 Dataset Kurulumu

Bu problemi çözmeden önce aşağıdaki SQL dosyasını indirip kendi SQL Server ortamınızda çalıştırmalısınız:

> **🎯 Dosya:** [`17_dataset.sql`](./17_dataset.sql)

Bu dosyada:
- `Artists` ve `Songs` tabloları tanımlanır
- Çeşitli uzunluklarda şarkı süreleriyle gerçekçi test verileri sağlanmıştır

---

## ❓ Soru

**Süresi 5 dakikadan uzun olan şarkıların isimlerini, sanatçısını ve şarkının kaç saniye sürdüğünü gösterin.**

---

## 🔍 Adım Adım Sorgu Gelişimi

### 🧩 Adım 1: Şarkı sürelerini görelim

```sql
SELECT * FROM s17.Songs;
```

---

### 🧩 Adım 2: Süresi 5 dakikadan (300 saniye) uzun şarkıları filtreleyelim

```sql
SELECT * 
FROM s17.Songs
WHERE DurationInSeconds > 300;
```

---

### 🧩 Adım 3: Şarkı ismi ve süresini gösterelim

```sql
SELECT SongName, DurationInSeconds 
FROM s17.Songs
WHERE DurationInSeconds > 300;
```

---

### 🧩 Adım 4: Sanatçıyı da dahil edelim

```sql
SELECT 
    s.SongName,
    a.ArtistName,
    s.DurationInSeconds
FROM s17.Songs AS s
JOIN s17.Artists AS a ON s.ArtistID = a.ArtistID
WHERE s.DurationInSeconds > 300;
```

---

## ✅ Final Sorgu

```sql
SELECT 
    s.SongName,
    a.ArtistName,
    s.DurationInSeconds
FROM s17.Songs AS s
JOIN s17.Artists AS a ON s.ArtistID = a.ArtistID
WHERE s.DurationInSeconds > 300;
```

---

## 📚 Kullanılan SQL Kavramları

| Fonksiyon / Komut | Açıklama |
|-------------------|----------|
| `JOIN` | Tabloları eşleştirmek için kullanılır |
| `WHERE` | Belirli bir koşula göre filtreleme yapar |
| `>` | Karşılaştırma operatörüdür (büyüktür) |

---

## 🔎 Örnek Kullanımlar

### Şarkı süresi karşılaştırması

```sql
SELECT * FROM s17.Songs
WHERE DurationInSeconds > 300;
```

### Sanatçı ile birleştirme

```sql
SELECT s.SongName, a.ArtistName
FROM s17.Songs s
JOIN s17.Artists a ON s.ArtistID = a.ArtistID;
```
