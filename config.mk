# Custom LineageOS Configuration
# This configuration replaces default system apps with custom alternatives

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    vendor/custom

# Core System Applications (3 apps)
PRODUCT_PACKAGES += \
    duckduck \
    CalculatorYou \
    calendar.foss

# Essential Utility Applications (5 apps)
PRODUCT_PACKAGES += \
    org.fossify.gallery \
    org.fossify.filemanager \
    com.bnyro.contacts \
    com.drnoob.datamonitor \
    io.github.yamin8000.owl

# Media and Tool Applications (5 apps)
PRODUCT_PACKAGES += \
    com.bitmavrick.lumolight \
    com.mardous.booming \
    recordyou \
    org.breezyweather \
    com.truemlgpro.wifiinfo

# System Enhancement Applications (5 apps)
PRODUCT_PACKAGES += \
    TapTap \
    QuickTiles 

# System Tool Applications (2 apps)
PRODUCT_PACKAGES += \
    athena \
    chrono

# Make custom apps the default system apps
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.browser_default=duckduck \
    ro.config.calculator_default=CalculatorYou \
    ro.config.calendar_default=calendar.foss \
    ro.config.gallery_default=org.fossify.gallery \
    ro.config.filemanager_default=org.fossify.filemanager \
    ro.config.contacts_default=com.bnyro.contacts \
    ro.config.flashlight_default=com.bitmavrick.lumolight \
    ro.config.music_default=com.mardous.booming \
    ro.config.recorder_default=recordyou \
    ro.config.weather_default=org.breezyweather \
    ro.config.wifiinfo_default=com.truemlgpro.wifiinfo 


# Build system optimizations
RELAX_USES_LIBRARY_CHECK=true

# Dex preopt settings
DEX_PREOPT_DEFAULT := false
DEX_PREOPT_APP := false
DEX_PREOPT_BOOT_IMG := false
PRODUCT_DEX_PREOPT_APP := false
PRODUCT_DEX_PREOPT_BOOT_IMG := false
PRODUCT_DEX_PREOPT_DEFAULT := false
PRODUCT_DEX_PREOPT_WIFI := false

# WiFi system server configuration
PRODUCT_SYSTEM_SERVER_JARS += service-wifi
PRODUCT_PACKAGES += \
    com.android.wifi \
    service-wifi

# WiFi artifact path requirements
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/framework/oat/arm64/apex@com.android.wifi@javalib@service-wifi.jar@classes.odex \
    system/framework/oat/arm64/apex@com.android.wifi@javalib@service-wifi.jar@classes.vdex

# Critical telephony services - ESSENTIAL for SIM card functionality
PRODUCT_PACKAGES += \
    com.android.phone \
    com.android.dialer \
    TeleService \
    TelephonyProvider \
    CallLogProvider \
    com.android.telephony \
    com.android.telephony.overlay \
    com.android.telephony.overlay.common \
    com.android.telephony.overlay.lineage \
    com.android.telephony.overlay.lineage.common

# Preserve ALL critical system components
PRODUCT_PACKAGES += \
    com.android.settings \
    com.android.systemui \
    com.android.launcher3 \
    com.android.launcher3.quickstep \
    com.android.webview \
    com.android.webview.google \
    com.google.android.webview \
    com.android.packageinstaller \
    com.android.packageinstaller.permissioncontroller \
    com.android.permissioncontroller \
    com.android.providers.settings \
    com.android.providers.media \
    com.android.providers.downloads \
    com.android.providers.telephony \
    com.android.providers.contacts \
    com.android.providers.calendar \
    com.android.providers.media.module \
    com.android.providers.media.module.apex

# Set default launcher
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.launcher_default=com.android.launcher3.quickstep \
    ro.config.default_launcher=com.android.launcher3.quickstep

# Emergency boot safety - prevent system crashes
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hw_quickpoweron=true \
    ro.config.hw_fastboot_enable=true \
    ro.config.hw_fastboot_anim=false \
    ro.config.hw_fastboot_anim_duration=0

# End of configuration


