# ⚙️ Configuration Reference - Technical Details

## 🎯 **Overview**

This document provides detailed technical information about the configuration files and build system used in the Custom LineageOS Vendor Configuration.

## 📁 **File Structure**

### **Root Directory**
```
android_vendor_custom/
├── Android.bp              # Soong build configuration
├── config.mk               # Make build configuration
├── SystemPrebuilts/        # APK files directory
├── vendorInfo/             # Documentation directory
├── LICENSE                 # License file
└── README.md               # Project documentation
```

### **SystemPrebuilts Directory**
```
SystemPrebuilts/
├── browser/                # DuckDuckGo Browser
├── calculator/             # CalculatorYou
├── calendar/               # Simple Calendar
├── contacts/               # Simple Contacts
├── datamonitor/            # Data Monitor
├── dictionary/             # Owl Dictionary
├── email/                  # Thunderbird Email
├── filemanager/            # Simple File Manager
├── firewall/               # Firewall
├── gallery/                # Simple Gallery
├── music/                  # Booming Music Player
├── notes/                  # Easy Notes
├── photo/                  # Photo Widget
├── quicktiles/             # QuickTiles
├── recorder/               # RecordYou
├── weather/                # Breezy Weather
├── wifiinfo/               # WiFi Info
├── taptap/                 # TapTap
├── athena/                 # Athena
├── chrono/                 # Chrono
├── dailyyou/               # Daily You
├── launchpad/              # Launchpad
├── privacium/              # Privacium
├── drawanywhere/           # Draw Anywhere
├── starioLauncher/         # Stario Launcher
├── imageToolbox/           # Image Toolbox
├── nativeAlpha/            # Native Alpha
├── digipaws/               # DigiPaws
└── locklock/               # LockLock
```

## 🔧 **Android.bp Configuration**

### **File Structure**
```blueprint
// Core System Applications
android_app_import {
    name: "app_name",
    apk: "SystemPrebuilts/folder/app.apk",
    preprocessed: true,
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "DefaultApp",
        "AlternativeApp",
    ],
}

// Essential Utility Applications
// ... (similar structure)

// Media and Tool Applications
// ... (similar structure)

// System Enhancement Applications
// ... (similar structure)

// New Applications
// ... (similar structure)

// System Tool Applications
// ... (similar structure)
```

### **Configuration Options**

#### **Basic Configuration**
```blueprint
android_app_import {
    name: "app_name",                    // Module name
    apk: "SystemPrebuilts/folder/app.apk", // APK file path
    preprocessed: true,                  // APK is preprocessed
    dex_preopt: {                       // DEX optimization
        enabled: false,                 // Disable DEX preopt
    },
    product_specific: true,             // Install to product partition
    overrides: [                        // Apps to replace
        "DefaultApp",
        "AlternativeApp",
    ],
}
```

#### **Advanced Configuration**
```blueprint
android_app_import {
    name: "app_name",
    apk: "SystemPrebuilts/folder/app.apk",
    preprocessed: false,                // APK is not preprocessed
    certificate: "platform",            // Sign with platform certificate
    dex_preopt: {
        enabled: true,                  // Enable DEX preopt
    },
    product_specific: true,
    overrides: [
        "DefaultApp",
    ],
}
```

### **Configuration Parameters**

#### **Required Parameters**
- **name**: Module name (must be unique)
- **apk**: Path to APK file (relative to Android.bp)

#### **Optional Parameters**
- **preprocessed**: Whether APK is preprocessed (default: true)
- **certificate**: Certificate to sign APK (default: "platform")
- **dex_preopt**: DEX optimization settings
- **product_specific**: Install to product partition (default: true)
- **overrides**: List of apps to replace

#### **DEX Preopt Options**
```blueprint
dex_preopt: {
    enabled: false,        // Disable DEX preopt (recommended)
    enabled: true,         // Enable DEX preopt (better performance)
}
```

#### **Certificate Options**
```blueprint
certificate: "platform",     // Platform certificate (system apps)
certificate: "shared",       // Shared certificate (user apps)
certificate: "media",        // Media certificate (media apps)
```

