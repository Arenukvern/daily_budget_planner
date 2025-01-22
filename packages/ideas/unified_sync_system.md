# Idea of Unified Sync System (USS) Documentation

## Version 1.0

- Uses Git-like structure for history tracking
- Implements lightweight blockchain verification
- Adds CRDT-inspired conflict resolution
- Includes automatic smart pruning system with blockchain-like checkpointing (so it merges changes into a single state - checkpoint)
- Has deterministic merge strategies
- Implements partition tolerance

## Version 2.0

1. Local Storage (normalized) via StorageProvider Interface. Fastest and most simple storage for fastest data retrieval. It should be a simple key-value store.
2. State management, Observers, Push mechanism and conflict resolution are responsibilities of the CRDT (YJS).
3. Bindings from UI models to CRDT models and back should be made via UiProvider Interface. These models immutable, and just representation of CRDT models in required or convenient format.
4. Long Term (Checkpoint) Storage via LongTermStorageProvider Interface. Difference between Long Term and Local Storage is that Long Term Storage should be a File-based storage, like one json, yaml which can be used for backup and recovery or to send to other users. This means that format should stay compatible from day one and support all older versions of LongTermStorage Files.
