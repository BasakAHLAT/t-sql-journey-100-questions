
# 🧩 15 – Subqueries: Alt Sorgular

Alt sorgular (subqueries), bir SQL sorgusunun içinde başka bir sorgu çalıştırmak için kullanılır.  
Ana sorgunun ihtiyacı olan veriyi, önce bir alt sorguda hazırlayıp, sonucu ana sorguda kullanabilirsin.

- SELECT, WHERE, FROM ve HAVING gibi yerlerde kullanılabilir.
- Sonuç olarak tek bir değer, birden fazla değer veya tablo dönebilir.

---

### Temel sözdizimi:

```sql
-- Koşulda alt sorgu (tek değer döner)
SELECT ... FROM ... WHERE Alan = (SELECT ... FROM ...);

-- Çoklu değer dönen alt sorgu (IN ile)
SELECT ... FROM ... WHERE Alan IN (SELECT ... FROM ...);

-- Alan içinde alt sorgu (hesaplanan değer)
SELECT ...,
    (SELECT ... FROM ... WHERE ...) AS YeniAlan
FROM ...;
```

---

## Gerçek Hayattan Senaryo

Bir e-ticaret uygulamasında, **hiç siparişi olmayan müşterileri** ya da **kategori bazında en ucuz ürünü** bulmak için alt sorgular kullanabilirsin.  
Böylece ana sorgunda, başka bir sorgunun sonucuna göre filtreleme veya hesaplama yapabilirsin.

---

## Pratik Kullanım Örnekleri

1. **En pahalı ürünü listele**
2. **En son siparişi veren müşterinin adını bul**
3. **Hiç siparişi olmayan müşterileri listele**
4. **Kategori bazında en ucuz ürünü bul**
5. **Her müşterinin toplam sipariş tutarını göster**
6. **Stoğu ortalamanın altında olan ürünleri listele**
7. **Departmanda en erken işe alınan çalışanı bul**
8. **En çok sipariş veren müşterinin bilgisini çek**
9. **Departmanındaki ortalama maaştan yüksek maaş alan çalışanlar**
10. **Kategoriye göre ortalamanın üstünde fiyatlı ürünler**
11. **Hiç çalışanı olmayan departmanları listele**

---

## Sık Yapılan Hatalar & Dikkat Edilmesi Gerekenler

- **Tek değer beklerken çoklu satır dönen alt sorgu hata verir.** Çözümü: `IN` ya da `EXISTS` kullanmak.
- **Performans:** Büyük tablolar ve gereksiz iç içe alt sorgular yavaşlatabilir, bazen JOIN ile çözmek daha verimlidir.
- **NULL değerler:** Sonuç beklenmeyen şekilde gelebilir.
- **Parantez unutma:** Alt sorgular daima parantez içinde olmalı.
- **Bağımlı (correlated) alt sorgularda dikkatli ol:** Performansı çok etkiler.

---

## Kısa Özet

- Alt sorgular, özellikle karmaşık filtreleme ve hesaplama gereken durumlarda çok kullanışlıdır.
- Büyük veri setlerinde JOIN veya CTE ile alternatiflerini de düşün.
