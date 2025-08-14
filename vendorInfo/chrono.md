# Chrono Clock App Integration (chrono)

## Overview
- **App Name**: Chrono
- **Package**: com.chrono.app
- **Type**: Regular System App
- **Replaces**: Default Android clock and time apps

## APK Details
- **File**: `SystemPrebuilts/clock/chrono-v0.6.0-arm64-v8a.apk`
- **Size**: Varies by version
- **Version**: 0.6.0
- **Architecture**: ARM64/ARM
- **Special Note**: Contains compressed DEX files

## Build Configuration (Android.bp)
```bp
android_app_import {
    name: "chrono",
    apk: "SystemPrebuilts/clock/chrono-v0.6.0-arm64-v8a.apk",
    preprocessed: false,     // Contains compressed DEX files
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "Clock",            // AOSP default clock
        "DeskClock",        // AOSP desk clock
        "LineageClock",     // LineageOS clock
        "OmniClock",        // OmniROM clock
        "com.android.deskclock", // AOSP desk clock package
        "com.android.clock", // AOSP clock package
        "org.lineageos.clock", // LineageOS clock package
    ],
}
```

## App Overrides
The app will replace the following default Android clock applications:
- **AOSP Clock**: Default Android clock app
- **AOSP DeskClock**: Default Android desk clock
- **LineageOS Clock**: LineageOS default clock
- **OmniROM Clock**: OmniROM clock app

## Installation Location
- **Path**: `/system/app/chrono/`
- **Type**: Regular system app (system/app)

## Default App Configuration (config.mk)
```makefile
# Chrono is included in PRODUCT_PACKAGES for regular installation
PRODUCT_PACKAGES += \
    chrono
```

## Removed Apps (config.mk)
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Clock \
    DeskClock \
    LineageClock \
    OmniClock \
    com.android.deskclock \
    com.android.clock \
    org.lineageos.clock
```

## Features
- **Clock Display**: Accurate time display
- **Alarm Clock**: Multiple alarm functionality
- **Timer**: Countdown timer features
- **Stopwatch**: Stopwatch functionality
- **World Clock**: Multiple timezone support
- **Widgets**: Home screen clock widgets
- **Customization**: Various clock themes and styles
- **Notifications**: Alarm and timer notifications

## Dependencies
- **Android Framework**: Standard Android clock APIs
- **System Permissions**: Basic system access
- **Time Services**: Android time and alarm services
- **Notification System**: Android notification framework

## Troubleshooting
### Common Issues
1. **Time Not Updating**: Check system time permissions
2. **Alarms Not Working**: Verify alarm permissions
3. **Service Not Starting**: Check app installation
4. **Build Failures**: APK contains compressed DEX files

### Solutions
- Ensure app is installed as regular system app
- Verify time and alarm permissions are granted
- Check system time service integration
- **Compressed DEX Issue**: Use `preprocessed: false` and `certificate: "platform"` in Android.bp

## Maintenance
- **Updates**: Check for newer APK versions
- **Permissions**: Verify system permissions are maintained
- **Time Integration**: Test with new Android versions
- **Backup**: Keep backup of working APK versions

## Notes
- **Regular App**: This is a regular system app with standard permissions
- **Clock Service**: Provides core clock and time functionality
- **Alarm System**: Comprehensive alarm and timer system
- **Time Management**: Advanced time management features
- **System Integration**: Deep integration with Android time services
- **Compressed DEX**: APK contains compressed DEX files requiring `preprocessed: false`