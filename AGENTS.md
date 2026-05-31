# AGENTS.md: AI ROASTING · 비즈니스 리더를 위한 Codex 완전 정복

이 파일은 이 프로젝트에서 AI가 일할 때 따라야 할 모든 작업 지침을 담는다. 코드 규약, 디자인 시스템, 한국어 작성 원칙, 페이지 인벤토리가 모두 여기에 있다. 변경 이력은 [MEMORY.md](MEMORY.md)에 따로 둔다.

새 규약을 추가하거나 기존 규약을 고칠 때는 이 파일만 수정한다.

## 한 줄 원칙 (글쓰기)

> 자연스러운 한국어로, 주술 구조 맞추어서, 이해하기 쉽게, 번역투 거두어내고 em dash는 절대 쓰지 마.

이 한 줄이 모든 한국어 문장의 뿌리다. 이 문서, 콘텐츠 페이지의 본문, commit 메시지, AI 응답까지 모두 같은 기준으로 쓴다.

**금지어**: "흐름"은 쓰지 않는다. 문맥에 따라 과정, 동선, 전개, 작업, 단계 등으로 바꾼다.

---

## 1. 프로젝트 정체성

- **이름**: AI ROASTING · 비즈니스 리더를 위한 Codex 완전 정복
- **URL**: https://airosting.github.io/codex_guide/
- **타깃**: 비즈니스 리더와 지식 노동자 (비개발자 포함)
- **포맷**: 단일 폴더 정적 HTML (Vanilla HTML + CSS + 약간의 JS), GitHub Pages 호스팅
- **디자인**: Pretendard Variable, Codex 블루 바이올렛 액센트(`--codex-accent: #3A32FF`). 인덱스는 클린 화이트 + 라벤더 블루 카드의 평면 스타일(뉴모피즘 제거)과 SVG 라인 아이콘 시스템으로 전환했고, 헤더는 로컬 자체 호스팅(`assets/media/hero-bg.mp4`) 배경 영상에 연한 라벤더 블루 톤. 개별 콘텐츠 페이지는 아직 뉴모피즘이며 순차 전환 중
- **분류**: Core Asset (계속 키워야 할 대표 자산)
- **전환 상태**: 기존 Claude 가이드를 Codex 가이드로 전환 중이다. `index.html`은 Codex 디자인 기준을 먼저 반영했다. 개별 콘텐츠 페이지는 파일명과 본문이 아직 Claude 기준일 수 있다.

## North Star

진단 → 작업 환경 → 첫 작업 맡기기 → 코드베이스 협업 → GitHub 작업 → 자동화. 이 학습 동선을 단일 사이트에서 완성한다. 각 페이지는 "다음 행동"이 선명해야 한다.

---

## 2. 페이지 인벤토리 (활성 루트 HTML 29개)

`index.html`이 라우팅 허브다. 콘텐츠 페이지는 모두 동일한 구조 골격을 공유한다(header → step-nav → header-pages → sticky sub-menu → container → SM-HAMBURGER).

### 진단 트랙 (header-pages: 2개)
| 페이지 | 시간 | 난이도 | 특성 |
|---|---|---|---|
| `codex-orientation.html` | 5분 | 입문 | 2-menu 기준 페이지. `.hero-inner` 700px + `.header-pages` 70% (=490px). `claude-orientation.html`은 호환용 이동 페이지다 |
| `ai-levels.html` | 5분 | 입문 | 자율주행 1~5단계 비유. 헤더에 별도 배지 없이 h1과 p, header-pages만 있다 |

### 1단계 · 기본기 (header-pages: 3개)
| 페이지 | 시간 | 난이도 | 특성 |
|---|---|---|---|
| `ai-fluency.html` | 10분 | 입문 | 3-menu 기준 페이지. 제목은 "프롬프트 잘 쓰는 비결"이다. 이전의 가이드와 새로운 가이드 (v5.5)를 비교한다 |
| `project-intro.html` | 20분 | 입문 | 프로젝트 셋업, 시스템 프롬프트 |
| `multi-persona.html` | 10분 | 중급 | 5인 페르소나 토론 (5-Color Harness와 연결) |

### 2단계 · 플러그인 (header-pages: 2개)
| 페이지 | 시간 | 난이도 | 특성 |
|---|---|---|---|
| `excel-plugin.html` | 12분 | 입문 | ChatGPT for Excel 설치, 워크북 분석, 수식 점검, 시나리오 작업 |
| `pptx-plugin.html` | 12분 | 입문 | ChatGPT for PowerPoint 설치, 슬라이드 초안, 덱 수정, 발표 준비 |

### 3단계 · Codex로 실행하기 (header-pages: 2개)
| 페이지 | 시간 | 난이도 | 특성 |
|---|---|---|---|
| `codex-101.html` | 10분 | 입문 | Codex 앱 시작 과정. `.header-pages` 490px 기준 |
| `codex-tasks.html` | 과제별 | 중급 | Codex 실행 과제 7가지. `.header-pages` 490px 기준 |

### 4단계 · GitHub와 배포 (페이지: 2개, index 카드: 2개)
| 페이지 | 시간 | 난이도 | 특성 |
|---|---|---|---|
| `github-guide.html` | 12분 | 중급 | GitHub 저장소 생성, 파일 업로드, GitHub Pages 공개 |
| `vercel-guide.html` | 8분 | 중급 | Vercel 프로젝트 가져오기, 배포 URL 확인, 자동 갱신 |

