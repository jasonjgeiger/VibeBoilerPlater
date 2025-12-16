# Getting Started

Quick workflow guide for building with this template.

## Build Workflow (Every Project)

### 1. Plan
- Copy your idea into `docs/prd.md`
- Choose instruction template: `basic`, `intermediate`, or `advanced`

### 2. Code
- Open your PRD + instruction file
- Chat: "Use this as instruction for how we build"
- Chat: "Start building"

### 3. Iterate
- Update PRD when requirements change
- Start new chats for major features
- Use `@context` to reference files
- Journal progress in `docs/prompt-journal.md`

## Setup for journaling (Optional)
1. Install **SpecStory** extensions
2. Once you've made some progress, tell the agent to "journal and update readme"
3. You may need use @context to referencethe journaling instructionss

## Files You'll Use
```
docs/prd.md                 # Your project requirements

## Other instruction files if your interested
instructions/basic-template.md      # For HTML/CSS/JS projects
instructions/intermediate-template.md  # For framework projects  
instructions/advanced-template.md      # For full-stack projects
```

## Key Commands
- `@context` - Reference files in chat
- "Start building" - Begin development
- "Update prd.md" - Refresh documentation
- "Journal progress" - Track development milestones
