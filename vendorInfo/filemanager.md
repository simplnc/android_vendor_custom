# Android Custom Vendor - Fossify File Manager Override

This vendor overlay ensures that **Fossify File Manager** becomes the default and only file management application across all Android ROMs including LineageOS, AOSP, and Pixel builds.

## Overview

This configuration:
- ✅ Replaces ALL existing file manager apps (AOSP, LineageOS, Pixel, etc.)
- ✅ Grants comprehensive file management permissions automatically
- ✅ Sets Fossify File Manager as the default for all file browsing intents
- ✅ Removes conflicting file management applications from the build
- ✅ Provides privileged system app status with full file system access

## Replaced Applications

The following file manager applications will be completely overridden:

### AOSP & Generic Android
- `DocumentsUI` - Default AOSP file manager (⚠️ **overridden but not removed** to preserve dependencies)
- `FileManager` - Generic file managers
- `File Commander` - File commander variations
- `File Explorer` - Basic file explorers
- `FileExplorer` - File explorer variations
- `Downloads` - Download managers with file browsing

### Google/Pixel Specific
- `Files` - Google Files (Pixel default)

### LineageOS Specific
- `FilesLineage` - LineageOS file manager
- `LineageFileManager` - Alternative LineageOS file manager

### Popular Third-Party File Managers
- `Amaze` - Amaze File Manager
- `MiXplorer` - MiXplorer file manager
- `Root Explorer` - Root file managers
- `X-plore` - X-plore file manager
- `Ghost Commander` - Ghost Commander file manager

## Override Strategy

### Complete Replacement (Removed from Build)
Most file managers are completely removed from the ROM build to prevent conflicts.

### Override with Dependency Preservation
- **DocumentsUI**: Overridden but not removed from build to preserve system dependencies
- **FilesLineage/LineageFileManager**: Removed from build as they can be safely replaced

## Granted Permissions

The app automatically receives the following permissions when installed:

### Core File Management Permissions
- `MANAGE_EXTERNAL_STORAGE` - Full external storage management
- `READ_EXTERNAL_STORAGE` - Read shared storage contents
- `WRITE_EXTERNAL_STORAGE` - Modify/delete shared storage contents
- `MANAGE_DOCUMENTS` - Document provider management
- `ACCESS_ALL_EXTERNAL_STORAGE` - Complete storage access

### System Integration Permissions
- `POST_NOTIFICATIONS` - Show notifications
- `USE_FINGERPRINT` / `USE_BIOMETRIC` - Biometric authentication
- `org.fossify.android.permission.WRITE_GLOBAL_SETTINGS` - Custom permission

### Advanced File Operations
- `WRITE_MEDIA_STORAGE` - Media storage write access
- `MANAGE_MEDIA` - Media file management
- `MOUNT_UNMOUNT_FILESYSTEMS` - Mount/unmount file systems
- `MOUNT_FORMAT_FILESYSTEMS` - Format file systems
- `WRITE_OBB` - OBB file management

### Media File Access (Android 13+)
- `READ_MEDIA_IMAGES` - Read image files from shared storage
- `READ_MEDIA_VIDEO` - Read video files from shared storage
- `READ_MEDIA_AUDIO` - Read audio files from shared storage
- `ACCESS_MEDIA_LOCATION` - Read location data from media files
- `READ_MEDIA_VISUAL_USER_SELECTED` - Read user-selected media files

### Package Management (User Consent Required)
- `QUERY_ALL_PACKAGES` - Query installed packages (auto-granted)
- `REQUEST_INSTALL_PACKAGES` - Request app installation (⚠️ **user prompt**)
- `INSTALL_PACKAGES` - Install APK packages (⚠️ **user prompt**)
- `DELETE_PACKAGES` - Delete installed packages (⚠️ **user prompt**)
- `REQUEST_DELETE_PACKAGES` - Request package deletion (⚠️ **user prompt**)

### Network Access (User Consent Required)
- `INTERNET` - Internet access for cloud features (⚠️ **user prompt**)
- `ACCESS_NETWORK_STATE` - Network state information (⚠️ **user prompt**)
- `ACCESS_WIFI_STATE` - WiFi state information (⚠️ **user prompt**)

### System Operations
- `RECEIVE_BOOT_COMPLETED` - Run at startup
- `WRITE_SETTINGS` / `WRITE_SECURE_SETTINGS` - System settings access
- `WAKE_LOCK` - Prevent device sleep during operations
- `FOREGROUND_SERVICE` - Run foreground services
- `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` - Battery optimization bypass

### Root and Advanced Access
- `ACCESS_SUPERUSER` - Superuser access for root operations
- `INTERACT_ACROSS_USERS` / `INTERACT_ACROSS_USERS_FULL` - Multi-user support
- `KILL_BACKGROUND_PROCESSES` - Process management
- `RESTART_PACKAGES` - Package restart capabilities

