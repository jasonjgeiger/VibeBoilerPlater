# Hook Name

## Description
Brief description of what the hook does and its purpose.

## Parameters
| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| param     | type | Yes/No   | default | description |

## Returns
| Return Value | Type | Description |
|--------------|------|-------------|
| value        | type | description |

## Usage
```tsx
import { useHookName } from './useHookName';

function Component() {
  const [value, setValue] = useHookName(initialValue);
  
  return (
    // Component JSX
  );
}
```

## Dependencies
- List any external dependencies or internal hooks this hook relies on

## Examples
```tsx
// Example 1: Basic usage
const [value, setValue] = useHookName();

// Example 2: With parameters
const [value, setValue] = useHookName(initialValue);
```

## Notes
- Any important notes about usage, edge cases, or limitations

## Testing
- Testing strategy and key test cases

## Changelog
- Version 1.0.0: Initial release 