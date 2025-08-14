# Vendor Custom Documentation Index

## 📚 **Documentation Overview**

This directory contains comprehensive documentation for the Custom LineageOS Configuration, which provides **22 total applications** to replace the default LineageOS app suite.

## 🚀 **Quick Reference**

### **Application Count**
- **SystemPrebuilts**: 20 APK applications
- **SystemBuild**: 3 source-built applications
- **Total**: 23 custom applications

### **Build System**
- **Configuration**: `config.mk` (111 lines)
- **Soong Build**: `Android.bp` (507 lines)
- **Make Build**: `SystemBuild/Android.mk`

## 📱 **Application Categories**

### **🌐 Core System Apps (5)**
1. **Browser**: `threads.thor` - Privacy-focused web browser
2. **Calculator**: `CalculatorYou` - Advanced calculator
3. **Calendar**: `calendar.foss` - Clean calendar app
4. **Data Monitor**: `com.drnoob.datamonitor` - Network monitoring
5. **Dictionary**: `io.github.yamin8000.owl` - Offline dictionary

### **🔧 Utility Apps (5)**
6. **Flashlight**: `com.bitmavrick.lumolight` - Customizable flashlight
7. **Music Player**: `com.mardous.booming` - Feature-rich music player
8. **Recorder**: `recordyou` - High-quality audio recording
9. **Weather**: `org.breezyweather` - Accurate weather info
10. **WiFi Info**: `com.truemlgpro.wifiinfo` - Network diagnostics

### **🛡️ Privacy & Security (2)**
11. **DNS**: `com.celzero.bravedns_478` - Privacy DNS resolver
12. **Gesture Control**: `TapTap` - Advanced gesture navigation

### **🎨 System Utilities (6)**
13. **Dual Wallpaper**: `dualwall` - Dynamic wallpaper management
14. **Quick Tiles**: `QuickTiles` - Customizable quick settings
15. **File Manager**: `org.fossify.filemanager` - Powerful file management
16. **Contacts**: `com.bnyro.contacts` - Modern contacts app
17. **Phone**: `org.fossify.phone` - Enhanced dialer interface
18. **Gallery**: `org.fossify.gallery` - Feature-rich photo gallery

### **🔧 System Tools (3)**
19. **Athena**: `athena` - System maintenance and optimization
20. **Chrono**: `chrono` - Advanced clock and timer
21. **BCR**: `bcr` - Boot certification and recovery

## 📖 **Documentation Files**

### **Core Documentation**
- **[VENDOR_BUILD_GUIDE.md](VENDOR_BUILD_GUIDE.md)** - Step-by-step build guide
- **[COMPREHENSIVE_APP_ANALYSIS.md](../vendorInfo/COMPREHENSIVE_APP_ANALYSIS.md)** - Detailed app analysis

### **Error Analysis & Troubleshooting**
- **[ERROR_ANALYSIS_MAKE_PARSING.md](ERROR_ANALYSIS_MAKE_PARSING.md)** - Make parsing issues
- **[ERROR_ANALYSIS_MAKEFILE_SYNTAX.md](ERROR_ANALYSIS_MAKEFILE_SYNTAX.md)** - Makefile syntax problems
- **[ERROR_ANALYSIS_BUILD_SYSTEM_CONFLICTS.md](ERROR_ANALYSIS_BUILD_SYSTEM_CONFLICTS.md)** - Build system conflicts
- **[ERROR_ANALYSIS_JNI_LIBRARIES.md](ERROR_ANALYSIS_JNI_LIBRARIES.md)** - JNI library issues

## 🏗️ **Build System Architecture**

### **Configuration Layers**
1. **`config.mk`** - Main product configuration
   - App packages and removal
   - Default app configurations
   - Build optimizations
   - System service configurations

2. **`Android.bp`** - Soong build system
   - SystemPrebuilts app definitions
   - App overrides and conflicts
   - Build properties and certificates

3. **`SystemBuild/Android.mk`** - Make build system
   - SystemBuild app compilation
   - Privileged app permissions
   - System integration

### **Build Features**
- **Unified approach** with both build systems
- **Dex preopt disabled** for compatibility
- **WiFi system server** properly configured
- **Critical telephony services** preserved

## 🔄 **App Replacement Strategy**

