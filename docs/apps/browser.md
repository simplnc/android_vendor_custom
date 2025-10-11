# Browser App Integration (threads.thor)

## Overview
**App Name**: threads.thor  
**Package**: threads.thor  
**Type**: Regular System App (SystemPrebuilts)  
**Replaces**: AOSP Browser, WebView, Jelly, Gello, Chrome, Chromium

## APK Details
- **File**: `SystemPrebuilts/browser/threads.thor_176.apk`
- **Size**: 5.1MB
- **Version**: 176
- **Architecture**: Universal (arm64, arm, x86)

## Build Configuration
```bp
android_app_import {
    name: "threads.thor",
    apk: "SystemPrebuilts/browser/threads.thor_176.apk",
    preprocessed: true,
    dex_preopt: { enabled: false, },
    product_specific: true,
    overrides: [
        "Browser",           // AOSP default browser
        "WebView",           // AOSP webview
        "Jelly",             // LineageOS browser
        "Gello",             // Legacy LineageOS browser
        "Chrome",            // Google Chrome (if present)
        "Chromium",          // Chromium browser
        "com.android.browser", // AOSP browser package
        "com.android.chrome",   // Chrome package
        "com.google.android.apps.chrome", // Chrome package
    ],
}
```

## App Overrides
This app will replace the following default system browsers:
- **AOSP Browser**: Default Android browser
- **WebView**: System web view component
- **Jelly**: LineageOS default browser
- **Gello**: Legacy LineageOS browser
- **Chrome**: Google Chrome browser
- **Chromium**: Open source Chromium browser

## Installation Location
- **Path**: `/product/app/threads.thor/`
- **Type**: Regular system app (non-privileged)
- **Permissions**: Standard browser permissions

## Default App Configuration
```makefile
# Set as default browser
ro.config.browser_default=threads.thor
```

## Removed Apps
The following conflicting apps are removed from the build:
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Browser \
    WebView \
    Jelly \
    Gello \
    Chrome \
    Chromium \
    com.android.browser \
    com.android.chrome \
    com.google.android.apps.chrome
```

## Features
- Modern web browser interface
- Tabbed browsing support
- Bookmark management
- History tracking
- Download management
- Privacy-focused browsing

## Dependencies
- No special dependencies required
- Uses standard Android web components
- Compatible with all Android versions 11+

## Troubleshooting
- **App not appearing**: Check if included in PRODUCT_PACKAGES
- **Not default browser**: Verify ro.config.browser_default setting
- **Build errors**: Ensure APK file exists in correct location

## Maintenance
- **Updates**: Replace APK file and update version number
- **Configuration**: Modify overrides list as needed
- **Testing**: Verify browser functionality after updates