---
project_id: "designSystem_project"
title: "디자인 시스템 구축"
headline: "빌드 타임 -98%, 코드 라인 -40%, 생산성 UP"
period: "약 6개월"
role: "Product Planning & Design (Design Token Architecture, Component Library)"
contribution: |
  Cursor AI 활용 14만 줄 레거시 코드 중복 패턴 분석
  디자인 토큰 체계 및 23개 핵심 컴포넌트 설계
  반응형 그리드 시스템(12/8/4) 기획
  피그마 베리언트 협업 구조 구축
tools: ["Figma", "Cursor AI"]
category: "main"
status: "complete"
figma_page: "https://www.figma.com/design/yC4yaCpntjTfgvpaRrn8WT/portfolio_with_claude?node-id=30-1514&m=dev"
cover_image: "img_source/img/project3_cover.png"
release: "Released (SaaS B2B)"
team: "FE 4, PD 2"
pdf_pages: "15-20"
---

## Overview

> **Assets**: (없음)

디자인 시스템 구축으로 레거시 코드 5.5만 줄 제거. 크로스펑셔널 협업으로 개발 생산성 향상.

---

## Problem

> **Assets**: `img_source/designSystem_projectProblem.svg`

디자이너가 코딩까지 직접 하다 보니, 같은 모양의 버튼이나 박스를 매번 복사해서 붙여넣는 방식으로 작업했습니다. 그 결과 중복 코드가 쌓였습니다.

수많은 코드 / SCSS 스타일 코드 13,360 Lines / 비사용 모듈 422 Packages / 느린 개발 서버 구동에 평균 90초 소요 / 빌드에 평균 6분 소요 / 사용자 경험 로딩 속도 3.8초 / 렌더링 시간 3.8초.

### 정량 데이터
중복 코드 14만 줄, 로딩 3.8초, 서버 구동 22초 소요.

### 정성 데이터 (VOC)
중복 코드로 인해 유지보수와 성능 모두에서 어려움이 발생하고 있었습니다. (팀 논의 기반 정의)

---

## Strategy

> **Assets**: `img_source/designSystem_projectStrategy.svg`

현재 폴더의 스타일 구조를 다시 살펴보고 재구축하자.

"자주 사용되는 스타일 패턴들을 종합해서 알려줘" (Cursor AI 프롬프트 활용)

우리는 '디자인 시스템'을 도입하기로 했습니다. 팀 전체가 따르는 일관된 규칙을 만드는 것입니다.

- **디자인 토큰**: 색상, 글꼴, 간격 등에 쉬운 이름을 붙여 관리.
- **중앙 관리**: 한곳에서 규칙을 바꾸면 모든 화면이 자동으로 변경.
- **반복되는 스타일의 토큰화** / **23가지 핵심 컴포넌트 선정**.

### Goal & Hypothesis
반복되는 코드를 디자인 시스템으로 정리해서 관리하면, 중복 코드를 30% 이상 제거하고 서버 구동 시간을 5초 이내로 단축할 것이다.

---

## Solution A

> **Assets**: `img_source/designSystem_projectSolution-A.svg`

Cursor AI를 통해 중복 패턴을 찾아내고, SCSS 코드를 MUI 기반의 최신 시스템으로 100% 전환하여 개발 효율을 극대화했습니다.

### AI 분석
'Cursor AI'라는 도구로 코드를 분석해 중복된 패턴을 찾아냈습니다.

### 컴포넌트화
버튼(Button), 입력창(TextField)처럼 자주 쓰는 요소를 재사용 가능한 부품으로 만들었습니다. 예전에는 버튼 하나를 만들 때마다 30줄씩 코드를 썼지만, 이제는 단 1줄이면 됩니다.

---

## Solution B

> **Assets**: `img_source/designSystem_projectSolution-B.svg`

4층 컬러 토큰 체계와 6종 차트 카탈로그를 적용하여 어떤 화면에서도 '빨간색=증가' 같은 일관된 시각 언어를 유지합니다.

### AS-IS
색의 의미를 고정하다 — 4층 토큰 구조.

차트 색상 4층 분리:
- **Categorical**: 시리즈 순환 8색
- **Semantic**: INCT·Trend 의미 고정색
- **Plan**: 요금제 엔티티 5색
- **Topic**: 고밀도 카테고리 20~26색

### TO-BE
데이터 목표에 맞는 차트 선택 — 6종 카탈로그(Line, Bar, Bump, Bubble, Sparkline, Network).

Chart Anatomy 구성 요소 표준: Grid(점선, grey-200) / Series line / Tooltip / Highlight point / Legend(하단 좌측 정렬).

**원칙 Do's**
- 의미가 고정된 값(INCT, Trend, Plan)은 항상 같은 색으로 매핑
- 시리즈 수 ≤ 8이면 lineChart, 그 이상은 topic
- Grid 라인은 점선 dashed + grey-200
- Tooltip은 값 오른쪽 정렬·서수 tabular-nums
- Bump 차트 Y축은 반전(1등이 위)

**원칙 Don'ts**
- Intent(INCT)에 lineChart 팔레트 순환 사용 금지
- 증감 색(Increase/Decrease)을 브랜드 Primary와 혼용 금지
- 3 시리즈 이하에서 topic 20색 사용 금지
- Grid 라인 실선 사용 금지(시각적 노이즈)
- Bar 차트 모서리 radius > 4px 금지(값 인지 왜곡)

---

## Impact

> **Assets**:
> - `img_source/designSystem_projectImpact-1.svg`
> - `img_source/designSystem_projectImpact-2.svg`
> - `img_source/designSystem_projectImpact-3.svg`

### 정량적 성과
- 빌드 타임 **-98%**
- 코드 라인 **-40%**
- 생산 속도 **UP**

### 정성적 성과
- **로딩 시간 단축**: 거의 2배 빨라진 속도로 사용자 경험을 개선했습니다.
- **개발 생산성 향상**: 서버 구동 시간이 22초에서 0.2초로 단축되었습니다.
- **코드 감축**: 전체 코드의 약 40%인 5만 5천 줄을 제거하여 가볍고 빠른 서비스.

### Lesson Learned
디자인 시스템은 예쁜 그림이 아니라 기술적 부채를 해결하는 엔지니어링입니다. 토큰 설계 역량을 통해 어떤 제품에서든 디자인-개발 간 일관된 협업 구조를 구축할 수 있습니다.
