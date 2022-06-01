#!/bin/bash
set -e

cd ..
flutter clean
flutter pub get
# https://flutter.dev/docs/development/data-and-backend/json#generating-code-continuously
flutter pub run build_runner watch --delete-conflicting-outputs
