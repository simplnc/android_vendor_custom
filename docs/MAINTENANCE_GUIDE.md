# 🔧 Maintenance Guide - Adding and Removing Apps

## 🎯 **Overview**

This guide explains how to maintain the Custom LineageOS Vendor Configuration by adding new apps, removing existing apps, and updating app versions.

## 📋 **Prerequisites**

### **Required Knowledge**
- Basic understanding of Android build system
- Familiarity with Git version control
- Knowledge of APK file structure
- Understanding of LineageOS build process

### **Required Tools**
- **Git** - Version control
- **Android SDK** - APK analysis tools
- **Text editor** - Configuration file editing
- **Terminal** - Command line operations

## ➕ **Adding New Apps**

### **Step 1: Prepare the APK**

#### **Verify APK Compatibility**
```bash
# Check APK information
aapt dump badging app.apk | grep -E "(package|sdkVersion|native-code)"

# Verify architecture compatibility
aapt dump badging app.apk | grep native-code
# Should show: native-code: 'arm64-v8a' or 'universal'
```

#### **Check APK Size and Dependencies**
```bash
# Check APK size
ls -lh app.apk

# Check for native libraries
unzip -l app.apk | grep "\.so"

# Check permissions
aapt dump permissions app.apk
```

### **Step 2: Create App Directory**

```bash
# Create directory for new app
mkdir -p SystemPrebuilts/newapp

# Copy APK to directory
cp newapp.apk SystemPrebuilts/newapp/

# Verify file structure
ls -la SystemPrebuilts/newapp/
```

### **Step 3: Update Android.bp**

#### **Add android_app_import Block**
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
        "AlternativeApp",
    ],
}
```

#### **Configuration Options**
```blueprint
// For non-preprocessed APKs
android_app_import {
    name: "newapp",
    apk: "SystemPrebuilts/newapp/newapp.apk",
    preprocessed: false,
    certificate: "platform",
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "DefaultApp",
    ],
}

// For apps with native libraries
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

### **Step 4: Update config.mk**

#### **Add to PRODUCT_PACKAGES**
```makefile
# Add to PRODUCT_PACKAGES section
PRODUCT_PACKAGES += \
    newapp
```

#### **Add Property Override (Optional)**
```makefile
# Add to PRODUCT_PROPERTY_OVERRIDES section
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.newapp_default=newapp
```

### **Step 5: Create Documentation**

#### **Create App Documentation File**
```bash
# Create documentation file
touch vendorInfo/newapp.md
```

#### **Documentation Template**
```markdown
# NewApp - App Name

## Basic Information
- **Package Name**: `com.example.newapp`
- **Version**: 1.0.0
- **Size**: ~5MB
- **Category**: Utility
- **Developer**: Developer Name

## Replacement Targets
- DefaultApp
- AlternativeApp

## Features
- Feature 1
- Feature 2
- Feature 3

## Build Configuration
```blueprint
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

## Default Configuration
```makefile
PRODUCT_PACKAGES += \
    newapp

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.newapp_default=newapp
```

## Privacy & Security
- No tracking
- Local processing
- Open source
- No ads

## Compatibility
- Android 12+
- LineageOS 18.1+
- Universal APK

## User Experience
- Modern UI
- Fast performance
- Customizable
- Accessible
```

### **Step 6: Test the Configuration**

#### **Verify Build Configuration**
```bash
# Check Android.bp syntax
grep -A10 "name: \"newapp\"" Android.bp

# Check config.mk syntax
grep -n "newapp" config.mk

# Verify APK file exists
ls -la SystemPrebuilts/newapp/newapp.apk
```

#### **Test Build**
```bash
# Clean build
make clean

# Build specific app
mka newapp

# Full build test
mka bacon -j$(nproc --all)
```

## ➖ **Removing Apps**

### **Step 1: Remove from Android.bp**

#### **Find and Remove android_app_import Block**
```bash
# Find the app block
grep -n "name: \"oldapp\"" Android.bp

# Remove the entire block (from android_app_import to closing brace)
# Example: Remove lines 100-120
```

### **Step 2: Remove from config.mk**

#### **Remove from PRODUCT_PACKAGES**
```bash
# Find and remove from PRODUCT_PACKAGES
grep -n "oldapp" config.mk

# Remove the line:
# oldapp \
```

#### **Remove Property Override**
```bash
# Find and remove property override
grep -n "ro.config.oldapp_default" config.mk

# Remove the line:
# ro.config.oldapp_default=oldapp
```

### **Step 3: Remove APK Files**

```bash
# Remove APK directory
rm -rf SystemPrebuilts/oldapp/

# Verify removal
ls -la SystemPrebuilts/ | grep oldapp
```

### **Step 4: Remove Documentation**

```bash
# Remove documentation file
rm vendorInfo/oldapp.md

# Verify removal
ls -la vendorInfo/ | grep oldapp
```

### **Step 5: Update Documentation**

#### **Update README.md**
```bash
# Remove app from app list
# Update app count
# Remove from acknowledgments
```

#### **Update Other Documentation**
```bash
# Update APP_OVERVIEW.md
# Update COMPREHENSIVE_APP_ANALYSIS.md
# Update VENDOR_BUILD_GUIDE.md
```

## 🔄 **Updating App Versions**

### **Step 1: Download New Version**

```bash
# Download new APK
wget https://example.com/newapp-v2.0.0.apk

