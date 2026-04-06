## 2025-05-14 - [Activity Injection in Sample App Launcher]
**Vulnerability:** The sample application's `MainActivity` used `queryIntentActivities` to dynamically populate its list of samples based on an intent category (`com.google.accompanist.sample.SAMPLE_CODE`) without verifying the package name of the returned activities.
**Learning:** Malicious external applications could register activities with the same category and inject themselves into the sample app's UI, potentially leading to phishing or UI redressing attacks.
**Prevention:** Always verify that `info.activityInfo.packageName` matches the application's own `packageName` when dynamically loading components from `PackageManager` based on shared intent categories.

## 2025-05-15 - [Manifest Hardening for Sample App]
**Vulnerability:** Sample activities were marked as `exported="true"`, making them accessible to other apps. The app also didn't explicitly disable cleartext traffic.
**Learning:** Even for sample apps, internal activities should be non-exported to minimize attack surface. Intent extras should use project-specific namespaces to avoid collisions.
**Prevention:** Explicitly set `android:exported="false"` for all internal components and `android:usesCleartextTraffic="false"` in the manifest as defense-in-depth.
