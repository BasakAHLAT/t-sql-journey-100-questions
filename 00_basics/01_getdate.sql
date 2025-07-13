-- 01_getdate.sql – GETDATE() Fonksiyonu Örnekleri

-- 1. Şu anki tarihi ve saati getir
SELECT GETDATE() AS CurrentDateTime;

-- 2. Müşterilerin kayıt tarihi ile şu anı karşılaştır (örnek amaçlı)
SELECT CustomerID, FirstName, LastName, RegisteredAt, GETDATE() AS Now
FROM s0.Customers;

-- 3. Sipariş tarihi ile şu anı birlikte listele
SELECT OrderID, CustomerID, OrderDate, GETDATE() AS CurrentDate
FROM s0.Orders;

-- 4. Şu anki zamanla karşılaştırmak üzere çalışan işe alım tarihleri
SELECT EmployeeID, FirstName, LastName, HireDate, GETDATE() AS Today
FROM s0.Employees;

-- 5. Ödeme tarihlerini şu anla birlikte göster
SELECT PaymentID, CustomerID, PaymentDate, GETDATE() AS TimeNow
FROM s0.Payments;

-- 6. Etkinlik tarihleriyle şu anı kıyaslamak için birlikte göster
SELECT EventID, EventName, EventDate, GETDATE() AS RightNow
FROM s0.Events;

-- 7. Abonelik bitiş tarihleri ile şu anı karşılaştırmak için listele
SELECT SubscriptionID, CustomerID, EndDate, GETDATE() AS CurrentTime
FROM s0.Subscriptions;

-- 8. Şu anki zamana göre uçuş tarihlerini göster
SELECT FlightID, FlightNumber, DepartureTime, GETDATE() AS CurrentMoment
FROM s0.Flights;

-- 9. Kitap yayın tarihi ve şu anki tarih aynı tabloda
SELECT BookID, Title, PublishedDate, GETDATE() AS Now
FROM s0.Books;

-- 10. Yeni bir müşteri eklerken kayıt tarihi olarak GETDATE() kullanımı (örnek kayıt)
-- INSERT INTO s0.Customers (CustomerID, FirstName, LastName, Email, RegisteredAt, MembershipType)
-- VALUES (999, 'Demo', 'User', 'demo@example.com', GETDATE(), 'Premium');