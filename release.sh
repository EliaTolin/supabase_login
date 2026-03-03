#!/bin/bash
set -euo pipefail

# Usage: ./release.sh [major|minor|patch]
# Default: patch

SCRIPT="supawho"
BUMP="${1:-patch}"

# Read current version
CURRENT=$(grep '^VERSION=' "$SCRIPT" | cut -d '"' -f 2)
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT"

case "$BUMP" in
  major) MAJOR=$((MAJOR + 1)); MINOR=0; PATCH=0 ;;
  minor) MINOR=$((MINOR + 1)); PATCH=0 ;;
  patch) PATCH=$((PATCH + 1)) ;;
  *)
    echo "Usage: ./release.sh [major|minor|patch]"
    exit 1
    ;;
esac

NEW="${MAJOR}.${MINOR}.${PATCH}"

echo ""
echo "  📦 Releasing supawho"
echo "     ${CURRENT} → ${NEW} (${BUMP})"
echo ""

# Update version in script
sed -i '' "s/VERSION=\"${CURRENT}\"/VERSION=\"${NEW}\"/" "$SCRIPT"

# Commit, tag, push
git add "$SCRIPT"
git commit -m "Bump version to ${NEW}"
git tag "v${NEW}"
git push
git push origin "v${NEW}"

echo ""
echo "  ✅ v${NEW} released!"
echo "     GitHub Action will update the Homebrew formula automatically."
echo ""