## 📋 **config.mk Configuration**

### **File Structure**
```makefile
# Core System Applications (3 apps)
PRODUCT_PACKAGES += \
    duckduck \
    CalculatorYou \
    calendar.foss

# Essential Utility Applications (6 apps)
PRODUCT_PACKAGES += \
    org.fossify.gallery \
    org.fossify.filemanager \
    com.bnyro.contacts \
    com.drnoob.datamonitor \
    io.github.yamin8000.owl \
    net.thunderbird.android

# Media and Tool Applications (5 apps)
PRODUCT_PACKAGES += \
    com.mardous.booming \
    recordyou \
    org.breezyweather \
    com.truemlgpro.wifiinfo \
    com.fibelatti.photowidget

# System Enhancement Applications (4 apps)
PRODUCT_PACKAGES += \
    TapTap \
    QuickTiles \
    firewall \
    com.kin.easynotes

# New Applications (9 apps)
PRODUCT_PACKAGES += \
    com.demizo.daily_you \
    com.devrinth.launchpad \
    com.kaleedtc.privacium \
    com.shezik.drawanywhere \
    com.stario.launcher \
    image.toolbox \
    native.alpha \
    nethical.digipaws \
    nethical.locklock

# System Tool Applications (2 apps)
PRODUCT_PACKAGES += \
    athena \
    chrono

# Default App Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.browser_default=duckduck \
    ro.config.calculator_default=CalculatorYou \
    ro.config.calendar_default=calendar.foss \
    ro.config.gallery_default=org.fossify.gallery \
    ro.config.filemanager_default=org.fossify.filemanager \
    ro.config.contacts_default=com.bnyro.contacts \
    ro.config.music_default=com.mardous.booming \
    ro.config.recorder_default=recordyou \
    ro.config.weather_default=org.breezyweather \
    ro.config.wifiinfo_default=com.truemlgpro.wifiinfo \
    ro.config.email_default=net.thunderbird.android \
    ro.config.notes_default=com.kin.easynotes \
    ro.config.dailyyou_default=com.demizo.daily_you \
    ro.config.launchpad_default=com.devrinth.launchpad \
    ro.config.privacium_default=com.kaleedtc.privacium \
    ro.config.drawanywhere_default=com.shezik.drawanywhere \
    ro.config.launcher_default=com.stario.launcher \
    ro.config.imagetoolbox_default=image.toolbox \
    ro.config.nativealpha_default=native.alpha \
    ro.config.digipaws_default=nethical.digipaws \
    ro.config.locklock_default=nethical.locklock
```

### **Configuration Variables**

#### **PRODUCT_PACKAGES**
- **Purpose**: List of apps to include in build
- **Format**: Package names separated by backslashes
- **Example**: `PRODUCT_PACKAGES += \ app_name \`

#### **PRODUCT_PROPERTY_OVERRIDES**
- **Purpose**: Set default apps via system properties
- **Format**: `ro.config.[app]_default=[package]`
- **Example**: `ro.config.browser_default=duckduck`

## 🔍 **Build System Integration**

### **Device Configuration**

#### **Adding to Device.mk**
```makefile
# Include vendor configuration
$(call inherit-product, vendor/custom/config.mk)
```

#### **Adding to AndroidProducts.mk**
```makefile
# Add vendor configuration to product list
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/device.mk \
    $(LOCAL_DIR)/vendor_custom.mk
```

### **Build Process**

#### **Soong Build (Android.bp)**
1. **Parse Android.bp** - Soong reads configuration
2. **Validate APK files** - Check APK existence and format
3. **Generate build rules** - Create build dependencies
4. **Build APK modules** - Compile and package apps

#### **Make Build (config.mk)**
1. **Parse config.mk** - Make reads configuration
2. **Add to PRODUCT_PACKAGES** - Include apps in build
3. **Set system properties** - Configure default apps
4. **Generate build rules** - Create build dependencies

## 📊 **Configuration Statistics**

### **Android.bp Statistics**
- **Total lines**: 580
- **android_app_import blocks**: 29
- **Configuration parameters**: 6 per app
- **Override targets**: 2-4 per app

### **config.mk Statistics**
- **Total lines**: 153
- **PRODUCT_PACKAGES entries**: 29
- **PRODUCT_PROPERTY_OVERRIDES**: 21
- **App categories**: 6

### **APK Statistics**
- **Total APKs**: 29
- **Total size**: ~250MB
- **Average size**: ~8.6MB
- **Size range**: 2MB - 23MB

## 🛠️ **Configuration Best Practices**

### **Android.bp Best Practices**

#### **Naming Conventions**
```blueprint
// Use package name as module name
name: "com.example.app",

