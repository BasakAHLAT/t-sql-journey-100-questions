# 🔁 20z – RECAP: Join + Date + ISNULL + CASE + DATEDIFF + COUNT + AVG + LEN

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

> **🎯 Dosya:** [`20z_dataset.sql`](./20z_dataset.sql)

Bu dosya içerisinde:
- Gerekli **tabloların yapısı** (`Customers`, `Orders`, `OrderDetails`, `Products`, `Categories`, `Subscriptions`)
- Gerçekçi ve çeşitli **test verileri**
yer almaktadır.

> 🧠 **Not:** Bu veri seti, bu GitHub reposuna özel olarak, ilk 20 problemin kavramlarını pekiştirmek amacıyla **yapay zeka tarafından oluşturulmuştur**.

---

## ❓ Soru

**Son 30 gün içinde kayıt olmuş ve en az bir sipariş vermiş müşterilerin:**

- Adı ve e-posta adresi  
- Toplam sipariş sayısı  
- Siparişlerinde geçen ürün isimlerinin ortalama karakter uzunluğu  
- Ürün kategorisi (yoksa “Bilinmiyor”)  
- Aboneliklerinin bitmesine kaç gün kaldığı (“Süresi Dolmuş” etiketiyle)  

bilgilerini listeleyin.

---

## ✅ Çözüm

### 🧩 Adım 1: İlgili tabloları birleştiriyoruz

```sql
SELECT 
    c.FullName,
    c.Email,
    o.OrderID,
    p.ProductName,
    cat.CategoryName,
    s.EndDate
FROM s20zrecap.Customers AS c
JOIN s20zrecap.Orders AS o ON c.CustomerID = o.CustomerID
JOIN s20zrecap.OrderDetails AS od ON o.OrderID = od.OrderID
JOIN s20zrecap.Products AS p ON od.ProductID = p.ProductID
LEFT JOIN s20zrecap.Categories AS cat ON p.CategoryID = cat.CategoryID
JOIN s20zrecap.Subscriptions AS s ON c.CustomerID = s.CustomerID;
```

---

### 🧩 Adım 2: Kayıt tarihi son 30 günü filtrele

```sql
WHERE c.RegistrationDate >= CAST(DATEADD(DAY, -30, GETDATE()) AS DATE)
```

---

### 🧩 Adım 3: Kategori bilgisi olmayanlar için “Bilinmiyor” göster

```sql
ISNULL(cat.CategoryName, 'Bilinmiyor') AS ProductCategory
```

---

### 🧩 Adım 4: Abonelik durumu – kaç gün kaldı ya da süresi dolmuş mu?

```sql
CASE 
    WHEN DATEDIFF(DAY, GETDATE(), s.EndDate) < 0 THEN 'Süresi Dolmuş'
    ELSE CAST(DATEDIFF(DAY, GETDATE(), s.EndDate) AS VARCHAR)
END AS DaysUntilEnd
```

---

### 🧩 Adım 5: Sipariş sayısı ve ürün adı uzunluğu için `COUNT()` ve `AVG(LEN())`

```sql
COUNT(DISTINCT o.OrderID) AS TotalOrders,
AVG(LEN(p.ProductName)) AS AvgProductNameLength
```

---

### 🧩 Final Sorgu

```sql
SELECT 
    c.FullName,
    c.Email,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    AVG(LEN(p.ProductName)) AS AvgProductNameLength,
    ISNULL(cat.CategoryName, 'Bilinmiyor') AS ProductCategory,
    CASE 
        WHEN DATEDIFF(DAY, GETDATE(), s.EndDate) < 0 THEN 'Süresi Dolmuş'
        ELSE CAST(DATEDIFF(DAY, GETDATE(), s.EndDate) AS VARCHAR)
    END AS DaysUntilEnd
FROM s20zrecap.Customers AS c
JOIN s20zrecap.Orders AS o ON c.CustomerID = o.CustomerID
JOIN s20zrecap.OrderDetails AS od ON o.OrderID = od.OrderID
JOIN s20zrecap.Products AS p ON od.ProductID = p.ProductID
LEFT JOIN s20zrecap.Categories AS cat ON p.CategoryID = cat.CategoryID
JOIN s20zrecap.Subscriptions AS s ON c.CustomerID = s.CustomerID
WHERE c.RegistrationDate >= CAST(DATEADD(DAY, -30, GETDATE()) AS DATE)
GROUP BY c.FullName, c.Email, cat.CategoryName, s.EndDate;
```

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Fonksiyon / Konsept | Açıklama |
|----------------------|----------|
| `JOIN`, `LEFT JOIN`  | Tablo birleştirme |
| `GETDATE()`          | Şu anki tarih |
| `DATEADD()`          | Tarih ileri/geri gitme |
| `CAST(... AS DATE)`  | Saat kısmını silme |
| `ISNULL()`           | Boş değer yerine varsayılan |
| `CASE`               | Koşullu değer döndürme |
| `DATEDIFF()`         | İki tarih arasındaki fark |
| `COUNT()`            | Satır/alan sayımı |
| `AVG()`, `LEN()`     | Ortalama uzunluk hesaplama |
