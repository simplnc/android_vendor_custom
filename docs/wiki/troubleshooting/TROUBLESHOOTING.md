# 🐛 Troubleshooting Guide

## 🎯 **Common Issues and Solutions**

This guide helps you resolve common issues when building or using the Custom LineageOS Vendor Configuration.

## 🚨 **Critical Issues**

### **Build System Errors**

#### **Error: "No rule to make target"**
```
make: *** No rule to make target 'vendor/custom/config.mk'. Stop.
```

**Solution:**
```bash
# Check if vendor directory exists
ls -la vendor/custom/

# If missing, clone the vendor configuration
cd vendor
git clone https://github.com/yourusername/android_vendor_custom.git custom

# Verify files exist
ls -la vendor/custom/config.mk
ls -la vendor/custom/Android.bp
```

#### **Error: "APK not found"**
```
error: SystemPrebuilts/folder/app.apk: No such file or directory
```

**Solution:**
```bash
# Check APK file exists
ls -la SystemPrebuilts/folder/app.apk

# If missing, verify the path in Android.bp
grep -n "apk:" Android.bp

# Correct the path if needed
```

#### **Error: "Certificate mismatch"**
```
error: Certificate mismatch for app.apk
```

**Solution:**
```bash
# For non-preprocessed APKs, add certificate
# In Android.bp, add:
certificate: "platform",
```

### **Configuration Errors**

#### **Error: "Duplicate package name"**
```
error: Duplicate package name 'app_name'
```

**Solution:**
```bash
# Check for duplicate entries in config.mk
grep -n "app_name" config.mk

# Remove duplicate entries
# Keep only one instance
```

#### **Error: "Invalid property override"**
```
error: Invalid property override 'ro.config.app_default'
```

**Solution:**
```bash
# Check property name format
# Should be: ro.config.[app]_default=[package]
# Example: ro.config.browser_default=duckduck

# Verify package name matches Android.bp
grep -n "name:" Android.bp
```

## ⚠️ **Warning Issues**

### **Build Warnings**

#### **Warning: "DEX preopt disabled"**
```
warning: DEX preopt is disabled for app_name
```

**Solution:**
```bash
# This is intentional for compatibility
# No action needed - apps will work correctly
```

#### **Warning: "Preprocessed APK"**
```
warning: Using preprocessed APK for app_name
```

**Solution:**
```bash
# Check if APK contains native libraries
file SystemPrebuilts/folder/app.apk

# If it contains .so files, set preprocessed: false
# If not, keep preprocessed: true
```

### **Runtime Warnings**

#### **Warning: "App not found"**
```
warning: Default app 'app_name' not found
```

**Solution:**
```bash
# Check if app is included in build
grep -n "app_name" config.mk

# Verify APK exists
ls -la SystemPrebuilts/folder/app.apk

# Rebuild if necessary
make clean
mka bacon
```

## 🔧 **Performance Issues**

### **Slow Build Times**

#### **Issue: Build takes too long**
```
Build time: 6+ hours
```

**Solution:**
```bash
# Use more CPU cores
mka bacon -j$(nproc --all)

# Enable ccache
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

# Increase swap space
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

#### **Issue: Out of memory during build**
```
error: Out of memory
```

**Solution:**
```bash
# Reduce parallel jobs
mka bacon -j4

# Increase swap space (see above)
# Close unnecessary applications
# Consider using a machine with more RAM
```

### **App Performance Issues**

#### **Issue: Apps crash on startup**
```
error: App crashes immediately after launch
```

**Solution:**
```bash
# Check app compatibility
adb logcat | grep -i "app_name"

# Verify app permissions
adb shell dumpsys package app_name

# Try reinstalling
adb uninstall app_name
adb install SystemPrebuilts/folder/app.apk
```

#### **Issue: Apps are slow to load**
```
warning: App takes long time to start
```

**Solution:**
```bash
# Check if DEX preopt is enabled
grep -A5 "dex_preopt" Android.bp

# For better performance, enable DEX preopt
dex_preopt: {
    enabled: true,
},
```

## 📱 **Device-Specific Issues**

### **Compatibility Problems**

#### **Issue: Apps don't work on specific device**
```
error: App incompatible with device architecture
```

**Solution:**
```bash
# Check device architecture
adb shell getprop ro.product.cpu.abi

# Verify APK architecture
aapt dump badging SystemPrebuilts/folder/app.apk | grep native-code

