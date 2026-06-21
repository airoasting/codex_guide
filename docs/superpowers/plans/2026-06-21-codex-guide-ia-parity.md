# Codex 가이드 IA 정합 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 로컬 Codex 가이드의 `index.html` IA와 콘텐츠 페이지 라인업을 airoasting.vercel.app(Claude판)과 동일하게 맞춘다(Cowork 제외, Anthropic 전용은 Codex 등가물로 치환).

**Architecture:** 정적 단일 폴더 HTML 사이트. A안 — 공유 스켈레톤·IA를 먼저 잠그고(Phase 0), `index.html`을 타깃 IA로 전면 재구성(Phase 1), 신설 18개 페이지를 공유 템플릿 골격으로 일괄 생성(Phase 2), 이후 단계 순서로 본문을 9.5점까지 심화(Phase 3+).

**Tech Stack:** Vanilla HTML/CSS/소량 JS, Pretendard, `--codex-accent:#3A32FF`. 빌드 시스템 없음. 검증은 구조 grep + 링크 무결성 bash 체크 + preview 렌더링.

**참고 문서:** 설계 스펙 `docs/superpowers/specs/2026-06-21-codex-guide-ia-parity-design.md`, 규약 `AGENTS.md`(2장 페이지 골격, 글쓰기·디자인 규약).

---

## 작업 규칙 (모든 Task 공통)
- AGENTS.md 한 줄 원칙 준수: 자연스러운 한국어, 주술 구조 정합, 번역투·"흐름" 금지, **em dash 금지**.
- 신설 페이지는 기존 골격 `header → step-nav → header-pages → sub-menu → container → footer + SM-HAMBURGER`를 그대로 따른다.
- 커밋은 Task마다. 메시지 한국어, 말미에 `Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>`.
- 깨진 링크 0 유지. 각 구조 Task는 아래 링크체크를 통과해야 한다.
- **참고 문헌·더 읽을거리 컴포넌트(필수):** 모든 학습 콘텐츠 페이지(진단·1~5단계·예제)는 본문 끝, 푸터 앞에 `참고 문헌·더 읽을거리` 섹션을 둔다. 구성은 ① 핵심 논문(저자·연도·제목, 링크) ② 공식 문서 ③ 사이트 내부 연결 페이지. 쇼케이스·갤러리·사전 등 참고 등급 페이지는 선택. 표준 마크업:

```html
<section class="reading" id="reading">
  <h2>참고 문헌·더 읽을거리</h2>
  <div class="reading-group">
    <h3>핵심 논문</h3>
    <ul>
      <li><a href="https://…" target="_blank" rel="noopener">저자 (연도) — 제목</a> · 한 줄 설명</li>
    </ul>
  </div>
  <div class="reading-group">
    <h3>공식 문서</h3>
    <ul><li><a href="https://…" target="_blank" rel="noopener">문서명</a></li></ul>
  </div>
  <div class="reading-group">
    <h3>이 사이트에서 이어 읽기</h3>
    <ul><li><a href="해당-페이지.html">제목</a></li></ul>
  </div>
</section>
```
> `.reading` 스타일은 `index.html`/콘텐츠 페이지 공통 `<style>`에 1회 정의(카드 톤 재사용). 외부 링크는 게시 전 실제 접속 확인. 자료는 **실재하는 것만** 싣고, 불확실하면 공식 문서로 대체한다(없는 논문 지어내지 않는다).

## File Structure
- `index.html` — 라우팅 허브. step-nav 라벨, 섹션·서브섹션·카드 전면 교체(Phase 1).
- 신설 18개 `*.html` — 공유 스켈레톤 기반(Phase 2), 본문 심화(Phase 3+).
- `assets/` — 기존 아이콘·미디어 재사용. 신규 SVG 아이콘 필요 시 `index.html`의 `<symbol>` 스프라이트에 추가하고 콘텐츠 페이지에도 동기화.
- `tools/check-links.sh` — 내부 링크 무결성 검사 스크립트(Phase 0 신설).

---

## Phase 0 — 템플릿·IA 잠금

### Task 0.1: 링크 무결성 체크 스크립트 생성

**Files:**
- Create: `tools/check-links.sh`

- [ ] **Step 1: 스크립트 작성**

```bash
#!/usr/bin/env bash
# 루트 HTML들이 href로 거는 내부 *.html 링크가 실제 파일로 존재하는지 검사한다.
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
for f in *.html; do
  grep -oE 'href="[a-zA-Z0-9_-]+\.html(#[a-zA-Z0-9_-]+)?"' "$f" \
    | sed -E 's/href="([^"#]+).*/\1/' | sort -u | while read -r target; do
      if [ ! -f "$target" ]; then
        echo "BROKEN: $f -> $target"
      fi
    done
done > /tmp/linkcheck.txt || true
if [ -s /tmp/linkcheck.txt ]; then cat /tmp/linkcheck.txt; echo "LINK CHECK FAILED"; exit 1; fi
echo "LINK CHECK OK"
```

- [ ] **Step 2: 실행 가능하게 만들고 현재 상태 확인**