### 5단계 · 자동화
| 페이지 | 시간 | 난이도 | header-pages | 특성 |
|---|---|---|---|---|
| `agents-md-templates.html` | 10분 | 중급 | 5개 | AGENTS.md 운영 문서 |
| `skills.html` | 20분 | 중급 | 7개 | 나만의 Skill 만들기 |
| `code-plugin.html` | 15분 | 고급 | 7개 | 스킬과 MCP를 플러그인으로 묶기 |
| `agent-design.html` | 20분 | 고급 | 5개 | 솔로 → 파이프라인 → 팀 → 오케스트라 |
| `harness-engineering.html` | 15분 | 고급 | 7개 | 하네스 6가지 구성 요소 |

### 실전 예제 (Codex 블루 바이올렛 액센트)
| 페이지 | 시간 | 난이도 | header-pages | 특성 |
|---|---|---|---|---|
| `google-sheets-dashboard.html` | 12분 | 중급 | 6개 | Codex 블루 바이올렛 액센트 카드 |
| `instagram-card-news.html` | 15분 | 중급 | 6개 | 카드뉴스 스토리라인과 1080×1350 PNG 다운로드 |
| `stock-messenger.html` | 15분 | 고급 | 6개 | Codex 블루 바이올렛 액센트 카드 |
| `korean-law-mcp.html` | 10분 | 중급 | 6개 | Claude Desktop Customize 커넥터 추가. 법제처 Open API |
| `playmcp-kakao.html` | 12분 | 중급 | 6개 | Codex와 Kakao PlayMCP로 카카오톡 나와의 채팅방 연결 |
| `harness-book.html` | 20분 | 고급 | 6개 | 책쓰기 실전 |

### 바이브코딩 백과사전 (header-pages: 3개)
| 페이지 | 시간 | 난이도 | 특성 |
|---|---|---|---|
| `file-types.html` | 필요할 때 | 참고 | 파일 8종 비교 |
| `license-compare.html` | 필요할 때 | 참고 | 오픈소스 라이선스 |
| `glossary.html` | 필요할 때 | 참고 | 용어 사전 |

### 디자인·시각화 갤러리 (header-pages: 3개)
| 페이지 | 시간 | 난이도 | 특성 |
|---|---|---|---|
| `eda-gallery.html` | 참고 | 참고 | 데이터 시각화 갤러리 |
| `component-gallery.html` | 참고 | 참고 | UI 컴포넌트 40종 |
| `ui-design.html` | 참고 | 참고 | UI 디자인 트렌드 12 |

---

## 3. 디자인 시스템과 코딩 규약

### 3.1 콘텐츠 영역 사이즈 (`.container`)

모든 콘텐츠 페이지(28개)는 공통 규격을 따른다 (commit 97f4331에서 통일).

```css
.container {
    max-width: 1080px;
    margin: 0 auto;
    padding: 32px 32px 80px;
}
```

원칙:
- 데스크톱 시각적 폭 상한은 1080px이다. 더 넓게 쓰지 않는다.
- 좌우 패딩 32px과 하단 80px은 고정값이다. 페이지별로 임의 조정하지 않는다.
- 본문 내부의 카드, 표, 이미지, 코드블록은 이 `.container` 안에서 100% 폭을 기본으로 한다.
- 갤러리와 다단 그리드도 `.container`를 넘어가지 않는다. 필요하면 내부에서 padding을 0으로 둔다.
- 본문 폰트 크기와 줄간격은 페이지별로 다르게 잡지 않고 사이트 공통 토큰을 따른다.

### 3.2 헤더 메뉴 폭 (`.header-pages`, `.header-page-link`)

원칙: 메뉴 개수별로 기준 페이지를 하나 정하고, 같은 개수의 모든 페이지는 그 폭에 정렬한다.

| 메뉴 수 | 기준 페이지 | `.header-pages` max-width | 각 버튼 폭 | 총합 |
|---|---|---|---|---|
| 1개 | `github-guide.html` | 490px | 최대 280px | 490px |
| 2개 | `codex-orientation.html` | 490px | 약 238px | 490px |
| 3개 | `ai-fluency.html` | 700px | 약 224px | 700px |
| 5개 | `playmcp-kakao.html` | 1080px | 약 205px | 1080px |
| 6개 | `instagram-card-news.html` | 1080px | 약 168px | 1080px |
| 7개 | 미정 | 미정 | 미정 | 미정 |
| 9개 | 미정 | 미정 | 미정 | 미정 |

버튼(`.header-page-link`) 공통 토큰:
```css
.header-page-link {
    flex: 1 1 0;
    min-width: 0;
    max-width: 280px;
    padding: 12px 22px;
    border-radius: 16px;
    font-size: 14px;
    font-weight: 700;
    gap: 8px;
    white-space: nowrap;
    color: rgba(255,255,255,0.7);
    background: rgba(255,255,255,0.07);
    box-shadow: 5px 5px 12px rgba(0,0,0,0.35), -5px -5px 12px rgba(255,255,255,0.06);
}
.header-page-link.active {
    background: rgba(255,255,255,0.14);
    box-shadow: inset 3px 3px 8px rgba(0,0,0,0.35), inset -3px -3px 8px rgba(255,255,255,0.06);
    color: #fff;
}
```

컨테이너(`.header-pages`) 공통:
```css
.header-pages {
    margin: 22px auto 0;
    display: flex;
    justify-content: center;
    gap: 14px;
    position: relative;
    z-index: 1;
}
```

