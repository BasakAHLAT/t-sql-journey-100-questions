
# 📘 02_dateadd.md – DATEADD() Fonksiyonu

## 🧠 Nedir?

`DATEADD()` fonksiyonu, bir tarih veya zaman değerine belirli bir zaman birimi (gün, ay, yıl, saat, dakika vb.) eklemek ya da çıkarmak için kullanılır. Fonksiyon şu yapıyı kullanır:

```sql
DATEADD(birim, sayı, tarih)
```

Örneğin: `DATEADD(DAY, -7, GETDATE())` ifadesi bugünden 7 gün öncesini verir.

## 🎯 Nerelerde Kullanılır?

- Belirli bir sürede gerçekleşmiş olayları filtrelemek (son 7 gün, son 3 ay)
- Gelecekte olacak olayları tarih bazlı planlamak (etkinlik başlangıç tahmini)
- Tarih tahminleri veya ileriye dönük raporlamalar oluşturmak
- Eski kayıtları hesaplamak veya rapor süresi belirlemek

## 🌍 Gerçek Senaryo

Bir e-ticaret platformunda yöneticiler, örneğin bugünden itibaren 10 gün içinde sona erecek abonelikleri bulmak isteyebilir.  
Bu durumda: `EndDate <= DATEADD(DAY, 10, '2025-06-01')` gibi bir sorgu kullanılabilir.

## 🧪 10 Pratik Kullanım Örneği

1. Son 7 günde kayıt olan müşterileri getir (GETDATE ile)
2. 2025-01-01 tarihinden itibaren son 1 ayda oluşturulan siparişleri listele
3. 2024-12-01’den sonraki ilk 7 günlük etkinlikleri bul
4. 3 ay önce işe alınan çalışanları filtrele (HireDate <= DATEADD(MONTH, -3, '2025-07-01'))
5. 10 gün içinde sona erecek abonelikleri getir
6. Son 6 saatte yapılan ödemeleri göster (PaymentDate >= DATEADD(HOUR, -6, '2025-07-14 12:00:00'))
7. 2023-01-01’den 1 yıl öncesine ait kitapları listele
8. 2025-07-01 tarihinden itibaren 5 gün içinde yapılacak uçuşları getir
9. Çalışanların işe alım tarihini baz alarak 1 yıl sonraki değerlendirme tarihini hesapla
10. Test verisi için bugünün 3 gün sonrası gibi ileri bir tarihi kullanarak kayıt ekle

## ⚠️ Dikkat Edilmesi Gerekenler

- `DATEADD()` fonksiyonunun 2. parametresi negatif verilirse geriye doğru işlem yapar.
- `birim` parametresi tırnak içinde değil, `DAY`, `MONTH`, `YEAR` gibi sabit değer olmalıdır.
- `DATEADD()` işlemi saat, dakika gibi detaylarda zaman hassasiyeti içerdiğinden bazı eşitlikler (`=`) beklenmeyen sonuçlar verebilir.
