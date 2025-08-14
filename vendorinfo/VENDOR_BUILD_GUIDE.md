# Vendor Custom Build Guide

## 🚀 **Complete Build Guide for Custom LineageOS Configuration**

This guide provides step-by-step instructions for building LineageOS with the Custom Vendor Configuration, which includes **23 total applications** to replace the default LineageOS app suite.

## 📊 **Configuration Overview**

### **Application Count**
- **SystemPrebuilts**: 20 APK applications
- **SystemBuild**: 3 source-built applications
- **Total Applications**: 23 custom applications

### **Build System**
- **Main Config**: `config.mk` (111 lines)
- **Soong Build**: `Android.bp` (507 lines)
- **Make Build**: `SystemBuild/Android.mk`

## 🏗️ **Build System Architecture**

### **Directory Structure**
```
vendor/custom/
├── config.mk                    # Main configuration
├── Android.bp                   # Soong build system
├── SystemPrebuilts/            # 20 APK applications
│   ├── browser/                # threads.thor
│   ├── calculator/             # CalculatorYou
│   ├── calendar/               # calendar.foss
│   ├── datamonitor/            # com.drnoob.datamonitor
│   ├── dictionary/             # io.github.yamin8000.owl
│   ├── flashlight/             # com.bitmavrick.lumolight
│   ├── music/                  # com.mardous.booming
│   ├── recorder/               # recordyou
│   ├── weather/                # org.breezyweather
│   ├── wifiInfo/               # com.truemlgpro.wifiinfo
│   ├── rethink/                # com.celzero.bravedns_478
│   ├── taptap/                 # TapTap
│   ├── dualWallpaper/          # dualwall
│   ├── quicktiles/             # QuickTiles
│   ├── filemanager/            # org.fossify.filemanager
│   ├── contacts/               # com.bnyro.contacts
│   ├── phone/                  # org.fossify.phone
│   ├── gallery/                # org.fossify.gallery
│   ├── notes/                  # notes
│   ├── systemAthena/           # athena
│   └── clock/                  # chrono
└── SystemBuild/                # 3 source-built apps
    ├── Android.mk              # Make build system
    ├── priv-app/               # Privileged applications
    │   └── com.chiller3.bcr/   # BCR app
    └── etc/                    # Permissions and configs
        └── permissions/        # App permission files
```

## 📱 **Application Details**

### **SystemPrebuilts Applications (20 Apps)**

#### **Core System Apps**
1. **`threads.thor`** - Privacy-focused web browser (5.1MB)
2. **`CalculatorYou`** - Advanced calculator (3.1MB)
3. **`calendar.foss`** - Clean calendar app (9.0MB)
4. **`com.drnoob.datamonitor`** - Network monitoring (29.0MB)
5. **`io.github.yamin8000.owl`** - Offline dictionary (46.0MB)

#### **Utility Apps**
6. **`com.bitmavrick.lumolight`** - Customizable flashlight (3.0MB)
7. **`com.mardous.booming`** - Feature-rich music player (3.0MB)
8. **`recordyou`** - High-quality audio recording (3.0MB)
9. **`org.breezyweather`** - Accurate weather info (3.0MB)
10. **`com.truemlgpro.wifiinfo`** - Network diagnostics (3.0MB)

#### **Privacy & Security**
11. **`com.celzero.bravedns_478`** - Privacy DNS resolver (27MB)
12. **`TapTap`** - Advanced gesture navigation (18MB)

#### **System Utilities**
13. **`dualwall`** - Dynamic wallpaper management (2.2MB)
14. **`QuickTiles`** - Customizable quick settings (2.0MB)
15. **`org.fossify.filemanager`** - Powerful file management (9.2MB)
16. **`com.bnyro.contacts`** - Modern contacts app (4.0MB)
17. **`org.fossify.phone`** - Enhanced dialer interface (8.5MB)
18. **`org.fossify.gallery`** - Feature-rich photo gallery (22MB)
19. **`notes`** - Productivity note-taking (911KB)
20. **`athena`** - System maintenance tools (system app)

