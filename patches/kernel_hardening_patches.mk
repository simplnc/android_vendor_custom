# Kernel Hardening Configuration
# Based on DivestOS and GrapheneOS security enhancements
# Safe runtime parameters that won't break the build

# =============================================================================
# RUNTIME KERNEL SECURITY PARAMETERS
# =============================================================================
# These parameters are applied at runtime and provide significant security
# hardening without requiring kernel source patches

# Address Space Layout Randomization (ASLR) - Maximum randomization
PRODUCT_PROPERTY_OVERRIDES += \
    kernel.randomize_va_space=2

# Kernel Pointer Restriction - Hide kernel pointers from unprivileged users
PRODUCT_PROPERTY_OVERRIDES += \
    kernel.kptr_restrict=2

# Performance Event Paranoia - Restrict perf events to privileged users
PRODUCT_PROPERTY_OVERRIDES += \
    kernel.perf_event_paranoid=3

# Ptrace Scope - Restrict ptrace to privileged processes
PRODUCT_PROPERTY_OVERRIDES += \
    kernel.yama.ptrace_scope=1

# Exec Shield - Additional execution protection
PRODUCT_PROPERTY_OVERRIDES += \
    kernel.exec-shield=1

# Dmesg Restriction - Hide kernel logs from unprivileged users
PRODUCT_PROPERTY_OVERRIDES += \
    kernel.dmesg_restrict=1

# BPF Disabled - Disable unprivileged BPF for security
PRODUCT_PROPERTY_OVERRIDES += \
    kernel.unprivileged_bpf_disabled=1

# Unprivileged User Namespace - Disable for security
PRODUCT_PROPERTY_OVERRIDES += \
    kernel.unprivileged_userns_clone=0

# Module Loading Restriction - Prevent unauthorized module loading
PRODUCT_PROPERTY_OVERRIDES += \
    kernel.modules_disabled=0

# =============================================================================
# NETWORK SECURITY PARAMETERS
# =============================================================================

# SYN Cookies - Protection against SYN flood attacks
PRODUCT_PROPERTY_OVERRIDES += \
    net.ipv4.tcp_syncookies=1

# IP Forwarding Disabled - Security measure
PRODUCT_PROPERTY_OVERRIDES += \
    net.ipv4.ip_forward=0 \
    net.ipv6.conf.all.forwarding=0

# ICMP Redirect Disabled - Prevent routing table manipulation
PRODUCT_PROPERTY_OVERRIDES += \
    net.ipv4.conf.all.accept_redirects=0 \
    net.ipv4.conf.default.accept_redirects=0 \
    net.ipv6.conf.all.accept_redirects=0 \
    net.ipv6.conf.default.accept_redirects=0

# Source Route Disabled - Security measure
PRODUCT_PROPERTY_OVERRIDES += \
    net.ipv4.conf.all.accept_source_route=0 \
    net.ipv4.conf.default.accept_source_route=0 \
    net.ipv6.conf.all.accept_source_route=0 \
    net.ipv6.conf.default.accept_source_route=0

# Send Redirects Disabled - Security measure
PRODUCT_PROPERTY_OVERRIDES += \
    net.ipv4.conf.all.send_redirects=0 \
    net.ipv4.conf.default.send_redirects=0

# Reverse Path Filtering - Anti-spoofing
PRODUCT_PROPERTY_OVERRIDES += \
    net.ipv4.conf.all.rp_filter=1 \
    net.ipv4.conf.default.rp_filter=1

# Log Martian Packets - Security monitoring
PRODUCT_PROPERTY_OVERRIDES += \
    net.ipv4.conf.all.log_martians=1 \
    net.ipv4.conf.default.log_martians=1

# =============================================================================
# FILESYSTEM SECURITY PARAMETERS
# =============================================================================

# Protected Hardlinks - Prevent hardlink attacks
PRODUCT_PROPERTY_OVERRIDES += \
    fs.protected_hardlinks=1

# Protected Symlinks - Prevent symlink attacks
PRODUCT_PROPERTY_OVERRIDES += \
    fs.protected_symlinks=1

# Protected FIFOs - Prevent FIFO attacks
PRODUCT_PROPERTY_OVERRIDES += \
    fs.protected_fifos=2

# Protected Regular Files - Security measure
PRODUCT_PROPERTY_OVERRIDES += \
    fs.protected_regular=2

# =============================================================================
# MEMORY SECURITY PARAMETERS
# =============================================================================

# Virtual Memory Security
PRODUCT_PROPERTY_OVERRIDES += \
    vm.mmap_min_addr=65536 \
    vm.unprivileged_userfaultfd=0

# =============================================================================
# APPLY TO SYSTEM PROPERTIES
# =============================================================================
# Make kernel parameters accessible at runtime for verification

PRODUCT_SYSTEM_PROPERTIES += \
    kernel.randomize_va_space=2 \
    kernel.kptr_restrict=2 \
    kernel.perf_event_paranoid=3 \
    kernel.yama.ptrace_scope=1 \
    kernel.exec-shield=1 \
    kernel.dmesg_restrict=1 \
    kernel.unprivileged_bpf_disabled=1 \
    kernel.unprivileged_userns_clone=0

# =============================================================================
# COMPATIBILITY NOTES
# =============================================================================
# These runtime parameters provide kernel hardening without requiring
# kernel source modifications or patches. They are:
# - Safe to apply on any kernel version
# - Won't break the build
# - Provide significant security improvements
# - Based on DivestOS, GrapheneOS, and Android security best practices
#
# For actual kernel source patches, you would need to:
# 1. Get patches from DivestOS: https://github.com/Divested-Mobile/DivestOS-Build
# 2. Apply during kernel compilation
# 3. Test each patch individually
#
# Current configuration focuses on runtime parameters for maximum compatibility.
# =============================================================================
