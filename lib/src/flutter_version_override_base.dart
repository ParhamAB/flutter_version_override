// TODO: Put public facing types in this file.
import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

Future<void> overrideVersion(String pubspecPath, String envPath) async {
  if (!File(pubspecPath).existsSync()) {
    print('❌ pubspec.yaml not found at $pubspecPath');
    exit(1);
  }

  if (!File(envPath).existsSync()) {
    print('❌ env file not found at $envPath');
    exit(1);
  }

  final pubspecContent = await File(pubspecPath).readAsString();
  final envContent = await File(envPath).readAsString();

  final pubspecEditor = YamlEditor(pubspecContent);
  final envYaml = loadYaml(envContent);

  if (!envYaml.containsKey('version')) {
    print('❌ No "version" field found in $envPath');
    exit(1);
  }

  final newVersion = envYaml['version'];
  pubspecEditor.update(['version'], newVersion);

  await File(pubspecPath).writeAsString(pubspecEditor.toString());
  print('✅ Updated version in $pubspecPath to $newVersion');
}
