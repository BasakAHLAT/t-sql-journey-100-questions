# 📘 11_avg.md – AVG() Fonksiyonu

## 🧠 Nedir?

`AVG()` fonksiyonu, sayısal bir sütundaki değerlerin ortalamasını hesaplamak için kullanılır.

Temel sözdizimi:
```sql
SELECT AVG(SütunAdi) FROM tablo;
```

## 🎯 Nerelerde Kullanılır?

- Maaş, fiyat, ödeme gibi sayısal verilerin ortalamasını almak
- Gruplandırılmış veriler için grup bazında ortalama hesaplamak
- Performans, bütçe, satış gibi metriklerde ortalama değerlendirme yapmak

## 🌍 Gerçek Senaryo

İnsan kaynakları raporunda, pozisyona göre ortalama maaşı hesaplamak  
veya bir kategorideki ürünlerin ortalama fiyatını göstermek için kullanılır.

## 🧪 10 Pratik Kullanım Örneği

1. Ürün fiyatlarının ortalamasını hesapla
2. Çalışan maaşlarının ortalamasını al
3. Ödeme tutarlarının ortalamasını bul
4. Her pozisyon için ortalama maaş
5. Her kategori için ortalama ürün fiyatı
6. Her müşteri için ortalama sipariş tutarı (varsayım amaçlı)
7. Kitapların ortalama sayfa sayısı
8. Aylık ortalama ödeme hesapla
9. Etkinliklerin günlük ortalama sayısı (varsayım)
10. Departman bazında ortalama çalışan maaşı

## ⚠️ Dikkat Edilmesi Gerekenler

- `NULL` değerler hesaba katılmaz
- `AVG()` sonucu genelde `DECIMAL` veya `FLOAT` tipindedir
- Daha hassas kontrol istenirse `CAST()` ya da `ROUND()` ile kullanılabilir