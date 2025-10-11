# Daily You - Habit Tracker

## 📱 **Application Details**

### **Basic Information**
- **Package Name**: `com.demizo.daily_you`
- **APK Path**: `SystemPrebuilts/dailyyou/com.demizo.daily_you_20120012.apk`
- **File Size**: ~12MB
- **Version**: 20120012
- **Category**: Productivity & Habit Tracking

### **Replacement Targets**
- **DailyYou**: Daily habit tracker apps
- **HabitTracker**: Habit tracking applications
- **TaskManager**: Task management applications
- **com.android.dailyyou**: AOSP daily you package

### **Features**
- **Daily Habit Tracking**: Track daily habits and routines
- **Task Management**: Organize and manage daily tasks
- **Progress Visualization**: Visual progress tracking and statistics
- **Reminders**: Customizable reminders for habits and tasks
- **Data Export**: Export habit and task data
- **Privacy-Focused**: Local data storage with no external tracking

### **Build Configuration**
```blueprint
android_app_import {
    name: "com.demizo.daily_you",
    apk: "SystemPrebuilts/dailyyou/com.demizo.daily_you_20120012.apk",
    preprocessed: true,
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "DailyYou",
        "HabitTracker",
        "TaskManager",
        "com.android.dailyyou",
    ],
}
```

### **Default Configuration**
- **Property Override**: `ro.config.dailyyou_default=com.demizo.daily_you`
- **Package**: Added to `PRODUCT_PACKAGES` in config.mk
- **System Integration**: Full integration with Android task management

### **Privacy & Security**
- **Local Storage**: All data stored locally on device
- **No Tracking**: No analytics or user tracking
- **Data Encryption**: Sensitive data encrypted locally
- **Offline Functionality**: Works completely offline

### **Compatibility**
- **Android Version**: Android 12+ (API level 31+)
- **Architecture**: ARM64 (arm64-v8a)
- **LineageOS**: Compatible with LineageOS 18.1+
- **Permissions**: Minimal permissions required

### **User Experience**
- **Modern UI**: Clean, intuitive interface
- **Customization**: Extensive customization options
- **Accessibility**: Full accessibility support
- **Dark Mode**: System-wide dark mode integration
