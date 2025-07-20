# 📘 16_datediff.md – DATEDIFF() Fonksiyonu

## 🧠 Nedir?

`DATEDIFF()` fonksiyonu, iki tarih arasındaki farkı belirli bir zaman biriminde (gün, ay, yıl, saat vb.) hesaplamak için kullanılır.

Temel sözdizimi:
```sql
DATEDIFF(birim, başlangıç_tarihi, bitiş_tarihi)
```

Örneğin: `DATEDIFF(DAY, '2025-01-01', '2025-01-10')` sonucu `9` döner.

## 🎯 Nerelerde Kullanılır?

- İki tarih arasındaki farkı hesaplamak (kaç gün geçti, kaç yıl oldu gibi)
- Abonelik süresi, çalışma süresi gibi metrikleri hesaplamak
- Geçmişe dönük analizlerde süre hesaplamak
- Bugünden itibaren olaylara kalan zamanı hesaplamak

## 🌍 Gerçek Senaryo

Bir çalışan sisteminde, işe giriş tarihi ile bugünün tarihi arasındaki farkı hesaplayarak kaç yıldır çalıştığı bulunabilir.

## 🧪 10 Pratik Kullanım Örneği

1. Müşterinin kayıt tarihi ile bugünün farkı
2. Sipariş tarihi ile teslim tarihi arasındaki gün farkı (varsayım amaçlı)
3. Çalışanın işe giriş tarihi ile bugün arasındaki yıl farkı
4. Kitap yayın tarihi ile bugünün farkı
5. Abonelik başlangıç ve bitiş tarihleri arasındaki gün farkı
6. Etkinlik tarihine kaç gün kaldığını hesapla
7. Ödeme tarihi ile sistem tarihi arasındaki saat farkı
8. İki sabit tarih arasındaki hafta farkı
9. Bugünden 90 gün önceye göre fark kontrolü
10. Her müşteri için kayıt süresi (gün bazlı)

## ⚠️ Dikkat Edilmesi Gerekenler

- `DATEDIFF()` sonucu negatif olabilir (başlangıç tarihi bitişten büyükse)
- `DATEDIFF()` sadece tam zaman birimi farkını verir (saat dilimi veya dakika detayı içermez)
- Sonuç sayısal bir `INT` değer olarak döner