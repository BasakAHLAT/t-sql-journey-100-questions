-- Şema oluşturuluyor
CREATE SCHEMA s16;
GO

-- Tarif kategorileri tablosu
CREATE TABLE s16.Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

-- Malzemeler tablosu
CREATE TABLE s16.Ingredients (
    IngredientID INT PRIMARY KEY,
    IngredientName VARCHAR(100) NOT NULL
);

-- Tarifler tablosu
CREATE TABLE s16.Recipes (
    RecipeID INT PRIMARY KEY,
    RecipeName VARCHAR(150) NOT NULL,
    CategoryID INT NOT NULL,
    Description VARCHAR(MAX),
    PrepTime INT CHECK (PrepTime >= 0),
    CookTime INT CHECK (CookTime >= 0),
    FOREIGN KEY (CategoryID) REFERENCES s16.Categories(CategoryID)
);

-- Tarif – Malzeme eşleşme tablosu
CREATE TABLE s16.RecipeIngredients (
    RecipeID INT,
    IngredientID INT,
    Quantity VARCHAR(50),
    PRIMARY KEY (RecipeID, IngredientID),
    FOREIGN KEY (RecipeID) REFERENCES s16.Recipes(RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES s16.Ingredients(IngredientID)
);

-- Kategoriler
INSERT INTO s16.Categories VALUES
(1, 'Ana Yemek'),
(2, 'Salata'),
(3, 'Çorba'),
(4, 'Tatlı');

-- Malzemeler
INSERT INTO s16.Ingredients VALUES
(1, 'Tavuk Göğsü'),
(2, 'Zeytinyağı'),
(3, 'Sarımsak'),
(4, 'Yoğurt'),
(5, 'Domates'),
(6, 'Soğan'),
(7, 'Marul'),
(8, 'Pirinç'),
(9, 'Tereyağı'),
(10, 'Un'),
(11, 'Limon');

-- Tarifler (açıklamalarda birden fazla 'tavuk' geçecek şekilde düzenlendi)
INSERT INTO s16.Recipes VALUES
(101, 'Tavuklu Salata', 2, 'Haşlanmış tavuk göğsü, marul ve limonla hazırlanmış tavuklu hafif bir salata.', 15, 10),
(102, 'Yoğurtlu Tavuk', 1, 'Fırında pişirilen tavuk, yoğurtlu sosla birleşiyor. Tavuk sevenler için nefis bir alternatif.', 20, 30),
(103, 'Domates Çorbası', 3, 'Domates, un ve tereyağıyla yapılan klasik çorba.', 10, 20),
(104, 'Tavuklu Pilav', 1, 'Pirinç ve tavuk ile hazırlanan tavuklu pilav, öğle ve akşam yemekleri için ideal.', 20, 25);

-- Tarif – Malzeme ilişkisi
INSERT INTO s16.RecipeIngredients VALUES
(101, 1, '200g'),  -- Tavuk göğsü
(101, 7, '1 bağ'),
(101, 11, '1/2 adet'),
(101, 2, '2 yemek kaşığı'),

(102, 1, '300g'),
(102, 4, '1 su bardağı'),
(102, 3, '2 diş'),
(102, 2, '1 yemek kaşığı'),

(103, 5, '3 adet'),
(103, 6, '1 adet'),
(103, 9, '1 yemek kaşığı'),
(103, 10, '1 yemek kaşığı'),

(104, 1, '250g'),
(104, 8, '1 su bardağı'),
(104, 6, '1 adet'),
(104, 9, '1 yemek kaşığı');