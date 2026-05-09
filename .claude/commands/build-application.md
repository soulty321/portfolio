# Build Application: 기업별 지원 폴더 생성/갱신

기업명을 인자로 받아 `applications/` 폴더에 해당 기업의 맞춤 지원 자료를 생성하거나 갱신합니다.

## 사용법
```
/build-application {기업명}
/build-application --all
```

## 실행 절차

### 1. 기업 정보 수집
1. `$ARGUMENTS`에서 기업명을 파싱합니다.
2. 해당 기업을 아래 소스에서 탐색합니다:
   - `C:/Users/soult/workSpace/master_agent/followup_companies.md` — 기업 상태, 마감일, 메모
   - `C:/Users/soult/workSpace/master_agent/daily_reports/jobs/` — 최신 job report에서 JD 분석, 칵테일 전략
3. 기업을 찾지 못한 경우 사용자에게 알리고 중단합니다.

### 2. 폴더 생성 또는 갱신

**신규 생성 (폴더가 없는 경우):**
1. `applications/_template/`에서 `portfolio_lineup.md`와 `resume_overlay.md`를 복사합니다.
2. job report의 JD 분석을 기반으로 각 파일을 채웁니다:
   - `portfolio_lineup.md`: JD 키워드, 칵테일 배합, 프로젝트 순서, JD 미러링 용어
   - `resume_overlay.md`: 소개, Strength, Application Motivation을 회사 맞춤 작성
3. `resume_final.md`를 생성합니다 (아래 4단계).

**갱신 (폴더가 이미 있는 경우):**
1. 기존 `portfolio_lineup.md`와 `resume_overlay.md`를 읽습니다.
2. 최신 job report와 비교하여 변경사항을 확인합니다.
3. 변경이 필요한 경우 diff를 보여주고 사용자 승인 후 반영합니다.

### 3. 칵테일 전략 배합 결정 기준

job report에 칵테일 전략이 있으면 그대로 사용합니다. 없으면 아래 기준으로 배합합니다:

| 회사 유형 | 문제해결 | 시스템설계 | AI설계 | 비주얼 | 데이터기반 |
|-----------|----------|-----------|--------|--------|-----------|
| B2B SaaS | 45% | 35% | 10% | 10% | — |
| AI 서비스 | 30% | 25% | 35% | 10% | — |
| 플랫폼/마켓 | 40% | 25% | — | 15% | 20% |
| 핀테크 | 35% | 20% | 15% | 10% | 20% |

### 4. resume_final.md 생성 (base + overlay 병합)

1. `projects/resume.md`(base resume)를 읽습니다.
2. `resume_overlay.md`에서 Override 섹션을 추출합니다.
3. base resume의 해당 섹션을 overlay 내용으로 교체합니다:
   - `## 소개` → overlay의 `## 소개 (Override)`
   - `## Strength` → overlay의 `## Strength (Override)`
   - `## Application Motivation` → overlay의 `## Application Motivation (Override)`
4. sync 마커(`<!-- sync:* -->`)는 제거하여 깔끔한 최종본을 생성합니다.
5. 결과를 `applications/{company}/resume_final.md`에 저장합니다.

### 5. 검수

생성/갱신된 파일에 대해 간단한 체크를 수행합니다:
- [ ] portfolio_lineup.md에 JD 키워드가 3개 이상 있는가?
- [ ] resume_overlay.md에 소개, Strength, Application Motivation이 모두 작성되었는가?
- [ ] resume_final.md가 정상적으로 병합되었는가?
- [ ] JD 미러링 용어가 resume_overlay.md에 반영되었는가?

검수 결과를 사용자에게 보여줍니다.

## `--all` 모드

`--all` 플래그가 있으면 `applications/` 디렉토리의 모든 기업 폴더(`_template` 제외)에 대해 순차적으로 갱신합니다.

## 주의사항

- `_template/` 폴더는 수정하지 않습니다.
- overlay의 Override 섹션만 base resume를 덮어씁니다. 명시되지 않은 섹션(Experience, Education, Skills 등)은 base resume를 그대로 유지합니다.
- 기업 폴더명은 영문 소문자 + 언더스코어 형식을 사용합니다 (예: `toss_securities`, `kakaobank_ai`).
