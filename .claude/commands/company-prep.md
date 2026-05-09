# Company Prep: 기업 지원 종합 준비 워크플로

기업명을 인자로 받아 포트폴리오 동기화 → 지원 폴더 생성/갱신 → 콘텐츠 검수를 순차 실행합니다.

## 사용법
```
/company-prep {기업명}
```

## 실행 절차

### Step 1: /resume-sync 실행
- 프로젝트 파일의 최신 성과 데이터를 resume.md와 _metrics_registry.md에 동기화합니다.
- 변경사항이 있으면 diff를 보여주고 사용자 승인 후 반영합니다.
- 변경이 없으면 "메트릭 동기화: 변경 없음" 출력 후 다음 단계로 진행합니다.

### Step 2: /build-application {기업명} 실행
- 해당 기업의 `applications/{company}/` 폴더를 생성 또는 갱신합니다.
- portfolio_lineup.md, resume_overlay.md, resume_final.md를 최신 상태로 만듭니다.

### Step 3: 콘텐츠 검수
- `resume_overlay.md`의 소개, Strength, Application Motivation에 대해 아래 체크를 수행합니다:
  1. **JD 키워드 미러링**: portfolio_lineup.md의 JD 미러링 용어가 overlay에 충분히 반영되었는가?
  2. **수치 정확성**: overlay에 사용된 수치가 _metrics_registry.md와 일치하는가?
  3. **뻔한 표현 탐지**: `docs/portfolio_analysis.md` 기준의 뻔한 표현이 없는가?
  4. **논리 흐름**: 소개 → Strength → Application Motivation 간 일관된 메시지가 전달되는가?

### Step 4: 준비 완료 체크리스트 출력

```markdown
# ✅ {기업명} 지원 준비 완료 — YYYY-MM-DD

## 동기화 상태
- [x] resume.md 메트릭 동기화 완료
- [x] _metrics_registry.md 최신 상태

## 지원 자료
- [x] portfolio_lineup.md — 프로젝트 {N}개 배치, 칵테일: {배합 요약}
- [x] resume_overlay.md — 소개/Strength/Application Motivation 작성
- [x] resume_final.md — base + overlay 병합 완료

## 콘텐츠 검수
- [x/△/✗] JD 키워드 미러링: {결과}
- [x/△/✗] 수치 정확성: {결과}
- [x/△/✗] 뻔한 표현 없음: {결과}
- [x/△/✗] 논리 흐름 일관성: {결과}

## 남은 수동 작업
- [ ] Figma에서 프로젝트 순서 조정 (portfolio_lineup.md 참고)
- [ ] resume_final.md를 Figma 이력서 페이지에 반영
- [ ] 지원서 제출
```

## 주의사항

- 각 Step에서 오류가 발생하면 해당 Step에서 중단하고 사용자에게 알립니다.
- Step 3의 검수에서 이슈가 발견되면 수정안을 제시하고, 사용자 승인 후 반영합니다.
- 이 커맨드는 `applications/` 폴더 외의 파일(Figma 등)은 수정하지 않습니다.
