## 2025-05-14 - [Activity Injection in Sample App Launcher]
**Vulnerability:** The sample application's `MainActivity` used `queryIntentActivities` to dynamically populate its list of samples based on an intent category (`com.google.accompanist.sample.SAMPLE_CODE`) without verifying the package name of the returned activities.
**Learning:** Malicious external applications could register activities with the same category and inject themselves into the sample app's UI, potentially leading to phishing or UI redressing attacks.
**Prevention:** Always verify that `info.activityInfo.packageName` matches the application's own `packageName` when dynamically loading components from `PackageManager` based on shared intent categories.

## 2024-05-15 - [Insecure Hashing and Shell Script Weakness]
**Vulnerability:** The `checksum.sh` script used MD5 for integrity checks and lacked variable quoting, making it susceptible to collisions and word-splitting vulnerabilities.
**Learning:** Legacy scripts often use older hashing algorithms like MD5 which are cryptographically broken. Additionally, unquoted variables in shell scripts can lead to unintended execution or script failure if paths contain special characters.
**Prevention:** Use SHA-256 for all integrity and security-sensitive hashing. Always wrap shell variables in double quotes (e.g., `"$VAR"`) to prevent word-splitting and globbing attacks.

## 2025-05-16 - [Secret Exposure in Process Listings]
**Vulnerability:** Secrets (decryption keys) were passed as command-line arguments to shell scripts and the `openssl` command in GitHub Actions, making them visible in process listings (e.g., via `ps`).
**Learning:** GitHub Actions masks secrets in logs, but passing them as arguments to processes is still insecure on the runner. `openssl` provides a safer `-pass env:VAR` mechanism to avoid this.
**Prevention:** Always pass secrets to scripts and commands via environment variables. Use the `env` block in GitHub Actions and `openssl -pass env:KEY_NAME` to ensure secrets never appear in the process tree.
