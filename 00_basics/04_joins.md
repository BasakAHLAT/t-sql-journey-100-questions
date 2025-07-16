# 📘 04_joins.md – JOIN Kullanımı (INNER, LEFT, RIGHT, FULL, CROSS)

## 🧠 Nedir?

`JOIN`, birden fazla tablodaki verileri ilişkilendirmek için kullanılır. SQL Server'da en yaygın JOIN türleri:

- `INNER JOIN` – Her iki tabloda da eşleşen kayıtları getirir.
- `LEFT JOIN` – Sol tablodaki tüm kayıtları, sağ tablodan eşleşenlerle birlikte getirir.
- `RIGHT JOIN` – Sağ tablodaki tüm kayıtları, sol tablodan eşleşenlerle birlikte getirir.
- `FULL JOIN` – Her iki tablodaki tüm kayıtları getirir, eşleşme yoksa `NULL` döner.
- `CROSS JOIN` – İki tabloyu çarprazlar (kartesyen çarpım).

## 🎯 Nerelerde Kullanılır?

- Sipariş ile müşteri ilişkisini kurmak
- Ürün ve kategori eşleşmeleri yapmak
- Boş ilişkileri (örneğin hiç sipariş vermemiş müşteri) bulmak
- Etkinliklere katılan kullanıcıları listelemek
- Birden fazla tabloyu birleştirerek rapor oluşturmak

## 🌍 Gerçek Senaryo

Bir e-ticaret sisteminde sipariş listesini, her siparişin hangi müşteriye ait olduğunu göstererek listelemek için `INNER JOIN` kullanılır.  
Hiç sipariş vermemiş müşterileri görmek için `LEFT JOIN` ve `IS NULL` birlikte kullanılır.

## 🧪 30 Farklı Pratik JOIN Kullanımı

İlk 5 örnek:

1. `INNER JOIN` ile sipariş-müşteri bilgisi
2. `LEFT JOIN` ile siparişi olmayan müşteriler
3. `RIGHT JOIN` ile çalışan-departman eşleşmesi
4. `FULL JOIN` ile tüm müşteri ve ödeme bilgileri
5. `CROSS JOIN` ile kategori ve ürün tüm kombinasyonları

Devamındaki örneklerde:
- Çoklu JOIN
- Filtreli JOIN
- GROUP BY ile JOIN
- NULL kontrolüyle JOIN
- Tarihli JOIN
- ON yerine USING benzeri mantıkla JOIN

...

(Tam 30 örnek, `.sql` dosyasında yer almaktadır)

## ⚠️ Dikkat Edilmesi Gerekenler

- `INNER JOIN` sadece eşleşenleri getirir, eksik veri görünmeyebilir.
- `LEFT JOIN` ve `RIGHT JOIN` yön farkı önemlidir.
- `CROSS JOIN` çok büyük veri oluşturabilir, dikkatli kullanılmalı.
- JOIN sonrası filtreleme yapılırken `NULL` kontrollerine dikkat edilmeli.