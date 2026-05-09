# Resume Sync: 프로젝트 성과 → 이력서 자동 반영

`projects/*_project.md`의 Impact 섹션과 frontmatter를 읽어 `projects/resume.md`와 `projects/_metrics_registry.md`를 자동 갱신합니다.

## 실행 절차

1. `projects/` 디렉토리의 모든 `*_project.md` 파일을 읽어 각 프로젝트의 frontmatter(headline, period, role)와 Impact 섹션(정량적 성과, 정성적 성과)을 파싱합니다.
2. `projects/_metrics_registry.md`를 최신 데이터로 갱신합니다. 상단의 `마지막 갱신` 날짜도 오늘로 업데이트합니다.
3. `projects/resume.md`에서 `<!-- sync:* -->` 마커를 찾아 각 섹션을 업데이트합니다.

## 동기화 규칙

### 소개 섹션 (`<!-- sync:intro -->`)
- 가장 임팩트 있는 hero_metric 2~3개를 소개 첫 문단에 반영
- 두번째 문단은 주요 프로젝트별 핵심 성과 1줄씩 요약
- 수치가 변경된 경우에만 갱신 (문체는 유지)

### Experience 섹션 (`<!-- sync:experience:{projectId} -->`)
- 각 프로젝트의 headline을 Experience 소제목(**볼드**)과 대조
- Impact 정량적 성과를 Experience의 불릿 포인트와 매칭
- **수치가 변경된 항목만** 갱신 — 문체와 표현은 기존 것을 유지
- 프로젝트 period가 변경된 경우 해당 라인도 갱신

### Strength 섹션 (`<!-- sync:strength -->`)
- 프로젝트 성과 수치를 Strength 근거로 사용하는 부분만 갱신
- 예: "코드 라인 수의 40% 감소", "13,360줄의 SCSS" 등의 수치

### Application Motivation 섹션 (`<!-- sync:application_motivation -->`)
- base resume의 범용 지원동기에 사용된 수치만 갱신
- 회사별 커스터마이징은 `applications/{company}/resume_overlay.md`에서 관리

## 출력 형식

변경사항을 아래 형식으로 보여주고, 사용자 승인 후 반영합니다:

```
## 동기화 결과

### _metrics_registry.md 변경사항
- [projectId] hero_metric: "기존값" → "새값"

### resume.md 변경사항
| 섹션 | 위치 | 기존 | 변경 |
|------|------|------|------|
| Experience:pathDual | 소제목 | "검색량 +26.4%..." | "검색량 +27.1%..." |

### 변경 없음
- (수치 변동 없는 프로젝트 목록)
```

## 주의사항

- **수치만 동기화합니다.** 문체, 어순, 표현 방식은 기존 resume.md의 것을 유지합니다.
- frontmatter의 `status: excluded` 프로젝트는 동기화에서 제외합니다.
- 동기화 후 반드시 사용자 승인을 받은 뒤 파일에 반영합니다.
- `applications/` 폴더의 `resume_overlay.md`는 이 커맨드로 수정하지 않습니다. 기업별 오버레이는 `/build-application`으로 관리합니다.
