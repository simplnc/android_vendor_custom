# 🏗️ Build Guide - Technical Build Instructions

## 🎯 **Overview**

This guide provides detailed technical instructions for building LineageOS with the Custom Vendor Configuration, including 29 FOSS applications.

## 📋 **Prerequisites**

### **System Requirements**
- **OS**: Ubuntu 20.04+ or similar Linux distribution
- **RAM**: 16GB minimum (32GB recommended)
- **Storage**: 200GB+ free space (SSD recommended)
- **CPU**: Multi-core processor (8+ cores recommended)
- **Network**: Stable internet connection for source download

### **Software Requirements**
- **Git** - Version control system
- **Python 3.6+** - Build system requirements
- **Java 11** - Android build requirements
- **Android SDK** - Platform tools and build tools
- **LineageOS source** - Android source code

## 🚀 **Environment Setup**

### **Step 1: System Preparation**

```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install required packages
sudo apt install -y git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip python3 python3-pip \
  repo

# Install Java 11
sudo apt install -y openjdk-11-jdk

# Set Java environment
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.bashrc
```

### **Step 2: Build Environment Configuration**

```bash
# Create build directory
mkdir -p ~/lineageos
cd ~/lineageos

# Configure Git
git config --global user.email "your.email@example.com"
git config --global user.name "Your Name"

# Set up ccache for faster builds
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
echo 'export USE_CCACHE=1' >> ~/.bashrc
echo 'export CCACHE_EXEC=/usr/bin/ccache' >> ~/.bashrc
```

### **Step 3: LineageOS Source Initialization**

```bash
# Initialize LineageOS repository
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1

# Download source code (this takes several hours)
repo sync -c -j$(nproc --all)
```

## 🔧 **Vendor Configuration Setup**

### **Step 1: Clone Vendor Configuration**

```bash
# Navigate to vendor directory
cd ~/lineageos/vendor

# Clone the custom vendor configuration
git clone https://github.com/yourusername/android_vendor_custom.git custom

# Verify vendor configuration
cd custom
ls -la
# Should show: Android.bp, config.mk, SystemPrebuilts/, vendorInfo/
```

### **Step 2: Verify APK Files**

```bash
# Check all APK files exist
find SystemPrebuilts/ -name "*.apk" | wc -l
# Should show: 29

# Verify APK file integrity
find SystemPrebuilts/ -name "*.apk" -exec file {} \;
```

### **Step 3: Device Configuration**

```bash
# Navigate to device configuration
cd ~/lineageos/device/[manufacturer]/[device]

# Example for Pixel devices:
# cd ~/lineageos/device/google/redfin

# Add vendor configuration to device.mk
echo '$(call inherit-product, vendor/custom/config.mk)' >> device.mk

# Verify device configuration
grep -n "vendor/custom" device.mk
```

## 🏗️ **Build Process**

### **Step 1: Build Environment Setup**

```bash
# Navigate to LineageOS root
cd ~/lineageos

# Set up build environment
source build/envsetup.sh

# Choose your device
lunch lineage_[device]-userdebug

# Example for Pixel 5:
# lunch lineage_redfin-userdebug
```

### **Step 2: Build Verification**

```bash
# Check build configuration
echo $TARGET_PRODUCT
echo $TARGET_BUILD_VARIANT

# Verify vendor configuration is included
grep -r "vendor/custom" out/target/product/[device]/obj/PACKAGING/
```

### **Step 3: Start the Build**

```bash
# Start the build (this takes 2-4 hours)
mka bacon -j$(nproc --all)

# Alternative: Build specific components first
mka systemimage -j$(nproc --all)
mka vendorimage -j$(nproc --all)
mka productimage -j$(nproc --all)
```

### **Step 4: Build Monitoring**

```bash
# Monitor build progress
tail -f out/target/product/[device]/build.log

# Check build status
ps aux | grep make

# Monitor system resources
htop
```

## 📱 **Build Output**

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
[100% 1234/1234] Package lineage-18.1-20231201-UNOFFICIAL-[device].zip
```

### **Build Artifacts**

```bash
# Check build output
ls -la out/target/product/[device]/

# ROM file
lineage-18.1-20231201-UNOFFICIAL-[device].zip

# Individual images
system.img
vendor.img
product.img
system_ext.img
boot.img
recovery.img
```

## 🔍 **Build Verification**

### **Step 1: APK Verification**

```bash
# Extract and check APK files
unzip -l out/target/product/[device]/lineage-*.zip | grep -i "\.apk"

# Verify specific apps are included
unzip -l out/target/product/[device]/lineage-*.zip | grep -i "duckduck"
unzip -l out/target/product/[device]/lineage-*.zip | grep -i "calculator"
```

### **Step 2: System Properties Verification**

```bash
# Check system properties in build
grep -r "ro.config.*_default" out/target/product/[device]/system/

