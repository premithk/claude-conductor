# Contributing to Conductor

Thank you for your interest in contributing to Conductor! This guide will help you get started.

## Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/premithk/claude-conductor.git
   cd claude-conductor
   ```

2. **Install locally for testing**
   ```bash
   claude plugin install /path/to/claude-conductor --scope user
   ```

3. **Test changes**
   - Make changes to command files in `commands/`
   - Restart Claude Code or reload plugins
   - Test the modified commands

## Plugin Structure

```
claude-conductor/
├── .claude-plugin/
│   └── plugin.json          # Plugin manifest
├── commands/                 # Slash commands
│   ├── setup.md             # Initialize project
│   ├── newTrack.md          # Create new track
│   ├── implement.md         # Implement track
│   ├── status.md            # Show progress
│   └── revert.md            # Revert work
├── templates/                # Template files
│   ├── workflow.md          # Development workflow
│   └── code_styleguides/    # Style guide templates
└── scripts/                  # Utility scripts
```

## Code Standards

### Command Files

1. **YAML Frontmatter**: Every command must have proper frontmatter
   ```yaml
   ---
   description: Clear, concise description
   allowed-tools: Bash, Read, Write, Edit, Glob, Grep, AskUserQuestion
   argument-hint: "[optional] <required>"
   ---
   ```

2. **Tool Names**: Use correct tool names
   - ✅ `AskUserQuestion` (not `Ask`)
   - ✅ `TodoWrite` (not `TodoWrite`)

3. **Structure**: Follow the established pattern
   - SYSTEM DIRECTIVE section
   - SETUP CHECK section
   - Clear, numbered protocols
   - Error handling instructions

### Documentation

1. **Comments**: Use clear, concise comments in code
2. **README**: Keep README.md up to date with features
3. **Examples**: Provide usage examples in docs

## Testing

1. **Test Commands**:
   ```bash
   # Test setup
   /conductor:setup

   # Test new track
   /conductor:newTrack Add user authentication

   # Test status
   /conductor:status

   # Test implement
   /conductor:implement

   # Test revert
   /conductor:revert
   ```

2. **Edge Cases**:
   - Test with empty directories
   - Test with existing projects
   - Test with invalid inputs
   - Test git operations

## Pull Request Process

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make changes and commit**
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

4. **Push and create PR**
   ```bash
   git push origin feature/your-feature-name
   ```

5. **PR Description**:
   - Describe the change
   - Explain why it's needed
   - Include screenshots if applicable
   - Reference related issues

## Commit Message Convention

Follow [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc.)
- `refactor:` Code refactoring
- `test:` Adding or updating tests
- `chore:` Maintenance tasks

Examples:
```
feat: add support for custom workflows
fix: handle missing conductor directory gracefully
docs: update README with new features
```

## Questions?

Feel free to open an issue for questions or discussion.
