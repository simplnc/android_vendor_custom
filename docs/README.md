# Vendor Custom Documentation Index

## 📚 **Documentation Overview**

This directory contains comprehensive documentation for the Custom LineageOS Configuration, which provides **currently configured applications** to replace the default LineageOS app suite.

## 🚀 **Quick Reference**

### **Application Count**
- **SystemPrebuilts**: see `APP_OVERVIEW.md`
- **Total**: see `APP_OVERVIEW.md`
- **All apps configured** in Android.bp and config.mk
- **User uninstallable apps**: duckduck, com.mardous.booming, org.breezyweather, chrono

### **Build System**
- **Configuration**: `config.mk` (127 lines)
- **Soong Build**: `Android.bp` (465 lines)
- **Clean, organized structure** ready for production

## 📱 **Application Information**

For complete application details, see:
- **[App Overview](wiki/user-guides/APP_OVERVIEW.md)** - Complete list of all 29 applications
- **[Comprehensive App Analysis](wiki/analysis/COMPREHENSIVE_APP_ANALYSIS.md)** - Detailed technical analysis

## 📖 **Documentation Files**

### **Quick Start**
- **[Main Notice](MAIN_NOTICE.md)** - Entry point for all documentation
- **[Wiki Index](wiki/WIKI_INDEX.md)** - Complete wiki documentation hub

### **User Guides**
- **[User Guide](wiki/user-guides/USER_GUIDE.md)** - Simple overview for end users
- **[App Overview](wiki/user-guides/APP_OVERVIEW.md)** - Complete application list
- **[Privacy Benefits](wiki/user-guides/PRIVACY_BENEFITS.md)** - Why privacy matters

### **Build & Technical**
- **[Build Guide](wiki/build-guides/BUILD_GUIDE.md)** - Technical build instructions
- **[Configuration Reference](wiki/technical-reference/CONFIGURATION_REFERENCE.md)** - Build configuration details
- **[Vendor Build Guide](build-system/VENDOR_BUILD_GUIDE.md)** - Detailed build system guide

### **Troubleshooting**
- **[Troubleshooting Guide](wiki/troubleshooting/TROUBLESHOOTING.md)** - Common issues and solutions
- **[Error Analysis](wiki/troubleshooting/ERROR_ANALYSIS.md)** - Detailed error analysis
- **[Build System Error Analysis](build-system/)** - Build system specific errors

### **Maintenance**
- **[Maintenance Guide](wiki/maintenance/MAINTENANCE_GUIDE.md)** - Adding/removing apps

### **Analysis & Production**
- **[Comprehensive App Analysis](wiki/analysis/COMPREHENSIVE_APP_ANALYSIS.md)** - Detailed app analysis
- **[Production Ready Summary](wiki/production/PRODUCTION_READY_SUMMARY.md)** - Production checklist

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

### **Build Features**
- **Unified approach** with Soong build system
- **Dex preopt disabled** for compatibility
- **WiFi system server** properly configured
- **Critical telephony services** preserved

## 🔄 **App Replacement Strategy**

### **Default App Configuration**
All custom apps are configured as system defaults through property overrides:
```makefile
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.browser_default=duckduck \
    ro.config.calculator_default=CalculatorYou \
    ro.config.gallery_default=org.fossify.gallery \
    ro.config.filemanager_default=org.fossify.filemanager \
    ro.config.contacts_default=com.bnyro.contacts \
    ro.config.email_default=net.thunderbird.android \
    ro.config.notes_default=com.kin.easynotes \
    ro.config.photo_default=com.fibelatti.photowidget
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
- **SystemPrebuilts**: 23 APK applications (~200MB+ total)
- **Total Applications**: 23 custom applications

### **File Sizes**
- **Largest Apps**: Gallery (~23MB), Email (~15MB), Weather (~14MB)
- **Smallest Apps**: Dual Wallpaper (~2MB), Quick Tiles (~2MB)
- **Average Size**: ~9MB per application

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
- Check that all 23 apps are included
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
**Total Apps**: 23 (23 SystemPrebuilts)  
**Build System**: Unified Soong + Make  
**Compatibility**: LineageOS 18.1+ / Android 12+  
**Last Updated**: Current configuration

For detailed app analysis, see [COMPREHENSIVE_APP_ANALYSIS.md](../vendorInfo/COMPREHENSIVE_APP_ANALYSIS.md).