# Verify property overrides
grep -r "ro.config.browser_default" out/target/product/[device]/
```

### **Step 3: Build Size Analysis**

```bash
# Check ROM size
ls -lh out/target/product/[device]/lineage-*.zip

# Check individual partition sizes
ls -lh out/target/product/[device]/*.img

# Analyze APK sizes
find out/target/product/[device]/system/ -name "*.apk" -exec ls -lh {} \;
```

## 🚀 **Installation**

### **Step 1: Device Preparation**

```bash
# Enable Developer Options
# Settings > About Phone > Tap Build Number 7 times

# Enable USB Debugging
# Settings > Developer Options > USB Debugging

# Unlock Bootloader (if not already done)
fastboot oem unlock
```

### **Step 2: Flash Recovery**

```bash
# Flash TWRP or Lineage Recovery
fastboot flash recovery recovery.img

# Boot to recovery
fastboot boot recovery.img
```

### **Step 3: Flash ROM**

```bash
# Copy ROM to device
adb push lineage-*.zip /sdcard/

# Flash ROM in recovery
# Install > Select ROM file > Swipe to confirm

# Or use fastboot for A/B devices
fastboot flash system system.img
fastboot flash vendor vendor.img
fastboot flash product product.img
```

### **Step 4: Verify Installation**

```bash
# Boot device and check apps
adb shell pm list packages | grep -E "(duckduck|calculator|gallery)"

# Check system properties
adb shell getprop | grep "ro.config.*_default"

# Verify app functionality
adb shell am start -n com.duckduckgo.mobile.android/.MainActivity
```

## 🐛 **Troubleshooting**

### **Build Issues**

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

#### **Build Fails**
```bash
# Clean build
make clean

# Check for missing dependencies
make deps

# Rebuild
mka bacon -j$(nproc --all)
```

#### **APK Not Found**
```bash
# Check APK files
find SystemPrebuilts/ -name "*.apk"

# Verify paths in Android.bp
grep -n "apk:" Android.bp

# Check file permissions
ls -la SystemPrebuilts/*/
```

### **Installation Issues**

#### **ROM Won't Flash**
```bash
# Check ROM integrity
md5sum lineage-*.zip

# Verify device compatibility
fastboot getvar all

# Try different recovery
# TWRP, Lineage Recovery, etc.
```

#### **Apps Missing After Flash**
```bash
# Check system partition
adb shell ls -la /system/app/
adb shell ls -la /system/priv-app/

# Verify vendor configuration
adb shell getprop | grep vendor

# Check system properties
adb shell getprop | grep "ro.config.*_default"
```

## 📊 **Build Performance**

### **Optimization Tips**

#### **Faster Builds**
```bash
# Use more CPU cores
mka bacon -j$(nproc --all)

# Enable ccache
export USE_CCACHE=1
ccache -M 50G

# Use SSD storage
# Build on SSD for faster I/O
```

#### **Memory Optimization**
```bash
# Increase swap space
sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# Close unnecessary applications
# Free up RAM before building
```

### **Build Statistics**

#### **Typical Build Times**
- **First build**: 3-4 hours
- **Incremental build**: 30-60 minutes
- **Clean build**: 2-3 hours
- **APK-only changes**: 5-10 minutes

#### **Resource Usage**
- **CPU**: 80-100% during build
- **RAM**: 12-16GB peak usage
- **Storage**: 150-200GB total
- **Network**: 10-20GB download

## 🔗 **Related Documentation**

- **[Developer Tutorial](../developer/DEVELOPER_TUTORIAL.md)** - Complete tutorial
- **[Troubleshooting Guide](../troubleshooting/TROUBLESHOOTING.md)** - Common issues and solutions
- **[Configuration Reference](../technical-reference/CONFIGURATION_REFERENCE.md)** - Configuration details
- **[Maintenance Guide](../maintenance/MAINTENANCE_GUIDE.md)** - Adding/removing apps

## 📝 **Build Checklist**

### **Before Building**
- [ ] System requirements met
- [ ] Software dependencies installed
- [ ] LineageOS source downloaded
- [ ] Vendor configuration cloned
- [ ] Device configuration updated
- [ ] Build environment set up

### **During Build**
- [ ] Monitor build progress
- [ ] Check for errors
- [ ] Monitor system resources
- [ ] Verify APK inclusion
- [ ] Check system properties

### **After Build**
- [ ] Verify build output
- [ ] Check ROM integrity
- [ ] Test installation
- [ ] Verify app functionality
- [ ] Document any issues

---
*This guide provides complete technical instructions for building LineageOS with the custom vendor configuration.*
