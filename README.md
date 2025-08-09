# Android Vendor Custom - Fossify Apps + System Utilities Integration

## 📱 **Project Overview**

A comprehensive Android vendor overlay that provides **29 carefully selected FOSS applications** to replace default system apps with privacy-focused, feature-rich alternatives, including complete Fossify Gallery and File Manager integration with Always On Display Toggle utility.

This vendor configuration works across all Android ROMs including LineageOS, AOSP, and Pixel builds, providing a complete privacy-focused app suite with system-level integration.

## 🎯 **What This Vendor Provides**

### **✅ Complete App Suite (29 FOSS Applications)**
- **🌐 Core System**: Privacy-focused browser, calculator, calendar
- **🔧 Essential Utilities**: Fossify Gallery, Fossify File Manager, contacts, email
- **🎵 Media & Tools**: Music player, weather, recorder, photo widgets
- **🛡️ System Enhancement**: Firewall, gesture controls, quick tiles
- **🔧 System Tools**: Athena, Chrono
- **📱 New Applications**: Daily You, Launchpad, Draw Anywhere, and more

### **✅ Fossify Integration Focus**
- **🖼️ Fossify Gallery**: Complete gallery replacement (42MB) - overrides 15+ gallery apps
- **📁 Fossify File Manager**: Complete file management (9.2MB) - overrides 10+ file managers

### **✅ System-Level Integration**
- **Privileged System Apps**: All apps installed with full system permissions
- **Automatic Permission Grants**: No user permission dialogs for core functionality
- **Intent Override**: All media/file operations use Fossify apps by default
- **App Removal**: Conflicting system apps automatically removed from build

### **✅ Privacy & Security First**
- **100% FOSS**: All applications are fully open source
- **No Tracking**: Zero data collection or analytics
- **Local Processing**: All operations performed locally
- **User Control**: Transparent permissions and user consent for sensitive operations

## 📊 **Quick Statistics**

| Category | Count | Size | Focus |
|----------|-------|------|-------|
| **Total Apps** | 29 | ~250MB | Privacy & Functionality |
| **Core System** | 3 | ~15MB | Essential system apps |
| **Utilities** | 6 | ~35MB | Daily productivity |
| **Media & Tools** | 6 | ~45MB | Content management |
| **System Enhancement** | 9 | ~120MB | Advanced features |
| **Fossify Focus** | 2 | ~51MB | Gallery + File Manager |

## 🏗️ **Repository Structure**

```
android_vendor_custom/
├── Android.bp                              # Soong build system config (580+ lines)
├── config.mk                               # Make build config (153+ lines)
├── config/                                 # Optimization configurations
│   ├── build_optimizations.mk             # Compiler optimizations
│   ├── framework_optimizations.mk         # Framework tuning
│   └── performance_security_optimizations.mk # Security hardening
├── SystemPrebuilts/                       # APK files directory (29 apps)
│   ├── gallery/                           # Fossify Gallery (42MB)
│   ├── filemanager/                       # Fossify File Manager (9.2MB)
│   └── [25 other app directories]
├── docs/                                  # Comprehensive documentation
│   ├── wiki/                              # Organized wiki (60+ guides)
│   │   ├── WIKI_INDEX.md                  # Main wiki index
│   │   ├── user-guides/                   # End-user guides
│   │   ├── apps/                          # Individual app docs (29 files)
│   │   ├── build-system/                  # Build system guides
│   │   ├── developer/                     # Developer tutorials
│   │   └── [15 other categories]
│   └── MAIN_NOTICE.md                     # Documentation hub
└── README.md                              # This file
```

## 📱 **Featured Applications**

### **🖼️ Fossify Gallery (42MB)**
**Complete Gallery Replacement**
- **Overrides**: 15+ gallery apps (AOSP Gallery, Google Photos, LineageOS Eleven, etc.)
- **Features**: Full media management, editing capabilities, wallpaper setting
- **Permissions**: Auto-granted media access, camera integration, biometric auth
- **Integration**: System wallpaper picker, camera roll access, media picker

### **📁 Fossify File Manager (9.2MB)**
**Complete File Management Solution**
- **Overrides**: 10+ file managers (DocumentsUI, Google Files, LineageOS managers, etc.)
- **Features**: Root file access, archive support (ZIP/RAR/TAR), APK management
- **Permissions**: Full file system access, package management, system operations
- **Integration**: System file picker, document provider, root operations on rooted devices

### **🌙 Always On Display Toggle (~3MB)**
**Quick Settings AOD Control**
- **Purpose**: One-tap AOD on/off without ADB/Shizuku setup
- **Integration**: Pre-granted WRITE_SECURE_SETTINGS permission
- **Compatibility**: Pixel/AOSP optimized, works on most AOD-supporting devices
- **Features**: Quick settings tile, system UI integration, no setup required

