---
type: equipment
name: 
site: 
vendor: 
category: 
status: 정상
updated: 
---

# {{name}}

## 소속
- 업체: [[ ]]
- 사이트: 

## 관련 이슈
```dataview
TABLE status, priority, assignee, updated
FROM "issues"
WHERE equipment = this.name
SORT updated DESC
```

## 메모
- 
