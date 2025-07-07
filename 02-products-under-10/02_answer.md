# 🛍️ 02 – Product Catalog: Price < 10 USD

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

> **🎯 Dosya:** [`02_dataset.sql`](./02_dataset.sql)

Bu dosya içerisinde:
- Gerekli **tabloların yapısı** (`Categories`, `Products`)
- Gerçekçi ve çeşitli **test verileri**
yer almaktadır.

> 🧠 **Not:** Bu veri seti, bu GitHub reposuna özel olarak, senaryo tabanlı SQL problemlerinin çözümünü desteklemek amacıyla **yapay zeka tarafından oluşturulmuştur**.

Tüm verileri başarıyla yükledikten sonra sorgularınızı rahatlıkla test edebilirsiniz.

---

## ❓ Soru

**2. Bir ürün kataloğunda, fiyatı 10 doların altında olan tüm ürünlerin adlarını, fiyatlarını ve kategorilerini listeleyin.**

---

## ✅ Çözüm

### 🧩 Adım 1: Temel sorguyla başlıyoruz

```sql
SELECT * 
FROM dbo.Products;
```

Bu sorgu, `Products` tablosundaki tüm verileri getirir.  
Henüz fiyat veya kategoriyle ilgili herhangi bir filtre uygulanmamıştır.

---

### 🧩 Adım 2: Fiyat filtresi ekleniyor

```sql
SELECT * 
FROM dbo.Products
WHERE Price < 10;
```

Bu haliyle yalnızca **fiyatı 10 doların altında olan ürünler** listelenir.  
Ancak kategori bilgisi henüz dahil değildir.

---

### 🧩 Adım 3: Kategori bilgisi için `JOIN`

```sql
SELECT * 
FROM dbo.Products AS P
INNER JOIN dbo.Categories AS C
    ON P.CategoryID = C.CategoryID
WHERE P.Price < 10;
```

Bu sorgu:
- `Products` ve `Categories` tablolarını birleştirir
- Ancak `SELECT *` hâlâ fazla bilgi getirir

---

### 🧩 Adım 4: Gerekli sütunlara indirgeme

```sql
SELECT 
    P.ProductName,
    P.Price,
    C.CategoryName
FROM dbo.Products AS P
INNER JOIN dbo.Categories AS C
    ON P.CategoryID = C.CategoryID
WHERE P.Price < 10;
```

Bu haliyle:
- Sadece ürün adı, fiyat ve kategori adı gösterilir
- En okunabilir ve optimize hali budur