Run: `chmod +x tools/check-links.sh && ./tools/check-links.sh`
Expected: `LINK CHECK OK` (현재 index는 신설 페이지를 아직 링크하지 않으므로 통과)

- [ ] **Step 3: 커밋**

```bash
git add tools/check-links.sh
git commit -m "chore: 내부 링크 무결성 체크 스크립트 추가"
```

### Task 0.2: 신설 페이지 매니페스트·스켈레톤 추출

**Files:**
- Create: `tools/new-pages.tsv`
- Create: `tools/_skeleton.html` (작업용, 최종 커밋 제외 가능)

- [ ] **Step 1: 매니페스트 작성** (`파일명<TAB>제목<TAB>단계섹션id<TAB>서브섹션<TAB>시간<TAB>난이도`)

```
ai-sycophancy.html	AI의 동조를 줄이는 법	section-project	검증	8분	입문
ai-hallucination.html	AI의 환각을 벗어나는 법	section-project	검증	12분	중급
chrome-plugin.html	브라우저에서 ChatGPT 사용 (Atlas)	section-plugin	확장프로그램	10분	입문
checklist.html	Codex CLI 20단계로 따라하기	section-code	CLI	단계별	고급
cheatsheet.html	Codex 명령어 모음	section-code	CLI	참고	참고
codex-best-practices.html	고수처럼 쓰는 9가지 원칙	section-code	비법	15분	고급
codex-tools.html	Codex의 도구란?	section-skills	하네스	12분	중급
loop-engineering.html	루프 엔지니어링이란?	section-loop	루프	14분	고급
routines.html	예약 작업으로 자동 실행	section-loop	루프	12분	중급
ai-writing.html	AI가 쓴 티를 지우는 법	section-examples	기본	12분	중급
news-clipping.html	뉴스 클리핑 자동화	section-examples	기본	15분	중급
company-brain.html	컴퍼니 브레인 축적하기	section-examples	심화	18분	고급
showcase-poems.html	멀티 페르소나로 시 쓰기	section-showcase	쇼케이스	참고	참고
showcase.html	스탑워치 쇼케이스	section-showcase	쇼케이스	참고	참고
hackathon.html	Codex 해커톤 쇼케이스	section-showcase	쇼케이스	참고	참고
security-guide.html	AI와 안전하게 일하는 법	section-ref	참고	참고	참고
ai-basic-law.html	인공지능기본법 한눈에	section-ref	참고	참고	참고
```

> 비고: harness-workflows는 기존 `agent-design.html`(팀 설계)을 4단계 하네스 서브섹션으로 재배치해 재사용한다(신설하지 않음). Task 1.x에서 링크만 연결.

- [ ] **Step 2: 레퍼런스 스켈레톤 추출**

Run: `cp project-intro.html tools/_skeleton.html`
이 파일을 Phase 2 생성의 원본으로 쓴다. 교체 대상 영역은 `<title>`, header h1/p, step-nav active, header-pages 링크, sub-menu 항목, `<main class="container">…</main>` 본문이다.

- [ ] **Step 3: 커밋**

```bash
git add tools/new-pages.tsv
git commit -m "docs: 신설 페이지 매니페스트 추가"
```

---

## Phase 1 — index 전면 재구성

> 각 Task 후 `./tools/check-links.sh` 실행. 신설 페이지를 링크하기 시작하면 해당 파일이 아직 없어 BROKEN이 뜬다 → Phase 1에서는 신설 링크 대상에 대해 **빈 stub 파일을 먼저 `touch`로 만들지 않는다**. 대신 Phase 2 완료 후 최종 링크체크를 통과시킨다. Phase 1 동안은 구조 grep으로 검증한다.

### Task 1.1: step-nav 라벨을 새 5단계로 교체

**Files:**
- Modify: `index.html:1271-1276`

- [ ] **Step 1: 현재 상태 확인**

Run: `grep -n 'guide-btn-num' index.html`
Expected: 진단/1단계 기본기부터/2단계 플러그인/3단계 Codex 실행/4단계 저장·배포/5단계 자동화 6개.

- [ ] **Step 2: 라벨·앵커 교체** (6→7 탭, section id 신설 포함)

```html
            <a class="guide-btn" href="#section-1" data-section="section-1"><span class="guide-btn-num">진단</span> 내 수준 파악<span class="done-mark"></span></a>
            <a class="guide-btn" href="#section-project" data-section="section-project"><span class="guide-btn-num">1단계</span> 기본기부터<span class="done-mark"></span></a>
            <a class="guide-btn" href="#section-plugin" data-section="section-plugin"><span class="guide-btn-num">2단계</span> 확장<span class="done-mark"></span></a>
            <a class="guide-btn" href="#section-code" data-section="section-code"><span class="guide-btn-num">3단계</span> Codex 코드<span class="done-mark"></span></a>
            <a class="guide-btn" href="#section-skills" data-section="section-skills"><span class="guide-btn-num">4단계</span> 에이전트 설계<span class="done-mark"></span></a>
            <a class="guide-btn" href="#section-loop" data-section="section-loop"><span class="guide-btn-num">5단계</span> 루프 자동화<span class="done-mark"></span></a>
            <a class="guide-btn" href="#section-examples" data-section="section-examples"><span class="guide-btn-num">예제</span> 실전 예제<span class="done-mark"></span></a>
```

