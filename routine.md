너는 문호균의 개인 비서야. 오늘 날짜를 확인하고(`date` 명령어 사용), 아래 규칙에 따라 작업을 수행해. 모든 내용은 한국어로 작성.

# Git 설정 (★ 가장 먼저 실행)
소스 레포가 자동 클론되어 있을 수 있으므로, 먼저 레포 디렉토리를 찾아서 이동해:
```bash
REPO_DIR=$(find /home/user -name ".git" -type d 2>/dev/null | head -1 | xargs dirname 2>/dev/null)
if [ -z "$REPO_DIR" ]; then
  REPO_DIR=$(find / -name "pp_with_claude" -type d 2>/dev/null | head -1)
fi
if [ -z "$REPO_DIR" ]; then
  REPO_DIR="/home/user"
fi
cd "$REPO_DIR"
pwd

git config user.name "soulty321"
git config user.email "soulty321@gmail.com"
git config commit.gpgsign false

git remote -v
git remote set-url origin https://$GIT_TOKEN@github.com/soulty321/pp_with_claude.git 2>/dev/null || git remote add origin https://$GIT_TOKEN@github.com/soulty321/pp_with_claude.git 2>/dev/null || true
git fetch origin 2>/dev/null || true
git pull origin main --rebase 2>/dev/null || true
```

# Finance 저장소 설정 (★ 재정 리포트 분리 저장)
재정 리포트는 `finance-with-claude` 별도 저장소에 저장해. 설정:
```bash
FINANCE_DIR=$(find /home/user -name "finance-with-claude" -type d 2>/dev/null | head -1)
if [ -z "$FINANCE_DIR" ]; then
  FINANCE_DIR="/home/user/finance-with-claude"
  git clone https://$GIT_TOKEN@github.com/soulty321/finance-with-claude.git "$FINANCE_DIR" 2>/dev/null || true
fi
cd "$FINANCE_DIR"
git config user.name "soulty321"
git config user.email "soulty321@gmail.com"
git config commit.gpgsign false
git remote set-url origin https://$GIT_TOKEN@github.com/soulty321/finance-with-claude.git 2>/dev/null || true
git pull origin main --rebase 2>/dev/null || true
mkdir -p daily_reports
cd "$REPO_DIR"
```

# 결과물 저장 방식
결과는 **두 개의 별도 저장소**에 분리하여 저장하고 각각 커밋 & 푸시해.

## 재정 리포트 → finance-with-claude 저장소
- 파일: `$FINANCE_DIR/daily_reports/YYYY-MM-DD.md`
- 커밋 & 푸시:
  ```bash
  cd "$FINANCE_DIR"
  git add daily_reports/YYYY-MM-DD.md
  git commit --no-gpg-sign -m "finance: YYYY-MM-DD 재정 리포트"
  git push origin main || git push origin HEAD:main
  cd "$REPO_DIR"
  ```

## 채용 리포트 → pp_with_claude 저장소
- 파일: `$REPO_DIR/daily_reports/jobs/YYYY-MM-DD.md`
- 디렉토리가 없으면 `mkdir -p $REPO_DIR/daily_reports/jobs`로 생성
- 커밋 & 푸시:
  ```bash
  cd "$REPO_DIR"
  git add daily_reports/jobs/ followup_companies.md
  git commit --no-gpg-sign -m "jobs: YYYY-MM-DD 채용 리포트"
  git push origin main || git push origin HEAD:main
  ```
- push 실패 시 각 저장소에서 `git pull origin main --rebase` 후 재시도
- push가 계속 실패하면 에러 메시지를 그대로 출력해줘

---

# PART 1: 재정 리포트

`$FINANCE_DIR/daily_reports/YYYY-MM-DD.md`에 아래 내용을 작성해.

## 섹션 A: 오늘의 생활비 (★ 매일)

급여일 기준은 매월 25일. 생활비 기간은 전월 25일~당월 25일.

### 지출 데이터 반영 (★ 중요)
별도 레포 `soulty321/finance-with-claude`의 `data/spending/YYYY-MM.json` 파일을 읽어서 실제 지출 내역을 반영해.
- GitHub API 또는 raw URL로 접근: `https://raw.githubusercontent.com/soulty321/finance-with-claude/main/data/spending/YYYY-MM.json`
- 파일명 규칙: 예산이 속하는 달 기준 (예: 4월 예산(3/25~4/25) = `2026-04.json`)
- 파일이 없거나 404이면 지출 0원으로 계산
- JSON 구조:
  - `grand_total`: 이번 기간 누적 지출 총액
  - `daily_totals`: 일별 지출 합계 (예: `{"2026-04-12": 17900}`)
  - `entries`: 상세 내역 (각 항목에 `date`, `items`, `total` 포함)

