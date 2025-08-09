# Android Custom Vendor - Always On Display Toggle Integration

This vendor overlay includes **Always On Display Toggle** as a privileged system app that adds a quick settings tile to control Always On Display functionality without requiring Shizuku or ADB commands.

## Overview

This configuration:
- ✅ Installs AOD Toggle as a privileged system app
- ✅ Pre-grants the critical `WRITE_SECURE_SETTINGS` permission automatically
- ✅ Provides quick settings tile for easy AOD control
- ✅ Eliminates need for Shizuku or manual ADB permission grants
- ✅ Integrates seamlessly with Android System UI

## App Details

### Always On Display Toggle v1.1.0+
- **Package**: `org.alberto97.aodtoggle`
- **Purpose**: Quick settings tile to toggle Always On Display
- **Size**: ~2-5MB APK (varies by version)
- **Compatibility**: Android 11+ (tested primarily on Google Pixel)
- **Features**: Android 14 support, Shizuku integration (not needed when pre-installed)

## Granted Permissions

The app automatically receives the following permissions when installed as a system app:

### Core AOD Control Permissions
- `WRITE_SECURE_SETTINGS` - **Primary permission** for controlling AOD settings
- `WRITE_SETTINGS` - System settings access for reading current AOD state

### Quick Settings Integration
- `STATUS_BAR` - Status bar integration for quick settings tile
- `EXPAND_STATUS_BAR` - Status bar manipulation capabilities
- `SYSTEM_ALERT_WINDOW` - System overlay for potential UI features

### System Integration
- `RECEIVE_BOOT_COMPLETED` - Restore tile state after device reboot
- `QUERY_ALL_PACKAGES` - Query system features and packages
- `POST_NOTIFICATIONS` - Show status notifications if needed

### Advanced System Access
- `WAKE_LOCK` - Prevent device sleep during operations
- `BIND_DEVICE_ADMIN` - Device admin capabilities for AOD control

## How It Works

### Traditional Method (Requires Manual Setup)
```bash
# Users normally need to grant permission manually via ADB:
adb shell pm grant org.alberto97.aodtoggle android.permission.WRITE_SECURE_SETTINGS
```

### Vendor Overlay Method (Automatic)
1. App is installed as a privileged system app during ROM build
2. All permissions are automatically granted through `privapp-permissions` whitelist
3. Quick settings tile is immediately available without any setup
4. Users can add the AOD toggle tile to their quick settings panel

## Quick Settings Integration

### Adding the Tile
1. Pull down the notification panel
2. Fully expand quick settings
3. Tap the pencil/edit icon
4. Find "AOD Toggle" in available tiles
5. Drag it to your active tiles area

### Using the Tile
- **Single tap**: Toggle Always On Display on/off
- **Long press**: Open AOD system settings (if supported)
- **Visual feedback**: Tile shows current AOD state

## Compatibility Notes

### Tested Platforms
- ✅ **Google Pixel** devices (primary test platform)
- ✅ **AOSP** builds with AOD support
- ✅ **LineageOS** with AOD functionality
- ⚠️ **OEM ROMs**: May work but untested (Samsung, OnePlus, etc.)

### Android Version Support
- ✅ **Android 11+**: Full support
- ✅ **Android 12+**: Enhanced support
- ✅ **Android 13+**: Full scoped storage compliance
- ✅ **Android 14**: Explicit support added in v1.1.0

### Device Requirements
- Device must support Always On Display functionality
- AOD feature must be present in system settings
- Quick settings customization must be available

## OEM Compatibility Warnings

⚠️ **Important Compatibility Notes:**

Different manufacturers implement Always On Display in various ways:
- **Samsung**: Uses proprietary AOD implementation
- **OnePlus**: Custom AOD system
- **Xiaomi/MIUI**: Modified AOD behavior
- **Google Pixel**: Standard AOSP implementation (best compatibility)

**The app may not function on heavily customized OEM ROMs** where AOD is implemented through proprietary systems rather than standard Android settings.

## File Structure

```
android_vendor_custom/
├── SystemPrebuilts/
│   └── aodtoggle/
│       ├── org.alberto97.aodtoggle.apk                     # AOD Toggle APK
│       ├── privapp-permissions-org.alberto97.aodtoggle.xml # Permission grants
│       └── default-aodtoggle-intent.xml                   # System configuration
└── vendorInfo/
    └── aodtoggle.md                                       # This documentation
```

## Integration Benefits

### For ROM Builders
- **No user setup required**: App works immediately after ROM flash
- **System-level integration**: Proper privileged app permissions
- **No external dependencies**: No need for Shizuku or root
- **Clean installation**: Integrated with ROM build system

### For Users
- **Immediate functionality**: AOD toggle works right away
- **No ADB commands**: No technical setup required
- **Native integration**: Appears as standard system tile
- **Reliable permissions**: Never loses required permissions

## Security Considerations

### High-Privilege Access
The app receives the powerful `WRITE_SECURE_SETTINGS` permission which allows:
- Modification of secure system settings
- Control over Always On Display behavior
- Access to system-level configuration

### Permission Justification
- **WRITE_SECURE_SETTINGS**: Required for AOD control (core functionality)
- **STATUS_BAR**: Required for quick settings tile integration
- **WRITE_SETTINGS**: Required for reading current AOD state
- Other permissions support reliable operation and system integration

### Risk Assessment
- **Low risk**: App has specific, limited functionality
- **Trusted source**: Open-source app with clear purpose
- **Limited scope**: Only affects AOD settings, not broader system
- **User control**: Users control when to use the toggle

## Troubleshooting

### App Not Working
1. **Check AOD support**: Verify device supports Always On Display
2. **Check permissions**: Ensure privileged permissions are granted
3. **Restart SystemUI**: `adb shell killall com.android.systemui`
4. **Check tile**: Verify tile appears in quick settings edit menu

### OEM Compatibility Issues
1. **Custom AOD**: Device may use proprietary AOD implementation
2. **Settings path**: AOD settings may be in non-standard location
3. **Permission blocking**: OEM may block certain system permissions
4. **ROM support**: May need OEM-specific ROM modifications

### Quick Settings Issues
1. **Tile missing**: Check if quick settings editing is disabled
2. **Tile not responding**: Restart SystemUI or reboot device
3. **Permission lost**: Re-flash ROM or check permission grants

## Building Instructions

### APK Placement
Place the AOD Toggle APK in:
```
SystemPrebuilts/aodtoggle/org.alberto97.aodtoggle.apk
```

### Download Source
- **Original**: [Always On Display Toggle on GitHub](https://github.com/alberto97/aod-toggle)
- **Play Store**: Search for "Always On Display Toggle" by alberto97
- **F-Droid**: May be available through F-Droid repositories

### Build Integration
The app will automatically be included when building ROMs with:
```makefile
$(call inherit-product, vendor/custom/config.mk)
```

## Version History

### v1.1.0 Features
- Android 14 support added
- WRITE_SECURE_SETTINGS permission can be granted via Shizuku
- Improved compatibility and stability

### System Integration Benefits
- Pre-granted permissions eliminate Shizuku requirement
- System app status provides reliable operation
- Integration with ROM build system ensures consistency

---

**Note**: This app primarily targets Google Pixel devices and AOSP-based ROMs. Compatibility with heavily customized OEM ROMs (Samsung, OnePlus, etc.) is not guaranteed due to proprietary Always On Display implementations. Testing on target devices is recommended before including in production ROM builds. 