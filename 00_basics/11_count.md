# 📘 10_count.md – COUNT() Fonksiyonu

## 🧠 Nedir?

`COUNT()` fonksiyonu, bir sorgudan dönen satırların sayısını verir.  
Belli bir sütundaki dolu (NULL olmayan) değerleri veya tüm satırları saymak için kullanılır.

Temel sözdizimi:
```sql
SELECT COUNT(*) FROM tablo;
SELECT COUNT(SütunAdi) FROM tablo;
```

## 🎯 Nerelerde Kullanılır?

- Toplam kayıt sayısını öğrenmek
- Belirli koşulları sağlayan satır sayısını hesaplamak
- `GROUP BY` ile birlikte grupların içindeki satırları saymak
- Raporlarda özet değer göstermek

## 🌍 Gerçek Senaryo

Bir yöneticinin raporunda, sistemde kayıtlı toplam müşteri sayısını veya son 30 günde verilen sipariş sayısını görmek istemesi gibi durumlarda kullanılır.

## 🧪 10 Pratik Kullanım Örneği

1. Sistemdeki toplam müşteri sayısı
2. Stokta ürünü olan ürün sayısı
3. Hiç sipariş verilmemiş müşteri sayısı (LEFT JOIN + IS NULL ile)
4. Her müşterinin verdiği sipariş sayısı (GROUP BY ile)
5. Her kategorideki ürün sayısı
6. Boş olmayan e-posta sayısı
7. Her departmandaki çalışan sayısı
8. Bugün yapılan ödeme sayısı
9. Yayınlanmış kitap sayısı
10. Abonelik planına göre müşteri sayısı

## ⚠️ Dikkat Edilmesi Gerekenler

- `COUNT(*)` tüm satırları sayar; `NULL` fark etmez
- `COUNT(Sütun)` sadece `NULL` olmayan değerleri sayar
- `COUNT(DISTINCT Sütun)` kullanarak benzersiz kayıtları sayabilirsin