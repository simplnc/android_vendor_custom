# Android Vendor Custom - Fossify Apps + System Utilities Integration

A comprehensive Android vendor overlay that replaces default gallery and file manager applications with **Fossify Gallery** and **Fossify File Manager**, plus includes **Always On Display Toggle** utility across all Android ROMs including LineageOS, AOSP, and Pixel builds.

## 🎯 Overview

This vendor overlay provides:
- ✅ **Complete app replacement** - Removes all default gallery and file manager apps
- ✅ **Privileged system integration** - Apps installed with full system permissions
- ✅ **Automatic permission grants** - No user permission dialogs for core functionality
- ✅ **Intent handling override** - All media and file operations use Fossify apps
- ✅ **System utilities included** - AOD Toggle with pre-granted secure settings access
- ✅ **ROM builder ready** - Simple integration with any Android build system
- ✅ **Cross-platform compatibility** - Works with all major Android distributions

## 📦 Included Applications

### 🖼️ Fossify Gallery
- **Size**: 42MB APK
- **Purpose**: Complete gallery and media viewer replacement
- **Permissions**: Full media access, wallpaper setting, biometric authentication
- **Overrides**: 15+ gallery apps including AOSP Gallery, Google Photos, LineageOS Eleven

### 📁 Fossify File Manager  
- **Size**: 9.2MB APK
- **Purpose**: Complete file management solution replacement
- **Permissions**: Full file system access, package management, root operations
- **Overrides**: 10+ file managers including DocumentsUI, Google Files, LineageOS file managers

### 🌙 Always On Display Toggle
- **Size**: ~3MB APK
- **Purpose**: Quick settings tile to control Always On Display
- **Permissions**: Pre-granted WRITE_SECURE_SETTINGS (no ADB/Shizuku needed)
- **Compatibility**: Pixel/AOSP optimized, may work on other devices

## 🏗️ Repository Structure

```
android_vendor_custom/
├── config.mk                          # Main build configuration
├── Android.bp                         # Android build system configuration
├── SystemPrebuilts/                   # Prebuilt application files
│   ├── gallery/
│   │   ├── org.fossify.gallery.apk                    # Gallery APK (42MB)
│   │   ├── privapp-permissions-org.fossify.gallery.xml # Permission grants
│   │   └── default-gallery-intent.xml                 # Intent handler config
│   ├── filemanager/
│   │   ├── org.fossify.filemanager.apk                # File Manager APK (9.2MB)
│   │   ├── privapp-permissions-org.fossify.filemanager.xml # Permission grants
│   │   └── default-filemanager-intent.xml             # Intent handler config
│   └── aodtoggle/
│       ├── org.alberto97.aodtoggle.apk                 # AOD Toggle APK (~3MB)
│       ├── privapp-permissions-org.alberto97.aodtoggle.xml # Permission grants
│       └── default-aodtoggle-intent.xml               # System configuration
├── vendorInfo/                        # Detailed documentation
│   ├── gallery.md                     # Gallery integration details
│   ├── filemanager.md                 # File manager integration details
│   └── aodtoggle.md                   # AOD Toggle integration details
├── LICENSE                            # Apache 2.0 License
└── README.md                          # This file
```

## 🔧 Integration for ROM Builders

### Quick Integration

Add to your device tree or ROM configuration:

```makefile
# In your device.mk or ROM configuration
$(call inherit-product, vendor/custom/config.mk)
```

### What Happens During Build

1. **App Installation**: All three apps are installed as privileged system apps
2. **Permission Grants**: All necessary permissions are automatically granted
3. **App Removal**: Conflicting gallery and file manager apps are removed from build
4. **Intent Configuration**: System intents are configured to use Fossify apps
5. **Override Setup**: Default handlers are replaced while preserving dependencies

### Build Requirements

- Android build system (AOSP/LineageOS/etc.)
- No additional dependencies required
- Compatible with all Android versions 11+

## 📱 Replaced Applications

### 🖼️ Gallery Apps Removed
- **AOSP**: Gallery, Gallery2, MediaGallery, PhotoGallery
- **Google/Pixel**: Photos, PixelPhotos, GalleryGo  
- **LineageOS**: Eleven
- **Camera Combos**: Camera, LegacyCamera, Snap, SnapdragonCamera, OpenCamera
- **Third-party**: SimpleGallery, QuickPic, ImageViewer, MediaViewer

