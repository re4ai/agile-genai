# Changelog

All notable changes to Agile GenAI will be documented in this file.

## [1.0.0] - 2025-12-09

### Added
- **External Configuration**: Load settings from `config.json` instead of hardcoded values
- **External Data Loading**: Load sprints, backlog, and tasks from external JSON/CSV files
- **Demo Mode**: Add `?demo=true` URL parameter to show sample data for previews
- **Light/Dark Theme Toggle**: Switch between dark and light themes with localStorage persistence
- **Theming Engine**: CSS custom properties for easy color customization
- **Robust CSV Parser**: Properly handles quoted fields containing commas
- **Sprint Management**: Create, navigate, and complete sprints
- **Backlog View**: Toggle sidebar to see and drag tasks from backlog
- **Task Details Modal**: Edit progress, add notes, manage dependencies
- **Export to CSV**: Download updated task data

### Documentation
- README.md with quick start guide
- CONTRIBUTING.md with contribution guidelines
- CODE_OF_CONDUCT.md based on Contributor Covenant
- GitHub issue templates for bugs and features

### DevOps
- GitHub Actions CI pipeline for validation

## Project Structure

```
agile-genai/
├── index.html          # Main dashboard
├── config.json         # Configuration
├── sprints.json        # Sprint definitions
├── backlog.csv         # Task backlog
├── current_sprint.csv  # Active sprint tasks
└── agile/              # Dogfooding instance
```

---

This project uses a "dogfooding" approach - we manage its own development using the dashboard in the `agile/` folder.
