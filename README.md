# LoginDemo

**Used patters**:

- BLoC.
- Clean Architecture Layers ( feature first approach).
- Multi Packages (bootstrap - core - design - network) using [Melos](https://melos.invertase.dev/getting-started) (Mono Repo).

Project structure highly inspire by VGV: https://verygood.ventures/blog/very-good-flutter-architecture?utm_source=linkedin&utm_medium=social&utm_campaign=app_architecture

Lint rules from **Flutter Linter**

### Project structure:

```
├─ lib
│  ├─ app
│  │  ├─ user
│  │  │  ├─ application
│  │  │  ├─ data
│  │  │  ├─ domain
│  │  │  └─ presentation
│  │  │
│  │  └─ product
│  │     ├─ application
│  │     ├─ data
│  │     ├─ domain
│  │     └─ presentation
│  ├─ app_manger (bloc)
│  ├─ service_locator (GitIt)
│  ├─ common
│  ├─ app.dart
│  ├─ main.dart
│  └─ router.dart (Fluro)
├─ melos.yaml
├─ packages
│  ├─ bootstrap
│  ├─ core
│  ├─ design
│  └─ network
├─ pubspec.yaml
```

## Scripts:

```yaml
scripts:
  analyze:
    run: melos exec -- flutter analyze .
    description: Run `dart analyze` in all packages.

  format: melos exec -- "flutter format ."

  fix_hints: melos exec -- "dart fix —apply ."

  build_runner:
    run: |
      melos exec --depends-on="build_runner" --    $runner
    env:
      runner: flutter pub run build_runner build --delete-conflicting-outputs
      
  build_relese:
    run: flutter build apk
```

ex: `melos format ` or  run any script from IDE GUI.

### Notes:

1. You can find all scripts and run them from android studio or VS Code in **melos.yaml** file.
2. Run this before run any melos script `dart pub global activate melos` if  **melos** is not active.