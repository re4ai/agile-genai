# Contributing to Agile GenAI

Thank you for your interest in contributing! This project is designed to be simple and accessible.

## How to Contribute

### Reporting Bugs

1. Check existing [issues](https://github.com/yourusername/agile-genai/issues) first
2. Create a new issue using the Bug Report template
3. Include:
   - Browser and version
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots if applicable

### Suggesting Features

1. Check existing issues for similar requests
2. Create a new issue using the Feature Request template
3. Describe the use case and proposed solution

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Make your changes
4. Test in multiple browsers (Chrome, Firefox, Safari)
5. Commit with clear messages
6. Push to your fork
7. Open a Pull Request

## Development Guidelines

### Code Style

- **HTML**: Semantic elements, proper indentation (2 spaces)
- **CSS**: BEM-like naming, mobile-first approach
- **JavaScript**: ES6+, no external dependencies, clear function names

### Architecture Principles

1. **Single File** - Keep everything in `index.html` for simplicity
2. **No Build Tools** - Must work by just opening in a browser
3. **No External Dependencies** - Vanilla JS only
4. **Graceful Degradation** - Work without config.json, handle missing files

### Testing

- Test all changes manually in Chrome, Firefox, and Safari
- Verify drag-and-drop works
- Check responsive layout on mobile viewport
- Ensure CSV export produces valid files

### Commit Messages

Use clear, descriptive commit messages:

```
feat: add dark mode toggle
fix: CSV parser handles escaped quotes
docs: update README with config examples
refactor: extract CSV parsing to separate function
```

## Project Structure

```
root/                    # Generic product code
├── index.html          # Main dashboard (edit this)
├── config.json         # Configuration template
├── sprints.json        # Sprint definitions template
├── backlog.csv         # Sample backlog
├── current_sprint.csv  # Sample sprint
└── completed_tasks.csv # Sample archive

agile/                   # Our dogfooding instance (don't edit for PRs)
├── index.html          # Copy of dashboard for our use
├── backlog.csv         # Our real backlog
└── ...
```

**Important**: When submitting PRs, only modify files in the root directory. The `agile/` folder is our internal project management.

## Getting Help

- Open an issue for questions
- Check existing documentation
- Join discussions in GitHub Discussions

## Recognition

Contributors will be recognized in the README and release notes.

---

By contributing, you agree that your contributions will be licensed under the MIT License.
