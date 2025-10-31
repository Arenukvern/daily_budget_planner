gen-icons:
	flutter pub run flutter_launcher_icons:main
build-web-prod:
	flutter build web --csp --dart-define-from-file=configs/prod.json  --target=lib/main_prod.dart
build-rustore-prod:
	flutter build apk --dart-define-from-file=configs/rustore_prod.json --target=lib/main_prod.dart
build-rustore-free:
	flutter build apk --dart-define-from-file=configs/rustore_prod_free.json --target=lib/main_prod.dart
build-rustore-local:
	flutter build apk --dart-define-from-file=configs/rustore_local.json 
build-google-prod:
	flutter build appbundle --dart-define-from-file=configs/google_play_prod.json  --target=lib/main_prod.dart
build-google-free:
	flutter build appbundle --dart-define-from-file=configs/google_play_prod_free.json  --target=lib/main_prod.dart