- [ ] **Step 3: 검증**

Run: `grep -cE 'data-section="section-(1|project|plugin|code|skills|loop|examples)"' index.html`
Expected: `7`

- [ ] **Step 4: 커밋**

```bash
git add index.html
git commit -m "feat(index): step-nav를 새 5단계+예제 라벨로 교체"
```

### Task 1.2: 서브섹션 구분 마크업·스타일 도입

**Files:**
- Modify: `index.html` (CSS `<style>` 블록 + 섹션 마크업)

- [ ] **Step 1: 서브섹션 CSS 추가** (기존 `.section-header` 정의 근처에 삽입)

```css
.card-subsection{display:flex;align-items:baseline;gap:10px;margin:28px 0 12px;padding-left:2px}
.card-subsection .sub-name{font-weight:700;color:var(--codex-accent);font-size:1.02rem}
.card-subsection .sub-desc{color:#6ب6f7a;font-size:.9rem}
```
> 주의: 위 `#6b6f7a`처럼 기존 팔레트와 맞춰 16진 색만 쓴다(오타 금지). 실제 값은 기존 `.section-subtitle` 색을 재사용.

- [ ] **Step 2: 검증**

Run: `grep -n '.card-subsection' index.html`
Expected: CSS 정의 1건 노출.

- [ ] **Step 3: 커밋**

```bash
git add index.html
git commit -m "feat(index): 서브섹션 구분 마크업 스타일 추가"
```

### Task 1.3: 1단계 섹션 재구성 (기본기 + 검증)

**Files:**
- Modify: `index.html:1309-1332` (section-project)

- [ ] **Step 1: section-subtitle 아래에 서브섹션 헤더 삽입, 기존 3카드 위에 "기본기" 라벨**

`<section class="cards">` 바로 앞에:
```html
        <div class="card-subsection"><span class="sub-name">기본기</span><span class="sub-desc">프롬프트부터 멀티 페르소나까지</span></div>
```

- [ ] **Step 2: 기존 3카드 `</section>` 뒤에 검증 서브섹션·2카드 추가**

```html
        <div class="card-subsection"><span class="sub-name">검증</span><span class="sub-desc">답을 그대로 믿지 않기</span></div>
        <section class="cards">
            <a class="card" href="ai-sycophancy.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-shield"/></svg></span><h2>AI의 동조를 줄이는 법</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 8분</span><span class="badge-level beginner">입문</span></div>
                <p>AI는 내 말에 쉽게 동의합니다. 동조를 걷어내고 비판적 피드백을 끌어내는 질문법을 정리합니다.</p>
            </a>
            <a class="card" href="ai-hallucination.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-search"/></svg></span><h2>AI의 환각을 벗어나는 법</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 12분</span><span class="badge-level intermediate">중급</span></div>
                <p>그럴듯한 거짓을 걸러내는 검증 절차. 출처 확인과 교차 검증으로 환각을 줄이는 방법을 다룹니다.</p>
            </a>
        </section>
```
> 아이콘 `#i-shield`, `#i-search`가 스프라이트에 없으면 Step 3에서 추가.

- [ ] **Step 3: 누락 아이콘 확인·보강**

Run: `grep -oE 'id="i-(shield|search)"' index.html`
없으면 기존 `<symbol>` 블록에 24x24 라인 아이콘 2개 추가(기존 아이콘 스타일 복제).

- [ ] **Step 4: 검증**

Run: `grep -c 'card-subsection' index.html` (이 섹션에서 2 이상) 및 `grep -n 'ai-sycophancy.html\|ai-hallucination.html' index.html`
Expected: 두 링크 노출.

- [ ] **Step 5: 커밋**

```bash
git add index.html
git commit -m "feat(index): 1단계에 검증 서브섹션 추가"
```

### Task 1.4: 2단계 재구성 (확장 프로그램, Cowork 제외)

**Files:**
- Modify: `index.html` (section-plugin)

- [ ] **Step 1: 섹션 헤더 라벨을 "2단계 / 확장"으로, subtitle 갱신**

```html
            <span class="section-num">2단계</span>
            <span class="section-title">확장</span>
```
subtitle: `지금 쓰는 브라우저와 오피스에서 ChatGPT를 바로 불러 씁니다`

- [ ] **Step 2: 카드 구성 = chrome-plugin(신규) + 기존 excel/pptx**

기존 excel/pptx 카드 앞에 chrome 카드 추가:
```html
            <a class="card" href="chrome-plugin.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-globe"/></svg></span><h2>브라우저에서 ChatGPT 사용</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 10분</span><span class="badge-level beginner">입문</span></div>
                <p>ChatGPT Atlas와 브라우저 확장으로, 보고 있는 웹페이지 위에서 바로 요약하고 작성합니다.</p>
            </a>
```

