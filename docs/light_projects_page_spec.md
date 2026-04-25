# 라이트 프로젝트 페이지 기획서
> 당근 모임 (5장) · 무노아트 (2장)
> 작성일: 2026-04-25

---

## 디자인 원칙

- **스캐너빌리티 우선**: 면접관이 30초 안에 핵심을 파악할 수 있어야 함
- **텍스트 최소화**: 불릿 포인트 + 굵은 수치로 시선 유도
- **Heavy 프로젝트와 시각적 대비**: 레이아웃 밀도·컬러 톤에서 의도적으로 가볍게
- **모바일 기준 16열 그리드**, 여백 넉넉히 (패딩 최소 48px)

---

---

# PROJECT A — 당근 모임 (5 Pages)

> **포지셔닝**: B2B SaaS 연속 후 등장하는 환기 프로젝트.
> 논리적 무게를 낮추고, 사람·커뮤니티·행동심리 중심의 감성 스토리로 전환.

---

## Page A-1 · Overview (커버)

```
레이아웃: 좌(텍스트 60%) / 우(커버 이미지 40%)
배경: 따뜻한 오렌지-앰버 계열 (#FFF4E6 또는 당근 브랜드 컬러)
```

### 콘텐츠 블록

| 영역 | 타입 | 내용 |
|------|------|------|
| TAG 뱃지 | chip × 3 | `Community Building` · `Retention` · `Gamification` |
| HEADLINE | h1 (large, bold) | 심리적 장벽을 넘는 '3번의 작은 성공',<br>정체된 커뮤니티를 **300% 성장**시키다 |
| SUMMARY | body | 당근 모임 3회 출석 챌린지 (Gamification for Retention) |
| KEY METRICS | stat-card × 3 | `참여자 300% 성장 (1.4명→4.2명)` · `지역 랭킹 1위` · `Retention UP` |
| 구분선 | divider | — |
| ROLE | label + text | 프로덕트 기획 및 디자인 (게이미피케이션, 브랜딩, 커뮤니티 운영) |
| CONTRIBUTION | bullet list | • 퍼널 데이터 분석 및 설문·심층 인터뷰 설계(5 Whys)<br>• Hook Model 기반 3회 출석 게이미피케이션 UX 전략<br>• QR 스탬프 인증 시스템 GUI 설계<br>• 모임 전용 굿즈 브랜딩 |
| PERIOD / TEAM | meta | `2개월 (Ongoing)` · `Solo` |
| 커버 이미지 | image | `project5Cover.png` (스탬프 카드 또는 굿즈 비주얼 권장) |

### 디자인 노트
- Stat card 숫자는 32px+ bold, 레이블은 12px gray
- 배경을 당근 오렌지 계열로 설정해 앞 프로젝트(designSystem 회색/청색 계열)와 확실히 대비

---

## Page A-2 · Problem (문제 발굴)

```
레이아웃: 상단(타이틀+설명 40%) / 하단(좌: 정량 | 우: 정성 인용구 60%)
섹션 라벨: "01 — Problem"
```

### 콘텐츠 블록

| 영역 | 타입 | 내용 |
|------|------|------|
| PROBLEM TITLE | h2 | 데이터가 가리킨 **2회차 방문으로 이어지지 않는** 원인 |
| BACKGROUND | body (short) | 신규 유저가 모임의 핵심 가치(집중, 연대)를 느끼기 전,<br>'어색함'과 '목표 부재'로 인해 1회성 방문 후 이탈하는 현상 발생. |
| 구분선 | divider | — |
| QUANT | highlight-card | **월평균 참여자 1.4명 정체**<br>퍼널 분석 결과 1회 참여 후 재방문율 급감. |
| QUAL | quote-block × 2 | _"기존 멤버들끼리 너무 친해 보여서 끼기 힘들어요."_<br>_"뚜렷한 목표가 없으니 한 번 가보고 안 가게 돼요."_ |
| 이미지 | image | `/stitch_source/dangen_projectProblem.svg` |

### 디자인 노트
- QUANT는 배경 컬러 블록(연한 오렌지)으로 강조
- QUAL 인용구는 큰따옴표 타이포 장식(64px gray) + italic 처리

---

## Page A-3 · User Research (사용자 리서치)

```
레이아웃: 좌(리서치 방법론 + 인사이트 50%) / 우(이미지 50%)
섹션 라벨: "02 — User Research"
```

### 콘텐츠 블록

