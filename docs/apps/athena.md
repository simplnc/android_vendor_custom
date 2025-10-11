# Athena App Integration (athena)

## Overview
- **App Name**: Athena
- **Package**: com.android.athena
- **Type**: Regular System App
- **Replaces**: Default Android system athena services

## APK Details
- **File**: `SystemPrebuilts/systemAthena/athena.apk`
- **Size**: Varies by version
- **Version**: Latest stable release
- **Architecture**: ARM64/ARM
- **Special Note**: Contains compressed DEX files

## Build Configuration (Android.bp)
```bp
android_app_import {
    name: "athena",
    apk: "SystemPrebuilts/systemAthena/athena.apk",
    preprocessed: false,     // Contains compressed DEX files
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "Athena",           // System athena apps
        "SystemAthena",      // System athena services
        "com.android.athena", // AOSP athena package
        "com.android.systemathena", // AOSP system athena package
    ],
}
```

## App Overrides
The app will replace the following default Android athena services:
- **AOSP Athena**: Default Android athena system
- **SystemAthena**: Android system athena services
- **Athena Services**: Various athena service implementations

## Installation Location
- **Path**: `/system/app/athena/`
- **Type**: Regular system app (system/app)

## Default App Configuration (config.mk)
```makefile
# Athena is included in PRODUCT_PACKAGES for regular installation
PRODUCT_PACKAGES += \
    athena
```

## Removed Apps (config.mk)
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Athena \
    SystemAthena \
    com.android.athena \
    com.android.systemathena
```

## Features
- **System Integration**: Deep system integration capabilities
- **System Services**: Core system service functionality
- **System Management**: System management and control
- **System Monitoring**: System monitoring and diagnostics
- **System Optimization**: System optimization features
- **System Security**: Enhanced system security features

## Dependencies
- **Android Framework**: Standard Android system APIs
- **System Permissions**: Basic system access
- **System Services**: Android system service framework
- **Core System**: Access to core system functionality

## Troubleshooting
### Common Issues
1. **Service Not Starting**: Check system permissions
2. **System Integration**: Verify app installation
3. **Functionality Issues**: Check system service integration
4. **Build Failures**: APK contains compressed DEX files

### Solutions
- Ensure app is installed as regular system app
- Verify system permissions are granted
- Check system service integration
- **Compressed DEX Issue**: Use `preprocessed: false` and `certificate: "platform"` in Android.bp

## Maintenance
- **Updates**: Check for newer APK versions
- **Permissions**: Verify system permissions are maintained
- **System Integration**: Test with new Android versions
- **Backup**: Keep backup of working APK versions

## Notes
- **Regular App**: This is a regular system app with standard permissions
- **System Service**: Provides core system service functionality
- **Deep Integration**: Deep integration with Android system services
- **System Management**: Core system management and control capabilities
- **System Security**: Enhanced system security and monitoring features
- **Compressed DEX**: APK contains compressed DEX files requiring `preprocessed: false`