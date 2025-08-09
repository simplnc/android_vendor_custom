# Contacts App Integration (com.bnyro.contacts)

## Overview
- **App Name**: FOSSify Contacts
- **Package**: com.bnyro.contacts
- **Type**: Regular System App
- **Replaces**: Default Android contacts apps

## APK Details
- **File**: `SystemPrebuilts/contacts/com.bnyro.contacts_29.apk`
- **Size**: ~29MB
- **Version**: Latest stable release
- **Architecture**: ARM64/ARM
- **Special Note**: Contains compressed DEX files

## Build Configuration (Android.bp)
```bp
android_app_import {
    name: "com.bnyro.contacts",
    apk: "SystemPrebuilts/contacts/com.bnyro.contacts_29.apk",
    preprocessed: false,     // Contains compressed DEX files
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "Contacts",          // AOSP default contacts
        "People",            // Alternative contacts app
        "contacts",          // lineage 15 contacts app
        "LineageContacts",   // LineageOS contacts
        "OmniContacts",      // OmniROM contacts
        "com.android.contacts", // AOSP contacts package
        "com.android.people", // AOSP people package
        "org.lineageos.contacts", // LineageOS contacts package
    ],
}
```

## App Overrides
The app will replace the following default Android contacts applications:
- **AOSP Contacts**: Default Android contacts app
- **AOSP People**: Alternative Android contacts app
- **LineageOS Contacts**: LineageOS default contacts
- **OmniROM Contacts**: OmniROM contacts app

## Installation Location
- **Path**: `/system/app/com.bnyro.contacts/`
- **Type**: Regular system app (system/app)

## Default App Configuration (config.mk)
```makefile
# Make FOSSify Contacts the default contacts app
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.contacts_default=com.bnyro.contacts

# Include in PRODUCT_PACKAGES for regular installation
PRODUCT_PACKAGES += \
    com.bnyro.contacts
```

## Removed Apps (config.mk)
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Contacts \
    People \
    contacts \
    com.android.contacts \
    com.android.people \
    org.lineageos.contacts
```

## Features
- **Contact Management**: Comprehensive contact management
- **Multiple Accounts**: Support for various contact accounts
- **Contact Sync**: Contact synchronization capabilities
- **Privacy Focused**: No Google integration
- **FOSS**: Free and open source software
- **Multiple Formats**: Support for various contact formats

## Dependencies
- **Android Framework**: Standard Android contacts APIs
- **System Permissions**: Basic system access
- **Contacts Database**: Access to contacts information
- **Account Services**: Android account management

## Troubleshooting
### Common Issues
1. **Contacts Not Loading**: Check contacts permissions
2. **Service Not Starting**: Verify app installation
3. **Sync Issues**: Check account permissions
4. **Build Failures**: APK contains compressed DEX files

### Solutions
- Ensure app is installed as regular system app
- Verify contacts and account permissions are granted
- Check contacts database integration
- **Compressed DEX Issue**: Use `preprocessed: false` and `certificate: "platform"` in Android.bp

## Maintenance
- **Updates**: Check for newer APK versions
- **Permissions**: Verify system permissions are maintained
- **Contacts Integration**: Test with new Android versions
- **Backup**: Keep backup of working APK versions

## Notes
- **Regular App**: This is a regular system app with standard permissions
- **Contacts Service**: Provides core contacts management functionality
- **FOSS**: Free and open source contacts solution
- **System Integration**: Deep integration with Android contacts system
- **Contact Management**: Comprehensive contact management and synchronization
- **Compressed DEX**: APK contains compressed DEX files requiring `preprocessed: false`