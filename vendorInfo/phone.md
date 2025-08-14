# Phone App Integration (org.fossify.phone)

## Overview
- **App Name**: FOSSify Phone
- **Package**: org.fossify.phone
- **Type**: Privileged System App
- **Replaces**: Default Android phone and dialer apps

## APK Details
- **File**: `SystemPrebuilts/phone/org.fossify.phone_11.apk`
- **Size**: Varies by version
- **Version**: Latest stable release
- **Architecture**: ARM64/ARM
- **Special Note**: Contains compressed DEX files

## Build Configuration (Android.bp)
```bp
android_app_import {
    name: "org.fossify.phone",
    apk: "SystemPrebuilts/phone/org.fossify.phone_11.apk",
    preprocessed: false,     // Contains compressed DEX files
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "Phone",            // AOSP default phone
        "Dialer",           // AOSP dialer
        "Dialer2",          // Alternative AOSP dialer
        "com.lineageos.dialer", // LineageOS dialer
        "com.android.dialer", // AOSP dialer package
        "com.android.phone", // AOSP phone package
        "org.lineageos.dialer", // LineageOS dialer package
    ],
}
```

## App Overrides
The app will replace the following default Android phone applications:
- **AOSP Phone**: Default Android phone app
- **AOSP Dialer**: Default Android dialer
- **LineageOS Dialer**: LineageOS default dialer
- **Phone Services**: Various phone service implementations

## Installation Location
- **Path**: `/system/app/org.fossify.phone/`
- **Type**: Regular system app (system/app)

## Default App Configuration (config.mk)
```makefile
# Make FOSSify Phone the default phone app
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.phone_default=org.fossify.phone

# Include in PRODUCT_PACKAGES for regular installation
PRODUCT_PACKAGES += \
    org.fossify.phone
```

## Removed Apps (config.mk)
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Phone \
    Dialer \
    Dialer2 \
    com.lineageos.dialer \
    com.android.dialer \
    com.android.phone \
    org.lineageos.dialer
```

## Features
- **Phone Calls**: Traditional phone call functionality
- **Dialer Interface**: Clean and intuitive dialer
- **Call History**: Comprehensive call history
- **Contacts Integration**: Seamless contacts integration
- **Call Recording**: Call recording capabilities
- **Voicemail**: Voicemail management
- **Call Blocking**: Call blocking and filtering
- **FOSS**: Free and open source software

## Dependencies
- **Android Framework**: Standard Android phone APIs
- **System Permissions**: Basic system access
- **Telephony Services**: Android telephony system
- **Contacts Database**: Access to contacts information

## Troubleshooting
### Common Issues
1. **Calls Not Working**: Check phone permissions
2. **Service Not Starting**: Verify app installation
3. **Contacts Not Loading**: Check contacts permissions
4. **Build Failures**: APK contains compressed DEX files

### Solutions
- Ensure app is installed as regular system app
- Verify phone and contacts permissions are granted
- Check telephony service integration
- **Compressed DEX Issue**: Use `preprocessed: false` and `certificate: "platform"` in Android.bp

## Maintenance
- **Updates**: Check for newer APK versions
- **Permissions**: Verify system permissions are maintained
- **Telephony Integration**: Test with new Android versions
- **Backup**: Keep backup of working APK versions

## Notes
- **Regular App**: This is a regular system app with standard permissions
- **Phone Service**: Provides core phone and dialer functionality
- **FOSS**: Free and open source phone solution
- **System Integration**: Deep integration with Android telephony system
- **Call Management**: Comprehensive call management and dialer functionality
- **Compressed DEX**: APK contains compressed DEX files requiring `preprocessed: false`