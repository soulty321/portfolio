---
project_id: "myKeyword_project"
title: "마이키워드 — 키워드 리서치 도구"
headline: "처리 시간 -99% (3일→1분), 키워드 +4,400개, 엑셀 작업 제거"
period: "2023.11 - 2024.07"
role: "Product Design (UX/UI Design · Prototyping · QA)"
contribution: |
  고객사 인터뷰 직접 수행 및 문제 정의
  퍼블리싱 범위 정의 및 개발 QA
  고객 여정 전반의 사용자 경험 설계
tools: ["Figma"]
category: "main"
status: "complete"
figma_page: "https://www.figma.com/design/yC4yaCpntjTfgvpaRrn8WT/portfolio_with_claude?node-id=30-1511&m=dev"
cover_image: "img_source/img/project2_cover.png"
release: "Released (SaaS B2B)"
team: "PM 1, FE 1, BE 1, PD 1"
pdf_pages: "9-14"
---

## Overview

> **Assets**: (없음)

매달 3일씩 걸리던 엑셀 보고서를 버튼 클릭 한 번으로 자동화. 키워드 등록 4,400개 돌파.

---

## Problem

> **Assets**: `img_source/myKeyword_projectProblem.svg`

사용자는 지난달과 이번 달 데이터를 비교하려면 엑셀을 켜서 직접 복사+붙여넣기를 해야 했습니다. 서비스 내에서는 비교 분석 기능이 없었기 때문에, 이 반복 작업이 사용자를 지치게 만들었습니다.

### 정량 데이터
리포트 작성에 3일 소요, 서비스 내 비교 분석 기능 부재.

### 정성 데이터 (VOC)
- "작년 이맘때랑 비교해야 진짜 비교가 가능하죠. 기능이 없어서 매달 엑셀로 직접 정리하고 있습니다."
- "매달 데이터가 사라질까 봐 불안한데, 그걸 또 다운받아서 엑셀로 지난 데이터랑 수작업으로 비교하고 있어요." — 유제품 브랜드 마케터 (고객사)
- "저희에겐 월/년 동기 대비 분석이 필수거든요."

---

## Strategy

> **Assets**: `img_source/myKeyword_projectStrategy.svg`

사용자가 서비스 밖에서 반복하고 있는 작업을 서비스 안으로 가져올 수 있다면 어떨까요?

### Problem Cause
사용자가 엑셀을 쓰는 진짜 이유는 '데이터 비교' 때문이었습니다. 서비스 내에 과거 데이터가 없으니, 억지로 엑셀을 써야만 비교가 가능했던 것입니다.

### HOOK Model 적용
- **계기**: 매달 데이터를 다운로드하지 않으면 비교가 불가능해 불안해요.
- **행동**: 복잡한 설정 없이, 클릭 한 번으로 '관심' 등록.
- **가변적 보상**: 저장 즉시 최신 시점부터 1년 전 데이터까지 확인되도록 제공.
- **투자**: 데이터가 쌓일수록 브랜드 맞춤 시장 분석 리포트가 완성됨.

### Goal & Hypothesis
버튼만 누르면 1년 전 데이터까지 자동으로 찾아와 비교해주자. 그러면 엑셀 다운로드 월 290회를 0으로 줄이고, 키워드 등록 수를 2배 이상 증가시킬 것이다.

---

## Solution A

> **Assets**: `img_source/myKeyword_projectSolutionA.svg`

과거 데이터까지 자동으로 찾아와 비교 그래프를 그려줍니다.

### 자동 데이터 수집
버튼 한 번으로 1년 전 데이터까지 자동 수집.

### 자동 시각화
수집된 데이터를 비교 그래프로 즉시 시각화.

### AS-IS
기존에는 비교를 원하는 키워드를 엑셀로 정리하여, 매월 정해진 시점에 다운로드 및 비교를 진행하였습니다.

### TO-BE
오늘 저장해도 시스템이 알아서 1년 전 데이터까지 찾아와 즉시 그래프를 그려줍니다.

---

## Solution B

> **Assets**: `img_source/myKeyword_projectSolutionB.svg`

매월 수백 개 키워드를 일일이 훑던 사용자를 위해, 원하는 기준으로 묶어 우선순위 키워드부터 확인하는 구조로 전환했습니다.

### AS-IS
기존에는 수많은 키워드를 그룹화하여 비교할 수 없었습니다. (분류가 어려운 키워드 그룹)

### TO-BE
등록 시 사용자가 원하는 카테고리를 지정하여, 다양한 테마의 분석을 진행할 수 있습니다.

---

## Impact

> **Assets**:
> - `img_source/myKeyword_projectImpact1.svg`
> - `img_source/myKeyword_projectImpact2.svg`
> - `img_source/myKeyword_projectImpact3.svg`

### 정량적 성과
- 처리 시간 **-99%** (3일 1분 → 1분)
- 키워드 **+4,400개**
- 엑셀 작업 **제거** (Free)

### 정성적 성과
- **리포트 작성 시간 단축**: 3일(72시간) 걸리던 엑셀 작업이 클릭 몇 번으로 해결되었습니다. (72시간 → 약 1분)
- **사용자 참여 증가**: 기능 오픈 직후 4,400개 이상의 키워드가 등록되었습니다.
- **VOC 고객 반응**: "지난 시간의 데이터를 서비스 내에서 확인할 수 있어, 다른 작업에 집중할 수 있게 됐어요!" — 인터뷰 대상 고객사

### Lesson Learned
고객이 서비스 밖에서 하던 일을 서비스 안으로 가져왔을 때, 비로소 팬이 됩니다. '서비스 밖 워크플로우 관찰 → 자동화 전환'을 모든 프로젝트의 첫 질문으로 삼아야 함을 알 수 있었습니다.
