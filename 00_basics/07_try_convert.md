# 📘 07_try_convert.md – TRY_CONVERT() Fonksiyonu

## 🧠 Nedir?

`TRY_CONVERT()` fonksiyonu, `CONVERT()` ile benzer şekilde veri türleri arasında dönüşüm yapar.  
Ancak dönüşüm başarısız olursa hata fırlatmak yerine `NULL` döner.  
Bu özelliği sayesinde hata vermeyen, güvenli dönüşümler yapılabilir.

Temel sözdizimi:
```sql
TRY_CONVERT(hedef_veri_tipi, ifade [, stil_kodu])
```

## 🎯 Nerelerde Kullanılır?

- Metin olarak girilmiş sayıların güvenli şekilde `INT`’e çevrilmesi
- Hatalı veri içeren sütunlarda dönüşüm denemeleri
- Dış kaynaklardan gelen verilerin kontrolü
- Veri temizleme senaryoları

## 🌍 Gerçek Senaryo

Bir dış sistemden gelen ödeme verilerinde `Amount` sütunu zaman zaman metin şeklinde gelir.  
Bu metni `TRY_CONVERT(DECIMAL, Amount)` şeklinde dönüştürerek hata yerine `NULL` alabilirsiniz.

## 🧪 10 Pratik Kullanım Örneği

1. Sayı içeren metni `INT`'e dönüştür (hatalıysa `NULL`)
2. Tarih formatındaki metni `DATE`'e dönüştür
3. Bozuk metinleri güvenli şekilde `FLOAT`’a çevir
4. Yazar doğum yılını metinle karşılaştırırken dönüşüm kullan
5. Sabit metinler üzerinden örnek dönüşüm testleri
6. Liste içindeki hatalı veri dönüşümleri filtrele
7. TRY_CONVERT ile dönüşüm yapılabilen verileri göster
8. CONVERT yerine TRY_CONVERT ile hata önleme
9. INSERT sırasında veri dönüşümünü TRY_CONVERT ile güvenli yap
10. TRY_CONVERT ile geçerli olmayan tarihleri filtrele

## ⚠️ Dikkat Edilmesi Gerekenler

- Başarısız dönüşümde `NULL` döner, hata fırlatmaz
- `CONVERT()` fonksiyonuna çok benzer ama daha güvenlidir
- NULL değer dönüşümlerinde dikkatli olunmalı, `IS NULL` ile kontrol edilmelidir