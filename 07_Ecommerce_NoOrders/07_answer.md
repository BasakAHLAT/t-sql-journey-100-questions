
# 🛍️ 07 – E-commerce: Customers with No Orders

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

> **🎯 Dosya:** [`07_dataset.sql`](./07_dataset.sql)

Bu dosya içerisinde:
- Gerekli **tabloların yapısı** (`Customers`, `Orders`)
- Gerçekçi ve çeşitli **test verileri**
yer almaktadır.

> 🧠 **Not:** Bu veri seti, senaryo tabanlı SQL öğrenimini desteklemek amacıyla **yapay zeka tarafından oluşturulmuştur**.

---

## ❓ Soru

**7. Sipariş sisteminde, hiç sipariş vermemiş müşterilerin adlarını ve e-posta adreslerini listeleyin.**

---

## ✅ Çözüm

### 🧩 Adım 1: Müşteri tablosunu görelim

```sql
SELECT * FROM s07.Customers;
```

---

### 🧩 Adım 2: Sipariş tablosunu görelim

```sql
SELECT * FROM s07.Orders;
```

---

### 🧩 Adım 3: RIGHT JOIN ile tüm müşterileri ve siparişlerini eşleştir

```sql
SELECT * 
FROM s07.Orders AS o
RIGHT JOIN s07.Customers AS c
ON o.CustomerID = c.CustomerID;
```

Bu sorgu:
- `Customers` tablosunu sağ tarafa koyar ve `Orders` ile birleştirir.
- Böylece sipariş verisi olmayan müşteriler de listelenir (NULL ile).

---

### 🧩 Adım 4: Sadece siparişi olmayanları filtrele

```sql
SELECT * 
FROM s07.Orders AS o
RIGHT JOIN s07.Customers AS c
ON o.CustomerID = c.CustomerID
WHERE o.CustomerID IS NULL;
```

---

### 🧩 Adım 5: Sadece isim ve e-posta alanlarını göster

```sql
SELECT c.CustomerName, c.Email
FROM s07.Orders AS o
RIGHT JOIN s07.Customers AS c
ON o.CustomerID = c.CustomerID
WHERE o.CustomerID IS NULL;
```

Bu son haliyle:
- Sipariş vermemiş müşteriler filtrelenir
- Sadece istenen sütunlar (`CustomerName`, `Email`) döndürülür

---

## 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| Fonksiyon / Konsept | Açıklama |
|---------------------|----------|
| `RIGHT JOIN`        | Sağdaki tüm kayıtları alır, eşleşmeyen sol taraf NULL olur |
| `IS NULL`           | Değeri olmayan (boş) satırları bulmak için kullanılır |

---

### RIGHT JOIN Kullanımı Örneği

```sql
SELECT *
FROM s07.Orders AS o
RIGHT JOIN s07.Customers AS c
ON o.CustomerID = c.CustomerID;
```

---

### IS NULL Kullanımı Örneği

```sql
SELECT *
FROM s07.Orders AS o
RIGHT JOIN s07.Customers AS c
ON o.CustomerID = c.CustomerID
WHERE o.CustomerID IS NULL;
```

