## 2024-12-16 - Grounded Icon Availability
**Learning:** Standard Material icons like `Icons.Default.CameraAlt` or `CheckCircle` may not be present in the project's source code despite the extended icons dependency.
**Action:** Always verify icon availability with `grep` in the codebase (e.g., `grep -r "Icons.Default" .`) before using them in UI components to ensure build success.

## 2024-12-16 - Spacing Consistency with Arrangement.spacedBy
**Learning:** Using manual `Spacer` components for vertical distribution in `Column` layouts can lead to inconsistent spacing and more verbose code.
**Action:** Prefer `verticalArrangement = Arrangement.spacedBy(16.dp)` (or appropriate value) in `Column` components to manage spacing between all children consistently and concisely.
