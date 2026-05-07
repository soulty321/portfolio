---
project_id: "aiAgent_project"
title: "AI 에이전트 — CDJ 시각화 및 데이터 테이블"
headline: "AI 에이전트가 설계한 고객 여정 CDJ 시각화 시스템"
period: "2025.09 ~ 2026.02"
role: "Product Design (CDJ 시각화, 데이터 테이블 UX/UI 설계 100%)"
contribution: |
  CDJ 5단계 저니 차트 시각화 설계
  7단계 AI 동작 UX 기획
  데이터 수정 테이블 및 스마트 필터링 UI 설계
  AI 분류 결과 정합성 QA
  MVP 단계별 개발 협업 리드
tools: ["Figma"]
category: "main"
status: "complete"
figma_page: "https://www.figma.com/design/yC4yaCpntjTfgvpaRrn8WT/portfolio_with_claude?node-id=30-1516&m=dev"
cover_image: "img_source/img/project5_cover.png"
release: "Released (SaaS B2B)"
team: "PM 1, FE 1, PD 1"
pdf_pages: "21-26"
---

## Overview

> **Assets**: (없음)

AI 파이프라인을 이해한 디자이너가 설계한 CDJ 자동 분석 솔루션.

---

## Problem

> **Assets**: `img_source/aiAgent_projectProblem.svg`

리스닝마인드는 방대한 검색 데이터를 보유하고 있었지만, 이를 소비자 의사결정 여정(CDJ) 보고서로 완성하려면 전문가의 수작업 분류가 필수였습니다.

키워드 분류, CDJ 단계 매핑, 차트 시각화까지 모든 과정이 수동이었고, 작업자마다 분류 기준이 달라 결과의 일관성도 보장되지 않았습니다.

- **소요 시간**: CDJ 차트 1건 작성 기준 1~2일.
- **수작업 의존**: 전 과정이 수동 의존, 키워드 분류부터 시각화까지 (실제 사내 프로세스 기준).
- **결과 불일치**: 작업자마다 다른 분류 기준 → 동일 데이터에서 상이한 결과.

### 정량 데이터
CDJ 차트 1건 작성에 1~2일 소요, 작업자별 CDJ 단계 분류 기준 불일치로 동일 데이터에서도 상이한 분석 결과 도출.

### 정성 데이터 (VOC)
"같은 키워드인데 담당자마다 단계를 다르게 해요. 보고서를 합칠 때마다 기준을 맞추느라 시간이 더 걸립니다."

---

## Strategy

> **Assets**: `img_source/aiAgent_projectStrategy.svg`

연구소가 설계한 7단계 파이프라인의 각 단계별 입출력 데이터를 이해한 뒤, 사용자에게 전달할 시각화와 인터페이스를 설계하고자 하였습니다.

### 7단계 AI 파이프라인
1. **무관 키워드 제외** — 무관 기준에 해당하는 키워드를 걸러내는 단계
2. **카테고리 분류** — AI가 가장 적합한 대분류를 탐색하고 하위 카테고리를 자동 추론
3. **대상/의도 분류** — 대상과 의도에 해당하는 키워드 분류
4. **브랜드/논브랜드 식별** — 키워드가 브랜드 검색어인지 논브랜드 검색어인지 판별하는 단계
5. **CDJ 5단계 자동 분류** — 키워드의 의도를 종합적으로 분석, 자동으로 데이터를 할당
6. **토픽 자동 생성** — 많이 반복되는 키워드를 중심으로 짧고 간결한 형태의 토픽을 생성
7. **시각화** — 완료된 5단계의 고객 여정과 묶여진 토픽 데이터들을 대시보드 상에 직관적인 원형(버블) 차트 형태로 렌더링

### Root Cause Analysis
키워드 분류, CDJ 매핑, 시각화가 모두 수작업이며, 작업자마다 일관성 없는 기준에 의존하고 있었습니다.

### Goal & Hypothesis
IF AI 파이프라인의 7단계 데이터 구조를 기반으로, THEN 각 단계의 분류 결과를 CDJ 차트 및 데이터를 확인하면, 누구나 10분 내에 완성형 CDJ 보고서를 생성할 수 있다.

---

## Solution A

> **Assets**: `img_source/aiAgent_projectSolutionA.svg`

7단계 AI 파이프라인의 데이터 구조를 직접 이해하고, CDJ 5단계 분류 결과를 저니 차트로 시각화했습니다.

### CDJ 저니 차트 시각화
CDJ 5단계(초기 탐색 → 브라우징 → 경험 탐색 → 구매 확인 → 소유·서비스) 분류 데이터를 키워드 버블 + 단계별 레인 구조의 직관적 차트로 설계했습니다.

### 키워드 버블 차트
검색량 비례 크기의 버블로 CDJ 단계별 키워드 분포 시각화.

### 타겟/인텐트 분리 뷰
AI 분류 결과를 사용자가 한눈에 파악할 수 있는 UI.

---

## Solution B

> **Assets**:
> - `img_source/aiAgent_projectSolutionB.svg`
> - `img_source/aiAgent_projectSolutionB_asis.svg`
> - `img_source/aiAgent_projectSolutionB_tobe.svg`

AI가 분류한 결과를 사용자가 검증·수정할 수 있는 테이블과, 브랜드 검색 점유율을 CDJ 차트 위에 오버레이하는 Visibility 기능을 설계했습니다.

### AS-IS
키워드 수작업 분류에 1~2일, 작업자별 기준 불일치, 전문가만 CDJ 보고서 작성 가능.

### TO-BE
AI 자동 분류 10분 완료, 일관된 기준, 누구나 대시보드에서 CDJ 보고서 생성·수정 가능.

- **데이터 수정 테이블**: AI 분류 결과(키워드별 타겟/인텐트, CDJ 단계, 브랜드 매칭)를 사용자가 직접 검토·수정할 수 있는 테이블 UI를 설계.
- **스마트 필터링 & 복구 UX**: 카드 기반 UI로 키워드를 시각적으로 필터링하고, Restore 버튼으로 실수를 즉시 복구할 수 있게 설계했습니다.

---

## Impact

> **Assets**:
> - `img_source/aiAgent_projectImpact1.svg`
> - `img_source/aiAgent_projectImpact2.svg`
> - `img_source/aiAgent_projectImpact3.svg`

### 정량적 성과
- 키워드 분류 **2,050+**건 처리
- AI 정합성 **99%**

### 정성적 성과
- **작업 타임라인 99% 단축**: 1~2일 소요되던 CDJ 차트 작성 타임라인을 AI 자동 분류와 시각화를 통해 10분 이내로 단축.
- **2,050건+ 분석 프로젝트 완료**: 운영 4개월 간 2,050건 이상의 분석 프로젝트가 성공적으로 완료되며 일관된 품질의 CDJ 보고서가 대량 생산되는 체계 구축.
- **554명 활성 사용자 확보**: 핵심 분석 솔루션으로 자리매김하며 554명의 활성 사용자를 확보했습니다.

### Lesson Learned
기술을 '이해'하고 설계하는 화면은 기술과 사용자 사이의 간극을 메울 수 있음을 알 수 있었습니다. AI 파이프라인의 프롬프트 및 구현 방법을 직접 학습하고 이해하여, 사용자 친화적 언어로 인터페이스를 설계할 수 있었습니다.
