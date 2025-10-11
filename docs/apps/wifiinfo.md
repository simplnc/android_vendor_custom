# WiFi Info App Integration (com.truemlgpro.wifiinfo)

## Overview
- **App Name**: WiFi Info
- **Package**: com.truemlgpro.wifiinfo
- **Type**: Regular System App
- **Replaces**: Default Android WiFi information apps

## APK Details
- **File**: `SystemPrebuilts/wifiInfo/com.truemlgpro.wifiinfo_1610.apk`
- **Size**: ~16MB
- **Version**: 1.6.1
- **Architecture**: ARM64/ARM
- **Special Note**: Contains compressed JNI libraries

## Build Configuration (Android.bp)
```bp
android_app_import {
    name: "com.truemlgpro.wifiinfo",
    apk: "SystemPrebuilts/wifiInfo/com.truemlgpro.wifiinfo_1610.apk",
    preprocessed: false,     // Contains compressed JNI libraries
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "WifiInfo",          // WiFi information apps
        "NetworkInfo",       // Network information
        "WifiAnalyzer",      // WiFi analyzer apps
        "WifiManager",       // WiFi management apps
        "com.android.wifi",  // AOSP WiFi package
        "com.android.network", // AOSP network package
    ],
}
```

## App Overrides
The app will replace the following default Android WiFi applications:
- **AOSP WifiInfo**: Default Android WiFi information
- **NetworkInfo**: Android network information
- **WifiAnalyzer**: WiFi analysis tools
- **WifiManager**: WiFi management utilities

## Installation Location
- **Path**: `/system/app/com.truemlgpro.wifiinfo/`
- **Type**: Regular system app (non-privileged)

## Default App Configuration (config.mk)
```makefile
# Make WiFi Info the default WiFi information app
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.wifiinfo_default=com.truemlgpro.wifiinfo
```

## Removed Apps (config.mk)
```makefile
PRODUCT_PACKAGES_REMOVE += \
    WifiInfo \
    NetworkInfo \
    WifiAnalyzer \
    WifiManager \
    com.android.wifi \
    com.android.network
```

## Features
- **WiFi Analysis**: Detailed WiFi network analysis
- **Signal Strength**: Real-time signal strength monitoring
- **Network Details**: Comprehensive network information
- **Channel Information**: WiFi channel analysis
- **Security Info**: Network security details
- **Speed Testing**: Network speed measurement
- **Network History**: Connection history tracking

## Dependencies
- **Android Framework**: Standard Android WiFi APIs
- **Location Services**: GPS access for WiFi scanning
- **WiFi Permissions**: WiFi access and scanning permissions
- **JNI Libraries**: Native libraries for WiFi analysis

## Troubleshooting
### Common Issues
1. **JNI Library Errors**: APK contains compressed JNI libraries
2. **WiFi Not Scanning**: Check WiFi and location permissions
3. **App Crashes**: Verify JNI library compatibility

### Solutions
- **JNI Issue**: Use `preprocessed: false` and `certificate: "platform"`
- **Permissions**: Ensure WiFi and location permissions are granted
- **Updates**: Check for newer APK versions with fixed JNI issues

## Maintenance
- **Updates**: Check for newer APK versions
- **JNI Compatibility**: Verify JNI libraries work with target Android version
- **Permissions**: Ensure required permissions are maintained
- **Backup**: Keep backup of working APK versions

## Notes
- **JNI Libraries**: This APK contains compressed JNI libraries requiring special handling
- **Certificate**: Must use platform certificate due to JNI compression
- **Preprocessing**: Set to false to handle compressed native libraries
- **Regular App**: This is a regular system app, not privileged
- **WiFi Access**: Requires WiFi and location permissions for full functionality
- **Network Analysis**: Provides detailed WiFi network analysis and monitoring
