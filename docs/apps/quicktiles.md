# Quick Tiles App Integration (QuickTiles)

## Overview
- **App Name**: QuickTiles
- **Package**: com.quicktiles.app
- **Type**: Regular System App
- **Replaces**: Default Android quick tiles services

## APK Details
- **File**: `SystemPrebuilts/quicktiles/QuickTiles.apk`
- **Size**: Varies by version
- **Version**: Latest stable release
- **Architecture**: ARM64/ARM
- **Special Note**: Contains compressed DEX files

## Build Configuration (Android.bp)
```bp
android_app_import {
    name: "QuickTiles",
    apk: "SystemPrebuilts/quicktiles/QuickTiles.apk",
    preprocessed: false,     // Contains compressed DEX files
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "TileService",       // Tile services
        "com.android.quicktiles", // AOSP quick tiles package
        "com.android.tileservice", // AOSP tile service package
    ],
}
```

## App Overrides
The app will replace the following default Android quick tiles services:
- **AOSP TileService**: Default Android tile service
- **QuickTiles**: Android quick tiles system
- **Tile Services**: Various tile service implementations

## Installation Location
- **Path**: `/system/app/QuickTiles/`
- **Type**: Regular system app (system/app)

## Default App Configuration (config.mk)
```makefile
# QuickTiles is included in PRODUCT_PACKAGES for regular installation
PRODUCT_PACKAGES += \
    QuickTiles
```

## Removed Apps (config.mk)
```makefile
PRODUCT_PACKAGES_REMOVE += \
    TileService \
    com.android.quicktiles \
    com.android.tileservice
```

## Features
- **Custom Quick Tiles**: User-defined quick settings tiles
- **Tile Management**: Easy tile creation and management
- **System Integration**: Deep integration with Android quick settings
- **Custom Actions**: Custom actions for each tile
- **Tile Themes**: Various tile appearance options
- **Quick Access**: Fast access to frequently used functions

## Dependencies
- **Android Framework**: Standard Android tile service APIs
- **System Permissions**: Basic system access
- **Quick Settings**: Integration with Android quick settings panel
- **SystemUI**: System UI integration

## Troubleshooting
### Common Issues
1. **Tiles Not Appearing**: Check if app has proper permissions
2. **System Integration**: Verify app installation
3. **Tile Functionality**: Check tile configuration
4. **Build Failures**: APK contains compressed DEX files

### Solutions
- Ensure app is installed as regular system app
- Verify system permissions are granted
- Check tile configuration and settings
- **Compressed DEX Issue**: Use `preprocessed: false` and `certificate: "platform"` in Android.bp

## Maintenance
- **Updates**: Check for newer APK versions
- **Permissions**: Verify system permissions are maintained
- **System Integration**: Test with new Android versions
- **Backup**: Keep backup of working APK versions

## Notes
- **Regular App**: This is a regular system app with standard permissions
- **System Integration**: Deep integration with Android quick settings system
- **Tile Service**: Provides custom quick settings tiles
- **No Self-Override**: App does not override itself (fixed in previous build)
- **Quick Settings**: Enhances Android quick settings panel functionality
- **Compressed DEX**: APK contains compressed DEX files requiring `preprocessed: false`