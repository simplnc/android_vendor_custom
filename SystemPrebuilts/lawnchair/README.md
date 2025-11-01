# Lawnchair Launcher Integration

## 📦 Required Files

### Main APK File:
- **Lawnchair.apk** - Place the Lawnchair APK file in this directory

## 📥 Downloading Lawnchair APK

### Option 1: GitHub Releases (Recommended)
1. Visit: https://github.com/LawnchairLauncher/lawnchair/releases
2. Download the latest release APK (nightly or stable)
3. Rename it to `Lawnchair.apk`
4. Place it in this directory

### Option 2: Play Store
1. Download from Play Store: https://play.google.com/store/apps/details?id=app.lawnchair.nightly
2. Extract the APK using a file manager or ADB
3. Rename to `Lawnchair.apk`
4. Place it in this directory

### Option 3: Development Builds
- Development builds are available at: https://github.com/LawnchairLauncher/lawnchair/releases
- Look for "nightly" or "dev" builds

## 📋 Package Information

- **Package Name**: `app.lawnchair.nightly`
- **Installation Location**: `/system_ext/priv-app/Lawnchair/`
- **Type**: Privileged system launcher
- **Required**: Android 10+ (API 29+) for full features

## ✅ Integration Status

- ✅ Android.bp configuration created
- ✅ Permission XML files created
- ✅ Sysconfig XML file created
- ✅ config.mk updated
- ⚠️ **APK file required**: Place `Lawnchair.apk` in this directory

## 🔗 References

- **Main Repository**: https://github.com/LawnchairLauncher/lawnchair
- **Vendor Integration**: Based on Snow-Irony/vendor_lawnchair
- **QuickSwitch Support**: https://github.com/Magisk-Modules-Repo/quickstepswitcher

