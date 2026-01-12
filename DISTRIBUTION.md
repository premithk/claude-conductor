# Distribution Guide for Conductor Plugin

This guide explains how to distribute the Conductor plugin to users.

---

## Quick Start: 3 Distribution Options

### Option 1: GitHub Repository (Recommended ⭐)

**Best for:** Quick distribution, open source collaboration

**User installation:**
```bash
claude plugin install https://github.com/premithk/claude-conductor.git --scope user
```

**Steps to distribute:**

1. **Push to GitHub:**
   ```bash
   # If not already pushed
   git remote add origin https://github.com/premithk/claude-conductor.git
   git branch -M main
   git push -u origin main
   ```

2. **Create a release:**
   ```bash
   # Tag the version
   git tag v0.1.0
   git push origin v0.1.0
   ```

3. **Go to GitHub and create a release:**
   - Visit: https://github.com/premithk/claude-conductor/releases/new
   - Choose tag: v0.1.0
   - Title: `v0.1.0 - Validated & Improved`
   - Description (copy from README Changelog):
     ```markdown
     ## What's New

     - Updated to use correct tool names (AskUserQuestion)
     - Added .gitignore for cleaner repositories
     - Reorganized utility scripts
     - Enhanced plugin manifest with contributes section
     - Added CONTRIBUTING.md for developers
     - Added comprehensive validation report

     ## Installation

     ```bash
     claude plugin install https://github.com/premithk/claude-conductor.git --scope user
     ```
     ```

4. **Update README with release badge:**
   ```markdown
   [![Release](https://img.shields.io/github/v/release/premithk/claude-conductor)](https://github.com/premithk/claude-conductor/releases)
   ```

---

### Option 2: Claude Code Marketplace (Official 🏆)

**Best for:** Maximum visibility, discoverability

**User installation:**
```bash
claude plugin install conductor --scope user
```

**Steps to distribute:**

1. **Prepare marketplace listing:**
   - ✅ marketplace.json created
   - ✅ README.md is comprehensive
   - ✅ Plugin follows best practices
   - ✅ License specified (Apache-2.0)

2. **Submit to marketplace:**
   - Visit the official Claude Code marketplace
   - Check for submission guidelines at: https://code.claude.com/docs/plugins/marketplace
   - Submit your plugin with:
     - Plugin name: `conductor`
     - Repository URL: `https://github.com/premithk/claude-conductor`
     - Category: Development Workflow
     - Description: From marketplace.json

3. **Wait for approval:**
   - The Claude team will review your plugin
   - Once approved, it appears in the marketplace
   - Users can install with short name: `conductor`

---

### Option 3: npm Package (JavaScript Ecosystem 📦)

**Best for:** Discovery in JavaScript ecosystem, version management

**User installation:**
```bash
# Note: This is for discovery only
# Users still install with:
claude plugin install https://github.com/premithk/claude-conductor.git --scope user
```

**Steps to distribute:**

1. **Login to npm:**
   ```bash
   npm login
   ```

2. **Publish:**
   ```bash
   npm publish
   ```

3. **Users find your package:**
   - Visit: https://www.npmjs.com/package/claude-conductor
   - Discoverable via npm search

---

## Recommended Distribution Strategy

### For Maximum Reach (All Three) ✨

1. **Start with GitHub** (immediate availability)
2. **Submit to Marketplace** (official discovery)
3. **Publish to npm** (additional visibility)

### For Quick Release (GitHub Only) ⚡

1. Push to GitHub
2. Create a release
3. Share the URL

---

## Pre-Release Checklist

Before distributing, ensure:

- [x] Plugin has been tested locally
- [x] All commands work correctly
- [x] README.md is comprehensive
- [x] LICENSE file is included
- [x] Version number is updated
- [x] Changelog is updated
- [x] marketplace.json is created (for marketplace submission)
- [x] package.json is created (for npm publishing)
- [x] Git repository is initialized
- [x] .gitignore excludes unnecessary files

