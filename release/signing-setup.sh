#!/bin/bash

# Copyright 2021 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

# If ENCRYPT_KEY is not set in environment, use the first argument for backward compatibility
if [[ -z "$ENCRYPT_KEY" ]]; then
  ENCRYPT_KEY=$1
fi

if [[ ! -z "$ENCRYPT_KEY" ]]; then
  # Export ENCRYPT_KEY so openssl can access it via env:ENCRYPT_KEY
  # This prevents the key from appearing in the process list.
  export ENCRYPT_KEY

  # Decrypt GnuPG keyring
  openssl aes-256-cbc -md sha256 -d -in "release/secring.gpg.aes" -out "release/secring.gpg" -pass env:ENCRYPT_KEY

  # Decrypt Play Store key
  openssl aes-256-cbc -md sha256 -d -in "release/signing.properties.aes" -out "release/signing.properties" -pass env:ENCRYPT_KEY

else
  echo "ENCRYPT_KEY is empty"
fi