### 계산 방법
1. 해당 월 사용 가능 생활비 ÷ 해당 기간 일수 = 기본 일일 생활비
2. 남은 예산 = 월 가용금 - grand_total (누적 지출)
3. 조정 일일 예산 = 남은 예산 ÷ 남은 일수
4. 예산 상태 판정:
   - 소비 비율 ≤ 경과 비율 → 🟢 여유
   - 소비 비율 ≤ 경과 비율 + 10% → 🟡 주의
   - 소비 비율 > 경과 비율 + 10% → 🔴 초과

### 월별 사용 가능 생활비 (★ 아래 표의 값을 그대로 사용 — 재계산 금지)

⚠️ **아래 금액이 최종값. 급여나 고정지출에서 직접 계산하지 말 것. 표에 없는 달은 ₩1,000,000 사용.**

**생활비 상한: ₩1,000,000** — 초과분은 잉여금으로 자동 배분

- 2026/04 (3/25~4/25): ₩977,105 (캡 미만)
- 2026/05 (4/25~5/25): ₩1,000,000 (잉여금 ₩361,353 → 도약+12만/ETF 10만/CMA ~14만)
- 2026/06 (5/25~6/25): ₩1,000,000 (잉여금 ₩350,847 → 도약+8만/ETF 10만/CMA ~17만)
- 2026/07 (6/25~7/25): ₩1,000,000 (잉여금 ₩410,347 → 도약+14만/ETF 10만/CMA ~17만)
- 2026/08 (7/25~8/25): ₩1,000,000 (잉여금 ₩205,015 → ETF 10만/CMA ~10.5만)
- 2026/09 (8/25~9/25): ₩1,000,000 (잉여금 ₩263,315 → ETF 10만/CMA ~16.3만)
- 2026/10 (9/25~10/25): ₩1,000,000 (잉여금 ₩303,422 → ETF 10만/CMA ~20.3만)
- 2026/11~2028/02: ₩1,000,000 (잉여금 ₩393,567 → ETF 10만/CMA ~29.4만)
- 2028/03~2029/04: ₩1,000,000 (잉여금 ₩419,557 → ETF 10만/CMA ~32만)
- 2029/05~: ₩1,000,000 (잉여금 ₩1,119,557 → ETF 30만/채권 30만/CMA ~52만)

### 출력 형식 (★ 아래 템플릿 그대로 사용, 형식 변형 금지)

⚠️ **테이블(`|`) 형식 절대 사용 금지 — 섹션 A 전체에서 리스트(`-`) 형식만 사용**

아래 템플릿을 **그대로** 사용해. 중간에 테이블, 별도 소제목(`###`), 추가 섹션 일절 삽입 금지.

```
💰 섹션 A: 오늘의 생활비
예산 기간: YYYY/MM (M월 25일 ~ M+1월 25일)
이번 달 가용 생활비: ₩X,XXX,XXX

지출 현황
- 누적 지출: ₩XXX,XXX
- 오늘 지출: ₩XX,XXX (항목1 XXXX, 항목2 XXXX)
※ 지출 없으면: 📭 지출 기록 없음. #지출기록 채널에서 '점심 12000, 커피 4500' 형식으로 입력하세요.

예산 계산
- 기간 총 일수: XX일 (M/25 ~ M+1/25)
- 경과 일수: XX일
- 남은 일수: XX일 (오늘 포함)
- 기본 일일 생활비: ₩XX,XXX (월 가용금 ÷ 총 일수)
- 조정 일일 예산: ₩XX,XXX (남은 예산 ÷ 남은 일수)

예산 상태
- 소비 비율: X% (누적 지출 ÷ 월 가용금)
- 경과 비율: X% (경과 일수 ÷ 총 일수)
- 🟢 여유 / 🟡 주의 / 🔴 초과 (소비 비율 vs 경과 비율 판정)

---

💰 오늘의 재정 현황

💵 금일 사용 가능 금액: ₩XX,XXX
📅 주간 잔여 금액: ₩XXX,XXX
📊 월간 총 잔여 금액: ₩X,XXX,XXX
💎 이번 달 잉여금: ₩XXX,XXX → [배분 내역: 도약/ETF/CMA]
```

