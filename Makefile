build_model:
	flutter packages pub run build_runner build

build_json:
	flutter pub run build_runner build --delete-conflicting-outputs

build: build_json build_model
