---
project_id: "pathDual_project"
title: "경로 이원화 — 듀얼뷰 싱크 시스템"
headline: "키워드 분석 효율 +26.43% 향상"
period: "약 2개월"
role: "Product Planning & Design (듀얼뷰 UX 기획 주도, 특허 UI 설계)"
contribution: |
  리드 프로덕트 디자이너(기여도 100%)
  듀얼뷰 시스템 로직 및 3가지 비교 모드 기획
  동기화 인터랙션 특허 UI 설계
tools: ["Figma"]
category: "main"
status: "complete"
figma_page: "https://www.figma.com/design/yC4yaCpntjTfgvpaRrn8WT/portfolio_with_claude?node-id=30-1513&m=dev"
cover_image: "img_source/img/project1_cover.png"
release: "Released (SaaS B2B)"
team: "PM 1, FE 1, PD 1"
pdf_pages: "3-8"
---

## Overview

> **Assets**: (없음 — Overview 전용 에셋 없음)

유저 여정 기반 비교 탐색 경험 설계로 맥락 파악 시간 단축. 동기화 기술로 특허 획득.

---

## Problem

> **Assets**: `img_source/pathDual_projectProblem.svg`

'갤럭시' 데이터를 보다가 '아이폰'과 비교하려면 화면을 끄거나 새 창을 띄워야 했습니다. 방금 본 숫자가 기억나지 않아 왔다 갔다 해야 했죠.

### 정량 데이터
일부 사용자들은 화면을 일일이 캡처하거나, 별도로 데이터를 확인해가며 비교하고 있었습니다. (비교는 동시에 되는 것이 아닌, 새 탭 오픈 혹은 캡쳐를 별도로 처리)

### 정성 데이터 (VOC)
채널톡 로그 분석 결과, 비교 관련 문의의 70% 이상이 '두 데이터를 나란히 보고 싶다'는 요청. 사용자들은 캡처·새 창 띄우기로 우회하고 있었습니다.

---

## Strategy

> **Assets**: `img_source/pathDual_projectStrategy.svg`

인간의 단기 기억에는 한계가 있습니다. 두 데이터를 나란히 놓고 직접 비교할 수 있는 구조가 필요했습니다.

### Problem Cause
창을 왔다 갔다 하며 비교하는 '맥락 전환'이 문제였습니다. 인간의 단기 기억력에는 한계가 있어서, 화면을 넘기는 순간 앞의 숫자를 까먹게 됩니다.

양측 캔버스의 상호작용(클릭 시 스크롤, Zoom 처리)을 동기화하여 맥락 전환 비용을 제거하는 구조를 설정했습니다.

### Goal & Hypothesis
물리적으로 화면을 반으로 나누고, 양쪽을 동기화시키자. 맥락 전환 없이 비교가 가능해져 검색 사용량을 20% 이상 증가시킬 것이다.

---

## Solution A

> **Assets**: `img_source/pathDual_projectSolutionA.svg`

과거 데이터까지 자동으로 찾아와 비교 그래프를 그려줍니다.

### 특허받은 동기화 기술
왼쪽 화면을 확대하거나 클릭하면, 오른쪽 화면도 0.1초 만에 반응합니다.

### 듀얼 캔버스 (Dual Canvas)
두 화면은 하나처럼 움직이지만, 필요하면 연결을 끊고 각각 따로 볼 수 있습니다.

---

## Solution B

> **Assets**: `img_source/pathDual_projectSolutionB.svg`

복잡한 UI를 정리하여 데이터에 집중할 수 있는 환경을 제공합니다.

### AS-IS
화면 여기저기 흩어져서 지도를 가리던 '뷰 전환 버튼', '키워드 목록', '키워드 리스트 팝업' 같은 도구들을 정리하여야 실제 비교 뷰를 확장할 수 있었습니다.

### TO-BE
화면 가시성을 위해 앞서 있던 기능 및 동작 버튼들을 캔버스의 외곽으로 이동시켰습니다. 실제 사용자들이 더 넓은 화면에서 데이터를 확인할 수 있게 되었습니다.

---

## Impact

> **Assets**:
> - `img_source/pathDual_projectImpact1.svg`
> - `img_source/pathDual_projectImpact2.svg`

### 정량적 성과
- 키워드 분석 효율 **+26.43%** 향상

### 정성적 성과
- **검색량 증가**: 기능이 편해지자 사용자들이 데이터를 더 많이 검색하고 탐색했습니다.
- **특허 획득**: 독창성을 인정받아 특허가 등록되었습니다.

### Lesson Learned
데이터는 비교할 때 진짜 의미를 갖습니다. 이후 데이터 시각화 설계 시 '비교 맥락'을 기본 레이어로 포함하는 원칙을 적용하고 있습니다.
