import 'dart:io';
import 'package:test/test.dart';
import 'package:flutter_version_override/flutter_version_override.dart';

void main() {
  group('overrideVersion', () {
    late File pubspecFile;
    late File envFile;

    setUp(() {
      pubspecFile = File('pubspec_temp.yaml');
      pubspecFile.writeAsStringSync('''
name: test_project
description: A test
version: 1.0.0+1
''');

      envFile = File('example.yaml');
      envFile.writeAsStringSync('''
version: 2.0.0+3
''');
    });

    tearDown(() {
      pubspecFile.deleteSync();
      envFile.deleteSync();
    });

    test('should override version in pubspec.yaml', () async {
      await overrideVersion(pubspecFile.path, envFile.path);

      final updatedContent = pubspecFile.readAsStringSync();
      expect(updatedContent.contains('version: 2.0.0+3'), isTrue);
    });
  });
}
