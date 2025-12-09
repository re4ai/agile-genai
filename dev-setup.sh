#!/bin/bash
# Agile GenAI Setup Script
# Creates an agile/ folder in your project for task management

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
PROJECT_NAME="${1:-My Project}"
AGILE_DIR="${2:-agile}"

echo -e "${BLUE}Agile GenAI Setup${NC}"
echo "=================="
echo ""

# Check if agile directory already exists
if [ -d "$AGILE_DIR" ]; then
    echo "Directory '$AGILE_DIR' already exists."
    read -p "Overwrite? (y/N): " confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "Setup cancelled."
        exit 0
    fi
    rm -rf "$AGILE_DIR"
fi

# Create agile directory
mkdir -p "$AGILE_DIR"

# Copy dashboard
if [ -f "index.html" ]; then
    cp index.html "$AGILE_DIR/"
    echo -e "${GREEN}✓${NC} Copied dashboard to $AGILE_DIR/index.html"
else
    echo "Warning: index.html not found. Please copy it manually."
fi

# Create config.json
cat > "$AGILE_DIR/config.json" << EOF
{
  "project": {
    "name": "$PROJECT_NAME",
    "title": "$PROJECT_NAME Sprint Dashboard",
    "description": "Agile task management for $PROJECT_NAME"
  },
  "files": {
    "backlog": "backlog.csv",
    "currentSprint": "current_sprint.csv",
    "completedTasks": "completed_tasks.csv",
    "sprints": "sprints.json"
  },
  "ui": {
    "showStats": true,
    "showBacklog": false,
    "defaultView": "kanban",
    "defaultTheme": "dark"
  },
  "team": {
    "roles": ["Product Owner", "Developer", "Designer", "AI Agent", "Unassigned"],
    "categories": ["Backend", "Frontend", "Feature", "Bug", "Testing", "Documentation", "DevOps"],
    "priorities": ["critical", "high", "medium", "low"]
  }
}
EOF
echo -e "${GREEN}✓${NC} Created $AGILE_DIR/config.json"

# Create sprints.json
TODAY=$(date +%Y-%m-%d)
TWO_WEEKS=$(date -v+14d +%Y-%m-%d 2>/dev/null || date -d "+14 days" +%Y-%m-%d 2>/dev/null || echo "2025-01-14")

cat > "$AGILE_DIR/sprints.json" << EOF
{
  "sprints": [
    {
      "id": "sprint1",
      "name": "Sprint 1 - Getting Started",
      "phase": "Sprint 1",
      "startDate": "$TODAY",
      "endDate": "$TWO_WEEKS",
      "status": "active"
    }
  ],
  "activeSprint": "sprint1",
  "lastUpdated": "${TODAY}T00:00:00Z"
}
EOF
echo -e "${GREEN}✓${NC} Created $AGILE_DIR/sprints.json"

# Create empty backlog.csv
cat > "$AGILE_DIR/backlog.csv" << 'EOF'
id,category,title,description,priority,phase,status,estimate_hours,owner
EOF
echo -e "${GREEN}✓${NC} Created $AGILE_DIR/backlog.csv"

# Create empty current_sprint.csv
cat > "$AGILE_DIR/current_sprint.csv" << 'EOF'
id,title,category,status,priority,owner,due_date,estimate_hours,progress_percent,dependencies,notes
EOF
echo -e "${GREEN}✓${NC} Created $AGILE_DIR/current_sprint.csv"

# Create empty completed_tasks.csv
cat > "$AGILE_DIR/completed_tasks.csv" << 'EOF'
id,title,category,phase,completed_date,actual_hours,owner,notes
EOF
echo -e "${GREEN}✓${NC} Created $AGILE_DIR/completed_tasks.csv"

echo ""
echo -e "${GREEN}Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Open $AGILE_DIR/index.html in your browser"
echo "  2. Add tasks via the Backlog panel (+ Add button)"
echo "  3. Or edit the CSV files directly"
echo ""
echo "For AI agents, add to your CLAUDE.md:"
echo "  - Read agile/current_sprint.csv before starting work"
echo "  - Update task status and progress as you work"
echo ""
