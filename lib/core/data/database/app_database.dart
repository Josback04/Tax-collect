import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'table/payment_table.dart';
import 'table/vehicule_type_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  PaymentTable,
  VehiculeTypeTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  /// the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    /// put the database file, called batela_db.sqlite here, into the documents
    /// folder for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file =
        File(join(dbFolder.path, 'batela_db_test_20240609_2014.sqlite'));

    /// Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    /// Make sqlite3 pick a more suitable location for temporary files - the
    /// one from the system may be inaccessible due to sandBoxing.
    final cacheDatabase = (await getTemporaryDirectory()).path;

    /// We can't access /tmp on Android, which sqlite3 would try by default.
    /// Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cacheDatabase;

    return NativeDatabase.createInBackground(file);
  });
}
