---
priority: 1
scope: core
last_updated: "2024-02-02"
dependencies: []
context_type: protocol
pattern: context_first
summary: "Protocol for AI tools to handle context management and interaction patterns"
---

# AI Context Protocol

## Context Loading Patterns

### 1. Context-First Pattern

Used when context is critical for understanding:

```md
#ctx {@context-files}
#type {action-type}
#scope {system-scope}
#state {current-state}

[TASK]
{clear task description}

[CONTEXT]

- File: {current-file}
- State: {relevant-state}
- Changes: {if-applicable}
```

### 2. Intent-First Pattern

Used when goal is clear but implementation needs context:

```md
[INTENT]
Goal: {what-to-achieve}
Type: {action-type}
Scope: {system-scope}

[STATE]
Current: {current-state}
Target: {desired-state}
Metrics: {if-applicable}

[REFS]
@{context-files}
```

## Pattern Selection Guide

1. **Use Context-First When**:

   - Working with complex systems
   - Performance optimization needed
   - Multiple systems involved
   - Code refactoring required

2. **Use Intent-First When**:
   - Adding new features
   - Bug fixing
   - UI/UX improvements
   - Simple system changes

## Context Loading Rules

1. **Metadata Processing**

   - Parse YAML frontmatter in all referenced files
   - Load dependencies based on priority (1 highest, 5 lowest)
   - Respect maximum dependency depth of 3
   - Avoid circular dependencies

2. **Context Selection**
   - Use `scope` to filter relevant context
   - Load CORE_PRINCIPLES.md by default
   - Maximum 3-4 context files per query
   - Prioritize files matching problem domain

## Response Protocol

1. **Initial Response**

   - Acknowledge pattern type
   - Confirm loaded context
   - Validate scope and state
   - Request any missing context

2. **Solution Delivery**
   - Reference specific context sections
   - Explain context influence on solution
   - Suggest context updates if needed
   - Provide implementation guidance

## Context Update Triggers

1. **Code Changes**

   - New system features
   - Component modifications
   - Performance optimizations
   - API changes

2. **Documentation Updates**
   - Pattern effectiveness metrics
   - New use cases discovered
   - Context load optimizations
   - Template improvements

## Error Handling

1. **Missing Context**

   - Request specific files
   - Suggest context creation
   - Provide template for new context

2. **Pattern Mismatch**

   - Suggest better pattern
   - Explain pattern selection
   - Provide corrected template

3. **Context Overload**
   - Identify essential context
   - Suggest context pruning
   - Optimize loading order

## Integration Guidelines

1. **Code Changes**

   - Reference relevant context in solutions
   - Maintain consistency with existing patterns
   - Suggest context updates for new patterns

2. **Performance Issues**

   - Check PERFORMANCE_BUDGET.md
   - Reference system-specific metrics
   - Update tracking data if needed

3. **Feature Requests**
   - Validate against CORE_PRINCIPLES.md
   - Check system compatibility
   - Suggest context expansion if needed

## Core Functionality

1. **Context Management**

   - Dynamic context loading and validation
   - Pattern-based interaction flows
   - Dependency resolution
   - State tracking and updates

2. **Pattern Enforcement**

   - Template validation
   - Context completeness checks
   - Pattern compliance verification
   - Error reporting and correction

3. **Integration Support**
   - System-wide context awareness
   - Cross-component communication
   - Performance monitoring
   - State synchronization

## Dependencies

1. **Required Context Files**

   - CORE_PRINCIPLES.md (priority: 1)
   - PERFORMANCE_BUDGET.md (priority: 2)
   - SYSTEMS_QUICKREF.md (priority: 2)
   - COMPONENT_MATRIX.md (priority: 3)

2. **Optional Context**

   - DEV_TOOLS_CONTEXT.md
   - 3D_CONTROLS_CONTEXT.md
   - SIMULATION_PRINCIPLES.md

3. **Runtime Dependencies**
   - Entity Component System
   - Rendering Pipeline
   - Physics Engine
   - Input Management

## Performance

1. **Context Loading**

   - Maximum load time: 50ms
   - Cache invalidation: 5 minutes
   - Memory budget: 10MB
   - Max concurrent loads: 3

2. **Pattern Processing**

   - Template validation: 10ms
   - Context resolution: 25ms
   - Error detection: 5ms
   - Response generation: 100ms

3. **Optimization Rules**
   - Lazy context loading
   - Incremental updates
   - Cache warm-up
   - Priority-based processing
