# MEMORY.md: 변경 로그

이 파일은 세션별 작업 로그를 기록한다. 모든 작업 지침은 [AGENTS.md](AGENTS.md)에 있다.

---

## 최근 세션 변경 로그

### 2026-05-30

| # | 요청 | 범위 | 결과 |
|---|---|---|---|
| 1 | `MEMORY.md` 파일의 기존 내용을 모두 지우고, 현재 요청을 첫 번째 기록으로 남기기 | `MEMORY.md` | 기존 변경 로그와 표준화 상태를 모두 삭제하고, 현재 요청을 첫 번째 항목으로 기록 |
| 2 | 사이트 주소를 `airosting.github.io/codex_guide`로 변경 | 전체 활성 HTML, `AGENTS.md`, `README.md` | 기존 `airoasting.github.io/claude_guide` 주소를 요청한 새 주소로 일괄 변경 |
| 3 | 히어로 빠른 메뉴를 3개만 남기기 | `index.html`, `AGENTS.md` | `ChatGPT`, `ChatGPT 플러그인`, `Codex 앱`만 남기고 `Codex`, `GitHub` 버튼 제거 |
| 4 | 헤더 애니메이션 효과 모두 제거 | `index.html`, `AGENTS.md`, `README.md`, 운영 문서 | 히어로 canvas와 관련 JS 제거. 헤더 hover, sticky 메뉴, 모바일 메뉴 전환과 상단 메뉴 로드 fade 제거. 헤더 기준을 공식 배경 영상 이전의 정적 그래파이트 배경으로 변경 |
| 5 | 모든 HTML 페이지 색상 디자인을 AGENTS.md 기준에 맞추기 | 전체 활성 HTML, `AGENTS.md` | Claude 주황과 골드 계열 색상값을 Codex 블루 바이올렛, 그래파이트, 차가운 패널 계열로 변경. 헤더 그라데이션, active 배지, CTA, 강조 텍스트 색상 통일 |
| 6 | 대표 제목을 `비즈니스 리더를 위한 Codex 완전 정복`으로 변경 | 전체 활성 HTML, `AGENTS.md`, `README.md` | 인덱스 H1, HTML 메타 제목과 설명, 푸터 문구, 문서 제목을 새 제목 기준으로 변경 |
| 7 | 히어로 빠른 진입 영역의 바깥 테두리 박스 제거 | `index.html`, `AGENTS.md` | `.hero-intro`의 border, 배경, 그림자, blur, padding 제거. 내부 버튼 카드 3개는 유지 |
| 8 | 상단 로고 이미지를 흰색 로고 스타일로 변경 | `index.html`, `AGENTS.md` | 히어로 브랜드 로고를 `logo1-white.png`로 교체하고, 기존 흰 배경 원과 테두리 그림자 제거 |
| 9 | 제목 앞에 `비즈니스 리더를 위한`을 붙이기 | 전체 활성 HTML, `AGENTS.md`, `README.md`, 슬라이드 | 대표 제목과 오리엔테이션 제목을 `비즈니스 리더를 위한 Codex 완전 정복` 기준으로 변경. 기존 설명문은 중복 없이 유지 |
| 10 | 대표 제목에서 `ChatGPT ·` 삭제하고 제목 크기 줄이기 | 전체 활성 HTML, `index.html`, `AGENTS.md`, `README.md`, 슬라이드 | 대표 제목을 `비즈니스 리더를 위한 Codex 완전 정복`으로 변경. 인덱스 H1 크기를 데스크톱 48px, 모바일 24px, 360px 이하 21px로 조정 |
| 11 | H1 크기 복원 | `index.html` | 인덱스 H1 크기를 데스크톱 52px, 모바일 25px, 360px 이하 22px로 복원 |
| 12 | `claude-plugin.html`을 ChatGPT 기준 MS Office 페이지로 전환 | `msoffice-plugin.html`, `index.html`, `ai-levels.html`, `README.md`, `AGENTS.md`, 슬라이드 | 파일명을 `msoffice-plugin.html`로 변경. Claude Office add-in 설치 안내를 제거하고 ChatGPT 파일 업로드, 데이터 분석, SharePoint 앱 연결 흐름으로 본문 재작성 |
| 12 | `claude-orientation.html`을 Codex 중심 오리엔테이션으로 개편 | `codex-orientation.html`, `claude-orientation.html`, 전체 활성 HTML 링크, `AGENTS.md`, `README.md` | 새 `codex-orientation.html` 작성. Codex의 뜻, OpenAI Codex 제품 구조, 사용 표면, 안전한 첫 작업 흐름으로 본문 전면 재구성. 기존 `claude-orientation.html`은 호환용 이동 페이지로 변경 |
| 13 | `chrome-plugin.html`을 ChatGPT 플러그인 페이지로 개편 | `chrome-plugin.html`, `index.html` | Claude 크롬 확장 설명을 제거하고 ChatGPT 앱, Chrome 검색 확장, PowerPoint와 Excel 애드인, Word 파일 업로드 흐름으로 재구성. 인덱스 카드 문구도 같은 기준으로 수정 |
| 14 | Claude Design 메뉴와 페이지 삭제 | `index.html`, `chrome-plugin.html`, `msoffice-plugin.html`, `ai-levels.html`, 슬라이드, 문서 | Claude Design 카드와 헤더 메뉴를 제거하고, 2단계 링크를 플러그인 흐름으로 정리. `claude-design.html` 삭제 |
| 15 | `project-intro.html`을 ChatGPT 관점으로 수정 | `project-intro.html`, `README.md` | Claude 프로젝트 설명과 화면 목업을 ChatGPT Projects 기준으로 변경. 프로젝트 지침, 소스, 프로젝트 채팅, 템플릿 내용을 ChatGPT 관점으로 재작성. README의 페이지 설명도 함께 정리 |
| 16 | `project-intro.html`의 ChatGPT 왼쪽 메뉴를 실제 화면 기준으로 수정 | `project-intro.html` | 화면 목업을 라이트 모드로 바꾸고, 왼쪽 메뉴를 ChatGPT, 새 채팅, 채팅 검색, 라이브러리, 프로젝트, 앱, Codex 구성으로 정리 |
| 17 | `project-intro.html`의 프로젝트 클릭 후 화면을 실제 목록 화면 기준으로 수정 | `project-intro.html` | 프로젝트 상세 목업을 제거하고, 프로젝트 제목, 검색창, 새 프로젝트 버튼, 전체·내가 만든 프로젝트·나와 공유됨 탭, 이름·수정됨 목록 구조로 변경 |
| 18 | `project-intro.html`에 프로젝트 제목 클릭 후 설정 화면 추가 | `project-intro.html` | 프로젝트 설정 모달 목업을 추가하고, 만드는 법의 지침 작성 절차를 프로젝트 제목 클릭 후 지침 수정 방식으로 변경 |
| 16 | `chrome-plugin.html`의 Chrome 확장 링크 변경 | `chrome-plugin.html` | 상단 CTA와 하단 Chrome 확장 확인 링크를 OpenAI Chrome 웹스토어 게시자 페이지로 변경 |
| 17 | Codex 오리엔테이션 문체 정리 | `codex-orientation.html` | 본문 문장을 자연스러운 한국어와 분명한 주술 구조로 다듬고, 번역투 표현을 줄임 |
| 18 | 3단계를 ChatGPT 업무 워크스페이스로 전환 | `chatgpt-workspace.html`, `chatgpt-workflows.html`, `index.html`, `README.md`, `AGENTS.md`, 전체 활성 HTML 링크 | 기존 클로드 코워크 2개 페이지를 ChatGPT 프로젝트, 파일, 앱, 회사 지식, 실전 워크플로우 중심으로 교체. `cowork-intro.html`, `cowork.html`은 새 페이지로 이동 처리 |
| 19 | Codex 오리엔테이션 서브 메뉴와 섹션 구분 효과 조정 | `codex-orientation.html` | 서브 메뉴 배경은 전체 폭으로 유지하고 내부 메뉴 묶음은 본문 1080px 폭에 정렬. 모든 섹션 구분 배지와 라인에 빛이 지나가는 애니메이션 추가 |
| 21 | 2단계 플러그인을 Excel과 PowerPoint 2개 파일로 분리 | `excel-plugin.html`, `pptx-plugin.html`, `chrome-plugin.html`, `msoffice-plugin.html`, `index.html`, `README.md`, `AGENTS.md`, 전체 활성 HTML 링크 | OpenAI 공식 가이드 기준으로 ChatGPT for Excel과 ChatGPT for PowerPoint 전용 페이지를 새로 만들고, 기존 Chrome과 MS Office URL은 새 페이지로 이동 처리. 2단계 인덱스와 문서 목록, 전역 단계 링크를 두 파일 기준으로 정리 |
| 22 | `project-intro.html`의 프로젝트 관련 파일 위치를 소스 탭 기준으로 수정 | `project-intro.html` | 소스 탭 목업을 추가하고, 파일 업로드 안내를 소스 추가 흐름으로 변경 |
| 23 | `project-intro.html`의 프로젝트명 예시를 범용 업무명으로 변경 | `project-intro.html` | 실제 사용자 프로젝트명을 제거하고, 분기 경영 보고서와 고객사 제안서 같은 비즈니스 리더용 예시로 교체 |
| 24 | `project-intro.html`의 프로젝트 목록 목업 비율 조정 | `project-intro.html` | 프로젝트 목록 목업을 더 넓고 낮은 비율로 조정하고, 행 높이와 여백을 줄임 |
| 25 | 3단계와 4단계 재구성, CLI 섹션 삭제 | `index.html`, `README.md`, `AGENTS.md`, `ai-levels.html`, 슬라이드, 관련 HTML 링크 | 기존 4단계 Codex 실행 내용을 3단계로 이동. 4단계를 GitHub와 배포로 분리. 인덱스와 문서 목차에서 CLI 섹션과 체크리스트, 치트시트 진입점을 제거 |
| 26 | `excel-plugin.html`의 OpenAI 링크 문구 변경 | `excel-plugin.html` | 버튼 문구를 `OpenAI 발표 글`에서 `OpenAI 공지`로 변경 |
| 27 | 4단계 GitHub와 Vercel 카드 분리 | `index.html`, `README.md`, `AGENTS.md`, `ai-levels.html`, `github-guide.html`, 관련 HTML 진입 버튼 | 인덱스 4단계를 GitHub 저장과 Vercel 배포 2개 카드로 분리하고 문서 목차와 로드맵, 진입 문구를 같은 기준으로 정리 |
| 28 | 5단계 대표 규칙 파일을 AGENTS.md 중심으로 변경 | `agents-md-templates.html`, `index.html`, `README.md`, `ai-levels.html`, `ai-fluency.html`, 5단계 관련 HTML, `AGENTS.md` | 5단계 카드와 헤더 메뉴를 AGENTS.md 기준으로 바꾸고, 운영 문서 페이지의 첫 설명과 셋업 순서를 AGENTS.md 중심으로 정리 |
| 29 | 5단계 운영 문서 페이지에서 기존 규칙 파일 설명 삭제 | `agents-md-templates.html`, `MEMORY.md` | 운영 문서 페이지의 본문, 서브 메뉴, 예시 코드, 셋업 단계에서 이전 규칙 파일 설명을 제거하고 AGENTS.md와 MEMORY.md만 남김 |
| 28 | 공식 Codex 색상과 히어로 애니메이션 반영 | 전체 활성 HTML, `index.html`, `AGENTS.md` | Codex 메인 색상을 그린에서 블루 바이올렛 계열로 변경. 인덱스 히어로에 공식 Codex 배경 영상을 추가하고, reduced motion 정적 대체 배경을 설정 |
| 29 | `ai-fluency.html`을 GPT-5.5 프롬프트 비교 페이지로 변경 | `ai-fluency.html` | OpenAI 공식 Prompt engineering과 GPT-5.5 Prompt guidance 기준으로 보편 프롬프트 원칙과 GPT-5.5 원칙의 차이, 비교 표, 실전 템플릿 중심으로 본문 재구성 |
| 32 | 4단계 카드 완전 분리 | `index.html`, `MEMORY.md` | GitHub와 Vercel을 같은 카드 그리드 안의 2개 항목에서 독립 트랙 2개로 나누고, 각 트랙 안에 카드가 한 장씩만 렌더되도록 변경 |
| 30 | 전체 콘텐츠 페이지 상단 헤더 영상화 | 루트 콘텐츠 HTML 25개, 공개 assets HTML 3개, `AGENTS.md`, `README.md`, 운영 문서 | 이동용 HTML을 제외한 실제 콘텐츠 페이지 상단에 인덱스와 같은 공식 Codex 배경 영상, 오버레이, reduced motion 대체 배경을 적용. 디자인 가이드를 전체 헤더 공통 규칙으로 갱신 |
| 31 | `project-intro.html` 목업 폭 통일과 설명 말풍선 추가 | `project-intro.html` | 프로젝트 목록, 설정, 소스 탭 목업의 가로 폭을 통일하고 각 화면의 핵심 의미를 말풍선으로 설명 |
| 33 | `project-intro.html` 목업 폭을 콘텐츠 영역에 맞춤 | `project-intro.html` | 세 목업 카드 폭을 화면 기준이 아니라 본문 콘텐츠 영역 100% 기준으로 변경 |
| 34 | `ai-fluency.html` 페이지 제목 정합성 반영 | `index.html`, `README.md`, `AGENTS.md`, `MEMORY.md` | 인덱스 카드 제목과 설명, README 페이지 목록, AGENTS 페이지 인벤토리를 GPT-5.5 프롬프트 비교 페이지 기준으로 변경 |
| 35 | `ai-fluency.html` 제목을 간결하게 변경 | `ai-fluency.html`, `index.html`, `README.md`, `AGENTS.md`, `MEMORY.md` | 페이지 제목, 헤더 메뉴, 인덱스 카드, README 목록, AGENTS 인벤토리를 "프롬프트 잘 쓰는 비결" 기준으로 통일 |
| 36 | `ai-fluency.html` 비교 문구와 표 구조 수정 | `ai-fluency.html`, `index.html`, `README.md`, `AGENTS.md`, `MEMORY.md` | "예전 보편 가이드" 표현을 "이전의 가이드 vs. 새로운 가이드 (v5.5)" 기준으로 바꾸고, 비교 표에서 리더 적용 열 제거 |
| 37 | `ai-levels.html`을 Codex 진단 페이지로 전면 개편 | `ai-levels.html` | 인덱스 카드 구성에 맞춰 기본기, 플러그인, Codex 실행, GitHub와 배포, 자동화 5단계 진단 흐름으로 본문 재작성. Claude 기능 지도와 주황 계열 디자인 제거 |
| 38 | GitHub와 Vercel 파일 분리 | `github-guide.html`, `vercel-guide.html`, `index.html`, `README.md`, `AGENTS.md`, `ai-levels.html`, 관련 진입 버튼 | GitHub 가이드는 저장소와 Pages 전용으로 정리하고 Vercel 내용을 제거. Vercel 가이드를 새 파일로 만들고 GitHub 가입, 토큰, Pages, Git 용어 내용을 제거. 인덱스와 로드맵 링크를 파일 단위로 분리 |
| 39 | 서브 메뉴 버튼 색상 통일 | 서브 메뉴가 있는 루트 HTML 26개, `AGENTS.md`, `MEMORY.md` | sticky 서브 메뉴와 모바일 드로어 버튼의 베이지, 갈색, 골드 계열 잔여색을 쿨 그레이와 Codex 블루 바이올렛 기준으로 통일. `CODEX-SUBMENU-COLOR` 공통 CSS 블록 추가 |
| 40 | 인덱스 수강생 후기의 클로드 표현 변경 | `index.html` | 수강생 후기 문단의 `클로드` 표현 2곳을 `Codex`로 변경 |
| 41 | 인덱스 헤더 상태 버튼 추가 | `index.html` | 히어로 제목 아래에 `최종 업데이트 2026년 6월`, `최신 모델 ChatGPT 5.5` 버튼 2개 추가 |
| 42 | 인덱스 헤더 상태 버튼 순서와 크기 조정 | `index.html` | 설명 줄과 상태 버튼의 위아래 순서를 바꾸고, 상태 버튼 크기를 이전 대비 절반 수준으로 축소 |
| 43 | 인덱스 수강생 후기 Codex 맥락으로 재작성 | `index.html` | 후기 6개를 Codex 작업 요청, 파일 변경 확인, GitHub 흐름, 검수와 협업 중심으로 재작성 |
| 44 | 인덱스 헤더 상태 버튼 크기 확대 | `index.html` | 상태 버튼 높이, 글자, 여백, 점 크기를 이전 대비 약 130%로 확대 |
| 45 | 인덱스 헤더 상태 버튼 크기 미세 축소 | `index.html` | 상태 버튼 높이, 글자, 간격, 점 크기를 이전 대비 약 90% 수준으로 조정 |
| 46 | 인덱스 하단과 푸터 배경 영상화 | `index.html`, `MEMORY.md` | 실전 예제부터 갤러리까지 하단 콘텐츠를 공식 Codex 배경 영상 레이어로 감싸고, 뉴스레터와 푸터에도 같은 영상 기반 오버레이를 적용. reduced motion 정적 대체 배경 유지 |
| 47 | 인덱스 영상 배경 밝기 보정 | `index.html`, `MEMORY.md` | 상단, 하단, 뉴스레터, 푸터의 어두운 오버레이를 낮추고 영상 밝기와 투명도를 올림. 하단 영상 영역과 뉴스레터 사이의 기본 배경색 띠 제거 |
| 48 | 인덱스 2단계 플러그인 카드 폭 조정 | `index.html` | 플러그인 카드 그리드를 3열 기본값에서 2열로 바꿔 콘텐츠 영역 전체 폭에 맞춤 |
| 49 | 인덱스 pill 버튼 색상 완화 | `index.html`, `AGENTS.md`, `README.md`, `MEMORY.md` | 단계 번호, 섹션 번호, 트랙 배지의 진한 네이비 계열을 따뜻한 라벤더 블루 그라데이션과 짙은 슬레이트 텍스트로 변경. 디자인 문서의 pill 토큰 기준 갱신 |
| 50 | `ai-levels.html` 문체를 전략 컨설턴트 톤으로 조정 | `ai-levels.html` | 학습지 느낌의 표현을 활용 성숙도, 실행 과제, 운영 기준 중심 문장으로 변경. 자가 진단과 로드맵 문구를 리더 의사결정에 맞게 정리 |
| 51 | 전체 콘텐츠 페이지 pill 색상 확장 | 루트 콘텐츠 HTML 28개, `AGENTS.md`, `README.md`, `MEMORY.md` | `CODEX-SUBMENU-COLOR` 공통 블록을 라벤더 블루 pill 토큰 기준으로 교체. sticky 서브 메뉴 번호 배지, 모바일 드로어 번호 배지, 섹션 배지, step badge의 진한 네이비 계열과 잔여 갈색·골드 계열을 부드러운 밝은 톤으로 통일 |
| 52 | 카카오톡 PlayMCP 실전 페이지와 인덱스 카드 추가 | `playmcp-kakao.html`, `index.html`, 실전 예제 HTML 4개, `README.md`, `AGENTS.md`, `MEMORY.md` | Codex와 Kakao PlayMCP를 연결해 카카오톡 나와의 채팅방으로 작업 요약을 보내는 실전 페이지 추가. 인덱스 실전 예제 카드와 실전 예제 상단 메뉴를 5개 기준으로 정렬 |
| 53 | 인스타그램 카드뉴스 실전 페이지와 인덱스 카드 추가 | `instagram-card-news.html`, `index.html`, 실전 예제 HTML 5개, `README.md`, `AGENTS.md`, `MEMORY.md` | 2030 여성 패션 타깃 예시로 카드뉴스 스토리라인을 만들고 1080×1350 PNG를 내려받는 실전 페이지 추가. 인덱스 실전 예제 카드와 실전 예제 상단 메뉴를 6개 기준으로 정렬 |
| 54 | `codex-orientation.html`에 ChatGPT와 Codex 앱 연표 추가 | `codex-orientation.html`, `MEMORY.md` | OpenAI 공식 발표 기준으로 2022년부터 2026년까지 ChatGPT 주요 업그레이드와 Codex 앱 출시일을 연도별 섹션으로 추가. 서브 메뉴와 모바일 드로어 섹션 목록도 함께 갱신 |
