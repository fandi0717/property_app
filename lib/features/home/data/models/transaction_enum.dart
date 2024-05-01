enum Transaction { pemesanan, administrasi, pembangunan, serahTerima }

const Map<String, Transaction> transactionValue = {
  'pemesanan': Transaction.pemesanan,
  'administrasi': Transaction.administrasi,
  'pembangunan': Transaction.pembangunan,
  'serah_terima': Transaction.serahTerima
};
