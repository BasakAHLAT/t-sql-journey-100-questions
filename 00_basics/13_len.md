# 📘 12_len.md – LEN() Fonksiyonu

## 🧠 Nedir?

`LEN()` fonksiyonu, bir karakter dizisinin uzunluğunu (karakter sayısını) verir.  
Boşluklar da sayılır ancak sondaki boşluklar hariç tutulur.

Temel sözdizimi:
```sql
LEN(ifadeler)
```

## 🎯 Nerelerde Kullanılır?

- Veritabanındaki metinlerin uzunluğunu kontrol etmek
- Kısa veya uzun açıklamaları ayırt etmek
- Veri kalitesi kontrolü
- Yorumlar, e-posta adresleri, başlıklar gibi metin alanlarında sınıflandırma yapmak

## 🌍 Gerçek Senaryo

Bir müşteri yorum sistemi varsa, yorumların ortalama uzunluğu veya 100 karakterden uzun yorumları filtrelemek için `LEN()` kullanılabilir.

## 🧪 10 Pratik Kullanım Örneği

1. Müşteri adının uzunluğunu getir
2. E-posta adresi uzunluğu 20 karakterden büyük olanları bul
3. Ürün isimlerinin uzunluklarını listele
4. Kitap başlığı uzunluğu 30 karakterden kısa olanları filtrele
5. Pozisyon adı uzunluğu ile birlikte göster
6. Departman adlarını uzunluklarına göre sırala
7. Çalışan tam adı uzunluğu hesapla
8. Uzun ürün açıklamaları varsa listele (varsayım)
9. `LEFT JOIN` ile açıklaması olmayan kayıtları `LEN IS NULL` ile tespit et
10. Ortalama isim uzunluğu (AVG(LEN(...)))

## ⚠️ Dikkat Edilmesi Gerekenler

- `LEN()` sondaki boşlukları saymaz ama baştaki ve ortadakileri sayar
- `NULL` değerlerde `LEN()` sonucu da `NULL` döner
- Alternatif olarak `DATALENGTH()` fonksiyonu da kullanılabilir ama byte sayar