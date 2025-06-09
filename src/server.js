const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');
const fs = require('fs');

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Load rules from .cursor/rules directory
const loadRules = () => {
  const rulesDir = path.join(__dirname, '..', '.cursor', 'rules');
  const rules = {};
  
  try {
    fs.readdirSync(rulesDir).forEach(file => {
      if (file.endsWith('.mdc')) {
        const content = fs.readFileSync(path.join(rulesDir, file), 'utf8');
        rules[file.replace('.mdc', '')] = content;
      }
    });
  } catch (error) {
    console.error('Error loading rules:', error);
    return {};
  }
  
  return rules;
};

// MCP endpoints
app.get('/mcp/rules', (req, res) => {
  const rules = loadRules();
  res.json(rules);
});

app.post('/mcp/apply', (req, res) => {
  const { rule, context } = req.body;
  // Here you would implement the logic to apply rules
  // For now, we'll just echo back the request
  res.json({
    success: true,
    message: `Applied rule: ${rule}`,
    context
  });
});

// Health check endpoint for Azure
app.get('/health', (req, res) => {
  const health = {
    status: 'ok',
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    memory: process.memoryUsage(),
    rules: Object.keys(loadRules()).length
  };
  res.json(health);
});

// Azure App Service requires a root endpoint
app.get('/', (req, res) => {
  res.json({
    name: 'Vibe Boilerplate MCP Server',
    version: '1.0.0',
    status: 'running',
    endpoints: {
      rules: '/mcp/rules',
      apply: '/mcp/apply',
      health: '/health'
    }
  });
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    error: 'Internal Server Error',
    message: process.env.NODE_ENV === 'production' ? 'An error occurred' : err.message
  });
});

// Start server
app.listen(port, () => {
  console.log(`MCP server running on port ${port}`);
  console.log(`Environment: ${process.env.NODE_ENV || 'development'}`);
}); 