### 📁 File Manager Apps Replaced
- **AOSP**: DocumentsUI (overridden, not removed), FileManager, File Explorer
- **Google/Pixel**: Files
- **LineageOS**: FilesLineage, LineageFileManager
- **Third-party**: Amaze, MiXplorer, Root Explorer, X-plore, Ghost Commander
- **Download Managers**: Downloads (when used for file browsing)

## 🔐 Permission System

### 🖼️ Gallery Permissions (Auto-granted)
- Full external storage access (`MANAGE_EXTERNAL_STORAGE`)
- Media file access (`READ_MEDIA_IMAGES`, `READ_MEDIA_VIDEO`, `READ_MEDIA_AUDIO`)
- Wallpaper setting (`SET_WALLPAPER`, `SET_WALLPAPER_HINTS`)
- Camera and recording (`CAMERA`, `RECORD_AUDIO`)
- Biometric authentication (`USE_FINGERPRINT`, `USE_BIOMETRIC`)
- System integration (`POST_NOTIFICATIONS`, `RECEIVE_BOOT_COMPLETED`)

### 📁 File Manager Permissions

#### Auto-granted (No User Prompts)
- Complete file system access (`MANAGE_EXTERNAL_STORAGE`, `ACCESS_ALL_EXTERNAL_STORAGE`)
- Media management (`MANAGE_MEDIA`, `WRITE_MEDIA_STORAGE`)
- System operations (`MOUNT_UNMOUNT_FILESYSTEMS`, `WRITE_SETTINGS`)
- Root access (`ACCESS_SUPERUSER`, `INTERACT_ACROSS_USERS_FULL`)
- Hardware control (`VIBRATE`, `FLASHLIGHT`, `WAKE_LOCK`)

#### User Consent Required (Security Prompts)
- ⚠️ **App installation**: `REQUEST_INSTALL_PACKAGES`, `INSTALL_PACKAGES`
- ⚠️ **App deletion**: `DELETE_PACKAGES`, `REQUEST_DELETE_PACKAGES`  
- ⚠️ **Network access**: `INTERNET`, `ACCESS_NETWORK_STATE`, `ACCESS_WIFI_STATE`

### 🌙 AOD Toggle Permissions (Auto-granted)
- Secure settings access (`WRITE_SECURE_SETTINGS`, `WRITE_SETTINGS`)
- Quick settings integration (`STATUS_BAR`, `EXPAND_STATUS_BAR`)
- System integration (`RECEIVE_BOOT_COMPLETED`, `QUERY_ALL_PACKAGES`)
- Device control (`WAKE_LOCK`, `BIND_DEVICE_ADMIN`)

## 🎛️ Intent Handling

### 🖼️ Gallery Intents
- Image viewing: `image/*` MIME types
- Video viewing: `video/*` MIME types  
- Media picker: `android.intent.action.PICK`
- Wallpaper setting: `android.intent.action.SET_WALLPAPER`

### 📁 File Manager Intents
- File browsing: `android.intent.action.VIEW` for directories
- Document picker: `android.intent.action.OPEN_DOCUMENT`
- Document tree: `android.intent.action.OPEN_DOCUMENT_TREE`
- File creation: `android.intent.action.CREATE_DOCUMENT`
- Archive support: ZIP, RAR, TAR files
- APK handling: `application/vnd.android.package-archive`

### 🌙 AOD Toggle Integration
- Quick settings tile service registration
- System UI integration for tile management
- Secure settings modification for AOD control

## 🔒 Security Considerations

### High-Privilege Access
- All apps receive **system-level privileges** equivalent to built-in Android apps
- File manager has **root access capabilities** on rooted devices
- AOD Toggle has **secure settings modification** capabilities
- **Full file system access** including system directories

### User Consent Gates
- **App installation/removal** requires explicit user permission for security
- **Network access** requires user permission to prevent unwanted data usage
- **Core file operations** work without user prompts for seamless experience
- **AOD control** works immediately without setup

### Privacy Protection
- No automatic network connections without user consent
- Local-first approach for all file and media operations
- User maintains control over sensitive operations
- AOD toggle operates locally without network requirements

## 🌐 Compatibility Matrix

