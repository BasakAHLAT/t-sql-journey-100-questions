# 📦 04 – Order System: Last Month's Orders

## 📥 Dataset Kurulumu

Bu problemi çözmeye başlamadan önce, aşağıdaki SQL dosyasını indirmeniz ve kendi SQL Server ortamınızda çalıştırmanız gerekmektedir:

> **🎯 Dosya:** [`04_dataset.sql`](./04_dataset.sql)

Bu dosya içerisinde:
- Gerekli **tabloların yapısı** (`Customers`, `Orders`)
- Gerçekçi ve çeşitli **test verileri**
yer almaktadır.

> 🧠 **Not:** Bu veri seti, bu GitHub reposuna özel olarak, senaryo tabanlı SQL problemlerinin çözümünü desteklemek amacıyla **yapay zeka tarafından oluşturulmuştur**.

---

## ❓ Soru

**4. Bir sipariş yönetim sisteminde, son 1 ayda oluşturulmuş siparişlerin ID’sini ve sipariş tarihini listeleyin.**

---

## ✅ Çözüm

```sql
SELECT OrderID, OrderDate
FROM Orders
WHERE OrderDate >= DATEADD(DAY, -30, GETDATE());
```

---

# 📚 Bu Problemde Öğrenilen Ana SQL Kavramları

| 🧠 Fonksiyon / Yapı | 💬 Açıklama |
|---------------------|-------------|
| DATEADD()           | Belirtilen zamansal birimi mevcut tarihe ekler veya çıkarır. |
| GETDATE()           | SQL Server'da o anki sistem tarihini döndürür. |

---

### 1️⃣ DATEADD() – Tarihe Gün Ekleme veya Çıkarma

```sql
-- 30 gün geri git
SELECT DATEADD(DAY, -30, GETDATE());
```

### 2️⃣ GETDATE() – Bugünün Tarihi

```sql
SELECT GETDATE();
```

