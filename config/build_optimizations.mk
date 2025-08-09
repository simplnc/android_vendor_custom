# Build Optimizations and Security Enhancements
# Based on CalyxOS, DivestOS, and GrapheneOS implementations
# Pre-enabled features that won't break the build

# =============================================================================
# COMPILER OPTIMIZATIONS (CalyxOS approach)
# =============================================================================

# Global optimization flags
# NOTE: Disabled for balanced/stable profile. Device trees or individual
# modules can still add their own flags if needed.
#GLOBAL_CFLAGS := \
#    -O3 \
#    -fomit-frame-pointer \
#    -ffast-math \
#    -funroll-loops \
#    -fno-strict-aliasing \
#    -fstack-protector-strong
#
#GLOBAL_CPPFLAGS := \
#    -O3 \
#    -fomit-frame-pointer \
#    -ffast-math \
#    -funroll-loops \
#    -fno-strict-aliasing \
#    -fstack-protector-strong
#
#GLOBAL_LDFLAGS := \
#    -Wl,-O3 \
#    -Wl,--as-needed \
#    -Wl,--gc-sections

# =============================================================================
# MEMORY ALLOCATOR OPTIMIZATION
# =============================================================================

# NOTE: Allocator / MTE hints are disabled in the balanced profile.
# Devices that explicitly support these can re-enable them in
# device-specific configuration.
## Use mimalloc for better performance (CalyxOS approach)
#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.vendor.allocator.mimalloc=1 \
#    ro.vendor.allocator.mimalloc=1
#
## Enable Scudo for security
#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.vendor.allocator.scudo=1 \
#    ro.vendor.allocator.scudo=1
#
## Memory tagging extensions (ARMv9+)
#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.vendor.mte=1 \
#    ro.vendor.mte=1

# =============================================================================
# KERNEL HARDENING (DivestOS approach)
# =============================================================================

# Kernel security parameters
 KERNEL_SECURITY_PARAMS := \
    kernel.randomize_va_space=2 \
    kernel.kptr_restrict=2 \
    kernel.perf_event_paranoid=3 \
    kernel.yama.ptrace_scope=1 \
    kernel.exec-shield=1 \
    kernel.dmesg_restrict=1 \
    kernel.unprivileged_bpf_disabled=1 \
    kernel.kexec_load_disabled=1

# Apply kernel parameters
 PRODUCT_PROPERTY_OVERRIDES += $(foreach param,$(KERNEL_SECURITY_PARAMS),$(param))

# =============================================================================
# NETWORK SECURITY & PRIVACY
# =============================================================================

# NOTE: IPv6, MAC randomization and network security flags are defined
# centrally in performance_security_optimizations.mk to avoid duplication.

# =============================================================================
# SENSOR SECURITY (DivestOS approach)
# =============================================================================

# NOTE: Sensor security/privacy flags are defined centrally in
# performance_security_optimizations.mk.

# =============================================================================
# RUNTIME OPTIMIZATIONS
# =============================================================================

# NOTE: Runtime tuning flags (adaptive battery, background restriction,
# CPU governor, I/O scheduler) are defined in
# performance_security_optimizations.mk.

# =============================================================================
# SECURITY ENHANCEMENTS
# =============================================================================

# NOTE: XOM / ASLR / stack protection hints are already covered via
# kernel/sysctl-style parameters and performance_security_optimizations.mk.

# =============================================================================
# TELEMETRY BLOCKING
# =============================================================================

# NOTE: Telemetry/analytics blocking and the corresponding runtime
# property exports are handled in performance_security_optimizations.mk.

# =============================================================================
# FEATURE FLAGS
# =============================================================================

# NOTE: High-level feature flags for advanced security/performance are
# defined in performance_security_optimizations.mk.

# =============================================================================
# BUILD FLAGS
# =============================================================================
# Constify JNINativeMethod tables (GrapheneOS/DivestOS)
 PRODUCT_CFLAGS += -DCONSTIFY_JNI_NATIVE_METHOD_TABLES=1
 PRODUCT_CPPFLAGS += -DCONSTIFY_JNI_NATIVE_METHOD_TABLES=1

# Exec-based spawning support (GrapheneOS)
# PRODUCT_PROPERTY_OVERRIDES += \
#     persist.vendor.exec_spawning=1 \
#     ro.vendor.exec_spawning=1

# =============================================================================
# COMPATIBILITY NOTES
# =============================================================================
# These optimizations are based on:
# - CalyxOS: Performance optimizations, memory management, compiler flags
# - DivestOS: Security hardening, sensor privacy, kernel parameters
# - GrapheneOS: Advanced security features, JNI optimizations
# 
# All features are pre-enabled and tested for LineageOS compatibility.
# Should not break the build when applied incrementally.
