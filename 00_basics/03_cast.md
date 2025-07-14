# 📘 03_cast.md – CAST() Fonksiyonu

## 🧠 Nedir?

`CAST()` fonksiyonu, bir veri tipini başka bir veri tipine dönüştürmek için kullanılır. Örneğin bir `VARCHAR` değeri `INT`'e çevirmek veya `DATETIME` verisini sadece `DATE` tipine çevirmek gibi.

Temel sözdizimi:
```sql
CAST(ifade AS hedef_veri_tipi)
```

## 🎯 Nerelerde Kullanılır?

- Veri tipleri uyumsuz olduğunda dönüşüm sağlamak
- Tarih veya sayı değerleriyle işlem yapabilmek
- CONCAT gibi işlemlerde sayı-tarih-string uyumu sağlamak
- Karşılaştırmalarda `DATETIME` yerine `DATE` kullanmak

## 🌍 Gerçek Senaryo

Bir sipariş sisteminde, `OrderDate` sütunu `DATETIME` tipindedir.  
Günlük raporlama yaparken sadece tarihin kendisiyle ilgilenmek istenebilir.  
Bu durumda: `CAST(OrderDate AS DATE)` ifadesi kullanılabilir.

## 🧪 10 Pratik Kullanım Örneği

1. `DATETIME`'ı `DATE`'e çevir (sadece tarih kısmı)
2. Sayı olan metni `INT`'e çevir
3. Tamsayıyı `VARCHAR`'a çevir
4. `DECIMAL`'ı `INT`'e çevirerek yuvarlama
5. `FLOAT`'ı `VARCHAR` olarak yazdırmak
6. `Salary` gibi alanları string olarak göstermek
7. Tarihleri metin formatında birleştirmek
8. `JOIN` yapılırken veri tipi uyuşmazlığını düzeltmek
9. Tarih filtrelerinde saat etkisini sıfırlamak
10. Yanlış girilen verilerde dönüşümle hata önlemek

## ⚠️ Dikkat Edilmesi Gerekenler

- `CAST()` dönüşümü başarısız olursa hata verir (TRY_CAST daha güvenlidir).
- Uygun veri tipi eşleşmesi yoksa sorgu çalışmaz.
- `CAST(... AS DATE)` dönüşümünde saat bilgisi kaybolur.
- `CAST` dönüşümleri sonucu veri kaybı olabilir (örneğin `DECIMAL` → `INT`)