| Platform | Gallery | File Manager | AOD Toggle | Notes |
|----------|---------|--------------|------------|-------|
| **LineageOS** | ✅ Full | ✅ Full | ✅ Good | Replaces Eleven gallery and LineageOS file managers |
| **AOSP** | ✅ Full | ✅ Full | ✅ Full | Replaces Gallery/Gallery2 and DocumentsUI frontend |
| **Pixel/Google** | ✅ Full | ✅ Full | ✅ Full | Replaces Photos and Files apps, AOD fully supported |
| **Custom ROMs** | ✅ Full | ✅ Full | ⚠️ Variable | Universal compatibility, AOD depends on implementation |
| **Android 11+** | ✅ Full | ✅ Full | ✅ Full | Full scoped storage support |
| **Android 13+** | ✅ Enhanced | ✅ Enhanced | ✅ Enhanced | Granular media permissions support |
| **Android 14** | ✅ Enhanced | ✅ Enhanced | ✅ Enhanced | AOD Toggle v1.1.0+ explicit support |

## 👥 User Experience

### After Flashing ROM with Vendor Overlay

**Gallery Experience:**
- Single, unified gallery app (no duplicate apps)
- All permissions pre-granted - no setup required
- Seamless wallpaper setting and media viewing
- Camera integration for immediate photo viewing

**File Manager Experience:**
- Comprehensive file management with system-level access
- Archive file support (ZIP, RAR, TAR) built-in
- APK installation available (with user permission)
- Root file operations on rooted devices
- No duplicate file management apps

**AOD Toggle Experience:**
- Quick settings tile immediately available
- No ADB commands or Shizuku setup required
- One-tap AOD on/off functionality
- Works on Pixel/AOSP devices out of the box

**Permission Behavior:**
- Core functionality works immediately without prompts
- Security-sensitive operations (app installs, network) require one-time user consent
- All subsequent operations are seamless

## 🛠️ Development & Customization

### Adding APK Files

You need to obtain and place the APK files in the correct locations:

```bash
# Download and place APK files:
SystemPrebuilts/gallery/org.fossify.gallery.apk
SystemPrebuilts/filemanager/org.fossify.filemanager.apk
SystemPrebuilts/aodtoggle/org.alberto97.aodtoggle.apk
```

### Modifying Configurations

**Adding/Removing Override Targets:**
Edit `Android.bp` to modify the `overrides` lists for each app.

**Permission Modifications:**
Edit the XML files in `SystemPrebuilts/*/privapp-permissions-*.xml`.

**Intent Handler Changes:**
Modify `default-*-intent.xml` files to change intent handling behavior.

### Building from Source

```bash
# Include in your ROM build
cd your_rom_source/vendor/
git clone https://github.com/yourusername/android_vendor_custom custom
cd your_rom_source/
# Add to your product configuration:
# $(call inherit-product, vendor/custom/config.mk)
```

## 📄 Licensing

This project is licensed under the **Apache License 2.0**. See `LICENSE` file for complete terms.

### License Summary
- ✅ Commercial use allowed
- ✅ Modification allowed  
- ✅ Distribution allowed
- ✅ Patent use allowed
- ⚠️ Must include license and copyright notice
- ⚠️ Must state changes made to the original

## 🤝 Contributing

Contributions welcome! Areas for improvement:
- Additional app overrides for better compatibility
- Permission optimization
- Intent handler enhancements
- Documentation improvements
- Additional useful system utilities

## ⚠️ Important Notes

- **Complete Replacement**: This overlay completely replaces default gallery and file management experience
- **System-Level Integration**: Apps receive extensive permissions for full functionality  
- **ROM Builder Responsibility**: ROM builders should inform users about the included apps and permissions
- **User Control**: Users retain control over security-sensitive operations through consent prompts
- **Dependency Preservation**: Critical system dependencies (like DocumentsUI backend) are preserved
- **APK Files Required**: You must obtain the APK files separately and place them in the appropriate directories
- **AOD Compatibility**: AOD Toggle works best on Pixel/AOSP devices; OEM compatibility varies

---

**For detailed technical documentation, see:**
- `vendorInfo/gallery.md` - Complete gallery integration details
- `vendorInfo/filemanager.md` - Complete file manager integration details  
- `vendorInfo/aodtoggle.md` - Complete AOD Toggle integration details

**Version**: 1.1  
**Last Updated**: 2024  
**Android Compatibility**: 11+ (API 30+)