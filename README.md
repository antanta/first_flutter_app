# first_flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Versions

- Gradle:
`android\gradle\wrapper\gradle-wrapper.properties`

```
distributionUrl=https\://services.gradle.org/distributions/gradle-8.6-all.zip
```

- Kotlin:
`android\settings.gradle`

```
plugins {
    id "org.jetbrains.kotlin.android" version "2.1.0" apply false
}
```

- Java (MAJOR):
`android\app\build.gradle`

```
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '18'
    }
```

- Flutter plugins
`pubspec.yaml`