# Photo Widget Application

## Overview
**Application Name:** Photo Widget  
**Package Name:** `com.fibelatti.photowidget`  
**APK File:** `com.fibelatti.photowidget-v1.32.3-1320300-release.apk`  
**Category:** Media and Tool Application  
**Replaces:** AOSP Photo Widget, Image Widget, Gallery Widget

## Description
Photo Widget is a lightweight and efficient widget application that allows users to display photos directly on their home screen. It provides a clean, customizable interface for showcasing personal photos without requiring a full gallery application.

## Features
- **Home Screen Widgets:** Display photos directly on home screen
- **Customizable Display:** Various widget sizes and layouts
- **Photo Selection:** Choose from gallery or specific folders
- **Auto-Rotation:** Automatic photo rotation and slideshow
- **Lightweight:** Minimal resource usage
- **Privacy Focused:** Local photo access only

## Technical Details
- **Build Configuration:** `android_app_import` with `preprocessed: true`
- **Certificate:** Uses default certificate (preprocessed APK)
- **DEX Preopt:** Disabled for compatibility
- **Product Specific:** Yes
- **Overrides:** PhotoWidget, ImageWidget, GalleryWidget, com.android.photowidget

## Installation
The application is automatically installed as a system app during LineageOS build process and replaces default photo widget applications.

## Default Configuration
- **Property Override:** `ro.config.photo_default=com.fibelatti.photowidget`
- **System Integration:** Integrated with Android's widget framework

## Security Considerations
- **Local Access Only:** No network permissions required
- **Privacy Focused:** No data collection or external access
- **Minimal Permissions:** Only requires photo access permissions
- **Open Source:** Transparent codebase

## User Benefits
- **Enhanced Home Screen:** Beautiful photo display on home screen
- **Customization:** Flexible widget sizing and positioning
- **Performance:** Lightweight and efficient
- **Privacy:** No external data sharing

## Widget Configuration
- **Widget Sizes:** Multiple size options available
- **Photo Sources:** Gallery, specific folders, or individual photos
- **Display Options:** Slideshow, single photo, or rotation
- **Update Frequency:** Configurable refresh rates

## Troubleshooting
- **Widget Not Appearing:** Check home screen widget permissions
- **Photo Loading Issues:** Verify photo file permissions
- **Performance:** Optimize widget refresh frequency
- **Memory Usage:** Monitor widget count and size

## Version Information
- **Current Version:** 1.32.3 (Build 1320300)
- **Update Policy:** Regular updates through developer
- **Compatibility:** Android 7.0+ (API level 24+)

---
*Last Updated: December 2024*