### **🌐 Complete App Suite**
- **DuckDuckGo Browser**: Privacy-focused web browsing
- **CalculatorYou**: Advanced scientific calculator
- **Simple Calendar**: Multi-account calendar management
- **Booming Music Player**: Feature-rich audio player with equalizer
- **Breezy Weather**: Accurate weather from multiple sources
- **Thunderbird Email**: Mozilla's privacy-focused email client
- **Firewall**: Network-level app firewall control
- **Athena + Chrono**: System tools and advanced clock
- **25 Additional Apps**: Complete productivity and utility suite

## 🔧 **Integration for ROM Builders**

### **Quick Integration**
Add to your device tree or ROM configuration:

```makefile
# In your device.mk or ROM configuration
$(call inherit-product, vendor/custom/config.mk)
```

### **What Happens During Build**
1. **App Installation**: All 29 apps installed as privileged system apps
2. **Permission Grants**: Complete permission sets automatically granted
3. **App Removal**: 25+ conflicting system apps removed from build
4. **Intent Configuration**: System intents configured for Fossify apps
5. **Override Setup**: Default handlers replaced while preserving dependencies

### **Build Requirements**
- ✅ **Android Build System**: AOSP/LineageOS/Pixel/etc.
- ✅ **No Additional Dependencies**: Self-contained vendor overlay
- ✅ **Android 11+**: Full scoped storage and modern permission support
- ✅ **Compatible Architectures**: ARM64 (arm64-v8a) primary support

## 📋 **App Replacement Matrix**

### **🖼️ Gallery Apps Replaced (15+)**
| Platform | Apps Replaced |
|----------|---------------|
| **AOSP** | Gallery, Gallery2, MediaGallery, PhotoGallery, ImageViewer |
| **Google/Pixel** | Photos, PixelPhotos, GalleryGo |
| **LineageOS** | Eleven |
| **Camera Combos** | Camera, LegacyCamera, Snap, SnapdragonCamera |
| **Third-party** | SimpleGallery, QuickPic, MediaViewer |

### **📁 File Manager Apps Replaced (10+)**
| Platform | Apps Replaced |
|----------|---------------|
| **AOSP** | DocumentsUI*, FileManager, File Explorer |
| **Google/Pixel** | Files |
| **LineageOS** | FilesLineage, LineageFileManager |
| **Third-party** | Amaze, MiXplorer, Root Explorer, X-plore |

*DocumentsUI is overridden but preserved for system dependencies

### **🎯 Intent Handling**
- **Gallery Intents**: Image/video viewing, media picker, wallpaper setting
- **File Manager Intents**: File browsing, document picker, APK installation

## 🔐 **Permission System**

### **Auto-Granted Permissions (No User Prompts)**
- **Gallery**: Full media access, camera, wallpaper setting, biometric auth
- **File Manager**: Complete file system access, media management, system operations
- **All Apps**: Basic system integration (notifications, boot completed, etc.)

### **User Consent Required (Security Gates)**
- ⚠️ **File Manager**: App installation/removal, network access
- ⚠️ **Security-Sensitive**: Operations requiring explicit user permission

### **Security Model**
- **System-Level Trust**: Apps receive same privileges as built-in Android apps
- **User Control**: Sensitive operations require explicit consent
- **Privacy Protection**: No automatic network connections or data collection
- **Local-First**: All core operations performed locally

## 🌐 **Compatibility Matrix**

| Platform | Gallery | File Manager | Apps Suite | Status |
|----------|---------|--------------|------------|--------|
| **LineageOS 18.1+** | ✅ Full | ✅ Full | ✅ Complete | **Recommended** |
| **AOSP 11+** | ✅ Full | ✅ Full | ✅ Full | ✅ Complete | **Supported** |
| **Pixel (Android 11+)** | ✅ Full | ✅ Full | ✅ Full | ✅ Complete | **Optimized** |
| **Custom ROMs** | ✅ Full | ✅ Full | ⚠️ Variable | ✅ Complete | **Compatible** |
| **Android 11-13** | ✅ Full | ✅ Full | ✅ Full | ✅ Complete | **Supported** |
| **Android 14+** | ✅ Enhanced | ✅ Enhanced | ✅ Enhanced | ✅ Complete | **Latest** |

## 🛠️ **Development & Customization**

### **Adding/Updating APK Files**
```bash
# Place APK files in correct directories:
SystemPrebuilts/gallery/org.fossify.gallery.apk
SystemPrebuilts/filemanager/org.fossify.filemanager.apk
SystemPrebuilts/aodtoggle/org.alberto97.aodtoggle.apk
# ... (26 other app directories)
```

### **Modifying Configurations**
- **Override Targets**: Edit `Android.bp` to modify app replacement lists
- **Permissions**: Edit XML files in `SystemPrebuilts/*/privapp-permissions-*.xml`
- **Intent Handlers**: Modify `default-*-intent.xml` files
- **Build Optimizations**: Adjust settings in `config/` directory files

