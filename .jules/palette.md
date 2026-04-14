## 2024-05-22 - [Permission Samples UX]
**Learning:** Enhancing permission rationale screens with illustrative icons and specific action-oriented button labels (e.g., "Allow camera access" vs. "Request permission") improves user trust and clarity. Using `Arrangement.spacedBy` in `Column` ensures consistent visual rhythm without manual spacers.
**Action:** Use `Icons.Default.Face` for rationale prompts and `Icons.Default.Done` with success colors for granted states in Compose-based permission flows.

## 2024-11-20 - [Sample App Navigation & Accessibility]
**Learning:** In sample apps with hierarchical list navigation, providing a contextual title in the `TopAppBar` and a back navigation button significantly improves user orientation. For accessibility, explicitly adding `role = Role.Button` to clickable list items ensures TalkBack correctly identifies them as interactive. Using `maxLines = 1` and `TextOverflow.Ellipsis` for titles prevents layout breakage with long sample names.
**Action:** Always include back navigation and contextual titles in multi-level sample browsers, and apply semantic roles to custom interactive components.