---

## Post-Distribution Tasks

### 1. **Announce the Release**

**Places to announce:**
- GitHub Discussions
- Twitter/X
- LinkedIn
- Reddit (r/Claude, r/programming)
- Hacker News
- Dev.to
- Your blog

**Announcement template:**
```markdown
🎉 Excited to announce Conductor v0.1.0 for Claude Code!

Conductor transforms Claude Code into a proactive project manager
following the protocol: Context → Spec & Plan → Implement.

Features:
✨ Context-driven development
✨ Spec & plan generation
✨ Team collaboration
✨ Git-aware revert

Install: claude plugin install https://github.com/premithk/claude-conductor.git

#ClaudeCode #AI #Development
```

### 2. **Monitor Feedback**

- Check GitHub Issues for bug reports
- Respond to questions in Discussions
- Gather feature requests
- Track usage metrics (if available)

### 3. **Maintain the Plugin**

- Fix bugs quickly
- Release new versions regularly
- Update documentation
- Engage with the community

---

## Version Management

### Semantic Versioning

Follow [Semantic Versioning](https://semver.org/):

- **MAJOR** (0.1.0 → 1.0.0): Breaking changes
- **MINOR** (0.1.0 → 0.2.0): New features, backwards compatible
- **PATCH** (0.1.0 → 0.1.1): Bug fixes, backwards compatible

### Release Process

1. **Make changes** on a branch:
   ```bash
   git checkout -b feature/new-feature
   ```

2. **Commit and push:**
   ```bash
   git add .
   git commit -m "feat: add new feature"
   git push origin feature/new-feature
   ```

3. **Create pull request** on GitHub

4. **Merge to main**

5. **Create release tag:**
   ```bash
   git checkout main
   git pull
   git tag v0.2.0
   git push origin v0.2.0
   ```

6. **Create GitHub release** with changelog

---

## Installation Instructions for Users

Add this section to your README.md:

### Installation

**Option 1: Install from GitHub (Recommended)**
```bash
claude plugin install https://github.com/premithk/claude-conductor.git --scope user
```

**Option 2: Install from Marketplace (when available)**
```bash
claude plugin install conductor --scope user
```

**Option 3: Install from local directory**
```bash
git clone https://github.com/premithk/claude-conductor.git
cd claude-conductor
claude plugin install . --scope user
```

**Verify installation:**
```bash
# Check if commands are available
claude --help | grep conductor

# Should show:
# /conductor:setup
# /conductor:newTrack
# /conductor:implement
# /conductor:status
# /conductor:revert
```

---

## Troubleshooting Distribution Issues

### Issue: Plugin not found after installation

**Solution:**
```bash
# Check installation location
ls -la ~/.claude/plugins/

# Verify plugin.json exists
cat ~/.claude/plugins/claude-conductor/.claude-plugin/plugin.json

# Restart Claude Code
```

### Issue: Commands not available

**Solution:**
```bash
# Verify command files exist
ls -la ~/.claude/plugins/claude-conductor/commands/

# Check command frontmatter
head -5 ~/.claude/plugins/claude-conductor/commands/*.md

# Reload Claude Code or restart terminal
```

### Issue: Marketplace submission rejected

**Common fixes:**
- Ensure plugin.json has all required fields
- Verify README.md is comprehensive
- Add LICENSE file
- Test plugin locally before submission
- Follow marketplace guidelines

---

## Resources

- [Claude Code Plugins Documentation](https://code.claude.com/docs/plugins)
- [Claude Code Marketplace](https://code.claude.com/marketplace)
- [Semantic Versioning](https://semver.org/)
- [GitHub Releases Documentation](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository)

---

## Need Help?

- **Issues:** https://github.com/premithk/claude-conductor/issues
- **Discussions:** https://github.com/premithk/claude-conductor/discussions
- **Email:** (your email)

---

*Last updated: 2025-01-14*
