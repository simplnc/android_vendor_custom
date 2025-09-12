# Thunderbird Email Application

## Overview
**Application Name:** Thunderbird Email  
**Package Name:** `net.thunderbird.android`  
**APK File:** `net.thunderbird.android_15.apk`  
**Category:** Essential Utility Application  
**Replaces:** AOSP Email, Gmail, LineageOS Email

## Description
Thunderbird Email is Mozilla's official email client for Android, providing a secure and privacy-focused alternative to default email applications. It offers robust email management with support for multiple accounts, encryption, and advanced filtering.

## Features
- **Multi-Account Support:** Manage multiple email accounts from different providers
- **Privacy Focused:** Built by Mozilla with privacy-first principles
- **Encryption Support:** Built-in support for email encryption
- **Advanced Filtering:** Powerful email filtering and organization tools
- **Open Source:** Fully open source and transparent
- **Cross-Platform:** Syncs with desktop Thunderbird

## Technical Details
- **Build Configuration:** `android_app_import` with `preprocessed: true`
- **Certificate:** Uses default certificate (preprocessed APK)
- **DEX Preopt:** Disabled for compatibility
- **Product Specific:** Yes
- **Overrides:** Email, Email2, Gmail, LineageEmail, OmniEmail, com.android.email, com.google.android.gm

## Installation
The application is automatically installed as a system app during LineageOS build process and replaces default email applications.

## Default Configuration
- **Property Override:** `ro.config.email_default=net.thunderbird.android`
- **System Integration:** Fully integrated with Android's email framework

## Security Considerations
- **Privacy Focused:** No data collection or tracking
- **Open Source:** Code is publicly auditable
- **Mozilla Foundation:** Backed by trusted organization
- **Regular Updates:** Maintained by Mozilla team

## User Benefits
- **Enhanced Privacy:** Better privacy protection than default email apps
- **Professional Features:** Advanced email management capabilities
- **Cross-Platform Sync:** Seamless integration with desktop Thunderbird
- **No Vendor Lock-in:** Works with any email provider

## Troubleshooting
- **Account Setup:** Follow standard IMAP/POP3 configuration
- **Sync Issues:** Check network connectivity and server settings
- **Performance:** Optimized for modern Android devices

## Version Information
- **Current Version:** 15
- **Update Policy:** Regular updates through Mozilla
- **Compatibility:** Android 7.0+ (API level 24+)

---
*Last Updated: December 2024*