### **Build Integration**
```bash
# Clone into vendor directory
cd your_rom_source/vendor/
git clone https://github.com/simplncprivate/android_vendor_custom custom

# Add to product configuration
echo '$(call inherit-product, vendor/custom/config.mk)' >> your_device.mk

# Build normally
cd your_rom_source/
make clean && make bacon
```

## 📚 **Documentation**

### **📖 Quick Start**
- **[Wiki Index](docs/wiki/WIKI_INDEX.md)** - Complete documentation hub
- **[Main Notice](docs/MAIN_NOTICE.md)** - Documentation entry point
- **[User Guide](docs/wiki/user-guides/USER_GUIDE.md)** - End-user overview

### **🛠️ Technical Documentation**
- **[Build Guide](docs/wiki/build-guides/BUILD_GUIDE.md)** - Technical build instructions
- **[Configuration Reference](docs/wiki/technical-reference/CONFIGURATION_REFERENCE.md)** - Build system details
- **[Developer Tutorial](docs/wiki/developer/DEVELOPER_TUTORIAL.md)** - Development guide

### **📱 Application Documentation**
- **[App Overview](docs/wiki/user-guides/APP_OVERVIEW.md)** - Complete application list
- **[Individual App Docs](docs/wiki/apps/)** - 29 detailed app guides
- **[Fossify Gallery](docs/wiki/app-documentation/fossify-gallery.md)** - Gallery integration details
- **[Fossify File Manager](docs/wiki/app-documentation/fossify-file-manager.md)** - File manager integration details

### **🔧 Advanced Documentation**
- **[Build System](docs/wiki/build-system/)** - Complete build system guides
- **[Troubleshooting](docs/wiki/troubleshooting/)** - Common issues and solutions
- **[Contributing](docs/wiki/community/CONTRIBUTING.md)** - How to contribute

## 📄 **Licensing**

**Apache License 2.0**
- ✅ Commercial use allowed
- ✅ Modification allowed
- ✅ Distribution allowed
- ✅ Patent use allowed
- ⚠️ Must include license and copyright notice
- ⚠️ Must state changes made to original

## 🤝 **Contributing**

### **Areas for Contribution**
- ✅ **App Updates**: Keep Fossify and other apps updated
- ✅ **Documentation**: Improve guides and add new content
- ✅ **Testing**: Test on different devices and ROMs
- ✅ **Bug Reports**: Report issues with detailed reproduction steps
- ✅ **Feature Requests**: Suggest improvements and new apps

### **How to Contribute**
1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/your-improvement`)
3. **Make** your changes and test thoroughly
4. **Submit** a pull request with clear description
5. **Contact**: simplncprivate@gmail.com

### **Contribution Guidelines**
- Follow existing code structure and naming conventions
- Test changes on target devices before submitting
- Update relevant documentation for any changes
- Maintain compatibility with supported Android versions
- Respect the privacy-first philosophy of the project

## ⚠️ **Important Notes**

### **Complete Replacement**
This vendor overlay completely replaces the default gallery, file manager, and utility experience. Users will not have access to the original system apps unless they manually override these settings.

### **System-Level Integration**
All apps receive extensive system permissions for full functionality. This is necessary for proper integration but requires responsible use.

### **ROM Builder Responsibility**
ROM builders should inform users about the included applications, their permissions, and the replacement of default system apps.

### **User Control Maintained**
While core functionality works automatically, users retain control over security-sensitive operations through Android's permission system.

### **APK Files Required**
You must obtain and place the APK files in the appropriate `SystemPrebuilts/` directories. The build system does not download APKs automatically.

### **Dependency Preservation**
Critical system dependencies (like DocumentsUI backend functions) are preserved to maintain system stability.

## 🎯 **Version Information**

- **Version**: 1.1.0
- **Last Updated**: January 2025
- **Android Compatibility**: 11+ (API 30+)
- **Total Applications**: 28 FOSS apps
- **Primary Focus**: Fossify Gallery + File Manager
- **Documentation**: 60+ comprehensive guides

## 📞 **Support & Contact**

- **Project Maintainer**: simplncprivate@gmail.com
- **Documentation**: See [Wiki Index](docs/wiki/WIKI_INDEX.md) for complete guides
- **Issues**: GitHub Issues for technical problems
- **Contributing**: See [Contributing Guide](docs/wiki/community/CONTRIBUTING.md)

---

**Status**: Production Ready ✅  
**Total Apps**: 29 FOSS Applications  
**Build System**: Unified Soong + Make  
**Compatibility**: Android 11+ (All major ROMs)  
**Focus**: Fossify Integration + Privacy-First Apps

For the complete documentation experience, start with **[Wiki Index](docs/wiki/WIKI_INDEX.md)**.