| 영역 | 타입 | 내용 |
|------|------|------|
| STRATEGY TITLE | h2 | 7명의 실제 유저 심층 인터뷰로<br>**'재방문의 진짜 이유'**를 발견하다 |
| STRATEGY DESC | body (short) | Design Thinking: Empathize → Define → Ideation.<br>5 Whys 심층 인터뷰로 모임에서 발견하는 핵심 가치를 구조화했습니다. |
| CAUSE 라벨 | section-label | 인터뷰 참여자 & 핵심 발견 |
| CAUSE DESC | bullet × 3 | • 최소 3회 참여 후 '혼자보다 같이'의 가치를 체감<br>• 집중·연대감은 첫 방문의 어색함을 넘어야 발현됨<br>• **3회 완주 장치**가 Aha Moment와 리텐션의 열쇠 |
| HYPOTHESIS | callout-box | 공통 인사이트: 유저는 '혼자보다 같이'의 가치를 **최소 3회 참여 후** 체감.<br>→ **3회 경험을 완주하게 만드는 장치**가 리텐션의 열쇠. |
| 이미지 | image | `/stitch_source/dangen_projectStrategy.svg` |

### 디자인 노트
- HYPOTHESIS는 테두리 있는 callout box (오렌지 left-border 4px)
- 인터뷰 인원 "7명"을 큰 숫자로 시각적 강조(48px bold)

---

## Page A-4 · Improvement Proposal (개선 제안)

```
레이아웃: 좌(설명 40%) / 우(이미지 60%)
섹션 라벨: "03 — Improvement Proposal"
```

### 콘텐츠 블록

| 영역 | 타입 | 내용 |
|------|------|------|
| SOL A TITLE | h2 | 막연한 방문을 **'도전'**으로 바꾸는<br>게이미피케이션(Gamification) |
| SOL A SUMMARY | body | 신규 유저의 심리적 진입 장벽을 낮추기 위해 보상을 통해 완결 욕구를 자극했습니다.<br>3회 참여 달성 → 유저가 '함께하는 가치'를 발견하는 순간. |
| 구분선 | divider | — |
| DESC 1 | feature-row | **Social Proof Onboarding**<br>"멤버의 80%가 3번 참여 후 습관을 만들었어요!" 문구로 진입 장벽 완화. |
| DESC 2 | feature-row | **Variable Feedback**<br>1회차: "시작이 반이에요!" / 2회차: "한 번만 더 오면 선물 획득!" (완결 욕구 자극) |
| DESC 3 | feature-row (highlight) | **The Aha-Moment**<br>3회 스탬프를 채우는 과정에서 "혼자보다 같이 하니 훨씬 잘되네?"라는 본질적 가치 경험. |
| 이미지 | image | `/stitch_source/dangen_projectSolution.svg` |

### 디자인 노트
- Feature row: 왼쪽 번호(01/02/03) + 굵은 타이틀 + 설명 구조
- DESC 3 (Aha-Moment)는 배경 강조 처리 — 전체 스토리의 클라이맥스

---

## Page A-5 · Impact (성과)

```
레이아웃: 상단(아웃컴 카드 3열) / 하단(레슨런 full-width)
```

### 콘텐츠 블록

| 영역 | 타입 | 내용 |
|------|------|------|
| OUTCOME 1 | impact-card | **참여자 3배 증가**<br>월 평균 1.4명 → 4.2명<br>이미지: `dangen_projectImpact-1.svg` |
| OUTCOME 2 | impact-card | **일반 유저 리뷰 수 증가**<br>방장 70% 작성 → 유저 50%+ 작성<br>이미지: `dangen_projectImpact-2.svg` |
| OUTCOME 3 | impact-card | **헤비 유저 형성**<br>최대 40회 이상 참여하는 핵심 유저층 형성<br>이미지: `dangen_projectImpact-3.svg` |
| LESSON | quote-box (full-width) | _"굿즈 받으러 왔다가 습관 얻고 갑니다"_<br>리텐션의 핵심은 첫 3회 경험을 별도 퍼널로 분리하여 '작지만 확실한 명분'을 제공하는 것입니다. |

### 디자인 노트
- Impact card: 숫자/결과 bold large → 설명 small gray → 이미지 하단
- LESSON: 인용 큰따옴표 장식, 배경 오렌지 연하게, 전체 폭 사용

---

---

# PROJECT B — 무노아트 (2 Pages)

> **포지셔닝**: 포트폴리오 마지막 클로저.
> 창업·비즈니스·데이터의 조합으로 "디자이너 = 비즈니스 파트너"를 각인.

---

## Page B-1 · Overview (커버)

```
레이아웃: 좌(텍스트 55%) / 우(커버 이미지 45%)
배경: 다크 네이비 또는 딥 차콜 (#1A1A2E 계열) — 앞 프로젝트들과 확실한 대비
```

### 콘텐츠 블록