- [ ] **Step 3: 검증**

Run: `grep -n 'chrome-plugin.html' index.html && grep -n 'cowork' index.html`
Expected: chrome-plugin 1건, cowork 0건.

- [ ] **Step 4: 커밋**

```bash
git add index.html
git commit -m "feat(index): 2단계 확장 재구성 (chrome 추가, Cowork 제외)"
```

### Task 1.5: 3단계 재구성 (노코드 / CLI / 비법)

**Files:**
- Modify: `index.html` (section-code 및 기존 section-deploy 흡수)

- [ ] **Step 1: section-code 헤더를 "3단계 / Codex 코드"로, 서브섹션 3개 구성**

노코드 서브섹션(codex-101, codex-tasks, github-guide) → CLI 서브섹션(checklist, cheatsheet) → 비법 서브섹션(codex-best-practices). 각 서브섹션 앞에 `.card-subsection` 헤더 삽입. github-guide 카드 설명을 "GitHub·Vercel·Netlify"로 통합 표기(기존 vercel-guide 링크는 github-guide 본문에서 다룸).

```html
        <div class="card-subsection"><span class="sub-name">노코드</span><span class="sub-desc">설치 없이 브라우저에서</span></div>
        <!-- codex-101 / codex-tasks / github-guide 카드 -->
        <div class="card-subsection"><span class="sub-name">CLI</span><span class="sub-desc">터미널에서 직접</span></div>
        <section class="cards">
            <a class="card" href="checklist.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-terminal"/></svg></span><h2>Codex CLI 20단계로 따라하기</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 단계별</span><span class="badge-level advanced">고급</span></div>
                <p>설치부터 첫 작업까지 20단계 체크리스트로 따라합니다.</p>
            </a>
            <a class="card" href="cheatsheet.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-list"/></svg></span><h2>Codex 명령어 모음</h2></div>
                <div class="card-meta"><span class="badge-level reference">참고</span></div>
                <p>자주 쓰는 명령어와 옵션을 한 장으로 정리했습니다.</p>
            </a>
        </section>
        <div class="card-subsection"><span class="sub-name">비법</span><span class="sub-desc">노코드·CLI 공통 원칙</span></div>
        <section class="cards">
            <a class="card" href="codex-best-practices.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-star"/></svg></span><h2>고수처럼 쓰는 9가지 원칙</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 15분</span><span class="badge-level advanced">고급</span></div>
                <p>작업을 맡기는 사람이 지키는 9가지 원칙을 정리합니다.</p>
            </a>
        </section>
```

- [ ] **Step 2: 기존 section-deploy(4단계 저장·배포) 블록 제거**

github-guide/vercel-guide 카드를 위 노코드 서브섹션으로 옮겼으므로 기존 `id="section-deploy"` 섹션 div 전체 삭제.

- [ ] **Step 3: 검증**

Run: `grep -n 'section-deploy' index.html` → 0건. `grep -n 'checklist.html\|cheatsheet.html\|codex-best-practices.html' index.html` → 3건.

- [ ] **Step 4: 커밋**

```bash
git add index.html
git commit -m "feat(index): 3단계 Codex 코드 (노코드/CLI/비법) 재구성, 저장·배포 흡수"
```

### Task 1.6: 4단계 재구성 (에이전트 설계: 하네스 / 스킬)

**Files:**
- Modify: `index.html` (section-skills)

- [ ] **Step 1: 헤더를 "4단계 / 에이전트 설계", 서브섹션 2개**

하네스(harness-engineering, codex-tools 신규, agent-design=멀티 에이전트) / 스킬(agents-md-templates, skills, code-plugin).
```html
        <div class="card-subsection"><span class="sub-name">하네스</span><span class="sub-desc">AI 에이전트 설계</span></div>
        <section class="cards">
            <!-- harness-engineering 기존 카드 -->
            <a class="card" href="codex-tools.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-wrench"/></svg></span><h2>Codex의 도구란?</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 12분</span><span class="badge-level intermediate">중급</span></div>
                <p>에이전트가 손발로 쓰는 도구의 개념과 종류를 정리합니다.</p>
            </a>
            <a class="card" href="agent-design.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-users"/></svg></span><h2>멀티 에이전트 소환</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 15분</span><span class="badge-level advanced">고급</span></div>
                <p>솔로에서 오케스트라까지, 여러 에이전트를 동시에 부리는 설계를 다룹니다.</p>
            </a>
        </section>
        <div class="card-subsection"><span class="sub-name">스킬</span><span class="sub-desc">나만의 스킬 만들기</span></div>
        <!-- agents-md-templates / skills / code-plugin 기존 카드 -->
```

- [ ] **Step 2: 검증**

Run: `grep -n 'codex-tools.html\|agent-design.html' index.html`
Expected: 두 링크 노출.

- [ ] **Step 3: 커밋**

```bash
git add index.html
git commit -m "feat(index): 4단계 에이전트 설계 (하네스/스킬) 재구성"
```

