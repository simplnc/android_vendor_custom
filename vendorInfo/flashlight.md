# Flashlight App Integration (com.bitmavrick.lumolight)

## Overview
**App Name**: com.bitmavrick.lumolight  
**Package**: com.bitmavrick.lumolight  
**Type**: Regular System App (SystemPrebuilts)  
**Replaces**: Flashlight, Torch, LineageTorch, OmniTorch

## APK Details
- **File**: `SystemPrebuilts/flashlight/com.bitmavrick.lumolight_23.apk`
- **Size**: 1.4MB
- **Version**: 23
- **Architecture**: Universal (arm64, arm, x86)

## Build Configuration
```bp
android_app_import {
    name: "com.bitmavrick.lumolight",
    apk: "SystemPrebuilts/flashlight/com.bitmavrick.lumolight_23.apk",
    preprocessed: true,
    dex_preopt: { enabled: false, },
    product_specific: true,
    overrides: [
        "Flashlight",        // AOSP flashlight
        "Torch",             // Alternative flashlight
        "LineageTorch",      // LineageOS torch
        "OmniTorch",         // OmniROM torch
        "Camera",            // Camera with flashlight
        "com.android.flashlight", // AOSP flashlight package
        "com.android.torch",      // AOSP torch package
    ],
}
```

## App Overrides
This app will replace the following default system flashlight apps:
- **Flashlight**: AOSP flashlight app
- **Torch**: Alternative flashlight utilities
- **LineageTorch**: LineageOS torch app
- **OmniTorch**: OmniROM torch app
- **Camera Flashlight**: Camera app flashlight functionality

## Installation Location
- **Path**: `/product/app/com.bitmavrick.lumolight/`
- **Type**: Regular system app (non-privileged)
- **Permissions**: Camera and flashlight permissions

## Default App Configuration
```makefile
# Set as default flashlight
ro.config.flashlight_default=com.bitmavrick.lumolight
```

## Removed Apps
The following conflicting apps are removed from the build:
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Flashlight \
    Torch \
    LineageTorch \
    OmniTorch \
    com.android.flashlight \
    com.android.torch
```

## Features
- Bright flashlight functionality
- Multiple brightness levels
- Strobe light modes
- SOS emergency signal
- Camera integration
- Quick access from notification panel
- Modern material design UI

## Dependencies
- No special dependencies required
- Uses standard Android camera APIs
- Compatible with all Android versions 11+

## Troubleshooting
- **App not appearing**: Check if included in PRODUCT_PACKAGES
- **Not default flashlight**: Verify ro.config.flashlight_default setting
- **Build errors**: Ensure APK file exists in correct location

## Maintenance
- **Updates**: Replace APK file and update version number
- **Configuration**: Modify overrides list as needed
- **Testing**: Verify flashlight functionality after updates
