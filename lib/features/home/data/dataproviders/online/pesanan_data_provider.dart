/// Example Simulate GET API From Server
///
class PesananPropertyDataProvider {
  /// [Tidak Denda]
  static const String propertyOne = """
{
  "id": "881726478123",
  "name": "Candra Bhirawa",
  "location": "Lotus, Kavling A1, Blok B No.4",
  "date_target": "2022-11-25 09:00:00",
  "price": 850000000.0,
  "jenis_property": "Komersil",
  "transaction": {
    "pemesanan": 100.0,
    "administrasi": 50.0,
    "pembangunan": 0.0,
    "serah_terima": 0.0
  },
  "date_now": "2022-10-10 10:10:00",
  "denda": null
}
""";

  /// [Denda]
  static const String propertyTwo = """
{
  "id": "881726478124",
  "name": "Bukit Raya Residence",
  "location": "Jaguar, Kavling A1, Blok D No. 4",
  "date_target": "2023-12-25 09:00:00",
  "price": 985799300.0,
  "jenis_property": "Komersil",
  "transaction": {
    "pemesanan": 100.0,
    "administrasi": 50.0,
    "pembangunan": 0.0,
    "serah_terima": 0.0
  },
  "date_now": "2024-01-25 09:00:00",
  "denda": 8550000.0
}
""";

  /// [Denda]
  static const String propertyThree = """
{
  "id": "881726478125",
  "name": "Bukit Tinggi",
  "location": "Kediri, Kavling A1, Blok D No. 4",
  "date_target": "2024-02-01 09:00:00",
  "price": 885799300.0,
  "jenis_property": "Komersil",
  "transaction": {
    "pemesanan": 100.0,
    "administrasi": 50.0,
    "pembangunan": 0.0,
    "serah_terima": 0.0
  },
  "date_now": "2024-04-02 09:00:00",
  "denda": 9550000.0
}
""";
}