`.hero-inner` 유무에 따른 폭 적용:
- `.hero-inner` (max-width: 700px)가 있는 페이지는 `.header-pages`에 `max-width: 100%` (상위 700px 상속) 또는 비율(`70%` 등)을 써도 된다.
- `.hero-inner`가 없는 페이지(`codex-101.html`, `codex-tasks.html`, `github-guide.html` 같은 경우)는 `.header-pages`에 직접 절대값(`700px` 또는 `490px`)을 적용한다. 비율(`70%`)을 쓰면 헤더 전체 폭의 70%가 되어 다른 페이지와 어긋난다.

금지 사항:
- 페이지별 임의 폭(`70%`, `64%`, `960px` 같은 값)을 그대로 두지 않는다.
- 버튼별 `min-width: 130~200px` 같은 잔여 값으로 균등 분배를 깨뜨리지 않는다.
- `gap`은 `14px`로 고정한다.

### 3.3 모바일 햄버거 메뉴

원칙: 햄버거는 사이트 공통의 단일 패턴이다. 페이지별로 다르게 만들지 않는다.

적용 범위:
- 30개 콘텐츠 페이지 전부에 동일한 코드가 들어 있다.
- 마커 주석으로 구역을 명확히 한다. `<!-- ## SM-HAMBURGER START ## -->`와 `<!-- ## SM-HAMBURGER END ## -->` 사이만 수정하거나 교체한다.

브레이크포인트와 동작 전환:
- 데스크톱(`>768px`)에서는 상단 sticky `nav.sub-menu`가 보이고 햄버거 버튼은 숨겨진다.
- 모바일(`≤768px`)에서는 다음이 동시에 일어난다.
  - `nav.sub-menu { display: none !important; }` (가로 sub-menu 숨김)
  - `.sm-menu-toggle { display: inline-flex; }` (우상단 햄버거 버튼 노출)
  - `.header-pages`가 세로 스택으로 바뀐다.

세로 스택 변형:
```css
.header-pages {
    flex-direction: column !important;
    max-width: 100% !important;
    gap: 8px !important;
    align-items: stretch !important;
}
.header-page-link {
    flex: none !important;
    max-width: none !important;
    width: 100% !important;
    white-space: normal !important;
    word-break: keep-all !important;
    font-size: 13px !important;
    padding: 11px 14px !important;
    border-radius: 12px !important;
}
```

햄버거 UI 구성:

| 요소 | 역할 | 핵심 스펙 |
|---|---|---|
| `.sm-menu-toggle` | 토글 버튼 | `position: fixed; top: 14px; right: 14px; 44×44; border-radius: 12px;` 흐림 효과 배경, z-index 1200 |
| `.sm-menu-backdrop` | 배경 오버레이 | 전체 화면, `rgba(0,0,0,0.45)`, z-index 1150 |
| `.sm-drawer` | 우측 드로어 | `width: 78%; max-width: 320px;` 100dvh, 우측에서 슬라이드 인 (`transform: translateX`), z-index 1160 |
| `.sm-drawer-heading` | 현재 페이지 제목 | active `.header-page-link` 텍스트 (아이콘 제거) > `h1` > `document.title` 순서로 자동 채운다 |
| `.sm-drawer-back` | "← 목록으로" | 항상 `index.html`로 이동한다 |
| `.sm-drawer-list` | 섹션 메뉴 | `nav.sub-menu`의 `<a>`를 JS가 복제해 `.sm-drawer-item`으로 렌더한다 |
| `.sm-drawer-item` | 한 줄 항목 | `.sm-drawer-num` (원형 번호), `.sm-drawer-title`, 그리고 있으면 `.sm-drawer-sub` |

JS 동작 (단일 IIFE, 외부 의존 없음):
1. `nav.sub-menu`의 모든 `<a>`를 `.sm-drawer-list`에 1:1로 복제한다 (번호, 제목, 서브타이틀 유지).
2. 드로어 항목을 클릭하면 드로어가 자동으로 닫힌다.
3. `body.sm-menu-open` 클래스로 상태를 토글한다 (`overflow: hidden` 동반).
4. 닫기 트리거는 세 가지다. 토글 버튼, 배경(backdrop), ESC 키.
5. MutationObserver로 `nav.sub-menu`의 active 변경을 드로어에 동기화한다 (스크롤 스파이 대응).
6. 접근성을 위해 `aria-label`("메뉴 열기/닫기")과 `aria-expanded`를 토글한다.

유지보수 규칙:
- 햄버거 블록은 사이트 공통 자산이다. 한 페이지에서 수정하면 전 페이지에 동일하게 반영해야 한다.
- 페이지가 `nav.sub-menu`를 가지지 않으면(일부 레퍼런스 페이지) 드로어 리스트가 비어 보일 수 있다. 그 페이지에서도 sub-menu 골격은 유지하는 것을 권장한다.
- 드로어 폭(320px), 버튼 위치(top 14, right 14), 브레이크포인트(768px)는 변경하지 않는다. 바꾸려면 30개 전체를 일괄 수정해야 한다.

### 3.4 중간 분기 (`≤1160px`, 비-모바일 축소)
- `.header-page-link`의 폰트는 12px, padding은 8px 14px, border-radius는 12px로 줄어든다.
- `flex: 1 1 0` 균등 분배는 유지된다 (햄버거로 전환되지 않는다).