### Hardware and System UI
- `VIBRATE` - Device vibration
- `FLASHLIGHT` - Flashlight control
- `STATUS_BAR` / `EXPAND_STATUS_BAR` - Status bar integration
- `SET_WALLPAPER` / `SET_WALLPAPER_HINTS` - Wallpaper management

### Backup and Recovery
- `BACKUP` - System backup operations
- `CONFIRM_FULL_BACKUP` - Full backup confirmation
- `USB_PERMISSION` - USB device access
- `HARDWARE_TEST` - Hardware testing capabilities

### Advanced System Access
- `WRITE_GSERVICES` - Google services configuration
- `READ_LOGS` - System log access
- `DUMP` - System dump capabilities

## Intent Handling

The file manager handles the following intents by default:

### File Operations
- **File Browsing**: `android.intent.action.VIEW` for folders
- **Document Picker**: `android.intent.action.OPEN_DOCUMENT`
- **Document Tree**: `android.intent.action.OPEN_DOCUMENT_TREE`
- **Create Document**: `android.intent.action.CREATE_DOCUMENT`
- **File Picker**: `android.intent.action.PICK` for any file type
- **Get Content**: `android.intent.action.GET_CONTENT` for files

### Archive Support
- **ZIP files**: `application/zip`
- **RAR files**: `application/x-rar-compressed`
- **TAR files**: `application/x-tar`

### Package Management
- **APK Installation**: `application/vnd.android.package-archive` (⚠️ **requires user permission**)

### System Integration
- **Root Management**: `android.provider.action.MANAGE_ROOT`
- **Files Category**: `android.intent.category.APP_FILES`

## File Structure

```
android_vendor_custom/
├── config.mk                                    # Main configuration
├── SystemPrebuilts/
│   ├── Android.bp                              # Build configuration
│   ├── gallery/                                # Gallery app files
│   └── filemanager/
│       ├── org.fossify.filemanager.apk        # File Manager APK
│       ├── privapp-permissions-org.fossify.filemanager.xml  # Permissions
│       └── default-filemanager-intent.xml     # Intent handlers
├── gallery.md                                  # Gallery documentation
└── filemanager.md                             # This file
```

## Integration

### For ROM Builders

1. Include this vendor in your ROM build:
   ```bash
   # In your device tree or ROM configuration
   $(call inherit-product, vendor/custom/config.mk)
   ```

2. The configuration will automatically:
   - Install Fossify File Manager as a privileged system app
   - Remove most conflicting file management applications
   - Override DocumentsUI while preserving its dependencies
   - Grant all necessary permissions for full file system access
   - Set up proper intent handling for all file operations

### For Users

When you flash a ROM with this vendor overlay:
- Fossify File Manager will be the primary file management app
- Most permissions will be pre-granted (no permission dialogs)
- Opening any file picker will use Fossify File Manager
- The app will have full root and system-level file access
- **APK installation requires user permission** when first attempted
- **Network access requires user permission** for cloud features
- Archive files (ZIP, RAR, TAR) can be viewed and managed
- DocumentsUI remains available for system functions that depend on it

## Permission Behavior

### Auto-Granted (No User Prompt)
- All file system access permissions
- Media file access permissions
- System integration permissions
- Root and advanced access permissions

### User Consent Required (Permission Prompt)
- ⚠️ **App installation permissions** (`REQUEST_INSTALL_PACKAGES`, `INSTALL_PACKAGES`)
- ⚠️ **App deletion permissions** (`DELETE_PACKAGES`, `REQUEST_DELETE_PACKAGES`)
- ⚠️ **Network access permissions** (`INTERNET`, `ACCESS_NETWORK_STATE`, `ACCESS_WIFI_STATE`)

## Security Considerations

⚠️ **Important Security Notes:**
- This configuration grants **extensive system permissions** including root access
- **App installation permissions require user consent** for security
- **Network access permissions require user consent** for security
- **Full file system access** is granted including system directories
- The app has **multi-user and cross-user capabilities**
- **APK files can be browsed and installed** with user permission
- **Cloud features are available** with user permission for network access
- **DocumentsUI dependencies are preserved** to maintain system stability

## Compatibility

- ✅ **LineageOS** (all versions) - includes LineageOS file manager override
- ✅ **AOSP** builds - DocumentsUI override with dependency preservation
- ✅ **Pixel** builds and derivatives
- ✅ **Custom ROMs** based on the above
- ✅ **Android 11+** (full scoped storage support)
- ✅ **Android 13+** (granular media permissions)
- ✅ **Rooted devices** (enhanced functionality)

## Building

This vendor overlay integrates with the standard Android build system. No special build steps are required beyond including the vendor in your product configuration.

The file manager will be installed with maximum privileges and will function as a complete system-level file management solution while preserving necessary system dependencies.

---

**Note**: This configuration replaces the user-facing file management experience while preserving system dependencies. Users will have a powerful file manager with system-level access. App installation and network capabilities are available but require user consent for security purposes. 