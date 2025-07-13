# 📘 01_getdate.md – GETDATE() Fonksiyonu

## 🧠 Nedir?

`GETDATE()` fonksiyonu, SQL Server'da o anki tarih ve saat bilgisini döndürür. Bu fonksiyon özellikle veri ekleme, güncelleme ve analizlerde "şu an"ı temsil etmek için kullanılır. Dönüş tipi `DATETIME`'dır ve saat bilgisini de içerir.

## 🎯 Nerelerde Kullanılır?

- Kayıt tarihlerini otomatik olarak atamak
- Güncel zamana göre karşılaştırma yapmak (son 7 gün, son 24 saat vb.)
- Zaman damgası içeren analizler üretmek

## 🌍 Gerçek Senaryo

Bir e-ticaret sisteminde, yeni müşteriler kayıt olduklarında kayıt tarihi otomatik olarak `GETDATE()` fonksiyonu ile doldurulur.  
Ayrıca yöneticiler, son 7 günde kayıt olan müşterileri analiz ederken yine `GETDATE()` kullanarak dinamik bir zaman aralığına ulaşır.

## 🧪 10 Pratik Kullanım Örneği

1. Şu anki tarih ve saati getir (`SELECT GETDATE();`)
2. Müşteri kayıt tarihlerinde şu anla kıyaslama yap (s0.Customers)
3. Siparişlerin hangi tarihte oluşturulduğunu GETDATE() ile karşılaştır
4. Şu anda geçerli olan abonelikleri getir
5. Ödemelerin GETDATE()'ten eski mi yeni mi olduğunu kontrol et
6. Çalışanların işe alım tarihini şu anla kıyasla
7. Etkinliklerin şimdiki zamana göre durumu
8. GETDATE() ile oluşturulan geçici filtreleme (örneğin: "son 3 gün")
9. Siparişleri `GETDATE()` kullanarak gerçek zamanlı sıralamak
10. `GETDATE()` ile tabloya yeni kayıt eklerken o anki zamanı otomatik ata

## ⚠️ Dikkat Edilmesi Gerekenler

- `GETDATE()` her çalıştırıldığında farklı bir sonuç üretir. Testlerde bu durum tutarsızlıklara yol açabilir.
- `GETDATE()` zamanla birlikte saat de içerdiği için saat karşılaştırmalarında dikkatli olunmalıdır.
- `GETDATE()` sistemi çalıştıran SQL Server'ın saatini baz alır; farklı sunucularda farklılık gösterebilir.