# TapTap Gesture App Integration (com.kieronquinn.app.taptap)

## Overview
**App Name**: TapTap  
**Package**: com.kieronquinn.app.taptap  
**Type**: Regular System App (Product Specific)  
**Replaces**: No specific replacements - adds gesture functionality

## APK Details
- **File**: `SystemPrebuilts/taptap/TapTap-v1.6.2.apk`
- **Size**: 18MB
- **Version**: v1.6.2
- **Architecture**: Universal (arm64, arm, x86)
- **Target SDK**: 30+ (Android 11+)

## Build Configuration
```bp
android_app_import {
    name: "TapTap",
    apk: "SystemPrebuilts/taptap/TapTap-v1.6.2.apk",
    preprocessed: false,     // Contains compressed DEX files
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    sdk_version: "current",  // Prevent signature stripping for compressed dex files
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "com.kieronquinn.app.taptap", // TapTap package
    ],
}
```

## App Functionality
- **Gesture Recognition**: Advanced gesture detection and processing
- **Custom Actions**: Configurable actions for different gestures
- **Accessibility**: Enhanced accessibility features
- **System Integration**: Deep system integration for gesture handling

## Installation Location
- **Path**: `/product/app/TapTap/`
- **Type**: Regular system app (product_specific)
- **Permissions**: Gesture, accessibility, and system permissions

## Build Requirements
- **preprocessed: false**: Contains compressed DEX files that need processing
- **certificate: "platform"**: Uses platform certificate for signing
- **dex_preopt: { enabled: false }**: Disables dex optimization

## Features
- **Advanced Gestures**: Complex gesture recognition and processing
- **Custom Actions**: User-configurable actions for gestures
- **Accessibility**: Enhanced accessibility support
- **System Integration**: Deep integration with Android system
- **Performance**: Optimized gesture processing

## Dependencies
- **Gesture Framework**: Android gesture recognition system
- **Accessibility Services**: Android accessibility framework
- **System Permissions**: Requires system-level gesture permissions

## Integration Notes
- **No Conflicts**: Designed to work alongside other apps
- **Gesture Enhancement**: Adds gesture functionality to the system
- **Accessibility**: Improves accessibility features
- **System Integration**: Integrates with Android gesture system

## Troubleshooting
- **App not appearing**: Check if included in PRODUCT_PACKAGES
- **Gesture not working**: Verify gesture permissions are granted
- **Build errors**: Ensure APK file exists and sdk_version is set

## Maintenance
- **Updates**: Replace APK file with newer versions
- **Configuration**: Modify overrides list as needed
- **Testing**: Verify gesture functionality after updates
- **Permissions**: Ensure proper gesture permissions are maintained

## Security Considerations
- **System Permissions**: Has access to gesture and accessibility APIs
- **Platform Certificate**: Signed with platform certificate for security
- **Gesture Access**: Can intercept and process system gestures
