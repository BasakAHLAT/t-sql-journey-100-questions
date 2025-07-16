# 📘 06_convert.md – CONVERT() Fonksiyonu

## 🧠 Nedir?

`CONVERT()` fonksiyonu, bir veriyi başka bir veri tipine dönüştürmek için kullanılır.  
Ayrıca `DATETIME` verisini farklı **stil** kodlarıyla biçimlendirmek için de kullanılır.  
`CAST()` fonksiyonu gibi çalışır ama `CONVERT` daha çok tarih formatı kontrolünde tercih edilir.

Temel sözdizimi:
```sql
CONVERT(hedef_veri_tipi, ifade [, stil_kodu])
```

## 🎯 Nerelerde Kullanılır?

- `DATETIME` türünü `DATE` ya da `VARCHAR` formatına çevirmek
- Tarihleri belirli bir biçimde göstermek (örn. `dd.mm.yyyy`)
- Sayı veya metin veri tipleri arasında dönüşüm yapmak

## 🌍 Gerçek Senaryo

Bir raporda tarihleri `dd.mm.yyyy` biçiminde göstermek istiyorsanız,  
`CONVERT(VARCHAR, OrderDate, 104)` şeklinde bir kullanım tercih edilir.

## 🧪 10 Pratik Kullanım Örneği

1. Sipariş tarihini sadece `DATE` formatına çevir
2. Ödeme tarihini `'dd.mm.yyyy'` biçiminde göster (stil 104)
3. Yayın tarihini `'yyyy-mm-dd'` formatında göster (stil 120)
4. `FLOAT` değeri `VARCHAR`'a çevir
5. `VARCHAR`'ı `INT`'e çevir (sayı metin)
6. `CONVERT()` ile saatli tarih döndür (stil 113)
7. Ödeme tutarını string olarak yazdır
8. Tarih ve saat verisini özel stil ile raporla
9. Tabloya tarih eklerken `GETDATE()` dönüşümü
10. `CAST()` yerine stil kontrolü gerektiğinde `CONVERT` kullan

## ⚠️ Dikkat Edilmesi Gerekenler

- `CONVERT()` tarih formatlarında `stil` kodları ile özelleştirme sağlar
- Tarih biçimlendirmede çok daha esnektir
- Dönüşüm hatası oluşursa sorgu başarısız olur
- `TRY_CONVERT()` hata riskine karşı alternatif olarak kullanılabilir