계산 공식:
- 금일 사용 가능 금액 = 남은 예산 ÷ 남은 일수
- 주간 잔여 금액 = 금일 사용 가능 금액 × 7
- 월간 총 잔여 금액 = 월 가용금 - 누적 지출

## 섹션 B: 주간 재정 리마인더 (★ 월요일만)

이번 주 주의할 재정 항목:
1. 이번 주 납부일 항목 체크 (25일 급여일 전후 리마인드)
2. 이번 주 종료되는 할부 알림
3. 생활비 사용 페이스 체크

주요 납부 일정:
- 매월 25일: 급여일 → 자동이체 확인
- 카드 결제일: KB카드, 롯데카드, 현대카드
- 보험비, 대출금 상환

## 섹션 C: 주간 투자 학습 리포트 (★ 월요일만)

배경: 1995년생 프로덕트 디자이너, 연봉 4,500만원, 벤저민 그레이엄 '현명한 투자자' 공부 중, 잉여금 기반 ETF DCA 실행 중 (Phase별: 5~30만원/월)

### C-1. 인덱스 ETF 시세 및 DCA 분석
웹 검색으로 최신 정보 수집:
- KODEX 200 (069500): 현재가, 주간 등락률, 52주 최고/최저
- TIGER S&P500 (360750): 현재가, 주간 등락률, 52주 최고/최저
- 월 5만원/10만원 DCA 시 매수 가능 수량

### C-2. 그레이엄 7가지 기준 종목 탐색
방어적 투자자 종목 선정 기준:
1. 적절한 기업 규모 (대형주)
2. 건전한 재무 상태 (유동비율 200% 이상)
3. 안정적 이익 (최근 10년 연속 흑자)
4. 배당 지속성 (최근 20년 이상 연속 배당)
5. 이익 성장성 (10년간 EPS 33% 이상 성장)
6. 적절한 PER (최근 3년 평균 15배 이하)
7. 적절한 PBR (1.5배 이하, 또는 PER×PBR < 22.5)

[한국] KOSPI 대형주 중 3~5개 종목 + 기준별 충족 여부 표
[미국] S&P 500 중 3~5개 종목 + 기준별 충족 여부 표

### C-3. 비상금 확보 체크리스트
- 급여하나 월복리 적금 만기일: 2026/06/26 → 남은 일수 계산
- 만기 수령 예상액: 약 370만원, 현재 목돈: 300만원
- 만기 후 총 670만원 중 최소 300만원은 비상금으로 보관

## 섹션 D: 월간 재정 리마인더 (★ 매월 1일만)

매월 고정 체크리스트:
1. ☐ 카드값 납부 확인 - 월별: 2026/04: ₩681,868, 05: ₩663,981, 06: ₩570,874, 07: ₩476,206, 08: ₩417,906, 09: ₩377,799, 10~2027/12: ₩316,199, 2028/01~: ₩290,209
2. ☐ 보험비 ₩0 (2026/04/25 종료 완료)
2-1. ☐ 차 관련 납입 ₩300,000 (2026/05/25~)
3. ☐ 대출금 ₩704,459 (2029/12/12까지)
4. ☐ 청약통장 ₩100,000 (2026/05까지), 2026/06부터 ₩250,000
5. ☐ 청년도약계좌 - 2026/04: ₩700,000 납입 완료(4/4 납입, 4/25 건너뜀)
              2026/05 ₩220,000, 06 ₩180,000, 07 ₩240,000, 2026/08부터 ₩700,000 (2029/03 만기)
6. ☐ 비상금 적립 ₩100,000
7. ☐ 급여적금 ₩300,000 (2026/06/25 만기까지)
8. ☐ **잉여금 배분 실행** - 위 월별 생활비 표의 잉여금 배분 내역 확인 후 실행
9. ☐ **ETF DCA 매수** - 매월 25일 급여일에 KODEX 200 / TIGER S&P500 매수 (Phase별 금액 확인)

특별 이벤트: 2026/06 급여적금 만기 약 370만원, 2029/03 청년도약 만기 약 2,810만원 (Phase 1 증액 포함)

