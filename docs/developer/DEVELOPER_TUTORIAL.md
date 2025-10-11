# 🛠️ Developer Tutorial - Complete Build Guide

## 🎯 **Overview**

This tutorial will guide you through building LineageOS with the Custom Vendor Configuration, which includes 29 FOSS applications to replace default system apps.

## 📋 **Prerequisites**

### **System Requirements**
- **OS**: Ubuntu 20.04+ or similar Linux distribution
- **RAM**: 16GB minimum (32GB recommended)
- **Storage**: 200GB+ free space
- **CPU**: Multi-core processor (8+ cores recommended)

### **Software Requirements**
- **Git** - Version control
- **Python 3.6+** - Build system requirements
- **Java 11** - Android build requirements
- **Android SDK** - Platform tools
- **LineageOS source** - Android source code

## 🚀 **Step-by-Step Build Process**

### **Step 1: Environment Setup**

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install required packages
sudo apt install -y git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip python3 python3-pip

# Install Java 11
sudo apt install -y openjdk-11-jdk

# Set Java environment
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
```

### **Step 2: Initialize LineageOS Build Environment**

```bash
# Create build directory
mkdir -p ~/lineageos
cd ~/lineageos

# Initialize LineageOS repository
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1

# Download source code (this takes several hours)
repo sync -c -j$(nproc --all)
```

### **Step 3: Add Custom Vendor Configuration**

```bash
# Clone the custom vendor configuration
cd ~/lineageos/vendor
git clone https://github.com/yourusername/android_vendor_custom.git custom

# Verify the vendor configuration
cd custom
ls -la
# Should show: Android.bp, config.mk, SystemPrebuilts/, vendorInfo/
```

### **Step 4: Configure Build for Your Device**

```bash
# Navigate to device configuration
cd ~/lineageos/device/[manufacturer]/[device]

# Example for Pixel devices:
# cd ~/lineageos/device/google/redfin

# Add vendor configuration to device.mk
echo '$(call inherit-product, vendor/custom/config.mk)' >> device.mk
```

### **Step 5: Build the ROM**

```bash
# Set up build environment
cd ~/lineageos
source build/envsetup.sh

# Choose your device
lunch lineage_[device]-userdebug

# Start the build (this takes 2-4 hours)
mka bacon -j$(nproc --all)
```

### **Step 6: Install the ROM**

```bash
# The built ROM will be in:
# ~/lineageos/out/target/product/[device]/lineage-18.1-[date]-UNOFFICIAL-[device].zip

# Flash to device using recovery (TWRP, Lineage Recovery, etc.)
# Or use fastboot for A/B devices
```

## 🔧 **Configuration Details**

### **Android.bp Structure**
```blueprint
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
```

### **config.mk Structure**
```makefile
# Add apps to build
PRODUCT_PACKAGES += \
    app_name

# Set as default app
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.app_default=app_name
```

## 📱 **Adding New Apps**

### **Step 1: Add APK to SystemPrebuilts**
```bash
# Create folder for new app
mkdir -p ~/lineageos/vendor/custom/SystemPrebuilts/newapp

# Copy APK file
cp newapp.apk ~/lineageos/vendor/custom/SystemPrebuilts/newapp/
```

### **Step 2: Update Android.bp**
```blueprint
// Add to Android.bp
android_app_import {
    name: "newapp",
    apk: "SystemPrebuilts/newapp/newapp.apk",
    preprocessed: true,
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "DefaultApp",
    ],
}
```

### **Step 3: Update config.mk**
```makefile
# Add to PRODUCT_PACKAGES
PRODUCT_PACKAGES += \
    newapp

# Add property override (optional)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.newapp_default=newapp
```

### **Step 4: Create Documentation**
```bash
# Create app documentation
touch ~/lineageos/vendor/custom/vendorInfo/newapp.md
# Add app details, features, configuration, etc.
```

## 🐛 **Troubleshooting**

### **Common Build Errors**

#### **Error: "No rule to make target"**
```bash
# Clean build and retry
make clean
mka bacon -j$(nproc --all)
```

#### **Error: "APK not found"**
```bash
# Check APK path in Android.bp
# Verify file exists in SystemPrebuilts folder
ls -la SystemPrebuilts/folder/app.apk
```

#### **Error: "Certificate mismatch"**
```bash
# For non-preprocessed APKs, add certificate
certificate: "platform",
```

### **Performance Issues**

#### **Slow Build**
```bash
# Use more CPU cores
mka bacon -j$(nproc --all)

# Use ccache for faster builds
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
```

#### **Out of Memory**
```bash
# Reduce parallel jobs
mka bacon -j4

# Increase swap space
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

## 📊 **Build Verification**

### **Check Build Output**
```bash
# Verify APK files are included
unzip -l out/target/product/[device]/lineage-*.zip | grep -i "\.apk"

# Check system properties
adb shell getprop | grep "ro.config.*_default"
```

### **Test Apps**
```bash
# Install and test each app
adb install -r SystemPrebuilts/folder/app.apk

# Verify app functionality
adb shell am start -n com.package.name/.MainActivity
```

## 🔗 **Additional Resources**

- **[BUILD_GUIDE.md](BUILD_GUIDE.md)** - Detailed build instructions
- **[CONFIGURATION_REFERENCE.md](CONFIGURATION_REFERENCE.md)** - Configuration details
- **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** - Common issues and solutions
- **[MAINTENANCE_GUIDE.md](MAINTENANCE_GUIDE.md)** - Adding/removing apps

## 📝 **Build Logs**

### **Successful Build Output**
```
[100% 1234/1234] Package system image
[100% 1234/1234] Package vendor image
[100% 1234/1234] Package product image
[100% 1234/1234] Package system_ext image
[100% 1234/1234] Package odm image
[100% 1234/1234] Package boot image
[100% 1234/1234] Package recovery image
[100% 1234/1234] Package vbmeta image
[100% 1234/1234] Package super image
[100% 1234/1234] Package lineage-18.1-20231201-UNOFFICIAL-device.zip
```

### **Build Statistics**
- **Total build time**: 2-4 hours
- **APK files included**: 29
- **Total size**: ~250MB
- **Compression ratio**: ~60%

---
*For advanced configuration and troubleshooting, see the technical documentation.*
