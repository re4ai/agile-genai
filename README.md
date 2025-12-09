<p align="center">
  <h1 align="center">Agile GenAI</h1>
  <p align="center">
    <strong>CSV-based agile task management for AI-assisted development workflows</strong>
  </p>
  <p align="center">
    <a href="#features">Features</a> •
    <a href="#quick-start">Quick Start</a> •
    <a href="#ai-agents">AI Agents</a> •
    <a href="#configuration">Configuration</a> •
    <a href="#contributing">Contributing</a>
  </p>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License: MIT"></a>
  <a href="CONTRIBUTING.md"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="PRs Welcome"></a>
  <img src="https://img.shields.io/badge/dependencies-zero-success" alt="Zero Dependencies">
  <img src="https://img.shields.io/badge/build-single%20file-orange" alt="Single File">
</p>

---

## What is Agile GenAI?

A **single-file HTML dashboard** that transforms CSV task data into an interactive Kanban board. Designed for developers working with AI coding assistants who want lightweight, version-controlled task management.

**Perfect for:**
- Solo developers managing personal projects
- AI-assisted "vibe coding" workflows (Claude, Copilot, Cursor)
- Teams who want Git-trackable task management
- Anyone who prefers simplicity over complex tools

## Features

- **Zero Dependencies** - Single HTML file, no npm, no build tools
- **Git-Friendly** - CSV files track changes beautifully in version control
- **AI-Native** - Designed for AI agents to read/update tasks directly
- **Offline-First** - Works locally, no server required
- **Customizable** - Configure via `config.json`, not code changes
- **Light/Dark Themes** - Toggle between themes, persisted in localStorage
- **Demo Mode** - Preview with sample data using `?demo=true`

## Quick Start

### Option 1: Setup Script (Recommended)

```bash
# Clone the repository
git clone https://github.com/yourusername/agile-genai.git
cd agile-genai

# Run setup for your project
./setup.sh "My Project Name"

# Open the dashboard
open agile/index.html
```

The setup script creates an `agile/` folder with:
- Dashboard (`index.html`)
- Configuration (`config.json`)
- Empty CSV files ready for your tasks

### Option 2: Manual Setup

1. Copy `index.html` to your project
2. Copy `config.json`, `sprints.json`
3. Create empty CSV files with headers
4. Open `index.html` in browser

### Option 3: Demo Mode

Try it instantly without setup:
```
index.html?demo=true
```

## AI Agents

**This is the key feature!** Agile GenAI is designed for AI coding assistants to manage their own tasks.

### For AI Agents: Read [CLAUDE.md](CLAUDE.md)

The `CLAUDE.md` file contains detailed instructions for AI agents on how to:
- Read tasks from CSV files
- Update task status and progress
- Handle the complete workflow

### Quick Reference for Agents

```
BEFORE starting any task:
1. Read agile/current_sprint.csv
2. Find next pending task (check dependencies)
3. Update status to "in_progress"

AFTER completing a task:
1. Update status to "completed"
2. Set progress_percent to 100
3. Add notes about what was done
```

### Add to Your Project's CLAUDE.md

```markdown
## Task Management

This project uses Agile GenAI. Before and after each task:
- Read `agile/current_sprint.csv` for current tasks
- Update task status: pending → in_progress → completed
- Update progress_percent as you work (0, 25, 50, 75, 100)
- Add notes describing what was done
```

## Project Structure

```
your-project/
├── agile/                   # Created by setup.sh
│   ├── index.html          # Dashboard
│   ├── config.json         # Project configuration
│   ├── sprints.json        # Sprint definitions
│   ├── backlog.csv         # All tasks
│   ├── current_sprint.csv  # Active sprint
│   └── completed_tasks.csv # Archive
├── src/                    # Your code
└── CLAUDE.md               # AI agent instructions
```

## Configuration

Edit `agile/config.json` to customize:

```json
{
  "project": {
    "name": "My Project",
    "title": "My Project Sprint Dashboard"
  },
  "team": {
    "roles": ["Developer", "Designer", "AI Agent"],
    "categories": ["Backend", "Frontend", "Testing"],
    "priorities": ["critical", "high", "medium", "low"]
  }
}
```

## CSV Format

### current_sprint.csv
```csv
id,title,category,status,priority,owner,due_date,estimate_hours,progress_percent,dependencies,notes
TASK-001,Setup Database,Backend,in_progress,high,AI Agent,2025-01-07,4,50,"",Working on schema
```

### Status Values
| Status | Description |
|--------|-------------|
| `pending` | Not started |
| `in_progress` | Currently being worked on |
| `completed` | Done |
| `blocked` | Cannot proceed (add reason in notes) |

## Dashboard Features

| Feature | Description |
|---------|-------------|
| **Kanban Board** | Drag-drop tasks between columns |
| **Task Details** | Click to edit progress, notes, dependencies |
| **Backlog View** | Toggle sidebar, add new tasks |
| **Sprint Management** | Create unlimited sprints |
| **Export CSV** | Download updated data |
| **Theme Toggle** | Dark/light mode |

## Browser Support

| Browser | Version |
|---------|---------|
| Chrome/Edge | 90+ |
| Firefox | 88+ |
| Safari | 14+ |
| Mobile | Supported |

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](LICENSE) for details.

---

<p align="center">
  <strong>Made for developers who code with AI assistants</strong>
</p>