### Task 1.7: 5단계 신설 (루프 자동화)

**Files:**
- Modify: `index.html` (4단계 뒤에 section-loop 신설)

- [ ] **Step 1: section-loop 섹션 추가**

```html
    <div class="card-section" id="section-loop">
        <div class="section-header"><span class="section-num">5단계</span><span class="section-title">루프 자동화</span></div>
        <p class="section-subtitle">반복 작업을 루프로 묶고 예약 작업으로 자동 실행합니다</p>
        <section class="cards">
            <a class="card" href="loop-engineering.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-repeat"/></svg></span><h2>루프 엔지니어링이란?</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 14분</span><span class="badge-level advanced">고급</span></div>
                <p>같은 작업을 반복 가능한 루프로 설계하는 개념을 다룹니다.</p>
            </a>
            <a class="card" href="routines.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-clock"/></svg></span><h2>예약 작업으로 자동 실행</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 12분</span><span class="badge-level intermediate">중급</span></div>
                <p>ChatGPT 예약 작업(Scheduled tasks)으로 정해진 시각에 자동 실행합니다.</p>
            </a>
        </section>
    </div>
```

- [ ] **Step 2: 검증**

Run: `grep -n 'id="section-loop"' index.html`
Expected: 1건.

- [ ] **Step 3: 커밋**

```bash
git add index.html
git commit -m "feat(index): 5단계 루프 자동화 신설"
```

### Task 1.8: 예제 섹션 3 서브섹션화 (기본/MCP/심화)

**Files:**
- Modify: `index.html` (기존 예제 섹션 → id="section-examples")

- [ ] **Step 1: 섹션 id를 section-examples로, 3 서브섹션 구성**

기본(ai-writing 신규, news-clipping 신규, google-sheets-dashboard) / MCP연결(playmcp-kakao, korean-law-mcp, stock-messenger) / 심화(harness-book, company-brain 신규, instagram-card-news). 각 앞에 `.card-subsection`. 신규 3카드 추가:
```html
            <a class="card" href="ai-writing.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-pencil"/></svg></span><h2>AI가 쓴 티를 지우는 법</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 12분</span><span class="badge-level intermediate">중급</span></div>
                <p>번역투와 AI 특유의 패턴을 걷어내 사람이 쓴 글로 다듬습니다.</p>
            </a>
            <a class="card" href="news-clipping.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-news"/></svg></span><h2>뉴스 클리핑 자동화</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 15분</span><span class="badge-level intermediate">중급</span></div>
                <p>관심 주제 뉴스를 모아 요약하는 작업을 자동화합니다.</p>
            </a>
            <a class="card" href="company-brain.html">
                <div class="card-title-row"><span class="card-icon"><svg viewBox="0 0 24 24"><use href="#i-brain"/></svg></span><h2>컴퍼니 브레인 축적하기</h2></div>
                <div class="card-meta"><span class="badge-time">⏱ 18분</span><span class="badge-level advanced">고급</span></div>
                <p>조직의 지식을 에이전트가 계속 쌓아가는 자산으로 만듭니다.</p>
            </a>
```

- [ ] **Step 2: 검증**

Run: `grep -n 'id="section-examples"' index.html && grep -c 'card-subsection' index.html`
Expected: section-examples 1건.

- [ ] **Step 3: 커밋**

```bash
git add index.html
git commit -m "feat(index): 예제를 기본/MCP/심화 3 서브섹션으로 재구성"
```

### Task 1.9: 쇼케이스·참고 섹션 추가 + 퀵스타트 Codex화

**Files:**
- Modify: `index.html` (예제 뒤 쇼케이스/참고 섹션, 상단 퀵스타트)

- [ ] **Step 1: 쇼케이스 섹션 추가** (section-showcase: showcase-poems, showcase, hackathon 카드 3)
- [ ] **Step 2: 참고 섹션 추가** (section-ref: security-guide, ai-basic-law 카드 2) — 기존 사전(file-types/license-compare/glossary)·갤러리(eda/component/ui-design)는 정렬만.
- [ ] **Step 3: 상단 퀵스타트 4접근을 Codex 맥락으로** (ChatGPT.ai / 브라우저·오피스 확장 / 커넥터·파일 / Codex 코딩). 카피만 교체, 레이아웃 유지.

- [ ] **Step 4: 검증**

Run: `grep -nE 'id="section-(showcase|ref)"' index.html`
Expected: 2건. `grep -n 'showcase-poems.html\|hackathon.html\|security-guide.html\|ai-basic-law.html' index.html` → 4건.

- [ ] **Step 5: 커밋**

```bash
git add index.html
git commit -m "feat(index): 쇼케이스·참고 섹션 추가, 퀵스타트 Codex화"
```

---

## Phase 2 — 신설 18개 골격 일괄 생성

### Task 2.1: 스켈레톤에서 18개 페이지 골격 생성

**Files:**
- Create: 매니페스트(`tools/new-pages.tsv`)의 18개 `*.html`

- [ ] **Step 1: 생성 스크립트 작성·실행** (`tools/gen-skeletons.sh`)

