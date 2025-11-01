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

# Essential Utility Applications (6 apps)
PRODUCT_PACKAGES += \
    org.fossify.gallery \
    org.fossify.filemanager \
    org.fossify.contacts \
    com.drnoob.datamonitor \
    io.github.yamin8000.owl \
    net.thunderbird.android

# Media and Tool Applications (6 apps)
PRODUCT_PACKAGES += \
    ambient.music \
    com.mardous.booming \
    recordyou \
    com.truemlgpro.wifiinfo \
    com.fibelatti.photowidget

# System Enhancement Applications (4 apps)
PRODUCT_PACKAGES += \
    TapTap \
    QuickTiles \
    firewall \
    com.kin.easynotes

# System Tool Applications (2 apps)
PRODUCT_PACKAGES += \
    athena \
    chrono

# New Applications (12 apps)
PRODUCT_PACKAGES += \
    com.demizo.daily_you \
    com.devrinth.launchpad \
    com.kaleedtc.privacium \
    com.shezik.drawanywhere \
    com.vishal2376.snaptick \
    image.toolbox \
    native.alpha \
    nethical.digipaws \
    nethical.locklock \
    org.thoughtcrime.securesms

# System Services and Sync Adapters (7 apps - BackupTransport commented out)
PRODUCT_PACKAGES += \
    TalkBack \
    AuroraStore \
    AuroraServices \
    AuroraDroid \
    FakeStore \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter
    
# Make custom apps the default system apps (minimal for boot fix)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.calculator_default=CalculatorYou \
    ro.config.calendar_default=calendar.foss \
    ro.config.filemanager_default=org.fossify.filemanager \
    ro.config.contacts_default=org.fossify.contacts \
    ro.config.recorder_default=recordyou \
    ro.config.notes_default=com.kin.easynotes 

# Launcher Configuration - Dual Launcher Setup
# TrebuchetQuickStep as main launcher + Launcher3QuickStep as fallback
PRODUCT_PACKAGES += \
    TrebuchetQuickStep \
    Launcher3QuickStep

# CRITICAL: Complete Navigation System Support
# Enable ALL navigation options (gesture, button, classic, legacy)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.quickstep_enabled=true \
    ro.config.gesture_navigation_enabled=true \
    ro.config.button_navigation_enabled=true \
    ro.config.classic_navigation_enabled=true \
    ro.config.legacy_navigation_enabled=true

# CRITICAL: Preserve Original App Hiding Configuration
# DO NOT override existing app hiding - let LineageOS handle it natively
# The original system was working, so we preserve it without interference

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

# CRITICAL: Launchers and Navigation System Components
# All launcher and navigation components consolidated to avoid duplicates
PRODUCT_PACKAGES += \
    Launcher3 \
    com.android.systemui.plugin.globalactions \
    com.android.systemui.plugin.globalactions.wallet \
    com.android.systemui.plugin.globalactions.smartspace \
    com.android.systemui.recents \
    com.android.systemui.plugins \
    com.android.systemui.plugin.volume \
    com.android.systemui.plugin.notification \
    com.android.systemui.plugin.statusbar \
    com.android.systemui.plugin.navigation \
    com.android.systemui.plugin.navigation.gestural \
    com.android.systemui.plugin.navigation.button \
    com.android.systemui.plugin.navigation.classic \
    com.android.systemui.plugin.navigation.legacy

# Navigation System Overlays - ALL Navigation Options
PRODUCT_PACKAGES += \
    com.android.systemui.navbar.gestural \
    com.android.systemui.navbar.gestural_narrow_back \
    com.android.systemui.navbar.gestural_extra_wide_back \
    com.android.systemui.navbar.gestural_no_pill \
    com.android.systemui.navbar.button \
    com.android.systemui.navbar.classic \
    com.android.systemui.navbar.legacy

# Navigation Configuration Properties - Enable ALL Options
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.navigation_bar_available=true \
    ro.config.gesture_navigation_available=true \
    ro.config.button_navigation_available=true \
    ro.config.classic_navigation_available=true \
    ro.config.legacy_navigation_available=true \
    ro.config.navigation_options_visible=true

# Emergency boot safety - prevent system crashes
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hw_quickpoweron=true \
    ro.config.hw_fastboot_enable=true \
    ro.config.hw_fastboot_anim=false \
    ro.config.hw_fastboot_anim_duration=0

# Boot Animation and Logo Disable - Complete Boot Speed Optimization
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.disable_boot_animation=true \
    ro.config.hw_showBootAnimation=false \
    ro.config.hw_showBootLogo=false \
    ro.config.hw_boot_animation_disable=true \
    ro.config.hw_boot_logo_disable=true \
    debug.sf.nobootanimation=1 \
    persist.sys.bootanimation=0 \
    ro.sf.bootanim=0 \
    ro.bootanim.disable=1 \
    debug.egl.hw=1 \
    ro.sf.hw=1

