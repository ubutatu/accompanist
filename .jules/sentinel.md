## 2025-05-14 - [Activity Injection in Sample App Launcher]
**Vulnerability:** The sample application's `MainActivity` used `queryIntentActivities` to dynamically populate its list of samples based on an intent category (`com.google.accompanist.sample.SAMPLE_CODE`) without verifying the package name of the returned activities.
**Learning:** Malicious external applications could register activities with the same category and inject themselves into the sample app's UI, potentially leading to phishing or UI redressing attacks.
**Prevention:** Always verify that `info.activityInfo.packageName` matches the application's own `packageName` when dynamically loading components from `PackageManager` based on shared intent categories.

## 2025-05-15 - [Exposed Intent Filters in Sample Application]
**Vulnerability:** Sample activities in the `AndroidManifest.xml` were explicitly marked as `android:exported="true"` while containing intent filters with a custom category (`com.google.accompanist.sample.SAMPLE_CODE`).
**Learning:** Activities containing intent filters are accessible to other applications by default, and explicitly setting `exported="true"` increases the attack surface. In this case, since the activities are only meant to be discovered and launched internally by the sample's `MainActivity`, they should be restricted.
**Prevention:** For defense-in-depth, explicitly set `android:exported="false"` for all activities that are not intended to be entry points for external applications, even if they contain intent filters.
