# flutter_version_override

A simple CLI tool to **override the `version` field in `pubspec.yaml`** based on environment-specific YAML files — ideal for automating versioning in Flutter projects for multiple environments like development, testing, or production.

---

## 🚀 Why use `flutter_version_override`?

Managing multiple environments often requires different app versions for development, staging, and production. This tool helps you:

- Keep one main `pubspec.yaml`.
- Maintain separate YAML files containing only the `version` field, for example:
  - `version-development.yaml`
  - `version-production.yaml`
  - `version-testing.yaml`
- Automatically override the `version` in `pubspec.yaml` with the version specified in your chosen environment YAML file.
- Integrate seamlessly with CI/CD pipelines for automated and consistent versioning across environments.

---

## 📦 Installation

Clone or download this repository, then activate the package globally using Dart:

```bash
dart pub global activate flutter_version_override
```

This will install the executable command `fvo` globally on your system.


## ✅ Usage

1. Prepare your files

    - Your main Flutter project’s pubspec.yaml.

    - Environment-specific YAML files containing only a version field, for example:

Example: `version-development.yaml`
```yaml
version: 1.0.5+9
```

2. Run the version override

From the root of your Flutter project, run:

```bash
fvo pubspec.yaml version-development.yaml
```

## 🧪 Example CI/CD Workflow
```bash
fvo pubspec.yaml version-${BUILD_ENV}.yaml
flutter pub get
flutter build apk --release
```
Where ${BUILD_ENV} can be development, production, testing, etc.

## 📁 Example Project Structure
```pgsql

my_flutter_project/
├── pubspec.yaml
└── versions/
    ├── version-development.yaml
    ├── version-production.yaml
    └── version-testing.yaml

```
or
```pgsql

my_flutter_project/
├── pubspec.yaml
├── version-development.yaml
├── version-production.yaml
└── version-testing.yaml

```
or any structure u desire

## 💡 Tip

If you want to revert your `pubspec.yaml` to the original version after running fvo, you can use Git:

```bash
git restore pubspec.yaml
```

## 🔒 License
MIT © 2025 Parham Abdollahzadeh