# NFC and QR Reader

A Flutter app for reading and writing NFC tags, built on the [nfc_manager](https://pub.dev/packages/nfc_manager) plugin. The plan was to add QR code scanning as well, but that part was never built. The app only does NFC.

## What it does

The home screen has one button, "Nfc Reader", which opens three tools:

- Tag - Read: starts an NFC session and shows what the tag reports. That includes the identifier, the tech list, and per-technology details for NfcA, NfcB, NfcF, NfcV, IsoDep, MifareClassic and MifareUltralight. If the tag holds NDEF data, it lists each record (with a detail view), the message size and whether the tag is writable.
- Ndef - Write: build a list of Text and URI records, edit or delete them, then write them to a tag in one session. The records are stored locally in SQLite (sqflite), so they are still there the next time you open the app.
- Ndef - Write Lock: makes a tag read-only after a confirmation prompt. This can't be undone.

## Stack

- Flutter, Dart 2.19
- nfc_manager 3.2.0 for NFC sessions
- sqflite for the saved write records
- provider to pass the repository down the widget tree
- flutter_launcher_icons for the app icons in `assets/icon/`

## Running it

You need a phone with NFC. Emulators and simulators can't scan tags.

```shell
git clone https://github.com/rohanjariwala03/nfc_and_qr_reader.git
cd nfc_and_qr_reader
flutter pub get
flutter run
```

The code was written in March 2023 and built with Flutter 3.7 (Dart 2.19). It doesn't compile on current Flutter, mostly because it uses `TextTheme` names (`bodyText1`, `caption`, etc.) and `CardTheme`/`DialogTheme` types that later releases removed or renamed. Use a Flutter 3.7 SDK, or update those call sites first.

## Known gaps

- The Android manifest doesn't declare `android.permission.NFC`. Add `<uses-permission android:name="android.permission.NFC" />` to `android/app/src/main/AndroidManifest.xml` before running on Android.
- iOS isn't set up for NFC. It needs `NFCReaderUsageDescription` in `Info.plist` and the Near Field Communication Tag Reading capability in Xcode.
- `test/widget_test.dart` is still the default counter test and references a `MyApp` class that no longer exists, so `flutter test` fails.
- `url_launcher` and `package_info` are in `pubspec.yaml` but aren't used.

## Project layout

```
lib/
  main.dart                 entry point
  view/app.dart             MaterialApp, providers, home screen
  view/nfc_view/            NFC menu plus read, write and write-lock screens
  view/common/              shared form rows and the NFC session dialog
  repository/               Repository interface, sqflite implementation (plus an unimplemented demo stub)
  model/                    NDEF record parsing and the WriteRecord model
```