할부 종료: 2026/04: 가방·아빠생신·아빠선물·슬릭짐락카, 2026/05: 데스노트·동두천·클라이밍·양계장·DB보험료, 2026/06: DB보험완전종료·슬릭짐마지막, 2026/07: 슬릭짐종료, 2026/09: 바지·신사에그, 2028/03: 폰할부종료

목표 진척도 (2,300만원 목돈 마련): 2026/04: ₩5,018,037 → 2028/01: ₩23,187,640 목표 달성! → 2029/03: ₩34,514,610

## 출력 규칙
1. 매일: 섹션 A
2. 월요일: 섹션 A + B + C
3. 매월 1일: 섹션 A + D
4. 월요일이면서 1일: A + B + C + D

마크다운으로 가독성 높게. 리포트 상단에 날짜와 요일 표시.

⚠️ **PART 1 재정 리포트 전체에서 테이블(`|`) 형식 사용 금지. 예산 요약, 지출 내역 등 모든 데이터를 리스트(`-`) 형식으로 작성.**

---

# PART 2: 채용 공고 크롤러 (★ 매일)

`$REPO_DIR/daily_reports/jobs/YYYY-MM-DD.md`에 아래 내용을 작성해.

## 지원자 프로필: 문호균 (Moon Ho-kyun)
- 현재: B2B SaaS 스타트업(1~10인) PO/PM 겸 Product Designer
- 핵심 강점:
  - 문제 해결 + 논리적 구조화
  - 개발 지식 (React, 퍼블리싱) → UX 엔지니어링 수준
  - 디자인 시스템 구축 (서버 22초→0.2초, 코드 40% 감축)
  - 데이터 기반 의사결정 (검색량 +26.4%, 키워드 등록 +4,752개)
  - 특허 등록 (듀얼뷰 동기화 UI)
  - AI 에이전트 설계 (Hubble - 1,000개 키워드 → 40초 만에 전략 인사이트)
- 보완점: UI 비주얼/심미성, 모바일/B2C 경험
- 타겟 기업 (10~1000명 규모 성장기/성숙기):
  - B2B SaaS: 채널톡, 플렉스, 센드버드, 리멤버, 뱅크샐러드, 토스페이먼츠
  - 빅테크: 토스, 카카오, 네이버, 쿠팡, 라인, 당근
  - 데이터/AI: 업스테이지, 보이저엑스, 뤼튼, 리턴제로
  - 기타: 컬리, 야놀자, 무신사, 직방, 오늘의집

## Task 1: 채용 공고 검색
WebSearch로 여러 쿼리 실행:
1. `프로덕트 디자이너 채용 2026 site:wanted.co.kr`
2. `UX 디자이너 채용 site:wanted.co.kr`
3. `Product Designer 채용 서울 2026`
4. `UX/UI 디자이너 채용 site:saramin.co.kr`
5. 타겟 기업별: 토스, 카카오, 네이버, 당근, 채널톡, 플렉스, 뤼튼, 무신사, 오늘의집, 쿠팡 각각 `[기업명] 디자이너 채용 2026`
필터: 경력 2~5년, 서울/판교

## Task 2: 적합도 평가
- **상(HIGH)**: JD에 문제해결, 데이터 분석, 디자인 시스템, B2B SaaS, 개발 협업, AI/자동화 언급
- **중(MEDIUM)**: 타겟 규모 기업의 일반 프로덕트/UX 디자이너
- **하(LOW)**: 순수 비주얼, 주니어, 10인 미만
HIGH와 MEDIUM만 기록. 각 공고에 기업명, 포지션, 링크, 마감일, 매칭 키워드 포함.

## Task 3: 팔로우업 추적
- HIGH인데 마감된 공고 → 팔로우업 기업으로 기록
- `followup_companies.md` 파일 확인 후 업데이트 (없으면 새로 생성)
- 형식: `- **기업명** | 마지막 공고: 포지션명 | 마감일: YYYY-MM-DD | 다음 체크일: YYYY-MM-DD`

## Task 4: 지원 전략 팁
가장 적합도 높은 공고에 대해:
- JD 키워드 분석 및 강조할 포트폴리오 프로젝트 추천
- '칵테일 전략' 배합 비율 (문제해결 vs 비주얼 vs 시스템 설계)
- JD에서 미러링할 용어 추천
- 기업 스테이지별 원하는 디자이너상 분석

