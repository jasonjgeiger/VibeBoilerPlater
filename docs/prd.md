# Product Requirements Document
App name: Dance Party LED Strip
Description: Make a web app that starts dim, then glows brighter, then fades back—slowly, like a deep breath. Imagine setting it on your desk, watching it pulse gently to relax you!

Help me plan my prototype and document the plan in the PRD.md 
## Style guide 
### visual Mood: Calming, meditative, atmospheric
- Color Palette:
- Start: Deep navy or black (#000814)
- Glow: Soft violet (#7209b7), blue (#4361ee), or warm white (#fdfcdc)
- Fade: Muted pastel tones or back to initial darkness
- Glow Effect: Use blurred radial gradients or CSS box shadows to simulate glowing light.

## Animations
- Slow, smooth transitions between brightness levels using ease-in-out curves
- Looping "breathe" rhythm:
- Fade in (~5 seconds)
- Hold (~2 seconds)
- Fade out (~5 seconds)
- Rest (~2 seconds)

## layout constraints
- Responsive: Works on desktop and mobile
- Minimal UI: No visible controls by default
- Centered Visual Element: One large glowing strip or circle/pulse dot
- Optional Controls (hidden by default, toggled on hover/tap):
- Start/Stop animation
## Color theme selector
- Speed adjustment (default: slow, optional: medium, fast)
- functionality details
- ore Features
## Feature	Description
- Breathing Animation	A looped animation mimicking inhalation and exhalation
- Theme Selector	Choose glow colors (e.g., blue, pink, rainbow, white)
- Animation Speed Control	User can pick Slow (default), Medium, or Fast
- Idle Start	App auto-starts animation on page load without input
- Device Light Sync (Stretch Goal)	Detect and sync with LED hardware (e.g., via WebUSB/WebBluetooth)

## copy image assets or examples
- UI Element	Text
- Color theme dropdown	"Choose a mood..."
- Speed label	"Breath pace"
- Toggle animation	"Pause Glow" / "Start Glow"