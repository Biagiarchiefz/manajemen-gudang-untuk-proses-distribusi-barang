CREATE TABLE [Barang] (
  [ID_Barang] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nama_barang] varchar(100) NOT NULL,
  [kategori] varchar(100) NOT NULL,
  [stok] int NOT NULL,
  [stok_minimum] int NOT NULL,
  [harga_beli] decimal(10,3) NOT NULL,
  [harga_jual] decimal(10,3) NOT NULL
)
GO

CREATE TABLE [Gudang] (
  [ID_Gudang] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nama_gudang] varchar(100) NOT NULL,
  [alamat] varchar(200) NOT NULL,
  [kapasitas_terisi] int,
  [kapasitas_max] int
)
GO

CREATE TABLE [Rak] (
  [ID_Rak] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [kode_rak] nvarchar(255) UNIQUE,
  [kapasitas_terisi] int,
  [kapasitas_max] int,
  [ID_Barang] int,
  [ID_Gudang] int
)
GO

CREATE TABLE [Supplier] (
  [ID_Supplier] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nama_supplier] varchar(100) NOT NULL,
  [kontak] varchar(10) NOT NULL,
  [alamat] varchar(200) NOT NULL
)
GO

CREATE TABLE [Pelanggan] (
  [ID_Pelanggan] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nama_Pelanggan] varchar(100) NOT NULL,
  [kontak] varchar(10) NOT NULL,
  [alamat] varchar(200) NOT NULL
)
GO

CREATE TABLE [Penerimaan] (
  [ID_Penerimaan] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [jumlah] int,
  [tanggal_penerimaan] datetime,
  [ID_Barang] int,
  [ID_Supplier] int,
  [ID_Gudang] int
)
GO

CREATE TABLE [Distribusi] (
  [ID_Distribusi] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [jumlah] int,
  [tanggal_distribusi] datetime,
  [status] nvarchar(255) NOT NULL CHECK ([status] IN ('pending', 'berhasil', 'dibatalkan')),
  [ID_Barang] int,
  [ID_Gudang] int,
  [ID_Pelanggan] int
)
GO

CREATE TABLE [Pengiriman] (
  [ID_Pengiriman] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [metode_pengiriman] varchar(100) NOT NULL,
  [biaya_pengiriman] decimal(10,3),
  [tanggal_pengiriman] datetime,
  [status_pengiriman] nvarchar(255) NOT NULL CHECK ([status_pengiriman] IN ('In Transit', 'Delivered')),
  [ID_Distribusi] int
)
GO

ALTER TABLE [Rak] ADD FOREIGN KEY ([ID_Barang]) REFERENCES [Barang] ([ID_Barang])
GO

ALTER TABLE [Rak] ADD FOREIGN KEY ([ID_Gudang]) REFERENCES [Gudang] ([ID_Gudang])
GO

ALTER TABLE [Penerimaan] ADD FOREIGN KEY ([ID_Supplier]) REFERENCES [Supplier] ([ID_Supplier])
GO

ALTER TABLE [Penerimaan] ADD FOREIGN KEY ([ID_Gudang]) REFERENCES [Gudang] ([ID_Gudang])
GO

ALTER TABLE [Distribusi] ADD FOREIGN KEY ([ID_Barang]) REFERENCES [Barang] ([ID_Barang])
GO

ALTER TABLE [Distribusi] ADD FOREIGN KEY ([ID_Gudang]) REFERENCES [Gudang] ([ID_Gudang])
GO

ALTER TABLE [Distribusi] ADD FOREIGN KEY ([ID_Pelanggan]) REFERENCES [Pelanggan] ([ID_Pelanggan])
GO

ALTER TABLE [Pengiriman] ADD FOREIGN KEY ([ID_Distribusi]) REFERENCES [Distribusi] ([ID_Distribusi])
GO




-- TUBES PRAKTIKUM BASIS DATA

-- -- Tabel Barang
-- CREATE TABLE Barang (
--   ID_Barang INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
--   nama_barang VARCHAR(100) NOT NULL,
--   kategori VARCHAR(100) NOT NULL,
--   stok INT NOT NULL,
--   stok_minimum INT NOT NULL,
--   harga_beli DECIMAL(10, 3) NOT NULL,
--   harga_jual DECIMAL(10, 3) NOT NULL
-- );


-- -- Tabel Gudang
-- CREATE TABLE Gudang (
--   ID_Gudang INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
--   nama_gudang VARCHAR(100) NOT NULL,
--   alamat VARCHAR(200) NOT NULL,
--   kapasitas_terisi INT,
--   kapasitas_max INT
-- );

-- -- Tabel Rak
-- CREATE TABLE Rak (
--   ID_Rak INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
--   kode_rak NVARCHAR(255) UNIQUE,
--   kapasitas_terisi INT,
--   kapasitas_max INT,
--   ID_Barang INT,
--   ID_Gudang INT,
--   FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang),
--   FOREIGN KEY (ID_Gudang) REFERENCES Gudang(ID_Gudang)
-- on delete cascade
-- on update cascade
-- );

-- -- Tabel Supplier
-- CREATE TABLE Supplier (
--   ID_Supplier INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
--   nama_supplier VARCHAR(100) NOT NULL,
--   kontak VARCHAR(10) NOT NULL,
--   alamat VARCHAR(200) NOT NULL
-- );


-- -- Tabel Pelanggan
-- CREATE TABLE Pelanggan (
--   ID_Pelanggan INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
--   nama_Pelanggan VARCHAR(100) NOT NULL,
--   kontak VARCHAR(10) NOT NULL,
--   alamat VARCHAR(200) NOT NULL
-- );


-- -- Tabel Penerimaan
-- CREATE TABLE Penerimaan (
--   ID_Penerimaan INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
--   jumlah INT,
--   tanggal_penerimaan DATETIME,
--   ID_Barang INT,
--   ID_Supplier INT,
--   ID_Gudang INT,
--   FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang),
--   FOREIGN KEY (ID_Supplier) REFERENCES Supplier(ID_Supplier),
--   FOREIGN KEY (ID_Gudang) REFERENCES Gudang(ID_Gudang)
-- on delete cascade
-- on update cascade
-- );


-- CREATE TABLE Distribusi (
--   ID_Distribusi INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
--   jumlah INT,
--   tanggal_distribusi DATETIME,
--   status NVARCHAR(255) NOT NULL CHECK (status IN ('pending', 'berhasil', 'dibatalkan')),
--   ID_Barang INT,
--   ID_Gudang INT,
--   ID_Pelanggan INT,
--   FOREIGN KEY (ID_Barang) REFERENCES Barang(ID_Barang),
--   FOREIGN KEY (ID_Gudang) REFERENCES Gudang(ID_Gudang),
--   FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan(ID_Pelanggan)
-- on delete cascade
-- on update cascade
-- );



-- -- Tabel Pengiriman
-- CREATE TABLE Pengiriman (
--   ID_Pengiriman INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
--   metode_pengiriman VARCHAR(100) NOT NULL,
--   biaya_pengiriman DECIMAL(10, 3),
--   tanggal_pengiriman DATETIME,
--   status_pengiriman NVARCHAR(255) NOT NULL CHECK (status_pengiriman IN ('In Transit', 'Delivered')),
--   ID_Distribusi INT,
--   FOREIGN KEY (ID_Distribusi) REFERENCES Distribusi(ID_Distribusi)
-- on delete cascade
-- on update cascade
-- );