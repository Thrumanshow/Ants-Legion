#!/usr/bin/env bash
set -Eeuo pipefail

out="${1:?Uso: collect_environment.sh <archivo> }"
mkdir -p "$(dirname "$out")"
{
  echo "collected_at_utc=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "hostname=$(hostname 2>/dev/null || echo unavailable)"
  echo "uname=$(uname -a 2>/dev/null || echo unavailable)"
  echo "architecture=$(uname -m 2>/dev/null || echo unavailable)"
  for cmd in bash openssl sha256sum awk gawk coreutils termux-battery-status getprop; do
    if command -v "$cmd" >/dev/null 2>&1; then
      case "$cmd" in
        bash) v="$($cmd --version 2>/dev/null | head -n1)" ;;
        openssl) v="$($cmd version 2>/dev/null | head -n1)" ;;
        sha256sum|awk|gawk|coreutils) v="$($cmd --version 2>/dev/null | head -n1)" ;;
        termux-battery-status) v="available" ;;
        getprop) v="available" ;;
      esac
    else
      v="unavailable"
    fi
    printf '%s=%s\n' "$cmd" "$v"
  done
  if command -v getprop >/dev/null 2>&1; then
    echo "android_release=$(getprop ro.build.version.release 2>/dev/null || true)"
    echo "device_model=$(getprop ro.product.model 2>/dev/null || true)"
    echo "device_manufacturer=$(getprop ro.product.manufacturer 2>/dev/null || true)"
  else
    echo "android_release=unavailable"
    echo "device_model=unavailable"
    echo "device_manufacturer=unavailable"
  fi
  # No se capturan variables de entorno: podrían contener tokens o claves.
  echo "secrets_capture=disabled"
} > "$out"
