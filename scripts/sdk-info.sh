#!/bin/bash

# sdk-info.sh
# setup-swift-wasm-sdk • https://github.com/orchetect/setup-swift-wasm-sdk
# © 2026 Steffan Andrews • Licensed under MIT Licens

# Inputs used:
# - SWIFT_VERSION    Swift short version (ie: "6.3")

# Step outputs produced:
# - sdk-id           SDK ID
# - sdk-url          SDK URL
# - sdk-checksum     SDK checksum

# Validate Swift version
if [ -z $SWIFT_VERSION ]; then echo "⛔️ Error: Swift version is empty."; exit 1; fi

# Output diagnostic info.
echo "Using Swift version $SWIFT_VERSION"

# Determine parameters for the given Swift version.
# These values are hard-coded here, as there is no viable way to retrieve historical data from Swift's server at this time. 
# Hopefully it's possible in future.
case $SWIFT_VERSION in
  6.3)
    SDK_ID="swift-6.3-RELEASE_wasm"
    SDK_URL="https://download.swift.org/swift-6.3-release/wasm-sdk/swift-6.3-RELEASE/swift-6.3-RELEASE_wasm.artifactbundle.tar.gz"
    SDK_CHECKSUM="9fa4016ee632c7e9e906608ec3b55cf13dfc4dff44e47574c5af58064dc33fd9" ;;
  6.3.1)
    SDK_ID="swift-6.3.1-RELEASE_wasm"
    SDK_URL="https://download.swift.org/swift-6.3.1-release/wasm-sdk/swift-6.3.1-RELEASE/swift-6.3.1-RELEASE_wasm.artifactbundle.tar.gz"
    SDK_CHECKSUM="bd47baa20771f366d8beed7970afaa30742b2210097afd15f85427226d8f4cf2" ;;
  6.3.2)
    SDK_ID="swift-6.3.2-RELEASE_wasm"
    SDK_URL="https://download.swift.org/swift-6.3.2-release/wasm-sdk/swift-6.3.2-RELEASE/swift-6.3.2-RELEASE_wasm.artifactbundle.tar.gz"
    SDK_CHECKSUM="a61f0584c93283589f8b2f42db05c1f9a182b506c2957271402992655591dd7c" ;;
  6.3.3)
    SDK_ID="swift-6.3.3-RELEASE_wasm"
    SDK_URL="https://download.swift.org/swift-6.3.3-release/wasm-sdk/swift-6.3.3-RELEASE/swift-6.3.3-RELEASE_wasm.artifactbundle.tar.gz"
    SDK_CHECKSUM="cabfa08b73bb8ac783927ecd15fa386e99d0c139c5f232445067bcf58379cae7" ;;
  *)
    echo "⛔️ Error: Unhandled Swift version: $SWIFT_VERSION. Please update script with URL and checksum for this version."; exit 1 ;;
esac

# Output diagnostic info.
echo "SDK ID: $SDK_ID"
echo "SDK URL: $SDK_URL"
echo "SDK checksum: $SDK_CHECKSUM"

# Set output variables.
echo "id=$(echo $SDK_ID)" >> $GITHUB_OUTPUT
echo "url=$(echo $SDK_URL)" >> $GITHUB_OUTPUT
echo "checksum=$(echo $SDK_CHECKSUM)" >> $GITHUB_OUTPUT
