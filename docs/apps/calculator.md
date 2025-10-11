# Calculator App Integration (CalculatorYou)

## Overview
**App Name**: CalculatorYou  
**Package**: CalculatorYou  
**Type**: Regular System App (SystemPrebuilts)  
**Replaces**: AOSP Calculator, Calculator2, LineageCalculator

## APK Details
- **File**: `SystemPrebuilts/calculator/CalculatorYou-v3.1.2.apk`
- **Size**: 3.1MB
- **Version**: v3.1.2
- **Architecture**: Universal (arm64, arm, x86)

## Build Configuration
```bp
android_app_import {
    name: "CalculatorYou",
    apk: "SystemPrebuilts/calculator/CalculatorYou-v3.1.2.apk",
    preprocessed: true,
    dex_preopt: { enabled: false, },
    product_specific: true,
    overrides: [
        "Calculator",        // AOSP default calculator
        "Calculator2",       // Alternative AOSP calculator
        "DeskClock",         // DeskClock with calculator
        "LineageCalculator", // LineageOS calculator
        "OmniCalculator",    // OmniROM calculator
        "com.android.calculator2", // AOSP calculator package
        "com.android.calculator",  // AOSP calculator package
    ],
}
```

## App Overrides
This app will replace the following default system calculators:
- **AOSP Calculator**: Default Android calculator
- **Calculator2**: Alternative AOSP calculator
- **LineageCalculator**: LineageOS calculator
- **OmniCalculator**: OmniROM calculator
- **DeskClock**: Clock app with calculator functionality

## Installation Location
- **Path**: `/product/app/CalculatorYou/`
- **Type**: Regular system app (non-privileged)
- **Permissions**: Standard calculator permissions

## Default App Configuration
```makefile
# Set as default calculator
ro.config.calculator_default=CalculatorYou
```

## Removed Apps
The following conflicting apps are removed from the build:
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Calculator \
    Calculator2 \
    com.android.calculator2 \
    com.android.calculator
```

## Features
- Advanced mathematical functions
- Scientific calculator mode
- Unit conversions
- History tracking
- Modern material design UI
- Landscape and portrait support

## Dependencies
- No special dependencies required
- Uses standard Android math libraries
- Compatible with all Android versions 11+

## Troubleshooting
- **App not appearing**: Check if included in PRODUCT_PACKAGES
- **Not default calculator**: Verify ro.config.calculator_default setting
- **Build errors**: Ensure APK file exists in correct location

## Maintenance
- **Updates**: Replace APK file and update version number
- **Configuration**: Modify overrides list as needed
- **Testing**: Verify calculator functionality after updates
