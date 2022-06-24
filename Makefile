.PHONY: apk jks icon splash


apk:
	@flutter build apk --target-platform android-arm64 --split-per-abi -v

jks:
	@keytool -genkey -v -keystore ./android/key.jks -keyalg RSA -keysize 2048 -validity 3650 -alias key

icon:
	@flutter pub run flutter_launcher_icons:main

splash:
	@flutter pub run flutter_native_splash:create