### **Default App Configuration**
All custom apps are configured as system defaults through property overrides:
```makefile
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.browser_default=threads.thor \
    ro.config.calculator_default=CalculatorYou \
    ro.config.gallery_default=org.fossify.gallery \
    ro.config.filemanager_default=org.fossify.filemanager \
    ro.config.contacts_default=com.bnyro.contacts \
    ro.config.dns_default=com.celzero.bravedns_478
```

### **System App Removal**
Conflicting default system apps are removed:
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Gallery Browser Calculator Contacts \
    LineageGallery LineageContacts \
    WebView Chrome Photos
```

## 📊 **Technical Specifications**

### **Build Optimizations**
- **Dex Preopt**: Disabled for all applications
- **Library Checks**: Relaxed for compatibility
- **WiFi System**: Properly configured with service jars
- **Telephony**: Critical services preserved

### **App Categories**
- **SystemPrebuilts**: 19 APK applications (~200MB+ total)
- **SystemBuild**: 3 source-built applications
- **Total Applications**: 22 custom applications

### **File Sizes**
- **Largest Apps**: Gallery (22MB), BraveDNS (27MB), File Manager (9.2MB)
- **Smallest Apps**: Dual Wallpaper (2.2MB), Quick Tiles (2.0MB)
- **Average Size**: ~10MB per application

## 🚀 **Quick Start Guide**

### **1. Include in Device Config**
```makefile
$(call inherit-product, vendor/custom/config.mk)
```

### **2. Build Commands**
```bash
# Clean previous build
make clean

# Build the ROM
make bacon
```

### **3. Verification**
- Check that all 22 apps are included
- Verify default app configurations
- Confirm system app removal

## ⚠️ **Important Considerations**

### **Compatibility**
- **LineageOS Version**: 18.1+ recommended
- **Android Version**: Android 12+ (API 31+)
- **Architecture**: ARM64 (arm64-v8a)

### **Dependencies**
- **System Libraries**: All required libraries included
- **Permissions**: Proper permission configurations
- **Overrides**: Comprehensive app replacement strategy

### **Performance**
- **Dex Preopt**: Disabled for compatibility
- **Memory Usage**: Optimized for modern devices
- **Storage**: Efficient APK packaging

## 🔍 **Troubleshooting Guide**

### **Common Issues & Solutions**

#### **1. Build Failures**
- **Issue**: Build process fails during compilation
- **Solution**: Run `make clean` and verify all APK files present

#### **2. App Conflicts**
- **Issue**: Custom apps conflict with system apps
- **Solution**: Check `PRODUCT_PACKAGES_REMOVE` configuration

#### **3. Permission Issues**
- **Issue**: Apps fail to install or run
- **Solution**: Verify permission files in `SystemBuild/etc/permissions/`

#### **4. Library Problems**
- **Issue**: JNI library compatibility issues
- **Solution**: Check `preprocessed` flags in Android.bp

### **Debug Commands**
```bash
# Check build environment
make showcommands

# Verify app packages
grep -r "PRODUCT_PACKAGES" vendor/custom/

# Check for conflicts
grep -r "PRODUCT_PACKAGES_REMOVE" vendor/custom/
```

## 📈 **Maintenance & Updates**

### **Regular Tasks**
- Update APK files to latest versions
- Verify compatibility with new LineageOS versions
- Check for security updates in FOSS applications
- Monitor build system changes

### **Update Process**
1. **APK Updates**: Replace old APK files in SystemPrebuilts
2. **Version Checks**: Update version numbers in config.mk
3. **Testing**: Verify apps work correctly after updates
4. **Documentation**: Update this documentation

## 🤝 **Contributing**

### **How to Help**
- Report bugs and issues
- Suggest new applications
- Improve documentation
- Test on different devices

### **Guidelines**
- Follow existing code style
- Test changes thoroughly
- Update documentation
- Maintain compatibility

---

**Status**: Production Ready ✅  
**Total Apps**: 23 (20 SystemPrebuilts + 3 SystemBuild)  
**Build System**: Unified Soong + Make  
**Compatibility**: LineageOS 18.1+ / Android 12+  
**Last Updated**: Current configuration

For detailed app analysis, see [COMPREHENSIVE_APP_ANALYSIS.md](../vendorInfo/COMPREHENSIVE_APP_ANALYSIS.md).