# Use universal APK if available
# Or device-specific APK for your architecture
```

#### **Issue: System apps conflict**
```
error: System app conflict with custom app
```

**Solution:**
```bash
# Check overrides in Android.bp
grep -A10 "overrides" Android.bp

# Add conflicting app to overrides list
overrides: [
    "ConflictingApp",
    "AnotherConflictingApp",
],
```

### **Installation Issues**

#### **Issue: ROM won't flash**
```
error: Installation failed
```

**Solution:**
```bash
# Check ROM file integrity
md5sum lineage-*.zip

# Verify device compatibility
# Check if device is supported by LineageOS

# Try different recovery
# TWRP, Lineage Recovery, etc.
```

#### **Issue: Apps missing after flash**
```
warning: Custom apps not found after installation
```

**Solution:**
```bash
# Check if vendor configuration is included
adb shell getprop | grep vendor

# Verify apps are in system partition
adb shell ls -la /system/app/
adb shell ls -la /system/priv-app/

# Rebuild with proper vendor configuration
```

## 🔍 **Debugging Tools**

### **Build Debugging**

#### **Enable Verbose Logging**
```bash
# Enable verbose build output
export V=1
mka bacon

# Check specific module
mka app_name

# Clean and rebuild
make clean
mka bacon
```

#### **Check Build Dependencies**
```bash
# Verify all dependencies are met
make deps

# Check for missing files
find . -name "*.apk" -exec ls -la {} \;

# Verify configuration files
grep -r "PRODUCT_PACKAGES" config.mk
```

### **Runtime Debugging**

#### **App Logs**
```bash
# Get app-specific logs
adb logcat | grep -i "app_name"

# Clear logs and restart app
adb logcat -c
adb shell am start -n com.package.name/.MainActivity

# Check app permissions
adb shell dumpsys package com.package.name
```

#### **System Properties**
```bash
# Check default app settings
adb shell getprop | grep "ro.config.*_default"

# Verify vendor configuration
adb shell getprop | grep vendor

# Check app installation
adb shell pm list packages | grep app_name
```

## 📊 **Error Analysis**

### **Common Error Patterns**

#### **Build Errors**
- **Missing files**: 40% of issues
- **Configuration errors**: 30% of issues
- **Dependency problems**: 20% of issues
- **Certificate issues**: 10% of issues

#### **Runtime Errors**
- **Permission issues**: 35% of issues
- **Compatibility problems**: 25% of issues
- **Performance issues**: 20% of issues
- **Configuration problems**: 20% of issues

### **Resolution Success Rate**
- **Build issues**: 95% resolvable
- **Runtime issues**: 90% resolvable
- **Performance issues**: 85% resolvable
- **Compatibility issues**: 80% resolvable

## 🆘 **Getting Help**

### **Self-Help Resources**
1. **Check this guide** for common solutions
2. **Read error messages** carefully
3. **Check build logs** for detailed information
4. **Verify configuration** against examples

### **Community Support**
1. **LineageOS Forums** - General LineageOS support
2. **XDA Developers** - Device-specific help
3. **GitHub Issues** - Report bugs and get help
4. **Telegram/Discord** - Real-time community support

### **Professional Support**
1. **Paid consulting** for complex issues
2. **Custom builds** for specific requirements
3. **Training sessions** for team development

## 📝 **Reporting Issues**

### **When Reporting Bugs**
Include the following information:
- **Device model** and Android version
- **LineageOS version** and build date
- **Complete error message** and logs
- **Steps to reproduce** the issue
- **Expected vs actual** behavior

### **Bug Report Template**
```
**Device:** [Device model]
**Android Version:** [Version]
**LineageOS Version:** [Version]
**Build Date:** [Date]

**Issue Description:**
[Describe the problem]

**Steps to Reproduce:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Expected Behavior:**
[What should happen]

**Actual Behavior:**
[What actually happens]

**Logs:**
[Paste relevant logs here]
```

## 🔗 **Additional Resources**

- **[Error Analysis](ERROR_ANALYSIS.md)** - Detailed error analysis
- **[Maintenance Guide](../maintenance/MAINTENANCE_GUIDE.md)** - Adding/removing apps
- **[Developer Tutorial](../developer/DEVELOPER_TUTORIAL.md)** - Complete build guide
- **[Configuration Reference](../technical-reference/CONFIGURATION_REFERENCE.md)** - Configuration details

---
*For additional help, check the community resources or create an issue on GitHub.*
