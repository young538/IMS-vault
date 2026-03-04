#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   scripts/memo_dual_write.sh "제목" "메모 본문" [분류]
# Example:
#   scripts/memo_dual_write.sh "출장 회의" "테스트 항목 3개 확정" "업무"

TITLE="${1:-}"
BODY="${2:-}"
CATEGORY="${3:-기록}"

if [[ -z "$TITLE" || -z "$BODY" ]]; then
  echo "사용법: scripts/memo_dual_write.sh \"제목\" \"메모 본문\" [분류]"
  exit 1
fi

WORKDIR="/home/young/.openclaw/workspace"
VAULT="$WORKDIR/obsidian-vault"
DAILY_DIR="$VAULT/03_데일리"
TODAY="$(date +%F)"
NOW_KST="$(TZ=Asia/Seoul date '+%Y-%m-%d %H:%M')"
DAILY_FILE="$DAILY_DIR/$TODAY.md"
REL_PATH="03_데일리/$TODAY.md"

mkdir -p "$DAILY_DIR"

if [[ ! -f "$DAILY_FILE" ]]; then
  cat > "$DAILY_FILE" <<EOF
# $TODAY 데일리

## 메모
EOF
fi

if ! grep -q '^## 메모' "$DAILY_FILE"; then
  printf "\n## 메모\n" >> "$DAILY_FILE"
fi

printf -- "- [%s] **%s**: %s\n" "$NOW_KST" "$TITLE" "$BODY" >> "$DAILY_FILE"

echo "[OK] Obsidian 기록 완료: $REL_PATH"

# Notion 동시 기록
NOTION_KEY="$(cat ~/.config/notion/api_key 2>/dev/null || true)"
NOTION_DB_ID="0c134acf-7b48-4926-a185-5c7a1ecf1147"

if [[ -z "$NOTION_KEY" ]]; then
  echo "[WARN] Notion API 키가 없어 Notion 기록은 건너뜀"
  exit 0
fi

PAYLOAD=$(python3 - <<PY
import json, datetime
payload = {
  "parent": {"database_id": "0c134acf-7b48-4926-a185-5c7a1ecf1147"},
  "properties": {
    "Name": {"title": [{"text": {"content": """$TITLE"""}}]},
    "분류": {"select": {"name": """$CATEGORY"""}},
    "메모": {"rich_text": [{"text": {"content": """$BODY"""}}]},
    "기록시각": {"date": {"start": datetime.datetime.now(datetime.timezone.utc).isoformat()}},
    "출처": {"select": {"name": "OpenClaw"}},
    "옵시디언경로": {"rich_text": [{"text": {"content": """$REL_PATH"""}}]}
  }
}
print(json.dumps(payload, ensure_ascii=False))
PY
)

curl -sS -X POST "https://api.notion.com/v1/pages" \
  -H "Authorization: Bearer $NOTION_KEY" \
  -H "Notion-Version: 2025-09-03" \
  -H "Content-Type: application/json" \
  --data "$PAYLOAD" >/tmp/notion_memo_result.json

if grep -q '"object":"error"' /tmp/notion_memo_result.json; then
  echo "[WARN] Notion 기록 실패"
  cat /tmp/notion_memo_result.json
  exit 1
fi

echo "[OK] Notion 동시 기록 완료"