### 3.5 색상 토큰
- 메인 액센트: `--codex-accent: #3A32FF`
- 보조 블루: `--codex-blue: var(--codex-accent)`
- 그래파이트: `--codex-graphite: #070707`
- 슬레이트: `--codex-slate: #14192E`
- 패널 배경: `--codex-panel: #F0F1F3`
- 인덱스와 콘텐츠 페이지 pill 텍스트: `--codex-pill-text: #283052`
- 인덱스와 콘텐츠 페이지 pill 기본 배경: `--codex-pill-bg: linear-gradient(135deg, #FFF4F0 0%, #ECE8FF 48%, #D9E0FF 100%)`
- 인덱스와 콘텐츠 페이지 pill active 배경: `--codex-pill-bg-active: linear-gradient(135deg, #FFECE5 0%, #DED8FF 48%, #B8C5FF 100%)`
- 인덱스와 콘텐츠 페이지 pill 보조 배경: `--codex-pill-bg-muted: linear-gradient(135deg, #F7F1EA 0%, #E9E5FF 100%)`
- 진단·단계 필버튼과 섹션 번호 배지 색 토큰(인덱스): `--codex-num-bg: linear-gradient(135deg, #7E84EC 0%, #5762D6 100%)`, active `--codex-num-bg-active: linear-gradient(135deg, #6A73E6 0%, #444FCE 100%)`, 텍스트 `--codex-num-text: #fff`. 연한 라벤더 핑크 대신 이 진한 라벤더 블루를 쓴다.
- **인덱스 기본 배경은 쿨 페리윙클 그레이 `--nm-bg: #E7E9F2`(그림자 `--nm-dark: #C5C8D8`, 라이트 `--nm-light: #FFFFFF`)를 쓴다.** 본문 텍스트는 쿨 뉴트럴 `#2C2F3A`, 제목·카드 제목 `#20242E`, 보조 텍스트 `#5A6072`로 통일한다. 이전 따뜻한 베이지 `#EDE8DF`와 웜 텍스트 `#3A3530`은 인덱스에서 더 쓰지 않는다(온도 정합).
- Claude 시절의 주황 액센트(`#D97757`, `#B35535`, `#A04828`, `#7A2E15`)는 활성 HTML 전체에서 쓰지 않는다.
- 전체 HTML 페이지의 주요 CTA, 좌측 보더, 강조 텍스트, 헤더 그라데이션은 Codex 블루 바이올렛과 그래파이트 계열을 쓴다.
- 번호 배지, 섹션 배지, step badge, 작은 pill 버튼은 따뜻한 라벤더 블루 배경과 짙은 슬레이트 텍스트를 쓴다.
- 실전 예제 카드도 골드가 아니라 Codex 블루 바이올렛을 쓴다.
- 투명 액센트는 `rgba(58,50,255,...)`를 기본으로 쓴다. 부드러운 보조광은 `#4B56ED`, `#8D9CF5`, `#D8DFFA` 계열을 쓴다.
- 인덱스와 콘텐츠 페이지의 pill 버튼, 작은 번호 배지, 섹션 배지는 진한 네이비 배경을 쓰지 않는다.
- sticky `nav.sub-menu`와 모바일 `.sm-drawer` 버튼은 쿨 그레이 패널(`#F0F1F3`, `#E3E6F0`, `#D2D6E2`)과 라벤더 블루 pill 토큰을 함께 쓴다.
- 서브 메뉴 active 배경은 따뜻한 크림과 라벤더 블루가 섞인 밝은 그라데이션으로 통일한다.
- 서브 메뉴와 모바일 드로어의 버튼 배경, 그림자, 번호 배지에는 주황, 갈색, 골드 계열을 쓰지 않는다.
- 서브 메뉴 색상과 콘텐츠 페이지의 작은 pill 배지는 `/* ## CODEX-SUBMENU-COLOR START ## */`와 `/* ## CODEX-SUBMENU-COLOR END ## */` 공통 CSS 블록에서 관리한다.

### 3.6 상단 히어로 영상 디자인

`index.html`과 실제 콘텐츠 HTML의 상단 헤더는 Codex 가이드 전환의 기준 화면이다. 이동용 HTML처럼 `http-equiv="refresh"`만 가진 파일은 제외한다. 다음 규칙을 따른다.

