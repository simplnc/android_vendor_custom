# Music App Integration (com.mardous.booming)

## Overview
**App Name**: com.mardous.booming  
**Package**: com.mardous.booming  
**Type**: Regular System App (SystemPrebuilts)  
**Replaces**: Music, Music2, Eleven, OmniMusic, AudioPlayer, MediaPlayer

## APK Details
- **File**: `SystemPrebuilts/music/com.mardous.booming_1040300.apk`
- **Size**: 6.6MB
- **Version**: 1040300
- **Architecture**: Universal (arm64, arm, x86)

## Build Configuration
```bp
android_app_import {
    name: "com.mardous.booming",
    apk: "SystemPrebuilts/music/com.mardous.booming_1040300.apk",
    preprocessed: true,
    dex_preopt: { enabled: false, },
    product_specific: true,
    overrides: [
        "Music",             // AOSP default music
        "Music2",            // Alternative AOSP music
        "Eleven",            // LineageOS music player
        "OmniMusic",         // OmniROM music
        "AudioPlayer",       // Generic audio players
        "MediaPlayer",       // Media players
        "com.android.music", // AOSP music package
        "com.android.music2", // AOSP music2 package
    ],
}
```

## App Overrides
This app will replace the following default system music apps:
- **Music**: AOSP default music player
- **Music2**: Alternative AOSP music player
- **Eleven**: LineageOS music player
- **OmniMusic**: OmniROM music player
- **AudioPlayer**: Generic audio players
- **MediaPlayer**: Media player utilities

## Installation Location
- **Path**: `/product/app/com.mardous.booming/`
- **Type**: Regular system app (non-privileged)
- **Permissions**: Audio and media permissions

## Default App Configuration
```makefile
# Set as default music player
ro.config.music_default=com.mardous.booming
```

## Removed Apps
The following conflicting apps are removed from the build:
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Music \
    Music2 \
    Eleven \
    OmniMusic \
    AudioPlayer \
    MediaPlayer \
    com.android.music \
    com.android.music2
```

## Features
- Full music player functionality
- Playlist management
- Equalizer and audio effects
- Album art display
- Lyrics support
- Multiple audio format support
- Modern material design UI
- Widget support

## Dependencies
- No special dependencies required
- Uses standard Android media APIs
- Compatible with all Android versions 11+

## Troubleshooting
- **App not appearing**: Check if included in PRODUCT_PACKAGES
- **Not default music player**: Verify ro.config.music_default setting
- **Build errors**: Ensure APK file exists in correct location

## Maintenance
- **Updates**: Replace APK file and update version number
- **Configuration**: Modify overrides list as needed
- **Testing**: Verify music player functionality after updates
