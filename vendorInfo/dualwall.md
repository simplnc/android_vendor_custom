# Dual Wallpaper Application

## Overview
**Application Name:** Dual Wallpaper  
**Package Name:** `dualwall`  
**APK File:** `dualwall.apk`  
**Category:** System Enhancement Application  
**Replaces:** AOSP Wallpaper Manager, Dual Wallpaper apps

## Description
Dual Wallpaper is a specialized application that enables users to set different wallpapers for their lock screen and home screen. This provides enhanced customization options and personalization for Android devices.

## Features
- **Dual Wallpaper Support:** Separate wallpapers for lock screen and home screen
- **Easy Switching:** Quick wallpaper switching between screens
- **Customization Options:** Various wallpaper fitting options
- **Gallery Integration:** Direct access to photo gallery
- **Live Wallpapers:** Support for animated wallpapers
- **Batch Operations:** Set multiple wallpapers at once

## Technical Details
- **Build Configuration:** `android_app_import` with `preprocessed: true`
- **Certificate:** Uses default certificate (preprocessed APK)
- **DEX Preopt:** Disabled for compatibility
- **Product Specific:** Yes
- **Overrides:** DualWallpaper, WallpaperManager, com.android.wallpaper

## Installation
The application is automatically installed as a system app during LineageOS build process and replaces default wallpaper management applications.

## Default Configuration
- **System Integration:** Integrated with Android's wallpaper framework
- **Permission Requirements:** Storage access for wallpaper files
- **Service Integration:** Works with system wallpaper service

## Security Considerations
- **Local Storage Only:** No external data access
- **Minimal Permissions:** Only requires storage and wallpaper permissions
- **Privacy Focused:** No data collection or tracking
- **System Integration:** Safe integration with Android framework

## User Benefits
- **Enhanced Customization:** More wallpaper options than default
- **Dual Screen Support:** Different wallpapers for lock and home screens
- **Easy Management:** Simplified wallpaper switching
- **Performance:** Optimized for smooth wallpaper transitions

## Wallpaper Management
- **Lock Screen Wallpaper:** Set custom lock screen backgrounds
- **Home Screen Wallpaper:** Customize home screen appearance
- **Live Wallpapers:** Support for animated backgrounds
- **Gallery Access:** Direct integration with photo gallery

## Troubleshooting
- **Wallpaper Not Applying:** Check file permissions and format support
- **Performance Issues:** Optimize wallpaper resolution
- **Live Wallpaper Problems:** Verify animation compatibility
- **Storage Issues:** Check available storage space

## Supported Formats
- **Image Formats:** JPEG, PNG, WebP, GIF
- **Live Wallpapers:** APK-based animated wallpapers
- **Resolution Support:** Up to device maximum resolution
- **Aspect Ratios:** Automatic scaling and cropping

## Version Information
- **Current Version:** Latest stable release
- **Update Policy:** Regular updates through developer
- **Compatibility:** Android 7.0+ (API level 24+)

---
*Last Updated: December 2024*
