# nukevietapp

Install Flutter
https://flutter.dev/

Configuration fvm
1. Install fvm
https://fvm.app/docs/getting_started/installation

dart pub global activate fvm

brew tap leoafarias/fvm

brew install fvm

2. Active fvm
dart pub global activate fvm

3. Install multiple version flutter
fvm install 2.2.3

fvm install stable

4. Configure Your IDE
Android Studio
Tool Bar > Preferences > Languages & Frameworks -> Flutter -> SDK Path Languages   Frameworks Flutter

set path to ~/fvm/versions/2.2.3

VSCode
Add the following to your settings.json

{
   "dart.flutterSdkPaths": [
      "fvm"
   ]
}
5. Open project and run in terminal of IDE
fvm use 2.2.3

How to run
fvm flutter run

fvm flutter --release

fvm flutter build apk --split-per-abi
 