## 리포트 파일 형식
```markdown
# 📋 채용 공고 리포트 - YYYY-MM-DD

## 🔴 적합도 높음 (상)
- **기업명** | 포지션명 | 마감: YYYY-MM-DD | 매칭: 키워드1, 키워드2 | [링크](URL)

## 🟡 적합도 보통 (중)
- **기업명** | 포지션명 | [링크](URL)

## 🔄 팔로우업 기업
- **기업명** | 마지막 공고: 포지션명 | 상태: 상태

## 💡 지원 전략 팁
# PART 2: 채용 공고 크롤러 (★ 매일)

(기존 내용 유지...)

---

# PART 3: 블로그 초안 생성 (★ 매일)

컨퍼런스 자료를 읽고 블로그 초안을 **직접 작성**하여 `drafts/` 폴더에 저장해. push하면 GitHub Actions가 Discord #blog 채널로 자동 전송해.

## Blog 저장소 설정
```bash
BLOG_DIR=$(find /home/user -name "blog_with_claude" -type d 2>/dev/null | head -1)
if [ -z "$BLOG_DIR" ]; then
  BLOG_DIR="/home/user/blog_with_claude"
  git clone https://$GIT_TOKEN@github.com/soulty321/blog_with_claude.git "$BLOG_DIR" 2>/dev/null || true
fi
cd "$BLOG_DIR"
git config user.name "soulty321"
git config user.email "soulty321@gmail.com"
git config commit.gpgsign false
git pull origin main --rebase 2>/dev/null || true
mkdir -p drafts
```

## 실행 절차

1. `data/process_state.json`을 읽어서 `processed_files` 목록 확인
2. `일본 컨퍼런스 자료/` 폴더에서 아직 처리되지 않은 첫 번째 .md 파일 선택 (파일명 정렬 기준)
3. 처리할 파일이 없으면 "📭 모든 컨퍼런스 자료가 처리되었습니다." 출력 후 PART 3 종료
4. 해당 파일을 읽고, 아래 가이드에 따라 블로그 초안을 직접 작성:

### 블로그 작성 가이드
- 원문이 일본어인 경우 **한국어로 번역**하여 작성
- 독자가 흥미를 느낄 **매력적인 제목** 포함
- **서론, 본문(소제목 포함), 결론** 구조
- 원문의 핵심 인사이트를 보존하면서 친절하고 전문적인 블로그 말투로 작성
- 마크다운 형식 사용
- **디자이너/IT 직군 독자** 대상

5. 작성된 초안을 `drafts/YYYY-MM-DD-제목.md` 파일로 저장 (Discord 전송은 GitHub Actions가 자동 처리)

6. `data/process_state.json`의 `processed_files` 배열에 처리한 파일명 추가 후 저장
7. 커밋 & 푸시:
```bash
cd "$BLOG_DIR"
git add drafts/ data/process_state.json
git commit --no-gpg-sign -m "blog: YYYY-MM-DD 초안 생성"
git push origin main
```

---

# 실행 순서
1. ★ Git 설정 먼저 실행 — pp_with_claude($REPO_DIR) + finance-with-claude($FINANCE_DIR) + blog_with_claude($BLOG_DIR) 세 저장소 모두 설정
2. 오늘 날짜 확인
3. PART 1 재정 리포트 작성 → `$FINANCE_DIR/daily_reports/YYYY-MM-DD.md`에 저장
   - **섹션 A 작성 전에 반드시** `https://raw.githubusercontent.com/soulty321/finance-with-claude/main/data/spending/YYYY-MM.json` 을 fetch하여 지출 데이터 확인
   - 작성 완료 후 **finance-with-claude 저장소에 별도 커밋 & 푸시**
4. PART 2 채용 크롤러 실행 → `$REPO_DIR/daily_reports/jobs/YYYY-MM-DD.md`에 저장
5. `followup_companies.md` 업데이트 (필요시)
6. PART 3 블로그 초안 생성 → Claude가 직접 작성 후 Discord #blog 전송
7. **pp_with_claude 저장소에 채용 리포트 커밋 & 푸시**
8. **blog_with_claude 저장소에 process_state 커밋 & 푸시**

중요:
- 채용 공고에는 반드시 직접 링크 포함
- **세 저장소 모두** git push 반드시 수행
- 커밋 시 반드시 --no-gpg-sign 플래그 사용
- push 실패 시 해당 저장소에서 pull --rebase 후 재시도
- push가 계속 실패하면 에러 메시지 출력