- 상단 헤더에는 공식 ChatGPT Codex 페이지의 배경 영상(`https://persistent.oaistatic.com/codex/background-video-jan-28.mp4`)을 쓴다.
- 영상 poster는 공식 히어로 이미지(`https://persistent.oaistatic.com/codex/landing-assets-v3/hero/desktop/hero.webp`)를 쓴다.
- 영상은 `autoplay muted loop playsinline`으로 둔다. 접근성을 위해 `prefers-reduced-motion: reduce`에서는 정적 CSS 배경으로 대체한다.
- 배경 위에는 어두운 오버레이를 얹어 흰색 헤드라인이 항상 먼저 읽히게 한다.
- 영상 노출은 인덱스 기준 `opacity: 0.98`, `filter: saturate(1.20) contrast(1.03) brightness(1.20)`을 따른다(공식 Codex 색감 100% 기준).
- 인덱스 히어로 오버레이는 왼쪽 텍스트 가독성을 지키되 오른쪽 파스텔이 보이게 둔다: `linear-gradient(90deg, rgba(7,7,7,0.56) 0%, rgba(20,25,46,0.24) 42%, rgba(216,223,250,0.06) 100%)` + `linear-gradient(180deg, rgba(216,223,250,0.06) 0%, rgba(7,7,7,0.18) 100%)`.
- 히어로에는 canvas를 넣지 않는다. 배경 움직임은 공식 배경 영상 하나로 제한한다.
- 인덱스 히어로에는 정의된 마이크로 인터랙션만 허용한다: ① 상태 알약(`.hero-status-pill`) hover 시 살짝 떠오르고 초록 점 글로우, ② 브랜드 로고(`.hero-brand`) hover 시 로고 이미지 360도 회전 + `scale(1.12)`. 그 외 배경 애니메이션은 넣지 않는다.
- 콘텐츠 페이지에는 `/* ## CODEX-HERO-VIDEO START ## */`와 `/* ## CODEX-HERO-VIDEO END ## */` 공통 CSS 블록을 둔다.
- 한 페이지에서 영상 헤더 규칙을 바꾸면 실제 헤더가 있는 루트 HTML 페이지와 공개 assets HTML 페이지에 같은 기준을 반영한다.
- 상단 sticky 메뉴와 모바일 메뉴는 열린 상태만 즉시 전환한다. transition 기반 슬라이드나 fade 효과를 넣지 않는다.
- 상단 sticky 메뉴가 `main.container`의 로드 애니메이션에 묶이지 않게 한다. 메뉴는 첫 화면에서 즉시 보여야 한다.
- 상단 브랜드 로고는 흰색 로고 이미지(`assets/logos/logo1-white.png`)를 쓰고, 별도 배경 원이나 캡슐을 두지 않는다. 브랜드 영역은 `index.html`로 가는 링크(`<a href="index.html" class="hero-brand">`)로 두고, hover 시 위 마이크로 인터랙션(로고 360도 회전)을 적용한다.
- 히어로 하단 빠른 진입 버튼은 현재 `ChatGPT`, `ChatGPT 플러그인`, `Codex 앱` 3개를 기준으로 한다.
- 히어로 하단 빠른 진입 영역은 바깥 테두리 박스를 두지 않는다. 버튼 카드만 개별 프레임으로 둔다.
- `.nav-wrapper` 배경은 하단 콘텐츠 영역과 같은 `var(--nm-bg)`를 쓴다.
- 인덱스의 모바일 드로어는 `var(--codex-panel)`을 쓴다.

### 3.7 인덱스 클린 라이트 카드 리디자인 (현행 기준)

`index.html`은 공식 Codex 카드 스타일(라이트 클린 카드)을 기준으로 한다. 뉴모피즘은 폐기했다. 콘텐츠 페이지는 아직 이전 골격일 수 있으나, 인덱스를 전환 기준으로 삼는다.

**카드 컴포넌트 (`.card`)**
- 흰 표면 `#FFFFFF`, 라운드 `22px`, 보더는 기본 `1.5px solid transparent`(레이아웃 흔들림 방지).
- 그림자 2단: `0 1px 3px rgba(20,25,46,0.05), 0 12px 30px rgba(20,25,46,0.06)`.
- hover: `translateY(-4px)` + 그림자 강화 + **테두리 라벤더 블루 `#7E84EC`**.
- 뉴모피즘 그림자(`--nm-shadow` 류)와 얇은 회색 보더, 난이도 좌측 컬러보더(`:has(.badge-level)`)는 쓰지 않는다. 난이도는 `.badge-level` 배지로만 표시한다.
- 패딩 `26px 26px 28px`, `min-height: 172px`.

**카드 아이콘 타일 (`.card-icon`)**
- 이모지를 `46px` 라운드(`13px`) 타일에 담는다. 배경 `linear-gradient(150deg, #EEF0FB 0%, #DFE3F8 100%)` + 안쪽 1px 라벤더 링. 작은 인라인 이모지는 쓰지 않는다.
- 단, 좁은 5열 `.newsletter-section .card-icon`은 타일을 리셋하고 인라인(`19px`)으로 둔다.

**카드 높이 통일**
- `.cards`는 `grid-auto-rows: 1fr`로 둔다. 한 단계(섹션) 안의 카드들은 모두 같은 세로 높이가 된다(단계 간 높이는 콘텐츠 양에 따라 다를 수 있다).

**섹션 배경 밴드**
- 본문 카드 섹션(진단·1~5단계·실전 예제·백과사전·갤러리)은 배경 밴드 없이 `var(--nm-bg)` 위에 흰 카드를 둔다.
- **수강생 한마디(`#section-voices`)**: 은은한 라이트 패널 `linear-gradient(180deg, #FCFCFE 0%, #F1F2F8 100%)` + 미세 보더, 라운드 28px. 글자는 다크(`#20242E`/`#5A6072`), 캐로우절 인디케이터는 다크/액센트(점 `rgba(20,25,46,0.18)`, active `var(--codex-accent)`).
- **다른 콘텐츠(뉴스레터)**: 위 가이드 영역과 구분되게 페리윙클 그라디언트 배경 `linear-gradient(165deg, #DEE2F3 0%, #C2C8E6 50%, #A7B0DA 100%)`을 쓴다. 뉴스레터 상단 라운드 28px, 흰 클린 카드.
- **푸터**: 검정 계열 `#14161D`로 분리한다(뉴스레터 라이트 밴드와 강한 대비). 텍스트는 라이트: 브랜드 `#AEB6FF`, 본문 `rgba(255,255,255,0.6)`. 푸터 하단 링크(`.footer-about-link`) hover는 **라벤더 블루 `#AEB6FF`**. 인덱스 푸터 자체는 라운드 없음(위 뉴스레터 밴드가 라운드라서).
- **콘텐츠 페이지(전 HTML)**: 인덱스 클린 스타일을 적용한다. 기본 배경 쿨 `#E7E9F2`(`--nm-bg`/`--bg` 등 페이지별 토큰), 본문 텍스트 쿨 `#2C2F3A`, 푸터는 인덱스와 동일한 다크 `#14161D` + 라이트 텍스트에 **상단 라운드 `border-radius: 32px 32px 0 0`**(위에 라이트 영역이 있어 라운드가 보임). 히어로 영상 톤은 `opacity: 0.98` + `filter: saturate(1.20) contrast(1.03) brightness(1.20)`로 통일.
- 폭 정렬: 모든 카드 섹션과 뉴스레터는 `.container`와 같은 폭(좌측 57px, 콘텐츠 1192px)으로 맞춘다. `.lower-ambient-inner`는 중복 패딩 없이 통과시킨다.

