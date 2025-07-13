# 📘 02_dateadd.md – DATEADD() Fonksiyonu

## 🧠 Nedir?

`DATEADD()` fonksiyonu, bir tarih veya zaman değerine belirli bir zaman birimi (gün, ay, yıl, saat, dakika vb.) eklemek ya da çıkarmak için kullanılır. Fonksiyon şu yapıyı kullanır:

```sql
DATEADD(birim, sayı, tarih)
```

Örneğin: `DATEADD(DAY, -7, GETDATE())` ifadesi bugünden 7 gün öncesini verir.

## 🎯 Nerelerde Kullanılır?

- Belirli bir sürede gerçekleşmiş olayları filtrelemek (son 7 gün, son 3 ay)
- Tarih tahminleri veya ileriye dönük işlemler (abonelik bitiş tarihi hesaplama)
- Geriye dönük raporlamalar

## 🌍 Gerçek Senaryo

Bir e-ticaret platformunda yöneticiler, son 30 günde verilen siparişleri görmek isteyebilir.  
Bu durumda `OrderDate >= DATEADD(DAY, -30, GETDATE())` şeklinde bir filtre kullanılabilir.

## 🧪 10 Pratik Kullanım Örneği

1. Son 7 günde kayıt olan müşterileri getir
2. Son 1 ayda oluşturulan siparişleri listele
3. Gelecek hafta başlayacak etkinlikleri bul
4. 3 ay önce işe alınan çalışanları filtrele
5. Önümüzdeki 10 gün içinde biten abonelikleri bul
6. Son 6 saatte yapılan ödemeleri göster
7. 1 yıl önce yayınlanmış kitapları getir
8. Uçuşların 5 gün içinde gerçekleşecek olanlarını getir
9. Çalışanların işe giriş tarihiyle şimdiki tarih arasında fark hesapla
10. Yeni veri eklerken tarih alanını `DATEADD()` ile ileri al (örnek: test verisi)

## ⚠️ Dikkat Edilmesi Gerekenler

- `DATEADD()` fonksiyonunun 2. parametresi negatif verilirse geriye doğru işlem yapar.
- `birim` parametresi tırnak içinde değil, `DAY`, `MONTH`, `YEAR` gibi sabit değer olmalıdır.
- `DATEADD` işlemi saat, dakika gibi detaylarda zaman duyarlılığı içerdiğinden bazı eşitlikler (=`) beklenmeyen sonuçlar verebilir.