각 페이지를 `tools/_skeleton.html`에서 복제하고 `<title>`·h1·header 설명·`<main class="container">` 본문을 매니페스트 값으로 치환한다. 본문은 임시 개요 블록(섹션 제목 + "준비중" 한 줄)으로 채운다. step-nav active와 sub-menu는 해당 단계로 맞춘다.

```bash
#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
while IFS=$'\t' read -r file title sec sub time level; do
  [ -f "$file" ] && { echo "skip $file (exists)"; continue; }
  cp tools/_skeleton.html "$file"
  # 제목/타이틀 치환 (sed -i '' for macOS). 본문은 placeholder 개요로.
  perl -0pi -e "s{<title>.*?</title>}{<title>$title · AI ROASTING Codex</title>}s" "$file"
  echo "created $file"
done < tools/new-pages.tsv
```
> 스크립트는 골격만 만든다. h1/본문 정밀 치환은 Step 2에서 페이지별로 확인·수정한다(자동 치환이 어긋난 페이지는 수동 보정).

- [ ] **Step 2: 각 페이지 h1·header 설명·본문 개요 수동 확정**

각 파일을 열어 header h1을 매니페스트 제목으로, 본문을 "이 페이지에서 다룰 것" 3~5개 H2 개요 + 각 한 줄로 채운다. step-nav active 클래스를 해당 단계 탭으로 이동.

- [ ] **Step 3: 링크 무결성·구조 검증**

Run: `./tools/check-links.sh`
Expected: `LINK CHECK OK` (이제 index가 링크한 18개가 모두 존재).
Run: `for f in $(cut -f1 tools/new-pages.tsv); do grep -q 'class="step-nav"' "$f" && grep -q '<footer' "$f" || echo "INCOMPLETE: $f"; done`
Expected: 출력 없음.

- [ ] **Step 4: preview 렌더링 확인**

`index.html`을 preview로 열어 각 단계 탭 이동·카드 클릭으로 신설 페이지가 골격으로 정상 렌더되는지 확인(깨진 레이아웃·콘솔 에러 없음).

- [ ] **Step 5: 커밋**

```bash
git add -A
git commit -m "feat: 신설 18개 페이지 골격 일괄 생성 (공유 템플릿)"
```

### Task 2.2: 전체 구조 정합 점검

- [ ] **Step 1: 타깃 대비 IA 체크리스트 대조**

스펙의 최종 IA 트리와 index를 1:1 대조. 누락 카드·잘못된 서브섹션·깨진 앵커 확인.

- [ ] **Step 2: 링크체크 + 데드 페이지 점검**

Run: `./tools/check-links.sh` → OK. 고아 페이지(어디서도 링크 안 되는 루트 html) 목록화해 보고.

- [ ] **Step 3: 커밋(수정 시)**

```bash
git add -A && git commit -m "fix(index): IA 정합 점검 반영"
```

---

## Phase 3+ — 페이지별 본문 심화 (단계 순서)

> 각 신설 페이지를 9.5점으로 채우는 반복 Task. 공통 절차는 동일하므로 **페이지당 1 Task**로 반복한다. 아래는 Task 템플릿과 페이지별 콘텐츠 개요(실제 작성 지침)다.

### Task 3.x 템플릿 (페이지 1개)

**Files:** Modify: `<해당 .html>`

- [ ] **Step 1:** 해당 페이지의 콘텐츠 개요(아래)대로 H2 섹션을 실제 본문으로 작성. AGENTS.md 글쓰기 규약 적용. 기존 동급 페이지(예: project-intro)의 본문 컴포넌트(콜아웃·코드블록·체크리스트·표)를 재사용.
- [ ] **Step 2:** 본문 끝에 `참고 문헌·더 읽을거리` 섹션(표준 마크업)을 넣고, 아래 "회차별 참고 문헌" 표의 해당 항목을 채운다. 외부 링크는 실제 접속 확인, 불확실한 논문은 공식 문서로 대체.
- [ ] **Step 3:** sub-menu 앵커를 본문 H2 + `#reading`과 동기화.
- [ ] **Step 4:** 검증 — `./tools/check-links.sh` OK + preview로 렌더·목차·외부 링크 동작 확인 + "흐름"/em dash 0건(`grep -c '—' <file>` → 0).
- [ ] **Step 5:** 커밋 `content(<slug>): 본문 9.5점 심화 + 참고 문헌`.

### 페이지별 콘텐츠 개요 (작성 지침)

**검증 트랙**
- `ai-sycophancy.html`: ① 동조란 무엇인가(사례) ② 왜 위험한가 ③ 동조를 줄이는 질문법(반례 요구·역할 분리·근거 강제) ④ 멀티 페르소나로 교차 검증 ⑤ 체크리스트. multi-persona와 상호 링크.
- `ai-hallucination.html`: ① 환각의 정의·유형 ② 발생 조건 ③ 출처 확인·교차 검증 절차 ④ 도구로 줄이기(검색·MCP) ⑤ 실무 체크리스트.