**진단·단계 필버튼 / 섹션 배지**
- `.guide-btn`은 흰 클린 버튼(`#FFFFFF` + 미세 보더 + 작은 그림자), hover 시 라벤더 블루 보더.
- `.guide-btn-num`과 `.section-num`은 위 `--codex-num-*` 토큰(진한 라벤더 블루 + 흰 글자)을 쓴다. 인라인 `var(--codex-pill-bg)` 덮어쓰기는 쓰지 않는다.

**A급 진입 카드(미완)**
- 레퍼런스 풀버전(상단 보라 제품 목업 패널 + 다크 알약 CTA)은 히어로 3개 진입점 전용으로 둔다. 실제 제품 목업 이미지를 받은 뒤 그 3개에만 적용한다. 30개 리스트 카드에는 적용하지 않는다.

---

## 4. 한국어 작성 원칙

이 프로젝트의 모든 한국어 글은 다음 규칙을 지킨다. 콘텐츠 페이지의 본문, 카드 설명, 헤더 문구, 운영 문서, commit 메시지, AI 응답 모두 같다.

### 4.1 em dash 절대 금지

em dash 기호(U+2014)는 어디에도 쓰지 않는다. 본문, 표 안, 주석, 제목, 어디에서도 등장하지 않는다.

대체 수단:
- 두 생각이 이어지면 마침표로 끊고 새 문장으로 쓴다.
- 부연 설명이면 괄호나 콜론을 쓴다.
- 표의 빈 칸은 그냥 비우거나 '없음', '미정'으로 적는다.

예시:
- 잘못된 표기: 햄버거 메뉴는 공통 자산 (긴 대시 사용) 한 페이지만 수정 금지.
- 올바른 표기: 햄버거 메뉴는 공통 자산이다. 한 페이지만 수정하면 안 된다.

### 4.2 주술 구조 맞추기

주어와 서술어가 같은 격으로 끝나야 한다. 주어가 멀어지면 문장을 끊는다.

- 잘못된 표기: 이 페이지의 목적은 사용자가 빠르게 따라할 수 있도록 만든다.
- 올바른 표기: 이 페이지의 목적은 사용자가 빠르게 따라가게 만드는 것이다.

### 4.3 번역투 거두기

| 번역투 | 자연스러운 표기 |
|---|---|
| ~을/를 통해 | ~으로, ~을 써서 |
| ~에 대해서 | ~에 관해, ~을 |
| ~로 인해 | ~ 때문에 |
| ~에 위치한 | ~에 있는 |
| ~을 제공한다 | ~을 준다, ~을 보여준다 |
| ~이 가능하다 | ~을 할 수 있다 |
| ~이 요구된다 | ~이 필요하다 |
| ~의 경우 | ~일 때, ~이면 |
| ~한 것이 아니라 | ~이 아니라 |
| 보다 빠른 | 더 빠른 |
| 다음과 같이 | 다음처럼 |
| 함에 있어 | 할 때 |
| 이를 통해 | 이것으로, 이걸 써서 |
| 부분에 있어서는 | ~ 부분은 |
| ~에 다름 아니다 | ~이다 |
| 매우 중요한 역할을 한다 | 핵심이다, 결정적이다 |
| ~라고 할 수 있다 | ~이다 |

### 4.4 자기해설 금지

글이 자기 자신을 설명하지 않는다.

- 잘못된 표기: 이 섹션에서는 헤더 메뉴의 구성 방식을 설명합니다.
- 올바른 표기: 헤더 메뉴는 다음 구성을 따른다.

### 4.5 과장 어휘 절제

다음 단어는 정말 그럴 때만 쓴다.

혁신적, 획기적, 완벽한, 강력한, 손쉽게, 누구나, 단 한 번에, 게임 체인저.

대신 관찰과 근거로 쓴다. "혁신적인 도구" 대신 "9,830건 대화를 분석해 만든 도구"라고 쓴다.

### 4.6 영어 병기 최소화

한국어로 잘 통하는 단어 옆에 굳이 영어를 붙이지 않는다. 다만 코드 식별자, 라이브러리 이름, 기술 용어(CSS, HTML, flex, padding 같은 것)는 그대로 둔다.

- 잘못된 표기: 사용자(user)는 카드(card)를 클릭(click)할 수 있습니다.
- 올바른 표기: 사용자는 카드를 클릭할 수 있다.

### 4.7 종결체 통일

한 문서 안에서 종결체를 섞지 않는다.