# Verify new version
aapt dump badging newapp-v2.0.0.apk | grep versionName
```

### **Step 2: Replace APK File**

```bash
# Backup old version
mv SystemPrebuilts/newapp/newapp.apk SystemPrebuilts/newapp/newapp-old.apk

# Copy new version
cp newapp-v2.0.0.apk SystemPrebuilts/newapp/newapp.apk

# Verify replacement
ls -la SystemPrebuilts/newapp/
```

### **Step 3: Update Documentation**

#### **Update App Documentation**
```markdown
# Update version information
- **Version**: 2.0.0 (was 1.0.0)
- **Size**: ~6MB (was ~5MB)

# Update features list
# Add new features
# Update compatibility information
```

### **Step 4: Test Updated App**

```bash
# Clean build
make clean

# Build updated app
mka newapp

# Test functionality
adb install -r SystemPrebuilts/newapp/newapp.apk
```

## 🔍 **Verification and Testing**

### **Build Verification**

#### **Check Configuration Syntax**
```bash
# Verify Android.bp syntax
grep -A10 "android_app_import" Android.bp

# Verify config.mk syntax
grep -n "PRODUCT_PACKAGES" config.mk
grep -n "PRODUCT_PROPERTY_OVERRIDES" config.mk
```

#### **Verify File Structure**
```bash
# Check all APK files exist
find SystemPrebuilts/ -name "*.apk" | wc -l
# Should match number of apps in config

# Verify all apps have documentation
ls vendorInfo/*.md | wc -l
# Should match number of apps
```

### **Runtime Testing**

#### **Test App Installation**
```bash
# Install and test each app
for app in $(find SystemPrebuilts/ -name "*.apk"); do
    echo "Testing $app"
    adb install -r "$app"
    # Test app functionality
    adb uninstall $(aapt dump badging "$app" | grep package | cut -d"'" -f2)
done
```

#### **Test Default App Settings**
```bash
# Check default app properties
adb shell getprop | grep "ro.config.*_default"

# Verify apps are set as default
# Test app switching
```

## 📊 **Maintenance Best Practices**

### **Regular Maintenance Tasks**

#### **Weekly Tasks**
- Check for app updates
- Monitor build performance
- Review error logs
- Update documentation

#### **Monthly Tasks**
- Security audit of apps
- Performance optimization
- Dependency updates
- Community feedback review

#### **Quarterly Tasks**
- Complete system review
- App compatibility testing
- Documentation overhaul
- Build system optimization

### **Quality Assurance**

#### **Before Adding Apps**
- [ ] Verify app is FOSS
- [ ] Check privacy policy
- [ ] Test on target devices
- [ ] Verify compatibility
- [ ] Check performance impact

#### **Before Removing Apps**
- [ ] Check user impact
- [ ] Verify no dependencies
- [ ] Update documentation
- [ ] Test build without app
- [ ] Notify users if needed

#### **Before Updating Apps**
- [ ] Test new version
- [ ] Check for breaking changes
- [ ] Verify compatibility
- [ ] Update documentation
- [ ] Test build process

## 🚨 **Common Issues and Solutions**

### **Adding Apps**

#### **Issue: APK Not Found**
```bash
# Check APK path
ls -la SystemPrebuilts/newapp/newapp.apk

# Verify path in Android.bp
grep -n "apk:" Android.bp
```

#### **Issue: Build Fails**
```bash
# Check syntax
grep -A10 "name: \"newapp\"" Android.bp

# Verify config.mk
grep -n "newapp" config.mk
```

### **Removing Apps**

#### **Issue: Build Fails After Removal**
```bash
# Check for remaining references
grep -r "oldapp" .

# Remove all references
# Clean build
make clean
```

#### **Issue: App Still Appears**
```bash
# Check system properties
adb shell getprop | grep oldapp

# Clear system properties
# Rebuild and reflash
```

## 🔗 **Related Documentation**

- **[DEVELOPER_TUTORIAL.md](DEVELOPER_TUTORIAL.md)** - Complete build guide
- **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** - Common issues and solutions
- **[ERROR_ANALYSIS.md](ERROR_ANALYSIS.md)** - Detailed error analysis
- **[CONFIGURATION_REFERENCE.md](CONFIGURATION_REFERENCE.md)** - Configuration details

## 📝 **Maintenance Checklist**

### **Adding New App**
- [ ] Verify APK compatibility
- [ ] Create app directory
- [ ] Add to Android.bp
- [ ] Add to config.mk
- [ ] Create documentation
- [ ] Test build
- [ ] Update main documentation

### **Removing App**
- [ ] Remove from Android.bp
- [ ] Remove from config.mk
- [ ] Remove APK files
- [ ] Remove documentation
- [ ] Update main documentation
- [ ] Test build
- [ ] Verify removal

### **Updating App**
- [ ] Download new version
- [ ] Replace APK file
- [ ] Update documentation
- [ ] Test updated app
- [ ] Verify functionality
- [ ] Update version info

---
*This guide ensures proper maintenance of the vendor configuration while maintaining build stability and user experience.*