| 영역 | 타입 | 내용 |
|------|------|------|
| TAG 뱃지 | chip × 3 | `Fan-sumer` · `Data Commerce` · `Brand Strategy` |
| HEADLINE | h1 (large, bold) | 팬덤의 목소리(VOC)를 시각화하여<br>**영업이익률 50.5%**의 비즈니스를 구축하다. |
| SUMMARY | body | 소셜 미디어 VOC를 구매 시그널로 포착하여, 광고비 없이 오가닉 바이럴만으로<br>4년 평균 영업이익률 50.5%를 달성한 1인 아트 커머스 브랜드를 구축했습니다. |
| KEY METRICS | stat-card × 3 | `50.52% — 4년 평균 영업이익률`<br>`72.5% — 바이럴 구간 연 매출 성장률`<br>`1,100+ — 오가닉 반응 (좋아요/댓글/공유)` |
| 구분선 | divider | — |
| ROLE | label + text | 창업 및 브랜드 기획 총괄 · 프로덕트 디자인 · 데이터 분석 |
| CONTRIBUTION | bullet list | • 1인 창업 총괄 (기획·디자인·운영 100%)<br>• 소셜 미디어 VOC 분석 기반 상품화 기획<br>• 기계적 미학 아트워크 창작 (네임택 330건·케이스 59건)<br>• 가치 기반 가격 전략 수립 및 Lean Startup 프로세스 운영 |
| PERIOD / TEAM | meta | `2018.12 - 2023.12` · `Solo (1인 창업)` |
| 커버 이미지 | image | `project6Cover.svg` (아트워크 또는 굿즈 비주얼) |

### 디자인 노트
- 다크 배경 위에 골드/화이트 타이포로 프리미엄 아트 브랜드 느낌 연출
- 영업이익률 **50.52%** 숫자를 가장 크게 — 면접관이 1초 만에 인지
- Stat card를 다크 배경 위 글로우 효과 또는 골드 테두리로 차별화

---

## Page B-2 · Impact (데이터 기반 성과)

```
레이아웃: 상단(아웃컴 카드 3열) / 하단(레슨런 full-width)
배경: Page B-1과 동일 다크 계열 유지
```

### 콘텐츠 블록

| 영역 | 타입 | 내용 |
|------|------|------|
| OUTCOME 1 | impact-card | **Build-Measure-Learn 실행**<br>MVP(일러스트 시안) 공개 → VOC 측정 → 굿즈 구현.<br>유저가 스스로 마케터가 되는 구조 설계.<br>이미지: `munoArt_projectImpact1.svg` |
| OUTCOME 2 | impact-card | **유저 보이스 (Fan VOC)**<br>"굿즈 나오면 진짜 사고 싶습니다"<br>"악기 하는 친구들에게 알려줘야겠다" — 자발적 바이럴의 증거<br>이미지: `munoArt_projectImpact2.svg` |
| OUTCOME 3 | impact-card (highlight) | **데이터 성과 요약**<br>**50.52%** 4년 평균 영업이익률<br>**+72.5%** 연 매출 성장률 (190만→328만원)<br>**1,100+** 오가닉 반응<br>**CAC = 0** 광고비 없이 95%+ 오가닉 도달<br>이미지: `munoArt_projectImpact3.svg` |
| LESSON | quote-box (full-width) | **Designer as Business Partner**<br>고객 VOC를 데이터로 검증하고 '팔리는 디자인'으로 연결하는 것이 진짜 설계입니다.<br>이 경험이 B2B SaaS 제품에서도 비즈니스 임팩트를 최우선으로 고려하는 설계 철학의 기반이 됩니다. |

### 디자인 노트
- OUTCOME 3 (데이터 성과)는 4개 지표 각각 bold 숫자 + 짧은 레이블로 배치 — 리스트가 아닌 2×2 그리드로 배치 권장
- LESSON: "Designer as Business Partner" 타이틀 강조, 나머지는 body small
- 포트폴리오 마지막 장이므로 하단에 이름+이메일 contact 정보 표시 고려

---

## 전체 페이지 요약

| # | 프로젝트 | 페이지 | 섹션 | 핵심 메시지 |
|---|----------|--------|------|------------|
| A-1 | 당근 | Overview | 커버 | 300% 성장, 소개 |
| A-2 | 당근 | Problem | 문제 발굴 | 1회성 이탈 데이터 |
| A-3 | 당근 | Research | 사용자 리서치 | 3회=Aha Moment |
| A-4 | 당근 | Proposal | 개선 제안 | 게이미피케이션 설계 |
| A-5 | 당근 | Impact | 성과 | 참여자 3배, 헤비유저 |
| B-1 | 무노아트 | Overview | 커버 | 영업이익률 50.5% |
| B-2 | 무노아트 | Impact | 데이터 성과 | CAC=0, 바이럴 구조 |
