# Task maganer APP

Task maganer mobile app

## Install project

To install all dependencies in the project, first run flutter pub get.
When using Apple M1 chip, consider installing pods with the following command arch -x86_64 pod insall.

Then, you'll need generated code. Run flutter packages pub run build_runner build --delete-conflicting-outputs.

Don't forget to target the right project -> Task maganer, then go to main.dart file, and in the program bar, select 'Run' -> 'Start debugging'.

And in the end you need to create .env file for enviroment variables (base url, app run mode etc...) and copy and past all necessary content.
.env content you can find in documentation which is on the slite => Tech -> [DEV] Mobile -> .env

## Run app
To run app you need to precise the build flavor and set target main file:
flutter run --target lib/app/main_prod.dart
You can also run main_dev.dart, main_stg.dart.
Or you can run ./run.sh file with flags '-dev, -stg, -prod'

### Edit demo data

If demo needs to have various type of posts, you can edit the list of data in the fake_data.dart file (lib/fake_data/fake_data.dart).
As class contains only static fields, you'll need to hot restart the emulator in order to have the new data.

### Generate code

To generate dart files (routing etc...) you need just run the ./gen.sh -code file

### Generate APK file

Run flutter build apk in the project folder. The terminal will indicate the location of the built bundle.

### To create splash screen

1. Upload some splash screen image into assets/images/ and set the path to this image inside pubscpec.yaml file
flutter_native_splash:
  image: assets/icons/logo.png

2. You can also set background color inside
flutter_native_splash:
        ...
  color: "#ffffff"

3. And just run ./gen.sh -splash_screen command on terminal or this commands to generate your splash screen
flutter clean
flutter pub get
flutter pub run flutter_native_splash:create

### Create app icon

1. Upload your app icon (it can be png, jpg, jpeg etc..) to assets/images/ and set the path to this image inside pubscpec.yaml file
flutter_icons:
  image: assets/icons/logo.png
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*

2. You can also set platform
flutter_icons:
        ...
  android: true,
  ios: true,
  web: true,
  windows: true
  mac: true

3. And just run ./gen.sh -app_icon command on terminal or this commands to generate your app icons
flutter clean
flutter pub get
flutter pub run flutter_launcher_icons_maker:main

### Rename app name (BundleId, appname etc...)
* Installation
flutter pub global activate rename

* Default Usage
flutter pub global run rename --bundleId com.onatcipli.networkUpp
flutter pub global run rename --appname "Network Upp"
By each
flutter pub global run rename --appname YourAppName --target ios
flutter pub global run rename --appname YourAppName --target android
flutter pub global run rename --appname YourAppName --target web
flutter pub global run rename --appname YourAppName --target macOS
flutter pub global run rename --appname YourAppName --target windows

### Testing
All test you can find into test/ folder. The file system is the same as lib/ folder
To run test you need to:
1. Generate Mocks ./gen.sh -code
2. Run Testing flutter test



### Platforms
* *Android*
* *IOS*
* MacOs
* Windows
* Web

### Data Sources
The code of mobile app you can find in Git: https://git.volcanly.me/tuan.nguyenvan/Task maganer
The Backend Api Documentation: https://api.Task maganer.com/swagger/index.html
The Design: https://www.figma.com/file/TxMLaMkn1we5CrvNVTgDZZ/Task maganer?node-id=1%3A7&mode=dev

### App Architecture
For this project I chose the MVVM. More info about this design pattern you can find here:
1. https://flatteredwithflutter.com/using-mvvm-in-flutter-2022/
2. https://blog.devgenius.io/flutter-mvvm-architecture-with-provider-a81164ef6da6