**확장**
- `chrome-plugin.html`: ① ChatGPT Atlas/브라우저 확장 개요 ② 설치 ③ 웹페이지 위 요약·작성 ④ 한계·주의 ⑤ 다음 단계. excel/pptx-plugin과 상호 링크.

**CLI**
- `checklist.html`: 설치→인증→첫 프로젝트→첫 작업까지 20단계 번호 리스트, 각 단계 명령·기대 출력.
- `cheatsheet.html`: 명령·옵션 표(범주별), 복사 가능한 코드블록.

**비법**
- `codex-best-practices.html`: 9개 원칙 각각 제목+근거+나쁜예/좋은예. AGENTS.md 작업 철학과 연결.

**하네스**
- `codex-tools.html`: ① 도구 개념 ② 종류(파일·실행·검색·MCP) ③ 권한·안전 ④ 도구 선택 기준 ⑤ 예시. harness-engineering과 링크.

**루프**
- `loop-engineering.html`: ① 루프 정의 ② 단발 vs 반복 ③ 루프 설계 4요소 ④ 중단·예외 ⑤ 사례.
- `routines.html`: ① 예약 작업 개념 ② 설정법(ChatGPT Scheduled tasks) ③ 사용 사례 ④ 주의·한계.

**예제**
- `ai-writing.html`: korean 윤문 스킬 연계 — ① AI 티 14패턴 ② 진단 ③ 윤문 절차 ④ 보존 원칙(의미·숫자·인용) ⑤ 전후 비교.
- `news-clipping.html`: ① 목표 ② 소스 정하기 ③ 수집·요약 자동화 ④ 산출물 포맷 ⑤ 확장.
- `company-brain.html`: ① 컴퍼니 브레인 개념 ② 축적 구조 ③ 에이전트 연결 ④ 운영·갱신 기준.

**쇼케이스**
- `showcase-poems.html` / `showcase.html` / `hackathon.html`: 결과물 갤러리 — 캡처·링크·한 줄 설명 중심. 본문 가벼움(참고 등급).

**참고**
- `security-guide.html`: ① 데이터 취급 원칙 ② 권한·승인 ③ 민감정보 ④ 안전한 작업 습관 ⑤ 체크리스트.
- `ai-basic-law.html`: 인공지능기본법 핵심 조항·적용 대상·실무 영향 요약(참고 등급, 한국 법령 MCP와 링크).

> 단계 순서: 검증 → 확장 → CLI → 비법 → 하네스 → 루프 → 예제 → 쇼케이스 → 참고. 한 단계 묶음 완료 시 preview 점검 + 링크체크.

### Task 3.R: 기존 핵심 페이지에 참고 문헌 소급 적용

신설 페이지와 같은 `참고 문헌·더 읽을거리` 컴포넌트를 기존 학습 페이지에도 넣는다. 대상: `ai-fluency`, `project-intro`, `multi-persona`, `harness-engineering`, `agent-design`, `agents-md-templates`, `skills`, `code-plugin`, `github-guide`, `codex-101`, `codex-tasks`, `harness-book`, `google-sheets-dashboard`, `stock-messenger`, `korean-law-mcp`, `playmcp-kakao`, `instagram-card-news`, `codex-orientation`, `ai-levels`. 페이지당: 표준 섹션 삽입 → 아래 표의 자료 채움 → 링크체크 → 커밋 `content(<slug>): 참고 문헌 추가`.

---

## 회차별 참고 문헌·읽을거리

> 모두 실재 자료다. 게시 전 URL 확인. "공식 문서"는 OpenAI/Anthropic/표준화 기구 등 1차 출처, "내부"는 사이트 내 연결 페이지.

### 진단·기초
| 페이지 | 핵심 논문 | 공식 문서 | 내부 |
|---|---|---|---|
| codex-orientation | Anthropic (2024) — Building effective agents | OpenAI Codex 문서 | ai-levels, codex-101 |
| ai-levels | — (비유: SAE J3016 자율주행 단계) | SAE J3016 개요 | codex-orientation |
| ai-fluency | Wei et al. (2022) — Chain-of-Thought Prompting Elicits Reasoning in LLMs; Kojima et al. (2022) — Large Language Models are Zero-Shot Reasoners | OpenAI/Anthropic Prompt engineering 가이드 | project-intro, multi-persona |
| project-intro | — | Anthropic Prompt engineering 문서; OpenAI Best practices for prompt engineering | ai-fluency |
| multi-persona | Du et al. (2023) — Improving Factuality and Reasoning via Multiagent Debate; Chan et al. (2023) — ChatEval | — | ai-sycophancy, agent-design |

### 검증
| 페이지 | 핵심 논문 | 공식 문서 | 내부 |
|---|---|---|---|
| ai-sycophancy | Sharma et al. (2023, Anthropic) — Towards Understanding Sycophancy in Language Models; Perez et al. (2022) — Discovering Language Model Behaviors with Model-Written Evaluations | — | multi-persona, ai-hallucination |
| ai-hallucination | Ji et al. (2022) — Survey of Hallucination in NLG (ACM Computing Surveys); Huang et al. (2023) — A Survey on Hallucination in LLMs; Lewis et al. (2020) — Retrieval-Augmented Generation | — | korean-law-mcp, company-brain |

