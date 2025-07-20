# 📘 10_groupby.md – GROUP BY Kullanımı

## 🧠 Nedir?

`GROUP BY`, SQL'de satırları gruplandırmak ve her grup için toplu işlem (aggregate) yapmak için kullanılır.  
`COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()` gibi fonksiyonlarla birlikte kullanılır.

```sql
SELECT City, COUNT(*) FROM Customers GROUP BY City;
```

## 🎯 Nerelerde Kullanılır?

- Bir gruba ait toplamları, adetleri, ortalamaları görmek
- Aylık/haftalık raporlar hazırlamak
- Departmanlara göre maaş ortalaması çıkarmak
- En çok ürün alan müşteriyi bulmak gibi özetleme analizleri

## 🌍 Gerçek Senaryo

Bir raporda her çalışanın departmanına göre ortalama maaşı göstermek istenebilir.  
Bu durumda `GROUP BY DepartmentID` kullanılarak her departman için ortalama `Salary` hesaplanır.

## 🧪 10 Pratik Kullanım Örneği

1. Her kategoride kaç ürün olduğunu say
2. Her departmandaki çalışan sayısını bul
3. Her müşteri için sipariş adedini getir
4. Her müşterinin toplam ödeme tutarını göster
5. Her etkinlik türüne göre etkinlik sayısını listele
6. Kitap yazarlarına göre kitap sayısını hesapla
7. Çalışan pozisyonlarına göre ortalama maaş hesapla
8. Abonelik planlarına göre müşteri sayısını say
9. Her gün yapılan ödeme sayısını bul
10. Her ürün için ortalama fiyatı listele (varsayım amaçlı)

## ⚠️ Dikkat Edilmesi Gerekenler

- `GROUP BY` kullanıldığında SELECT içinde gruplandırılmayan sütunlar aggregate fonksiyon içinde olmalıdır
- `HAVING` ile gruplandırılmış veriler filtrelenebilir
- `GROUP BY` ile birlikte `ORDER BY` kullanarak sonuçlar sıralanabilir