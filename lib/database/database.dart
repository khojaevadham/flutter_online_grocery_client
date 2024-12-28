// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;
//
//   DatabaseHelper._internal();
//
//   Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initializeDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initializeDatabase() async {
//   String path = join(await getDatabasesPath(), 'dcmarket_database.db');
//   return openDatabase(
//     path,
//     onCreate: (db, version) {
//       db.execute(
//         "CREATE TABLE profile(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, surname TEXT, phone_number TEXT, imagePath TEXT)",
//       );
//     },
//     version: 1,
//   );
// }
//
//
//   Future<void> insertUser(String name, String surname, String phone, String? imagePath) async {
//     final db = await database;
//     await db.insert(
//       'profile',
//       {'name': name, 'surname': surname, 'phone_number': phone, 'imagePath': imagePath},
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   Future<List<Map<String, dynamic>>> getUsers() async {
//     final db = await database;
//     return await db.query('profile');
//   }
// }
