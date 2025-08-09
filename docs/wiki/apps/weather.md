# Weather App Integration (org.breezyweather)

## Overview
- **App Name**: Breezy Weather
- **Package**: org.breezyweather
- **Type**: Regular System App
- **Replaces**: Default Android weather apps

## APK Details
- **File**: `SystemPrebuilts/weather/org.breezyweather_50408.apk`
- **Size**: ~50MB
- **Version**: 5.0.4
- **Architecture**: ARM64/ARM
- **Special Note**: Contains compressed JNI libraries

## Build Configuration (Android.bp)
```bp
android_app_import {
    name: "org.breezyweather",
    apk: "SystemPrebuilts/weather/org.breezyweather_50408.apk",
    preprocessed: false,     // Contains compressed JNI libraries
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "Weather",           // AOSP default weather
        "WeatherProvider",   // Weather provider services
        "LineageWeather",    // LineageOS weather
        "OmniWeather",       // OmniROM weather
        "com.android.weather", // AOSP weather package
        "com.android.weatherprovider", // AOSP weather provider package
    ],
}
```

## App Overrides
The app will replace the following default Android weather applications:
- **AOSP Weather**: Default Android weather app
- **WeatherProvider**: Android weather provider service
- **LineageOS Weather**: LineageOS default weather
- **OmniROM Weather**: OmniROM weather app

## Installation Location
- **Path**: `/system/app/org.breezyweather/`
- **Type**: Regular system app (non-privileged)

## Default App Configuration (config.mk)
```makefile
# Make Breezy Weather the default weather app
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.weather_default=org.breezyweather
```

## Removed Apps (config.mk)
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Weather \
    WeatherProvider \
    LineageWeather \
    OmniWeather \
    com.android.weather \
    com.android.weatherprovider
```

## Features
- **Weather Forecasts**: Accurate weather predictions
- **Multiple Sources**: Support for various weather providers
- **Widgets**: Home screen weather widgets
- **Notifications**: Weather alerts and updates
- **Maps Integration**: Weather maps and radar
- **Multiple Units**: Celsius/Fahrenheit support
- **Offline Support**: Basic offline functionality

## Dependencies
- **Android Framework**: Standard Android weather APIs
- **Location Services**: GPS and location access
- **Internet**: Network connectivity for weather data
- **JNI Libraries**: Native libraries for performance

## Troubleshooting
### Common Issues
1. **JNI Library Errors**: APK contains compressed JNI libraries
2. **Weather Not Loading**: Check internet and location permissions
3. **App Crashes**: Verify JNI library compatibility

### Solutions
- **JNI Issue**: Use `preprocessed: false` and `certificate: "platform"`
- **Permissions**: Ensure location and internet permissions are granted
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
- **Weather Data**: Requires internet connection for real-time weather updates
