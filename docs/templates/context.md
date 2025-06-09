# Context Name

## Description
Brief description of what the context provides and its purpose.

## Context Value
| Property | Type | Description |
|----------|------|-------------|
| value    | type | description |

## Provider Props
| Prop Name | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| prop      | type | Yes/No   | default | description |

## Usage
```tsx
import { ContextNameProvider, useContextName } from './ContextName';

function App() {
  return (
    <ContextNameProvider value={initialValue}>
      <YourComponent />
    </ContextNameProvider>
  );
}

function YourComponent() {
  const context = useContextName();
  return (
    // Component JSX
  );
}
```

## Dependencies
- List any external dependencies or internal components this context relies on

## Examples
```tsx
// Example 1: Basic usage
const context = useContextName();

// Example 2: With provider
<ContextNameProvider value={customValue}>
  <Component />
</ContextNameProvider>
```

## Notes
- Any important notes about usage, performance considerations, or limitations

## Testing
- Testing strategy and key test cases

## Changelog
- Version 1.0.0: Initial release 