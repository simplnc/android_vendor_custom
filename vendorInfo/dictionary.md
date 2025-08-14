# Dictionary App Integration (io.github.yamin8000.owl)

## Overview
**App Name**: io.github.yamin8000.owl  
**Package**: io.github.yamin8000.owl  
**Type**: Regular System App (SystemPrebuilts)  
**Replaces**: Dictionary, DictionaryProvider, WordLookup, Translator

## APK Details
- **File**: `SystemPrebuilts/dictionary/io.github.yamin8000.owl-v46-n1.7.3-release.apk`
- **Size**: 4.0MB
- **Version**: v46-n1.7.3-release
- **Architecture**: Universal (arm64, arm, x86)

## Build Configuration
```bp
android_app_import {
    name: "io.github.yamin8000.owl",
    apk: "SystemPrebuilts/dictionary/io.github.yamin8000.owl-v46-n1.7.3-release.apk",
    preprocessed: false,     // Contains compressed JNI libraries
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    dex_preopt: { enabled: false, },
    product_specific: true,
    overrides: [
        "Dictionary",        // AOSP dictionary
        "DictionaryProvider", // Dictionary provider
        "WordLookup",        // Word lookup apps
        "Translator",        // Translation apps
        "com.android.dictionary", // AOSP dictionary package
        "com.android.translate", // AOSP translate package
    ],
}
```

## App Overrides
This app will replace the following default system dictionary apps:
- **Dictionary**: AOSP dictionary app
- **DictionaryProvider**: Dictionary provider service
- **WordLookup**: Word lookup utilities
- **Translator**: Translation services
- **AOSP Dictionary**: Built-in dictionary package

## Installation Location
- **Path**: `/product/app/io.github.yamin8000.owl/`
- **Type**: Regular system app (non-privileged)
- **Permissions**: Standard dictionary permissions

## Default App Configuration
```makefile
# Set as default dictionary
ro.config.dictionary_default=io.github.yamin8000.owl
```

## Removed Apps
The following conflicting apps are removed from the build:
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Dictionary \
    DictionaryProvider \
    WordLookup \
    Translator \
    com.android.dictionary \
    com.android.translate
```

## Special Configuration Notes
- **JNI Libraries**: This APK contains compressed JNI libraries
- **Preprocessed**: Set to `false` to handle compressed libraries
- **Certificate**: Uses `platform` certificate for proper signing
- **Build Issues**: Resolved JNI compression errors

## Features
- Comprehensive dictionary database
- Word definitions and meanings
- Pronunciation guides
- Multiple language support
- Offline functionality
- Word search and lookup
- Modern material design UI

## Dependencies
- No special dependencies required
- Uses standard Android text processing
- Compatible with all Android versions 11+

## Troubleshooting
- **App not appearing**: Check if included in PRODUCT_PACKAGES
- **Not default dictionary**: Verify ro.config.dictionary_default setting
- **Build errors**: Ensure APK file exists in correct location
- **JNI errors**: Verify preprocessed: false and certificate: "platform"

## Maintenance
- **Updates**: Replace APK file and update version number
- **Configuration**: Modify overrides list as needed
- **Testing**: Verify dictionary functionality after updates
- **JNI Issues**: Always check for compressed JNI libraries
