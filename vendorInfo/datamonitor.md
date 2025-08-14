# Data Monitor App Integration (com.drnoob.datamonitor)

## Overview
**App Name**: com.drnoob.datamonitor  
**Package**: com.drnoob.datamonitor  
**Type**: Regular System App (SystemPrebuilts)  
**Replaces**: DataUsage, DataManager, NetworkUsage, TrafficMonitor

## APK Details
- **File**: `SystemPrebuilts/datamonitor/com.drnoob.datamonitor_29.apk`
- **Size**: 7.6MB
- **Version**: 29
- **Architecture**: Universal (arm64, arm, x86)

## Build Configuration
```bp
android_app_import {
    name: "com.drnoob.datamonitor",
    apk: "SystemPrebuilts/datamonitor/com.drnoob.datamonitor_29.apk",
    preprocessed: true,
    dex_preopt: { enabled: false, },
    product_specific: true,
    overrides: [
        "DataUsage",         // AOSP data usage
        "DataManager",       // Data management apps
        "NetworkUsage",      // Network usage apps
        "TrafficMonitor",    // Traffic monitoring
        "com.android.settings", // Settings data usage
        "com.android.systemui", // SystemUI data usage
    ],
}
```

## App Overrides
This app will replace the following default system data monitoring apps:
- **DataUsage**: AOSP data usage monitoring
- **DataManager**: Data management utilities
- **NetworkUsage**: Network usage tracking
- **TrafficMonitor**: Traffic monitoring tools
- **Settings Data Usage**: Built-in settings data monitoring

## Installation Location
- **Path**: `/product/app/com.drnoob.datamonitor/`
- **Type**: Regular system app (non-privileged)
- **Permissions**: Network monitoring permissions

## Default App Configuration
```makefile
# Set as default data monitor
ro.config.datamonitor_default=com.drnoob.datamonitor
```

## Removed Apps
The following conflicting apps are removed from the build:
```makefile
PRODUCT_PACKAGES_REMOVE += \
    DataUsage \
    DataManager \
    NetworkUsage \
    TrafficMonitor
```

## Features
- Real-time data usage monitoring
- Network traffic analysis
- Per-app data consumption tracking
- Wi-Fi and mobile data monitoring
- Data usage alerts and warnings
- Historical data usage graphs
- Data saving recommendations

## Dependencies
- No special dependencies required
- Uses standard Android network APIs
- Compatible with all Android versions 11+

## Troubleshooting
- **App not appearing**: Check if included in PRODUCT_PACKAGES
- **Not default data monitor**: Verify ro.config.datamonitor_default setting
- **Build errors**: Ensure APK file exists in correct location

## Maintenance
- **Updates**: Replace APK file and update version number
- **Configuration**: Modify overrides list as needed
- **Testing**: Verify data monitoring functionality after updates
