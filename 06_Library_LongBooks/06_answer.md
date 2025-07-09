
# 📚 06 – Library: Long Books (500+ Pages)

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

> **🎯 Dosya:** [06_dataset.sql](./06_dataset.sql)

Bu dosya içerisinde:
- Gerekli **tabloların yapısı** (`Authors`, `Categories`, `Books`)
- Gerçekçi ve çeşitli **test verileri** yer almaktadır.

---

## ❓ Soru

**6. Bir kütüphane sisteminde, 500 sayfadan uzun kitapların adlarını, yazar isimlerini ve ait oldukları kategori adlarını listeleyin.**

---

## ✅ Çözüm

### 🧩 Adım 1: Tüm kitapları görelim

```sql
SELECT *
FROM s06.Books;
```

Kitap tablosundaki tüm kitapları görüntüleyerek veri yapısını ve hangi alanları filtreleyeceğimizi anlamaya çalışıyoruz.

---

### 🧩 Adım 2: 500 sayfa üzeri kitapları filtrele

```sql
SELECT *
FROM s06.Books
WHERE PageCount > 500;
```

Bu sorgu yalnızca `PageCount` değeri 500’den büyük olan kitapları getirir.

---

### 🧩 Adım 3: Yalnızca başlık ve sayfa sayısını göster

```sql
SELECT Title, PageCount
FROM s06.Books
WHERE PageCount > 500;
```

İlgili sütunları seçerek çıktıyı sadeleştiriyoruz.

---

### 🧩 Adım 4: Yazar bilgilerini ekleyelim – `LEFT JOIN` ile

```sql
SELECT b.Title, b.PageCount, a.AuthorName
FROM s06.Books AS b
LEFT JOIN s06.Authors AS a ON b.AuthorID = a.AuthorID
WHERE b.PageCount > 500;
```

Kitabın yazar bilgisi için `Authors` tablosuyla `LEFT JOIN` yapıyoruz.

---

### 🧩 Adım 5: Kategori bilgisi de eklensin

```sql
SELECT b.Title, b.PageCount, a.AuthorName, c.CategoryName
FROM s06.Books AS b
LEFT JOIN s06.Authors AS a ON b.AuthorID = a.AuthorID
LEFT JOIN s06.Categories AS c ON b.CategoryID = c.CategoryID
WHERE b.PageCount > 500;
```

Kitabın ait olduğu kategori bilgisi de eklendi. Tablolar `LEFT JOIN` ile birleştirildi.

---

### 🧩 Final Sorgu

```sql
SELECT b.Title AS KitapAdi, b.PageCount AS SayfaSayisi, 
       a.AuthorName, c.CategoryName
FROM s06.Books AS b
LEFT JOIN s06.Authors AS a ON b.AuthorID = a.AuthorID
LEFT JOIN s06.Categories AS c ON b.CategoryID = c.CategoryID
WHERE b.PageCount > 500;
```

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Fonksiyon / Konsept | Açıklama |
|----------------------|----------|
| `LEFT JOIN`          | Eşleşmeyen kayıtlar dahil olmak üzere tabloyu birleştirir |
| `WHERE`              | Şart eklemek için kullanılır |
| `>`                  | Sayısal büyüklük karşılaştırması yapar |
| `AS`                 | Sütunlara takma ad (alias) vermek için kullanılır |

---

### JOIN – Tablo Birleştirme

```sql
SELECT b.Title, a.AuthorName
FROM s06.Books b
LEFT JOIN s06.Authors a ON b.AuthorID = a.AuthorID;
```

### WHERE – Filtreleme

```sql
SELECT *
FROM s06.Books
WHERE PageCount > 500;
```

### AS – Takma Ad Kullanımı

```sql
SELECT Title AS KitapAdi
FROM s06.Books;
```

