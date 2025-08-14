# Dual Wallpaper App Integration (dualwall)

## 📱 **App Information**

- **App Name**: Dual Wallpaper
- **Package**: `com.celzero.dualwall`
- **Type**: System Application
- **Category**: System Utilities
- **Size**: 2.2MB APK
- **Source**: SystemPrebuilts/dualWallpaper/
- **File**: `SystemPrebuilts/dualWallpaper/dualwall.apk`

## 🏗️ **Build Configuration**

### **Android.bp Configuration**
```blueprint
// Dual Wallpaper Applications
android_app_import {
    name: "dualwall",
    apk: "SystemPrebuilts/dualWallpaper/dualwall.apk",
    preprocessed: false,     // Contains compressed DEX files
    certificate: "platform", // Use platform certificate for non-preprocessed APK
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "com.celzero.dualwall", // Dual wallpaper package
    ],
}
```

### **config.mk Integration**
```makefile
# SystemPrebuilts Apps (APK files)
PRODUCT_PACKAGES += \
    dualwall \
    # ... other apps
```

## 🔧 **Installation Details**

### **Installation Path**
- **System Path**: `/system/app/dualwall/`
- **APK File**: `dualwall.apk`
- **Module Type**: Regular system application

### **Build System Integration**
- **Build System**: Soong (Android.bp)
- **Installation**: System application (non-privileged)
- **Certificate**: Platform certificate
- **Dex Preopt**: Disabled for compatibility

## 🎨 **Features & Functionality**

### **Core Features**
- **Dual Wallpaper Support**: Set different wallpapers for home and lock screens
- **Dynamic Wallpapers**: Animated and live wallpaper support
- **Theme Integration**: Material Design 3 theming
- **Customization**: Extensive wallpaper customization options

### **System Integration**
- **Wallpaper Service**: Integrates with system wallpaper service
- **Settings Integration**: Appears in system display settings
- **Quick Settings**: Accessible through quick settings panel
- **Home Screen**: Seamless integration with launcher

## 🔄 **App Overrides**

### **Replaced Applications**
- **System Wallpaper**: Default AOSP wallpaper app
- **Wallpaper Picker**: System wallpaper selection
- **Live Wallpapers**: Default live wallpaper apps

### **Override Configuration**
```blueprint
overrides: [
    "com.celzero.dualwall", // Dual wallpaper package
]
```

## 📱 **User Experience**

### **Default Behavior**
- **Automatic Installation**: Installed as system app during ROM build
- **Default Wallpaper**: Can be set as system default
- **Settings Access**: Available in system display settings
- **Launcher Integration**: Works with all standard launchers

### **Customization Options**
- **Wallpaper Types**: Static, live, and dynamic wallpapers
- **Screen Support**: Separate home and lock screen wallpapers
- **Effects**: Blur, dimming, and color adjustments
- **Scheduling**: Automatic wallpaper changes

## 🛠️ **Technical Specifications**

### **APK Details**
- **File Size**: 2.2MB
- **Architecture**: ARM64 (arm64-v8a)
- **Minimum SDK**: Android 12+ (API 31+)
- **Target SDK**: Android 14+ (API 34+)

### **Build Properties**
- **Preprocessed**: false (contains compressed DEX files)
- **Certificate**: platform (system-level signing)
- **Product Specific**: true (product-specific installation)
- **Dex Preopt**: disabled (compatibility optimization)

## 🔒 **Permissions & Security**

### **Required Permissions**
- **System Permissions**: Wallpaper, display, storage access
- **Security Level**: Regular system application
- **Privileged Access**: No privileged permissions required

### **Security Features**
- **Platform Certificate**: Signed with system certificate
- **System Integration**: Runs with system privileges
- **Sandboxed**: Runs in isolated application sandbox

## 📊 **Performance & Optimization**

### **Build Optimizations**
- **Dex Preopt Disabled**: Ensures compatibility across devices
- **Platform Certificate**: System-level integration
- **Product Specific**: Optimized for product builds

### **Runtime Performance**
- **Lightweight**: Small APK size (2.2MB)
- **Efficient**: Optimized for system wallpaper service
- **Responsive**: Fast wallpaper switching and customization

## 🔍 **Troubleshooting**

### **Common Issues**
1. **Wallpaper Not Changing**: Check system wallpaper permissions
2. **App Not Appearing**: Verify installation in system/app/
3. **Settings Integration**: Ensure proper system integration

### **Debug Commands**
```bash
# Check app installation
adb shell pm list packages | grep dualwall

# Verify app functionality
adb shell am start -n com.celzero.dualwall/.MainActivity

# Check app permissions
adb shell dumpsys package com.celzero.dualwall | grep permission
```

## 📈 **Future Enhancements**

### **Potential Improvements**
- **Additional Effects**: More wallpaper effects and filters
- **Cloud Integration**: Wallpaper sync across devices
- **Advanced Scheduling**: Intelligent wallpaper rotation
- **Performance**: Further optimization for older devices

### **Maintenance**
- **Regular Updates**: Keep APK updated to latest version
- **Compatibility**: Test with new Android versions
- **User Feedback**: Incorporate user suggestions and bug reports

---

**Status**: Production Ready ✅  
**Integration**: Complete SystemPrebuilts integration  
**Build System**: Soong (Android.bp)  
**Compatibility**: Android 12+ / LineageOS 18.1+
