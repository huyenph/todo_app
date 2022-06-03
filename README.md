# Manabie test TODO App

## Folder structure

```
android/
  app/
    src/
      debug/
      development/
      main/
      production/
      profile/
      staging/
ios/
  Config/
    development/
    production/
    staging/
lib/
  src/
    blocs/
    common/
    config/
    core/
    data/
      datasources/
      repositories/
    di/
    domain/
      models/
      repositories/
      usecases/
    presentation/
      components/
      screens/
  application.dart
  main_dev.dart
  main_stag.dart
  main_prod.dart
  test/
    bloc/
      main/
      task/
    widget_test.dart
  pubspec.lock
  pubspec.yaml
  README.md
```

## How to run the code

1. run "flutter pub get"

2. "cd ios"

3. run "pod install"

### Run for Android and iOS

1. Development environment: "flutter run --flavor development -t lib/main_dev.dart"

2. Staging environment: "flutter run --flavor staging -t lib/main_stag.dart"

3. Production environment: "flutter run --flavor production -t lib/main_prod.dart"

## Unit test cases

1. Main - bloc test change tabs expected correct MainState

2. Bloc test task event expected "Props are correct" and "Values are equality" for each event

3. Bloc test task state expected "Props are correct" and "Values are equality" for each state

4. Bloc test create task

5. Bloc test update task status

6. Bloc test search task with debounce transformer
