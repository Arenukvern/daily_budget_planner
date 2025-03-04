---
priority: 3
scope: tools
last_updated: "2024-02-02"
dependencies: []
context_type: reference
pattern: intent_first
summary: "Development tools and environment setup guide"
---

# Flutter/Flame Shader Implementation Guide

## Core Concepts

Use Flutter 3.27 and Dart 3.6

### 1. Shader Architecture

- Fragment shaders only (.frag extension)
- GLSL version 460 core recommended
- Must include Flutter runtime effects:
  ```glsl
  #include <flutter/runtime_effect.glsl>
  ```

### 2. Essential Components

a) Uniforms:

- Float-based (float, vec2, vec3, vec4)
- Sampler2D for textures
- Ordered by declaration
- Default to 0.0 if uninitialized

b) Coordinates:

- Use FlutterFragCoord() for position
- Avoid gl_FragCoord for backend compatibility
- Local coordinates preferred over screen space

### 3. Integration Patterns

#### Flame Engine Integration:

Use Flame 1.23 version.
https://docs.flame-engine.org/latest/index.html

```dart
// Loading
_shaderProgram = await FragmentProgram.fromAsset('assets/shaders/name.frag');
_shader = _shaderProgram?.fragmentShader();

// Updating
void _updateShader() {
  _shader?.setFloat(0, size.x);    // Resolution X
  _shader?.setFloat(1, size.y);    // Resolution Y
  _shader?.setFloat(2, _time);     // Time
}

// Rendering
canvas.drawRect(
  rect,
  Paint()..shader = _shader
);
```

### 4. Performance Guidelines

- Precache FragmentProgram objects
- Reuse FragmentShader instances
- Minimize uniform updates
- Use efficient coordinate transformations

### 5. Shader Types & Usage

a) Star Field Shader:

- Multiple layers for depth
- Rotation matrix for camera
- Density control via distance
- Real spectral types

b) Planet Shader:

- Surface detail via noise
- Atmosphere effects
- Normal mapping
- Rim lighting

c) Sun Shader:

- Corona effect
- Surface plasma
- Dynamic color variation
- Emission control

### 6. Limitations

- No vertex shaders
- No UBOs/SSBOs
- Only sampler2D supported
- No unsigned ints/bools
- No custom varying inputs

### 7. Best Practices

- Use premultiplied alpha
- Normalize color values (0.0-1.0)
- Handle edge cases in UV mapping
- Implement proper depth sorting
- Cache computed values

### 8. Critical Considerations

- Backend compatibility (Skia/Impeller)
- Memory management
- State handling
- Shader compilation timing
- Error handling
