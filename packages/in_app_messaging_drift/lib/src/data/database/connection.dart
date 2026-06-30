import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<File> _getFile(String path, String name) async {
  final applicationDir = await getApplicationDocumentsDirectory();
  final dbDirectory = p.join(applicationDir.path, path);
  Directory(dbDirectory).createSync();

  return File(p.join(dbDirectory, '$name.sqlite'));
}

/// Opens the package database file.
LazyDatabase openConnection(String path, String name) {
  return LazyDatabase(() async {
    final file = await _getFile(path, name);

    return NativeDatabase.createInBackground(file, logStatements: false);
  });
}

/// Deletes the package database file if it exists.
Future<void> destroyDatabase(String path, String name) async {
  final file = await _getFile(path, name);
  try {
    await file.delete();
  } on PathNotFoundException {/* ignore */}
}
