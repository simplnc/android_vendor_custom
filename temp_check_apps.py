import re

# Read config.mk and extract app names
with open('config.mk', 'r') as f:
    config_content = f.read()

# Extract app names from PRODUCT_PACKAGES sections
config_apps = []
lines = config_content.split('\n')
for i, line in enumerate(lines):
    if 'PRODUCT_PACKAGES +=' in line:
        # Look at the next few lines for app names
        j = i + 1
        while j < len(lines) and (lines[j].strip().endswith('\\') or lines[j].strip() == ''):
            app_line = lines[j].strip().rstrip('\\').strip()
            if app_line and not app_line.startswith('#'):
                config_apps.append(app_line)
            j += 1

# Read Android.bp and extract app names
with open('Android.bp', 'r') as f:
    bp_content = f.read()

# Extract app names from name: declarations
bp_apps = []
for line in bp_content.split('\n'):
    if 'name:' in line:
        match = re.search(r'name:\s*"([^"]+)"', line)
        if match:
            bp_apps.append(match.group(1))

print('Config.mk apps:', sorted(config_apps))
print('Android.bp apps:', sorted(bp_apps))
print('Missing from config.mk:', set(bp_apps) - set(config_apps))
print('Missing from Android.bp:', set(config_apps) - set(bp_apps))
print('Total config apps:', len(config_apps))
print('Total bp apps:', len(bp_apps))