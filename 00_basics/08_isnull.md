# 📘 08_isnull.md – ISNULL() Fonksiyonu

## 🧠 Nedir?

`ISNULL()` fonksiyonu, bir değerin `NULL` olup olmadığını kontrol eder.  
Eğer ifade `NULL` ise, yerine verilen yedek değeri döndürür.

Temel sözdizimi:
```sql
ISNULL(ifade, yedek_deger)
```

## 🎯 Nerelerde Kullanılır?

- NULL değerleri yerine varsayılan değer atamak
- Raporlama sırasında boş alanları doldurmak
- CONCAT gibi işlemlerde NULL nedeniyle bozulmayı engellemek
- NULL değer içeren sorgulara istikrar kazandırmak

## 🌍 Gerçek Senaryo

Bir ödeme raporunda bazı müşterilerin ödeme kaydı olmayabilir.  
Bu durumda `Amount` değeri `NULL` olarak döner.  
Rapor bozulmasın diye `ISNULL(Amount, 0)` şeklinde kullanılabilir.

## 🧪 10 Pratik Kullanım Örneği

1. NULL olan sipariş tutarlarını `0` olarak göster
2. Müşteri e-posta adresi yoksa 'Belirsiz' yaz
3. NULL maaşları 'Tanımsız' olarak göster
4. CONCAT işlemi içinde NULL'ları önle
5. Ödeme tarihleri boşsa 'Henüz Ödenmedi' yaz
6. NULL olan abonelik planlarını 'Standart' olarak göster
7. NULL ürün stoklarını `0` ile değiştir
8. COUNT sonuçlarında NULL varsa sıfırla
9. JOIN sonrası gelen boş değerleri yorumla
10. CASE ile birlikte ISNULL kullanımı

## ⚠️ Dikkat Edilmesi Gerekenler

- `ISNULL()` yalnızca ilk `NULL` kontrolü yapar, çoklu alan için `COALESCE()` önerilir
- `ISNULL()` dönüş tipi ilk parametrenin veri tipidir, dönüşüm farkına dikkat edilmeli
- Sadece `NULL` değerleri etkiler, boş string veya sıfır etkilenmez