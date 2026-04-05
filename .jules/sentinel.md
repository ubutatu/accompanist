## 2025-05-14 - [Activity Injection in Sample App Launcher]
**Vulnerability:** The sample application's `MainActivity` used `queryIntentActivities` to dynamically populate its list of samples based on an intent category (`com.google.accompanist.sample.SAMPLE_CODE`) without verifying the package name of the returned activities.
**Learning:** Malicious external applications could register activities with the same category and inject themselves into the sample app's UI, potentially leading to phishing or UI redressing attacks.
**Prevention:** Always verify that `info.activityInfo.packageName` matches the application's own `packageName` when dynamically loading components from `PackageManager` based on shared intent categories.

## 2026-04-05 - [Defense-in-Depth for Manifest and Intents]
**Vulnerability:** The sample application had multiple activities set to `android:exported="true"` by default and used a generic `com.example` namespace for internal intent extras. It also lacked an explicit policy against cleartext traffic.
**Learning:** For activities discovered dynamically via `queryIntentActivities` within the same app, `android:exported="false"` is sufficient and more secure as it prevents external components from launching them with malicious intents.
**Prevention:** Explicitly set `android:exported="false"` for all internal activities, even those with intent filters. Use project-specific prefixes for intent extra keys to prevent collisions and improve security hygiene. Enforce HTTPS by setting `android:usesCleartextTraffic="false"` in the application manifest.
