#!/bin/bash
# Release script for Conductor plugin
# This script helps you release a new version

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🎼 Conductor Plugin Release Script"
echo "=================================="
echo ""

# Check if we're in the plugin directory
if [ ! -f ".claude-plugin/plugin.json" ]; then
    echo -e "${RED}Error: Not in the Conductor plugin directory${NC}"
    exit 1
fi

# Get current version
VERSION=$(jq -r '.version' .claude-plugin/plugin.json)
echo -e "${GREEN}Current version: $VERSION${NC}"
echo ""

# Ask for version bump
echo "Select version bump type:"
echo "1) patch ($VERSION → $(echo $VERSION | awk -F. '{$3++; print $1"."$2"."$3}'))"
echo "2) minor ($VERSION → $(echo $VERSION | awk -F. '{$2++; $3=0; print $1"."$2"."$3}'))"
echo "3) major ($VERSION → $(echo $VERSION | awk -F. '{$1++; $2=0; $3=0; print $1"."$2"."$3}'))"
echo "4) Keep current version"
read -p "Enter choice [1-4]: " choice

case $choice in
    1)
        NEW_VERSION=$(echo $VERSION | awk -F. '{$3++; print $1"."$2"."$3}')
        TYPE="patch"
        ;;
    2)
        NEW_VERSION=$(echo $VERSION | awk -F. '{$2++; $3=0; print $1"."$2"."$3}')
        TYPE="minor"
        ;;
    3)
        NEW_VERSION=$(echo $VERSION | awk -F. '{$1++; $2=0; $3=0; print $1"."$2"."$3}')
        TYPE="major"
        ;;
    4)
        NEW_VERSION=$VERSION
        TYPE="none"
        ;;
    *)
        echo -e "${RED}Invalid choice${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${YELLOW}New version: $NEW_VERSION${NC}"

# Update version in files
if [ "$TYPE" != "none" ]; then
    read -p "Update version numbers? [y/N] " update
    if [ "$update" = "y" ] || [ "$update" = "Y" ]; then
        # Update plugin.json
        jq --arg v "$NEW_VERSION" '.version = $v' .claude-plugin/plugin.json > .claude-plugin/plugin.json.tmp
        mv .claude-plugin/plugin.json.tmp .claude-plugin/plugin.json

        # Update package.json if it exists
        if [ -f "package.json" ]; then
            jq --arg v "$NEW_VERSION" '.version = $v' package.json > package.json.tmp
            mv package.json.tmp package.json
        fi

        # Update marketplace.json if it exists
        if [ -f "marketplace.json" ]; then
            jq --arg v "$NEW_VERSION" '.version = $v' marketplace.json > marketplace.json.tmp
            mv marketplace.json.tmp marketplace.json
        fi

        echo -e "${GREEN}Version numbers updated${NC}"
    fi
fi

# Commit changes
echo ""
read -p "Commit changes? [y/N] " commit
if [ "$commit" = "y" ] || [ "$commit" = "Y" ]; then
    git add .
    git commit -m "chore: release v$NEW_VERSION"
    echo -e "${GREEN}Changes committed${NC}"
fi

# Create tag
if [ "$TYPE" != "none" ]; then
    read -p "Create git tag v$NEW_VERSION? [y/N] " tag
    if [ "$tag" = "y" ] || [ "$tag" = "Y" ]; then
        git tag -a "v$NEW_VERSION" -m "Release v$NEW_VERSION"
        echo -e "${GREEN}Tag created${NC}"
    fi
fi

# Push to remote
echo ""
read -p "Push to remote? [y/N] " push
if [ "$push" = "y" ] || [ "$push" = "Y" ]; then
    read -p "Remote name [origin]: " remote
    remote=${remote:-origin}

    read -p "Branch name [main]: " branch
    branch=${branch:-main}

    git push "$remote" "$branch"

    if [ "$TYPE" != "none" ] && [ "$tag" = "y" ] || [ "$tag" = "Y" ]; then
        git push "$remote" "v$NEW_VERSION"
    fi

    echo -e "${GREEN}Pushed to $remote/$branch${NC}"
fi

echo ""
echo -e "${GREEN}Release preparation complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Create a GitHub release: https://github.com/premithk/claude-conductor/releases/new"
echo "2. Select tag: v$NEW_VERSION"
echo "3. Copy changelog from README.md"
echo "4. Submit to Claude Code marketplace (if desired)"