- 운영 문서(AGENTS.md, MEMORY.md, README의 일부)는 평어("~다", "~한다")로 쓴다.
- 사용자에게 보여주는 콘텐츠 본문은 경어("~합니다", "~입니다")로 쓴다.
- 한 페이지 안에서 평어와 경어를 섞지 않는다.

### 4.8 AI 마무리 명언 금지

문단 끝에 일반화된 격언이나 다짐을 붙이지 않는다.

- 잘못된 표기: 결국 좋은 글은 독자를 향한 배려에서 나온다.
- 올바른 표기: (그냥 끝낸다.)

### 4.9 글의 전개

- 두 문장이 이어지면 접속사 없이도 자연스러운지 살핀다.
- "그리고", "하지만", "따라서"를 남발하지 않는다.
- 한 문단에는 한 주제만 담는다.
- 표나 목록으로 분해할 수 있으면 분해한다.
- 한 문장이 두 줄을 넘으면 잘라본다.

### 4.10 마지막 점검

글을 마치기 전에 스스로 묻는다.

1. em dash가 한 개라도 남아 있는가.
2. 주어와 서술어가 어긋난 문장이 있는가.
3. 번역투 표현이 남아 있는가.
4. 같은 문서에서 평어와 경어가 섞였는가.
5. 자기해설 문장이 있는가.
6. 끝에 군더더기 다짐이나 격언이 붙어 있는가.

하나라도 해당하면 그 자리에서 고친다.

---

## 5. Working Rules (사용자 명령 누적 정책)

### Rule 1. 사이즈 통일은 메뉴 개수별 기준 페이지를 따른다
- 3-menu는 `ai-fluency.html`을 기준으로 한다.
- 2-menu는 `codex-orientation.html`을 기준으로 한다.
- 5-menu는 `playmcp-kakao.html`을 기준으로 한다.
- 6-menu는 `instagram-card-news.html`을 기준으로 한다.
- 새 메뉴 카운트(7, 9)는 별도 기준 페이지를 정의하기 전까지 손대지 않는다.

### Rule 2. 헤더에서 중복되는 배지는 제거한다
- 예시: `ai-levels.html`의 "5단계로 진단 · 10분 소요"는 본문과 index 메타데이터로 충분해서 헤더에서 뺐다.
- 새 페이지를 만들 때 `header-badge`는 본문이 강하게 요구할 때만 쓴다.

### Rule 3. 기존 디자인 토큰을 깨지 않는다
- 폰트, 색, 뉴모피즘 그림자는 페이지 간 일관성을 유지한다.
- 활성 HTML의 액센트는 Codex 블루 바이올렛으로 통일한다.
- 페이지별 특수 액센트는 기존 콘텐츠 페이지 안에서 명시적 사유가 있을 때만 허용한다.

### Rule 4. 변경은 데스크톱과 모바일 모두 확인하고 보고한다
- `≤1160px` 분기와 모바일(`≤768px`) 분기에 같은 변경이 필요할 수 있다.
- 데스크톱만 수정하고 끝내지 않는다.
- 모바일 분기에서는 `.header-pages` 세로 스택과 `nav.sub-menu` 숨김(햄버거 대체)이 함께 동작하는지 확인한다.

### Rule 5. 사이트 공통 블록은 일괄 수정한다
- 햄버거 메뉴(SM-HAMBURGER START~END), `.container` 폭, 헤더 메뉴 토큰처럼 전 페이지가 공유하는 구성 요소는 한 페이지만 손대지 않는다.
- 부득이 단일 페이지에만 적용해야 하면 사유를 [MEMORY.md](MEMORY.md)에 기록한다.

### Rule 6. 운영 문서는 AGENTS.md 한 곳에서 관리한다
- 코드 규약, 디자인 시스템, 한국어 작성 원칙, 페이지 인벤토리는 모두 이 파일에 있다.
- 새 규약은 이 파일에 추가하고, 변경 이력은 MEMORY.md에 남긴다.

### Rule 7. Codex 전환 작업은 인덱스 기준을 따른다
- 새 인덱스 디자인은 Codex 블루 바이올렛, 공식 배경 영상 히어로, ChatGPT와 Codex 빠른 진입 메뉴를 기준으로 한다.
- 모든 활성 HTML 페이지의 색상 디자인은 인덱스와 같은 Codex 블루 바이올렛, 그래파이트, 뉴모피즘 배경 계열로 맞춘다.
- 실제 상단 헤더가 있는 루트 HTML 페이지는 인덱스와 같은 공식 Codex 배경 영상 패턴을 공유한다.
- Claude 문구를 Codex 문구로 바꿀 때는 기능 이름이 실제 사용 맥락과 맞는지 확인한다.
- 파일명은 사용자가 별도 요청하기 전까지 한꺼번에 바꾸지 않는다. 기존 링크 안정성을 우선한다.

---

## 6. 버전 관리

GitHub 첫 커밋은 2026-02-24에 올렸다. 모든 릴리스는 [README.md](README.md)의 "버전 히스토리" 섹션에 기록한다.

### 6.1 버전 번호 규칙 (semver)

`MAJOR.MINOR.PATCH` 형식을 따른다.

- **메이저 (앞 숫자)**: 사이트 전체 표준화나 큰 방향 전환. 예: v1.0.0 (운영 문서 체계 정착과 헤더 메뉴 통일).
- **마이너 (가운데 숫자)**: 새 페이지 추가, 새 기능 도입, 큰 디자인 변경.
- **패치 (끝 숫자)**: 작은 수정, 문구 정리, 부분 보강.

### 6.2 언제 버전을 올리는가