# Remove Boot Animation Package
PRODUCT_PACKAGES_REMOVE += \
    bootanimation.zip

# Additional Boot Speed Optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hw_quickpoweron=true \
    ro.config.hw_fastboot_enable=true \
    ro.config.hw_fastboot_anim=false \
    ro.config.hw_fastboot_anim_duration=0 \
    ro.config.hw_fastboot_timeout=0 \
    ro.config.hw_fastboot_delay=0 \
    ro.config.hw_quickboot=true \
    ro.config.hw_quickboot_enable=true

# Duress PIN Configuration - Pre-enabled security feature
PRODUCT_PROPERTY_OVERRIDES += \
    ro.security.default_duress_pin=9119 \
    ro.security.duress_pin_enabled=1 \
    ro.security.duress_pin_logging=1 \
    ro.security.duress_wipe_delay=5000

# Security and Privacy Enhancements
PRODUCT_PROPERTY_OVERRIDES += \
    ro.security.wifi_privacy=1 \
    ro.security.sensor_privacy=1 \
    ro.security.network_privacy=1 \
    ro.security.anti_forensic=1 \
    ro.security.memory_protection=1

# System properties for runtime access
PRODUCT_SYSTEM_PROPERTIES += \
    ro.security.default_duress_pin=9119 \
    ro.security.duress_pin_enabled=1 \
    ro.security.duress_pin_logging=1 \
    ro.security.duress_wipe_delay=5000 \
    ro.security.wifi_privacy=1 \
    ro.security.sensor_privacy=1 \
    ro.security.network_privacy=1 \
    ro.security.anti_forensic=1 \
    ro.security.memory_protection=1

# Performance Optimization Defaults
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.memory_optimization=1 \
    ro.config.cpu_performance_profile=balanced \
    ro.config.intelligent_gc=1

# End of configuration


PRODUCT_PROPERTY_OVERRIDES += \
    kernel.randomize_va_space=2 \
    kernel.kptr_restrict=2 \
    kernel.perf_event_paranoid=3 \
    kernel.yama.ptrace_scope=1 \
    kernel.exec-shield=1

# System properties for kernel hardening
PRODUCT_SYSTEM_PROPERTIES += \
    kernel.randomize_va_space=2 \
    kernel.kptr_restrict=2 \
    kernel.perf_event_paranoid=3 \
    kernel.yama.ptrace_scope=1 \
    kernel.exec-shield=1
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.verifiedbootstate=orange \
    ro.boot.flash.locked=0 \
    ro.boot.veritymode=enforcing \
    ro.debuggable=1 \
    ro.secure=1 \
    ro.adb.secure=1
PRODUCT_PROPERTY_OVERRIDES += \
    net.ipv6.conf.all.use_tempaddr=2 \
    net.ipv6.conf.default.use_tempaddr=2 \
    net.ipv6.privacy_extensions=2

# System properties for IPv6 privacy
PRODUCT_SYSTEM_PROPERTIES += \
    net.ipv6.conf.all.use_tempaddr=2 \
    net.ipv6.conf.default.use_tempaddr=2 \
    net.ipv6.privacy_extensions=2

# =============================================================================
# PERFORMANCE, MEMORY, AND SECURITY OPTIMIZATIONS
# Based on CalyxOS, DivestOS, and GrapheneOS implementations
# =============================================================================

# Include optimization configurations
# These files contain all compiler optimizations, security enhancements, and performance tuning
 $(call inherit-product, vendor/custom/config/build_optimizations.mk)
 $(call inherit-product, vendor/custom/config/framework_optimizations.mk)
 $(call inherit-product, vendor/custom/config/performance_security_optimizations.mk)

# Include kernel hardening configuration
# This applies runtime kernel parameters for security (patches optional)
# -include vendor/custom/patches/kernel_hardening_patches.mk

# =============================================================================
# PRIVILEGED APP PERMISSIONS (XML Files)
# Copy XML permission files for privileged apps
# =============================================================================

# Aurora Services Permissions
PRODUCT_COPY_FILES += \
    vendor/custom/SystemPrebuilts/Aurora/permissions_com.aurora.services.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.aurora.services.xml

# Backup Transport Permissions - Commented out for now
# PRODUCT_COPY_FILES += \
#     vendor/custom/SystemPrebuilts/BackupTransport/privapp-permissions-backuptransport.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.google.android.backuptransport.xml \
#     vendor/custom/SystemPrebuilts/BackupTransport/privapp-permissions-gsync.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-gsync.xml
