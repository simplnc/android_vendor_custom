# Lawnchair Launcher Integration Guide

## 📋 Repository Analysis

### Analyzed Repositories:
1. **ProjectZenithAOSP/vendor_lawnchair** - Uses source build with TARGET_INCLUDE_LAWNCHAIR flag
2. **Snow-Irony/vendor_lawnchair** - Uses prebuilt APK approach (recommended for this vendor)
3. **LawnchairLauncher/lawnchair** - Main source repository

### Recommended Approach: Prebuilt APK (Snow-Irony method)

## 🎯 Integration Requirements

### 1. Required Files:
- **Lawnchair.apk** - The prebuilt APK file (package: `app.lawnchair.nightly`)
- **privapp-permissions-lawnchair.xml** - Privileged permissions configuration
- **lawnchair-hiddenapi-package-whitelist.xml** - Hidden API whitelist configuration

### 2. Package Details:
- **Package Name**: `app.lawnchair.nightly`
- **Type**: Privileged system app
- **Location**: `/system_ext/priv-app/Lawnchair/` (system_ext_specific: true)
- **Overrides**: Home, Launcher2, Launcher3, Launcher3QuickStep, NexusLauncherRelease, TrebuchetQuickStep

### 3. Required Permissions (Privileged):
- `android.permission.BIND_APPWIDGET`
- `android.permission.BROADCAST_CLOSE_SYSTEM_DIALOGS`
- `android.permission.CONTROL_REMOTE_APP_TRANSITION_ANIMATIONS`
- `android.permission.PACKAGE_USAGE_STATS`
- `android.permission.START_TASKS_FROM_RECENTS`
- `android.permission.STATUS_BAR`
- `android.permission.STOP_APP_SWITCHES`
- `android.permission.WRITE_SECURE_SETTINGS`

## 📦 File Structure Required

```
SystemPrebuilts/
└── lawnchair/
    ├── Lawnchair.apk
    ├── permissions/
    │   └── privapp-permissions-lawnchair.xml
    └── sysconfig/
        └── lawnchair-hiddenapi-package-whitelist.xml
```

## 🔧 Android.bp Configuration

```blueprint
// Lawnchair Launcher - Privileged System App
android_app_import {
    name: "Lawnchair",
    apk: "SystemPrebuilts/lawnchair/Lawnchair.apk",
    preprocessed: false,
    certificate: "platform",
    privileged: true,
    system_ext_specific: true,
    dex_preopt: {
        enabled: false,
    },
    required: [
        "lawnchair-hiddenapi-package-whitelist",
        "privapp-permissions-lawnchair",
    ],
    overrides: [
        "Home",
        "Launcher2",
        "Launcher3",
        "Launcher3QuickStep",
        "NexusLauncherRelease",
        "TrebuchetQuickStep",
        "Trebuchet",
        "Launcher3",
    ],
}

// Hidden API Whitelist Configuration
prebuilt_etc_xml {
    name: "lawnchair-hiddenapi-package-whitelist",
    src: "SystemPrebuilts/lawnchair/sysconfig/lawnchair-hiddenapi-package-whitelist.xml",
    filename_from_src: true,
    sub_dir: "sysconfig",
    system_ext_specific: true,
}

// Privileged Permissions Configuration
prebuilt_etc_xml {
    name: "privapp-permissions-lawnchair",
    src: "SystemPrebuilts/lawnchair/permissions/privapp-permissions-lawnchair.xml",
    filename_from_src: true,
    sub_dir: "permissions",
    system_ext_specific: true,
}
```

## 📝 config.mk Updates

### Add to PRODUCT_PACKAGES:
```makefile
# Launcher Configuration
PRODUCT_PACKAGES += \
    Lawnchair \
    lawnchair-hiddenapi-package-whitelist \
    privapp-permissions-lawnchair
```

### Set as Default Launcher:
```makefile
# Set Lawnchair as default launcher
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.launcher_default=Lawnchair \
    ro.launcher.default=app.lawnchair.nightly
```

### QuickSwitch Support (Optional):
```makefile
# QuickSwitch integration for Android 10+
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.quickswitch_lawnchair_shipped=1
```

## 🔍 QuickSwitch Integration (Framework Base Patch)

The referenced commit (8d7f7b87b768a1223df3ba9bd26ac9eaa968d116) from ProjectMatrixx adds QuickSwitch support. This may require:
- Framework base patches for QuickSwitch integration
- Root access for full QuickSwitch functionality
- Additional configuration in frameworks/base

**Note**: QuickSwitch requires root and framework modifications. This is optional and can be added later.

## 📥 Downloading Lawnchair APK

### Option 1: Download from GitHub Releases
```bash
# Check latest release from LawnchairLauncher/lawnchair
# Download the APK and place it in SystemPrebuilts/lawnchair/
```

### Option 2: Build from Source (Advanced)
If you want to build Lawnchair yourself:
```bash
git clone https://github.com/LawnchairLauncher/lawnchair
cd lawnchair
# Follow build instructions
```

### Option 3: Use Pre-built APK
- Available on [Play Store](https://play.google.com/store/apps/details?id=app.lawnchair.nightly)
- Development builds available on [GitHub](https://github.com/LawnchairLauncher/lawnchair/releases)

## ⚠️ Important Notes

1. **System Ext Specific**: Lawnchair uses `system_ext_specific: true` instead of `product_specific: true`
   - This installs to `/system_ext/priv-app/` instead of `/product/app/`
   - Ensures proper privileged access

2. **Required Modules**: The two XML files are required modules, not just copied files
   - They must be defined as `prebuilt_etc_xml` in Android.bp
   - Referenced in the `required` array of the main app

3. **Package Name**: The package name is `app.lawnchair.nightly`
   - This is different from the module name `Lawnchair`

4. **Overrides**: Lawnchair overrides multiple launchers to ensure it replaces all default launchers

## 🔗 Reference Links

- **Main Repository**: https://github.com/LawnchairLauncher/lawnchair
- **Vendor Repo (Prebuilt)**: https://github.com/Snow-Irony/vendor_lawnchair
- **Vendor Repo (Source)**: https://github.com/ProjectZenithAOSP/vendor_lawnchair
- **QuickSwitch Module**: https://github.com/Magisk-Modules-Repo/quickstepswitcher
- **Framework Patch**: https://github.com/ProjectMatrixx/android_frameworks_base/commit/8d7f7b87b768a1223df3ba9bd26ac9eaa968d116

