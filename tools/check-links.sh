#!/usr/bin/env bash
# 루트 HTML들이 href로 거는 내부 *.html 링크가 실제 파일로 존재하는지 검사한다.
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
for f in *.html; do
  grep -oE 'href="[a-zA-Z0-9_-]+\.html(#[a-zA-Z0-9_-]+)?"' "$f" \
    | sed -E 's/href="([^"#]+).*/\1/' | sort -u | while read -r target; do
      if [ ! -f "$target" ]; then
        echo "BROKEN: $f -> $target"
      fi
    done
done > /tmp/linkcheck.txt || true
if [ -s /tmp/linkcheck.txt ]; then cat /tmp/linkcheck.txt; echo "LINK CHECK FAILED"; exit 1; fi
echo "LINK CHECK OK"
