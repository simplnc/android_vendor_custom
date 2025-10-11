# Calendar App Integration (calendar.foss)

## Overview
**App Name**: calendar.foss  
**Package**: calendar.foss  
**Type**: Regular System App (SystemPrebuilts)  
**Replaces**: AOSP Calendar, Calendar2, Etar, LineageCalendar

## APK Details
- **File**: `SystemPrebuilts/calendar/calendar-9-foss-release.apk`
- **Size**: 8.0MB
- **Version**: 9-foss-release
- **Architecture**: Universal (arm64, arm, x86)

## Build Configuration
```bp
android_app_import {
    name: "calendar.foss",
    apk: "SystemPrebuilts/calendar/calendar-9-foss-release.apk",
    preprocessed: true,
    dex_preopt: { enabled: false, },
    product_specific: true,
    overrides: [
        "Calendar",          // AOSP default calendar
        "Calendar2",         // Alternative AOSP calendar
        "DeskClock",         // DeskClock with calendar
        "LineageCalendar",   // LineageOS calendar
        "OmniCalendar",      // OmniROM calendar
        "Etar",              // Etar calendar
        "com.android.calendar", // AOSP calendar package
        "com.android.calendar2", // AOSP calendar package
    ],
}
```

## App Overrides
This app will replace the following default system calendars:
- **AOSP Calendar**: Default Android calendar
- **Calendar2**: Alternative AOSP calendar
- **Etar**: Etar calendar app
- **LineageCalendar**: LineageOS calendar
- **OmniCalendar**: OmniROM calendar
- **DeskClock**: Clock app with calendar functionality

## Installation Location
- **Path**: `/product/app/calendar.foss/`
- **Type**: Regular system app (non-privileged)
- **Permissions**: Standard calendar permissions

## Default App Configuration
```makefile
# Set as default calendar
ro.config.calendar_default=calendar.foss
```

## Removed Apps
The following conflicting apps are removed from the build:
```makefile
PRODUCT_PACKAGES_REMOVE += \
    Calendar \
    Calendar2 \
    Etar \
    com.android.calendar \
    com.android.calendar2
```

## Features
- Full calendar functionality
- Event management
- Multiple calendar support
- Reminder system
- Widget support
- Sync capabilities
- Modern material design UI

## Dependencies
- No special dependencies required
- Uses standard Android calendar provider
- Compatible with all Android versions 11+

## Troubleshooting
- **App not appearing**: Check if included in PRODUCT_PACKAGES
- **Not default calendar**: Verify ro.config.calendar_default setting
- **Build errors**: Ensure APK file exists in correct location

## Maintenance
- **Updates**: Replace APK file and update version number
- **Configuration**: Modify overrides list as needed
- **Testing**: Verify calendar functionality after updates