### **SystemBuild Applications (3 Apps)**
21. **`athena`** - System maintenance and optimization
22. **`chrono`** - Advanced clock and timer
23. **`bcr`** - Boot certification and recovery

## 🔧 **Build Configuration**

### **1. Main Configuration (config.mk)**

#### **Soong Namespaces**
```makefile
PRODUCT_SOONG_NAMESPACES += \
    vendor/custom
```

#### **SystemPrebuilts Packages**
```makefile
PRODUCT_PACKAGES += \
    threads.thor \
    CalculatorYou \
    calendar.foss \
    com.drnoob.datamonitor \
    io.github.yamin8000.owl \
    com.bitmavrick.lumolight \
    com.mardous.booming \
    recordyou \
    org.breezyweather \
    com.truemlgpro.wifiinfo \
    com.celzero.bravedns_478 \
    TapTap \
    dualwall \
    QuickTiles \
    org.fossify.filemanager \
    com.bnyro.contacts \
    org.fossify.phone \
    org.fossify.gallery
```

#### **SystemBuild Packages**
```makefile
PRODUCT_PACKAGES += \
    athena \
    chrono \
    bcr
```

#### **Default App Configurations**
```makefile
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.browser_default=threads.thor \
    ro.config.calculator_default=CalculatorYou \
    ro.config.calendar_default=calendar.foss \
    ro.config.gallery_default=org.fossify.gallery \
    ro.config.filemanager_default=org.fossify.filemanager \
    ro.config.contacts_default=com.bnyro.contacts \
    ro.config.dns_default=com.celzero.bravedns_478
```

#### **System App Removal**
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Gallery Browser Calculator Contacts \
    LineageGallery LineageContacts \
    WebView Chrome Photos \
    org.chromium.webview_shell
```

### **2. Soong Build System (Android.bp)**

#### **App Import Structure**
```blueprint
android_app_import {
    name: "app_name",
    apk: "SystemPrebuilts/category/app.apk",
    preprocessed: false,
    certificate: "platform",
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "SystemApp1",
        "SystemApp2",
        "com.android.systemapp",
    ],
}
```

#### **Key Configuration Options**
- **`preprocessed: false`** - For APKs with compressed JNI libraries
- **`certificate: "platform"`** - System-level signing
- **`dex_preopt: { enabled: false }`** - Compatibility optimization
- **`product_specific: true`** - Product-specific installation

### **3. Make Build System (SystemBuild/Android.mk)**

#### **Privileged App Configuration**
```makefile
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := app_name
LOCAL_SRC_FILES := app.apk
LOCAL_PRODUCT_MODULE := true
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)
```

## 📋 **Step-by-Step Build Process**

### **Prerequisites**
- LineageOS source code (18.1+)
- Android build environment
- 16GB+ RAM recommended
- 100GB+ free disk space
- Linux environment (Ubuntu 20.04+)

### **Step 1: Environment Setup**
```bash
# Install build dependencies
sudo apt update
sudo apt install -y build-essential ccache git-core gnupg flex bison gperf \
    build-essential zip curl zlib1g-dev gcc-multilib g++-multilib \
    libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev \
    libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip

# Set up Java environment
sudo apt install -y openjdk-11-jdk
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
```

### **Step 2: Source Code Setup**
```bash
# Initialize LineageOS repository
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1

# Sync source code
repo sync -j$(nproc)

# Set up build environment
source build/envsetup.sh
```

### **Step 3: Vendor Custom Integration**
```bash
# Navigate to vendor directory
cd vendor

# Clone custom vendor configuration
git clone <your-repo-url> custom

# Return to root directory
cd ..
```

### **Step 4: Device Configuration**
```bash
# Navigate to device configuration
cd device/manufacturer/device

# Edit device.mk or lineage_device.mk
# Add the following line:
$(call inherit-product, vendor/custom/config.mk)
```

### **Step 5: Build Process**
```bash
# Clean previous build (if any)
make clean

