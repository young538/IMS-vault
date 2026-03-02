# 팀 운영 대시보드

## 오늘 할 일 (오세영)
```dataview
TABLE status, due, vendor, equipment
FROM "todos/오세영"
SORT due ASC
```

## 전체 진행중 이슈
```dataview
TABLE site, equipment, assignee, priority, updated
FROM "issues"
WHERE status = "진행중"
SORT priority DESC, updated DESC
```

## 사이트별 이슈 수
```dataview
TABLE length(rows) as "이슈 수"
FROM "issues"
GROUP BY site
```

## 상태 코드
- 신규
- 진행중
- 완료
- 보류
