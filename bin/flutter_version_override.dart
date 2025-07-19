import 'package:flutter_version_override/flutter_version_override.dart';

void main(List<String> args) {
  if (args.length != 2) {
    print('Usage: flutter_version_override <pubspec.yaml> <env.yaml>');
    return;
  }

  overrideVersion(args[0], args[1]);
}