# Set up build environment
source build/envsetup.sh
lunch lineage_device-userdebug

# Start build process
make bacon -j$(nproc)
```

## 🔍 **Build Verification**

### **1. Package Verification**
```bash
# Check that all apps are included
grep -r "PRODUCT_PACKAGES" vendor/custom/config.mk

# Verify app removal
grep -r "PRODUCT_PACKAGES_REMOVE" vendor/custom/config.mk

# Check default configurations
grep -r "ro.config" vendor/custom/config.mk
```

### **2. Build Artifact Verification**
```bash
# Check build output
ls -la out/target/product/device/system/app/
ls -la out/target/product/device/system/priv-app/
ls -la out/target/product/device/product/app/
```

### **3. App Installation Verification**
```bash
# Check installed packages
adb shell pm list packages | grep -E "(threads|CalculatorYou|calendar|datamonitor|owl|lumolight|booming|recordyou|breezyweather|wifiinfo|bravedns|taptap|dualwall|QuickTiles|filemanager|contacts|phone|gallery|athena|chrono|bcr)"
```

## ⚠️ **Common Issues & Solutions**

### **1. Build Failures**
- **Issue**: Build process fails during compilation
- **Solution**: Run `make clean` and verify all APK files present

### **2. App Conflicts**
- **Issue**: Custom apps conflict with system apps
- **Solution**: Check `PRODUCT_PACKAGES_REMOVE` configuration

### **3. Permission Issues**
- **Issue**: Apps fail to install or run
- **Solution**: Verify permission files in `SystemBuild/etc/permissions/`

### **4. Library Problems**
- **Issue**: JNI library compatibility issues
- **Solution**: Check `preprocessed` flags in Android.bp

### **5. Memory Issues**
- **Issue**: Build fails due to insufficient memory
- **Solution**: Reduce parallel jobs: `make bacon -j4`

## 📊 **Performance Optimizations**

### **Build Optimizations**
- **CCache**: Enable for faster rebuilds
- **Parallel Jobs**: Use `-j$(nproc)` for maximum speed
- **Clean Builds**: Use `make clean` when switching configurations

### **Runtime Optimizations**
- **Dex Preopt**: Disabled for compatibility
- **Library Checks**: Relaxed for better performance
- **System Services**: Optimized WiFi and telephony configurations

## 🔄 **Maintenance & Updates**

### **Regular Tasks**
1. **APK Updates**: Replace old APK files in SystemPrebuilts
2. **Version Checks**: Update version numbers in config.mk
3. **Compatibility**: Test with new LineageOS versions
4. **Security**: Monitor FOSS app security updates

### **Update Process**
```bash
# Backup current configuration
cp -r vendor/custom vendor/custom_backup

# Update APK files
# Replace old APK files in SystemPrebuilts directories

# Update configuration if needed
# Edit config.mk and Android.bp as required

# Test build
make clean
make bacon
```

## 📈 **Troubleshooting Commands**

### **Debug Commands**
```bash
# Check build environment
make showcommands

# Verify app packages
grep -r "PRODUCT_PACKAGES" vendor/custom/

# Check for conflicts
grep -r "PRODUCT_PACKAGES_REMOVE" vendor/custom/

# Verify file existence
find vendor/custom/SystemPrebuilts -name "*.apk" -exec ls -lh {} \;

# Check build logs
tail -f out/error.log
```

### **Verification Commands**
```bash
# Check installed apps
adb shell pm list packages | grep vendor

# Verify app functionality
adb shell am start -n package.name/activity.name

# Check app permissions
adb shell dumpsys package package.name | grep permission
```

---

**Status**: Production Ready ✅  
**Total Apps**: 23 (20 SystemPrebuilts + 3 SystemBuild)  
**Build System**: Unified Soong + Make  
**Compatibility**: LineageOS 18.1+ / Android 12+  
**Last Updated**: Current configuration

For detailed app analysis, see [COMPREHENSIVE_APP_ANALYSIS.md](../vendorInfo/COMPREHENSIVE_APP_ANALYSIS.md).
