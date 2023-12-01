## Version 0.0.1 Release

Automated Image Precache Feature Added: Automatically precache images from the application's asset folder to enhance performance.

### Usage

1. Add the plugin to your project.

```dart
dependencies:
  gh_asset_pre_cache: ^0.0.1
```

2. Run the following command in the terminal to install the plugin.
```dart
flutter pub get
```
3. Call the plugin from any part of your app to automatically perform image precaching.
```dart
import 'package:gh_asset_pre_cache/gh_asset_pre_cache.dart';

// ...

void precacheImages() {
  GhAssetPreCache().startImageCache();
}
```

### Note

- This version provides basic automated precaching functionality.
- Future updates will include more features and detailed configurations.

### Bug Fixes

- No bug fixes in this version.

### Other Changes
- This version marks the initial release of the plugin. Feedback and suggestions are welcome.

Now, optimize your application's performance by automatically managing image precaching with this plugin! Expect more updates and features in the future. Feel free to provide feedback or report issues on the GitHub repository. Thank you!


