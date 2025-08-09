# Android Custom Vendor - Fossify Gallery Override

This vendor overlay ensures that **Fossify Gallery** becomes the default and only gallery application across all Android ROMs including LineageOS, AOSP, and Pixel builds.

## Overview

This configuration:
- ✅ Replaces ALL existing gallery apps (AOSP, LineageOS, Pixel, etc.)
- ✅ Grants comprehensive permissions automatically
- ✅ Sets Fossify Gallery as the default for all media intents
- ✅ Removes conflicting gallery applications from the build
- ✅ Provides privileged system app status

## Replaced Applications

The following gallery applications will be completely overridden:

### AOSP & Generic Android
- `Gallery` - Default AOSP gallery
- `Gallery2` - Alternative AOSP gallery
- `MediaGallery` - Generic media gallery apps
- `PhotoGallery` - Generic photo gallery apps
- `ImageViewer` - Basic image viewers
- `MediaViewer` - Basic media viewers

### Google/Pixel Specific
- `Photos` - Google Photos
- `PixelPhotos` - Pixel-specific Photos app
- `GalleryGo` - Google Gallery Go

### LineageOS Specific
- `Eleven` - LineageOS default gallery

### Camera/Gallery Combos
- `Camera` - ROMs that bundle gallery with camera
- `LegacyCamera` - Legacy camera/gallery combinations
- `Snap` - Qualcomm camera/gallery
- `SnapdragonCamera` - Snapdragon camera with gallery
- `OpenCamera` - Open camera with gallery features

### Alternative Galleries
- `SimpleGallery` - Simple Gallery alternatives
- `QuickPic` - QuickPic gallery
- `FossifyGallery` - Prevents conflicts with other Fossify installs

## Granted Permissions

The app automatically receives the following permissions when installed:

### Core Media Permissions
- `MANAGE_EXTERNAL_STORAGE` - Full storage access
- `MANAGE_MEDIA` - Media management capabilities
- `READ_EXTERNAL_STORAGE` - Read shared storage contents
- `WRITE_EXTERNAL_STORAGE` - Modify shared storage contents
- `ACCESS_MEDIA_LOCATION` - Read location data from media files

### Scoped Storage Permissions (Android 13+)
- `READ_MEDIA_IMAGES` - Read image files from shared storage
- `READ_MEDIA_VIDEO` - Read video files from shared storage
- `READ_MEDIA_AUDIO` - Read audio files from shared storage
- `READ_MEDIA_VISUAL_USER_SELECTED` - Read user-selected images and videos

### System Integration
- `SET_WALLPAPER` - Set system wallpaper
- `SET_WALLPAPER_HINTS` - Provide wallpaper hints
- `RECEIVE_BOOT_COMPLETED` - Run at startup
- `POST_NOTIFICATIONS` - Show notifications
- `USE_FINGERPRINT` / `USE_BIOMETRIC` - Biometric authentication

### Additional Features
- `CAMERA` / `RECORD_AUDIO` - Camera and video recording
- `WRITE_SETTINGS` / `WRITE_SECURE_SETTINGS` - System settings access
- `org.fossify.android.permission.WRITE_GLOBAL_SETTINGS` - Custom permission

## File Structure

```
android_vendor_custom/
├── config.mk                                    # Main configuration
├── SystemPrebuilts/
│   ├── Android.bp                              # Build configuration
│   └── gallery/
│       ├── org.fossify.gallery.apk            # Gallery APK
│       ├── privapp-permissions-org.fossify.gallery.xml  # Permissions
│       └── default-gallery-intent.xml         # Intent handlers
└── README.md                                   # This file
```

## Integration

### For ROM Builders

1. Include this vendor in your ROM build:
   ```bash
   # In your device tree or ROM configuration
   $(call inherit-product, vendor/custom/config.mk)
   ```

2. The configuration will automatically:
   - Install Fossify Gallery as a privileged system app
   - Remove all conflicting gallery applications
   - Grant all necessary permissions
   - Set up proper intent handling

### For Users

When you flash a ROM with this vendor overlay:
- Fossify Gallery will be the only gallery app
- All permissions will be pre-granted (no permission dialogs)
- Opening any image/video will use Fossify Gallery
- The app will have full system integration

## Compatibility

- ✅ **LineageOS** (all versions)
- ✅ **AOSP** builds
- ✅ **Pixel** builds and derivatives
- ✅ **Custom ROMs** based on the above
- ✅ **Android 11+** (full scoped storage support)
- ✅ **Android 13+** (granular media permissions)

## Security Notes

This configuration grants extensive permissions to ensure full gallery functionality. The app is installed as a privileged system application with the same level of access as built-in system apps.

## Building

This vendor overlay integrates with the standard Android build system. No special build steps are required beyond including the vendor in your product configuration.

---

**Note**: This configuration completely replaces the default gallery experience. Users will not be able to install or use other gallery applications unless they manually override these settings. 