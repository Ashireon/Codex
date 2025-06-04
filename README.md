# Delivery App

A simple Flutter web application for calculating delivery fees for three carriers.

## Carriers
- **Rouillon**: requires floor length and department.
- **STTI**: requires floor length, department, and unloading option.
- **Joyaux**: requires weight and department.

The fee calculations currently use placeholder formulas. Replace them with the
actual logic from your Excel files.

## Getting Started
1. Install [Flutter](https://docs.flutter.dev/get-started/install).
2. Run `flutter pub get` inside `delivery_app`.
3. To launch the web app:
   ```bash
   flutter run -d chrome
   ```