- 기본 리듬은 **매주 일요일**이다. 그 주(월~일)에 들어온 commit을 묶어 일요일 날짜로 한 버전을 부여한다.
- 활동이 없는 주는 건너뛴다. 버전 번호도 한 단계 비워 둔다(예: v0.3.0 → 건너뛰는 주 → v0.5.0).
- 메이저 버전(앞 숫자) 부여는 사용자가 선언한다. AI가 임의로 메이저로 올리지 않는다.
- 한 commit이 한 버전과 1:1로 일치할 필요는 없다. 한 주간 단위로 묶는다.

### 6.3 릴리스 노트 형식

README.md의 버전 히스토리는 단일 표로 정리한다. 각 행은 다음 네 칸으로 구성된다.

| 칸 | 내용 |
|---|---|
| 버전 | `vX.Y.Z` 형식. semver를 따른다 (6.1 참고). |
| 날짜 (일) | 그 주의 일요일 날짜. `YYYY-MM-DD` 형식. |
| 부제 | 그 주의 큰 주제를 2~5단어로 잡는다. 예: '표준화', '모바일 햄버거 + 첫 진입점 리뉴얼'. |
| 핵심 변경 | 의도와 영향 중심으로 쉼표로 묶어 한 셀에 정리한다. 신규 페이지나 파일은 백틱으로 표시한다 (예: ``stock-messenger.html``). |

규칙:
- 표 위에 첫 commit 날짜와 매주 일요일 리듬을 짧게 설명하는 도입 문단을 둔다.
- 표 위에 버전 규칙 3종(메이저·마이너·패치) 설명을 글머리표로 둔다.
- 표 안에서는 동작 중심 서술("~를 통일했습니다")이 아니라 명사구로 압축한다 ("본문 폭 1080px 통일").
- 문체는 도입 문단까지 경어로 통일한다. 표 셀은 명사구라 종결체가 따로 없다.
- 표가 길어져도 별도 헤딩이나 메이저 도입 문단을 더하지 않는다. 표 하나가 곧 히스토리다.

### 6.4 어디에 기록하는가

- [README.md](README.md): 공식 릴리스 노트. 사용자가 보는 버전 히스토리.
- [MEMORY.md](MEMORY.md): 세션별 작업 로그. 버전이 부여되지 않은 중간 작업도 여기에 남는다.
- commit 메시지: `vX.Y.Z: 부제 (핵심 변경)` 형식을 쓰면 git 이력과 README 버전이 맞아 들어간다.

### 6.5 commit 메시지 규칙

- 릴리스 commit: 첫 줄에 버전과 부제를 적고, 본문에 변경 항목을 짧은 글머리표로 나열한다.
- 일반 commit: 변경 대상 파일이나 영역으로 시작해 무엇을 했는지 한 줄로 적는다 (예: `ai-fluency.html 모바일 사이즈를 다른 페이지와 동일하게 정렬`).
- 한국어로 쓰되 4절의 한국어 작성 원칙을 그대로 지킨다.

---

## 7. Anti-Patterns

- `.container` 폭을 1080px 외의 값으로 바꾸지 않는다.
- 페이지마다 `.header-pages max-width`를 임의 값(70%, 64%, 960px 같은 값)으로 두지 않는다. 메뉴 개수별 기준 폭으로 통일한다.
- `.hero-inner` 유무를 확인하지 않고 폭을 비율(`70%`)로 두지 않는다. 헤더 풀폭의 70%가 되어 다른 페이지와 어긋난다.
- 햄버거 메뉴 블록(SM-HAMBURGER START~END)을 한 페이지만 수정하고 나머지를 그대로 두지 않는다. 이 블록은 사이트 공통 자산이다.
- 햄버거 드로어 폭, 위치, 브레이크포인트(320px, top14·right14, 768px)를 페이지별로 다르게 두지 않는다.
- 모바일에서 `.header-pages`를 가로로 유지하려고 `flex-direction: column`을 깨지 않는다.
- 본문 메타데이터로 알 수 있는 정보를 헤더 배지에 중복으로 노출하지 않는다.
- 활성 HTML에 Claude 주황, 실전 예제 골드, 주황 그라데이션을 다시 넣지 않는다.
- 서브 메뉴와 모바일 드로어 버튼에 베이지, 갈색, 주황, 골드 계열 배경이나 그림자를 쓰지 않는다.
- 상단 헤더에 공식 Codex 배경 영상 외 움직이는 canvas, video, 배경 애니메이션을 추가로 넣지 않는다.
- `index.html` 헤더 버튼에 transition이나 transform 기반 hover 효과를 넣지 않는다.
- `index.html`의 상단 sticky 메뉴와 모바일 메뉴에 transition 기반 슬라이드나 fade 효과를 넣지 않는다.
- `index.html`의 상단 sticky 메뉴가 로드 fade에 묶이도록 `main.container`에 animation을 주지 않는다.
- 새 페이지를 만들 때 기존 골격(`header → step-nav → header-pages → sticky sub-menu → container → SM-HAMBURGER`)을 따르지 않는 일이 없도록 한다.

---

## 8. Default Output Pattern

페이지 수정 요청을 받으면 다음 순서로 답한다.

1. 변경 대상 파일 목록과 분류 (기준 페이지인지, 통일 대상인지).
2. 변경 전과 후의 CSS 핵심 값을 비교한 표.
3. 데스크톱과 모바일에 미치는 영향 범위.
4. 다음 액션 (commit 여부 등).