### 확장
| 페이지 | 핵심 논문 | 공식 문서 | 내부 |
|---|---|---|---|
| chrome-plugin | — | OpenAI ChatGPT Atlas / 브라우저 사용 문서 | excel-plugin, pptx-plugin |

### 코드 (노코드/CLI/비법)
| 페이지 | 핵심 논문 | 공식 문서 | 내부 |
|---|---|---|---|
| codex-101 / codex-tasks | — | OpenAI Codex 문서 | github-guide, checklist |
| github-guide | — | GitHub Docs; Vercel Docs; Netlify Docs | codex-tasks |
| checklist / cheatsheet | — | OpenAI Codex CLI 문서 | codex-best-practices |
| codex-best-practices | — | Anthropic — Claude Code: Best practices for agentic coding (2025); OpenAI Codex 프롬프트 가이드 | harness-engineering |

### 에이전트 설계
| 페이지 | 핵심 논문 | 공식 문서 | 내부 |
|---|---|---|---|
| harness-engineering | Yao et al. (2022) — ReAct; Anthropic (2024) — Building effective agents | Anthropic Agents 문서 | codex-tools, agent-design |
| codex-tools | Schick et al. (2023) — Toolformer; Patil et al. (2023) — Gorilla; Yao et al. (2022) — ReAct | Anthropic — Model Context Protocol 소개 (2024) | harness-engineering, code-plugin |
| agent-design (멀티 에이전트) | Wu et al. (2023) — AutoGen; Hong et al. (2023) — MetaGPT | Anthropic — Multi-agent research system 블로그 | multi-persona, harness-engineering |
| agents-md-templates / skills / code-plugin | — | Anthropic Claude Code(Skills) 문서; Anthropic — Model Context Protocol | codex-tools |

### 루프 자동화
| 페이지 | 핵심 논문 | 공식 문서 | 내부 |
|---|---|---|---|
| loop-engineering | Shinn et al. (2023) — Reflexion; Madaan et al. (2023) — Self-Refine; Wang et al. (2023) — Voyager | — | routines, harness-engineering |
| routines | — | OpenAI — ChatGPT Scheduled tasks 문서 | loop-engineering, news-clipping |

### 예제
| 페이지 | 핵심 논문 | 공식 문서 | 내부 |
|---|---|---|---|
| ai-writing | Mitchell et al. (2023) — DetectGPT | — | multi-persona |
| news-clipping | Lewis et al. (2020) — Retrieval-Augmented Generation | — | routines |
| google-sheets-dashboard | — | Google Sheets API 문서 | news-clipping |
| company-brain | Lewis et al. (2020) — RAG; Asai et al. (2023) — Self-RAG; Gao et al. (2023) — RAG for LLMs: A Survey | — | harness-book, ai-hallucination |
| harness-book | — | Anthropic — Building effective agents | company-brain |
| playmcp-kakao / korean-law-mcp / stock-messenger | — | Anthropic — Model Context Protocol 사양; 각 서비스 API 문서 | codex-tools |

### 참고
| 페이지 | 핵심 자료 | 공식 문서 | 내부 |
|---|---|---|---|
| security-guide | — | OWASP — Top 10 for LLM Applications; NIST — AI Risk Management Framework (AI RMF 1.0, 2023) | ai-basic-law |
| ai-basic-law | — | 인공지능 발전과 신뢰 기반 조성 등에 관한 기본법(인공지능기본법, 2024 제정); EU AI Act (2024) | security-guide, korean-law-mcp |

> 위 목록은 시작점이다. 작성 중 더 적합한 1차 자료를 찾으면 교체하되, 검증 가능한 출처만 싣는다.

---

## Self-Review (작성자 체크 결과)
- **스펙 커버리지:** 신설 18개 전부 Phase 2(골격)+Phase 3(본문) 매핑됨. agent-design 재사용(harness-workflows) 반영. Cowork 제외 반영. 저장·배포→3단계 흡수 반영.
- **플레이스홀더:** Phase 3 각 페이지에 구체 H2 개요 제공(=작성 지침), "TBD" 없음. 구조 Task는 실제 마크업 포함.
- **타입/명명 정합:** section id(section-1/project/plugin/code/skills/loop/examples/showcase/ref)와 step-nav data-section 일치. 매니페스트 파일명과 index 링크 일치.
- **참고 문헌:** 모든 학습 페이지에 표준 `참고 문헌·더 읽을거리` 컴포넌트 필수화. 회차별 실재 자료 표 제공(신설+기존, Task 3.R로 소급). 없는 논문 금지·게시 전 URL 확인 명시.
- **주의 사항:** Task 1.2 CSS 색값은 기존 팔레트 16진값으로 확정해 입력(오타 금지). Phase 2 자동 치환이 어긋나면 페이지별 수동 보정.