// Use descriptive folder names
apk: "SystemPrebuilts/descriptive_folder/app.apk",
```

#### **Configuration Consistency**
```blueprint
// Use consistent preprocessed setting
preprocessed: true,

// Use consistent DEX preopt setting
dex_preopt: {
    enabled: false,
},

// Use consistent product_specific setting
product_specific: true,
```

#### **Override Management**
```blueprint
// Include relevant system apps
overrides: [
    "DefaultApp",           // Primary replacement
    "AlternativeApp",       // Secondary replacement
    "LegacyApp",            // Legacy app replacement
],
```

### **config.mk Best Practices**

#### **Package Organization**
```makefile
# Group apps by category
# Core System Applications (3 apps)
PRODUCT_PACKAGES += \
    app1 \
    app2 \
    app3

# Essential Utility Applications (6 apps)
PRODUCT_PACKAGES += \
    app4 \
    app5 \
    app6
```

#### **Property Override Naming**
```makefile
# Use consistent naming pattern
ro.config.[app]_default=[package]

# Examples:
ro.config.browser_default=duckduck
ro.config.calculator_default=CalculatorYou
ro.config.calendar_default=calendar.foss
```

## 🔧 **Advanced Configuration**

### **Custom Build Variants**

#### **Debug Build**
```makefile
# Enable debug features
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    ro.config.debug_apps=true
```

#### **Release Build**
```makefile
# Optimize for release
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=0 \
    ro.config.debug_apps=false
```

### **Device-Specific Configuration**

#### **Architecture-Specific APKs**
```blueprint
// Use architecture-specific APKs
android_app_import {
    name: "app_name",
    apk: "SystemPrebuilts/folder/app-${TARGET_ARCH}.apk",
    // ... other options
}
```

#### **Device-Specific Overrides**
```makefile
# Device-specific app overrides
ifeq ($(TARGET_DEVICE),specific_device)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.specific_app_default=custom_app
endif
```

## 🐛 **Troubleshooting Configuration**

### **Common Configuration Errors**

#### **APK Not Found**
```bash
# Check APK path
ls -la SystemPrebuilts/folder/app.apk

# Verify path in Android.bp
grep -n "apk:" Android.bp
```

#### **Duplicate Module Names**
```bash
# Check for duplicate names
grep -n "name:" Android.bp | sort | uniq -d

# Ensure unique module names
```

#### **Invalid Property Overrides**
```bash
# Check property format
grep -n "ro.config.*_default" config.mk

# Verify package names match
grep -n "name:" Android.bp
```

### **Configuration Validation**

#### **Syntax Checking**
```bash
# Check Android.bp syntax
soong_build --check

# Check config.mk syntax
make -n config.mk
```

#### **Dependency Verification**
```bash
# Verify all APKs exist
find SystemPrebuilts/ -name "*.apk" | wc -l

# Check for missing files
grep -o 'SystemPrebuilts/[^"]*' Android.bp | while read file; do
    if [ ! -f "$file" ]; then
        echo "Missing: $file"
    fi
done
```

## 🔗 **Related Documentation**

- **[DEVELOPER_TUTORIAL.md](DEVELOPER_TUTORIAL.md)** - Complete build guide
- **[MAINTENANCE_GUIDE.md](MAINTENANCE_GUIDE.md)** - Adding/removing apps
- **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** - Common issues and solutions
- **[ERROR_ANALYSIS.md](ERROR_ANALYSIS.md)** - Detailed error analysis

---
*This reference provides complete technical details for configuring the vendor build system.*
