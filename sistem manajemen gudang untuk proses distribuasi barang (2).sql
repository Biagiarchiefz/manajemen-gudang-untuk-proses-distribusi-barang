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
