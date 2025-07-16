# 📘 09_case.md – CASE WHEN Kullanımı

## 🧠 Nedir?

`CASE` ifadesi, SQL’de koşullu ifadeler yazmak için kullanılır.  
Bir değer belirli bir şarta göre farklı sonuçlar alabilir.

Temel sözdizimi:
```sql
CASE
  WHEN koşul1 THEN sonuç1
  WHEN koşul2 THEN sonuç2
  ...
  ELSE varsayılan
END
```

## 🎯 Nerelerde Kullanılır?

- Koşullu sınıflandırmalar (örnek: 'yüksek maaş', 'düşük maaş')
- Verileri kategorilere ayırma
- Şarta göre sütun hesaplamak
- Raporlamada anlamlı etiketler üretmek

## 🌍 Gerçek Senaryo

Bir çalışan listesinde maaşı 10.000 TL'nin üzerinde olanları 'Yüksek Maaş' olarak etiketlemek, diğerlerini 'Normal' olarak göstermek için `CASE` kullanılır.

## 🧪 10 Pratik Kullanım Örneği

1. Maaşı 10.000 üzeri olanlara 'Yüksek Maaş' etiketi ver
2. Sipariş tutarına göre siparişleri sınıflandır ('Büyük', 'Orta', 'Küçük')
3. Ürün stoğu yoksa 'Tükenmiş', varsa 'Var'
4. Abonelik tipi 'Annual' ise indirim uygula
5. Ödeme tutarına göre puan hesapla
6. Etkinlik türünü etiketle ('Çevrimiçi', 'Fiziksel')
7. NULL email varsa 'Eksik', değilse 'Tamam'
8. Sayfa sayısına göre kitap sınıflandırması
9. Çalışan pozisyonuna göre mesaj üret
10. CASE içinde ISNULL kullanımı

## ⚠️ Dikkat Edilmesi Gerekenler

- `CASE` çok dallı koşullarda okunabilirliği zorlaştırabilir
- `ELSE` bölümü yazılmazsa ve koşul sağlanmazsa sonuç `NULL` olur
- `CASE` çıktısının veri tipi ilk `THEN` ifadesine göre belirlenir
- `CASE` sorgu içinde hem SELECT, hem WHERE, hem ORDER BY içinde kullanılabilir