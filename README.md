# FocusUtils

A Swift library for interacting with the focused window on macOS using the Accessibility API.

NOTE: Purely vibe-coded with Claude Opus 4.5.

## Requirements

- macOS 12+
- Accessibility permissions (System Settings → Privacy & Security → Accessibility)

## Library (FocusUtils)
### Installation
Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/youruser/FocusUtils", from: "1.0.0")  // remote
]
```

Then add `"FocusUtils"` to your target's dependencies.



### Usage

```swift
import FocusUtils

// Get the focused window's info
if let window = FocusedWindow.current() {
    print("Position: \(window.position)")
    print("Size: \(window.size)")
    print("Center: \(window.center)")
}

// Warp cursor to center of focused window
FocusedWindow.warpCursorToCenter()
```

### API

#### `FocusedWindow`

A struct representing the currently focused window.

**Properties:**
- `position: CGPoint` — Top-left corner of the window
- `size: CGSize` — Width and height of the window
- `center: CGPoint` — Computed center point of the window

**Static Methods:**
- `current() -> FocusedWindow?` — Returns the currently focused window, or nil if none
- `warpCursorToCenter()` — Moves the mouse cursor to the center of the focused window

## Binary (mvmouse)
### Installation
Run `install.sh`.

### Usage
Execute `mvmouse` to move the mouse cursor to the center of the focused window.
