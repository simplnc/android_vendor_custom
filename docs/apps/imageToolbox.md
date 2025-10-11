# Image Toolbox - Image Editing Tools

## 📱 **Application Details**

### **Basic Information**
- **Package Name**: `image.toolbox`
- **APK Path**: `SystemPrebuilts/imageToolbox/image-toolbox-3.4.0-alpha01-arm64-v8a.apk`
- **File Size**: ~14MB
- **Version**: 3.4.0-alpha01
- **Category**: Image Editing & Tools

### **Replacement Targets**
- **ImageToolbox**: Image toolbox applications
- **ImageEditor**: Image editor applications
- **PhotoEditor**: Photo editor applications
- **com.android.imagetoolbox**: AOSP image toolbox package

### **Features**
- **Advanced Image Editing**: Comprehensive image editing tools
- **Photo Enhancement**: Photo enhancement and correction
- **Filters & Effects**: Various filters and visual effects
- **Batch Processing**: Batch image processing capabilities
- **Format Support**: Support for multiple image formats
- **Local Processing**: All editing performed locally on device

### **Build Configuration**
```blueprint
android_app_import {
    name: "image.toolbox",
    apk: "SystemPrebuilts/imageToolbox/image-toolbox-3.4.0-alpha01-arm64-v8a.apk",
    preprocessed: false,
    certificate: "platform",
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "ImageToolbox",
        "ImageEditor",
        "PhotoEditor",
        "com.android.imagetoolbox",
    ],
}
```

### **Default Configuration**
- **Property Override**: `ro.config.imagetoolbox_default=image.toolbox`
- **Package**: Added to `PRODUCT_PACKAGES` in config.mk
- **System Integration**: Full integration with Android media framework

### **Privacy & Security**
- **Local Processing**: All image editing performed locally
- **No Data Collection**: No user data or image content tracking
- **Secure Storage**: Secure local image storage
- **Privacy Protection**: No external image transmission

### **Compatibility**
- **Android Version**: Android 12+ (API level 31+)
- **Architecture**: ARM64 (arm64-v8a)
- **LineageOS**: Compatible with LineageOS 18.1+
- **Permissions**: Storage and camera permissions

### **User Experience**
- **Professional Tools**: Professional-grade editing tools
- **Intuitive Interface**: Easy-to-use editing interface
- **Performance**: Hardware-accelerated image processing
- **Accessibility**: Full accessibility support
