# Recorder App Integration (recordyou)

## Overview
- **App Name**: recordyou
- **Package**: com.recordyou.app
- **Type**: Regular System App
- **Replaces**: Default Android recorder apps

## APK Details
- **File**: `SystemPrebuilts/recorder/recordyou.apk`
- **Size**: Varies by version
- **Version**: Latest stable release
- **Architecture**: ARM64/ARM

## Build Configuration (Android.bp)
```bp
android_app_import {
    name: "recordyou",
    apk: "SystemPrebuilts/recorder/recordyou.apk",
    preprocessed: true,
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "Recorder",         // AOSP default recorder
        "SoundRecorder",    // Alternative AOSP recorder
        "AudioRecorder",    // Audio recording apps
        "VoiceRecorder",    // Voice recording apps
        "LineageRecorder",  // LineageOS recorder
        "com.android.soundrecorder", // AOSP sound recorder package
        "com.android.voicerecorder", // AOSP voice recorder package
    ],
}
```

## App Overrides
The app will replace the following default Android recorder applications:
- **AOSP Recorder**: Default Android sound recorder
- **SoundRecorder**: Alternative Android recorder
- **AudioRecorder**: Generic audio recording apps
- **VoiceRecorder**: Voice-specific recording apps
- **LineageOS Recorder**: LineageOS default recorder

## Installation Location
- **Path**: `/system/app/recordyou/`
- **Type**: Regular system app (non-privileged)

## Default App Configuration (config.mk)
```makefile
# Make recordyou the default recorder app
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.recorder_default=recordyou
```

## Removed Apps (config.mk)
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Recorder \
    SoundRecorder \
    AudioRecorder \
    VoiceRecorder \
    LineageRecorder \
    com.android.soundrecorder \
    com.android.voicerecorder
```

## Features
- **Audio Recording**: High-quality audio recording
- **Voice Recording**: Optimized for voice capture
- **Format Support**: Multiple audio formats
- **Quality Options**: Various recording quality settings
- **Simple Interface**: Clean, user-friendly design

## Dependencies
- **Android Framework**: Standard Android recording APIs
- **Audio System**: Android audio recording system
- **Storage**: Access to device storage for saving recordings

## Troubleshooting
### Common Issues
1. **Recording Not Working**: Check microphone permissions
2. **Storage Issues**: Verify storage permissions
3. **Quality Problems**: Check recording settings

### Solutions
- Ensure microphone permissions are granted
- Verify storage access permissions
- Check app settings for quality configuration

## Maintenance
- **Updates**: Check for newer APK versions
- **Permissions**: Verify required permissions are maintained
- **Compatibility**: Test with new Android versions
- **Backup**: Keep backup of working APK versions

## Notes
- This is a regular system app, not privileged
- No special permissions required beyond standard recording permissions
- Compatible with standard Android audio recording APIs
