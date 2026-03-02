# 노션 운영 구조 요약 (2026-03-02)

## 1) 메인 페이지
- IMS(메인): https://www.notion.so/IMS-d0aeadd8ab8f47ae83ca0039273969f0
- 메인 페이지에서 아래 DB/페이지로 바로 이동할 수 있도록 링크를 구성해두었습니다.

---

## 2) 일정/할일 운영 구조

### 팀 스케줄
- 팀 스케줄 마스터: https://www.notion.so/3174faad8d9c8178a0aeceb1cdd2ea74
- 주요 필드
  - 일정명, 시작일시, 종료일시
  - 담당자(Owner), 참석자
  - 상태, 우선순위, 카테고리
  - 프로젝트, 장소/링크, 사전준비, 메모, 알림규칙
  - 담당자 Todo 링크(담당자별 Todo DB 바로가기)

### 개인 Todo DB
- Todo - 오세영: https://www.notion.so/3174faad8d9c813aad54ed1abd44e762
- Todo - 임혜란: https://www.notion.so/3174faad8d9c817c9a41d4c328f94848
- Todo - 고봉석: https://www.notion.so/3174faad8d9c8107810fcd77e17ba895
- Todo - 김민준: https://www.notion.so/3174faad8d9c8128a6b5dfa1a0d44851
- Todo - 김경태: https://www.notion.so/3174faad8d9c81a79d39d948a933ea7f
- 공통 필드
  - 할일명, 상태, 우선순위, 마감일
  - 관련 일정, 프로젝트, 메모
  - 연결 이슈 URL, 사이트

> 참고: `Todo - 사용자님` DB는 `오세영`과 중복으로 아카이브 처리됨

---

## 3) 업체/장비/이슈 운영 구조

### 업체 관리 허브
- 업체 관리 페이지: https://www.notion.so/3174faad8d9c81929239fd9505339475

### 공통 마스터
- 업체 마스터: https://www.notion.so/3174faad8d9c8181ad78d8bfc67a86fd
- 장비 마스터: https://www.notion.so/3174faad8d9c8135a2dff8103abe3b7a
  - 삼성VD 장비 기준: S-AOI / M-AOI / RM

### 사이트별 장비 이슈 DB
- 이슈 - 삼성VD: https://www.notion.so/3174faad8d9c81039e41ddc2b09ffec6
- 이슈 - 와이솔(베트남)-WLP: https://www.notion.so/3174faad8d9c81fcbc23dfd68ab3426a
- 공통 필드
  - 이슈제목, 장비명, 장비종류
  - 상태, 우선순위, 발생일, 담당자
  - 조치내용, 다음액션
  - 연결 Todo URL, Todo 메모

---

## 4) 운영 규칙 (요약)
1. 일정이 생기면
   - 팀 스케줄 등록
   - 담당자 Todo 생성
2. 장비 이슈가 생기면
   - 사이트별 이슈 DB 등록
   - 담당자 Todo 생성 및 상호 링크 연결
3. 링크 연결 기준
   - 이슈 `연결 Todo URL` ↔ Todo `연결 이슈 URL`
4. 상태 동기화 기준
   - 이슈 완료 시 연계 Todo도 완료 처리

---

## 5) 현재 반영된 대표 업무
- 와이솔(베트남)-WLP AOI 내일 출장 업무 등록 완료
- 오세영/김경태 Todo 반영 완료
- 업체/장비/이슈 구조 및 메인 링크 구성 완료
