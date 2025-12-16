# Cursor/GitHub Copilot Rules

This directory contains configuration rules for Cursor and GitHub Copilot to maintain code quality and consistency across the project.

## Rules Overview

### General Rules
- Maximum line length: 100 characters
- Use spaces for indentation (2 spaces)
- Required comments for functions, classes, and complex logic

### Naming Conventions
- Variables: camelCase
- Constants: UPPER_SNAKE_CASE
- Functions: camelCase with appropriate verbs
- Classes: PascalCase
- Files: PascalCase for components, camelCase for utilities

### Documentation
- Required README files
- API documentation
- Component documentation
- Markdown format
- Templates available in `docs/templates/`

### Testing Requirements
- Unit tests
- Integration tests
- End-to-end tests
- Minimum 80% code coverage

### Security Guidelines
- No hardcoded secrets
- No console.logs in production
- No eval() usage
- No innerHTML usage

### Performance Standards
- Maximum bundle size: 250KB
- Maximum dependencies: 50
- Lazy loading required where appropriate

### Accessibility Requirements
- Alt text for images
- ARIA labels
- Keyboard navigation support

### Git Workflow
- Conventional commit messages
- Branch naming conventions:
  - Feature branches: `feature/*`
  - Bug fixes: `bugfix/*`
  - Hotfixes: `hotfix/*`

## Usage

These rules are automatically enforced by Cursor and GitHub Copilot. They will provide suggestions and warnings based on these configurations.

### Customization

To modify these rules:
1. Edit the `rules.json` file
2. Commit the changes
3. Share the updates with the team

### Best Practices

1. Always review Copilot suggestions against these rules
2. Use the provided templates for documentation
3. Run tests before committing changes
4. Follow the naming conventions consistently
5. Document any exceptions to these rules with clear justification

## Support

If you need to make exceptions to these rules or have questions about their implementation, please:
1. Document the exception in your code
2. Discuss with the team
3. Update these rules if the exception becomes a new standard 