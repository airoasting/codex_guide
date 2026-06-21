# Codex 가이드 IA 정합 설계 (airoasting.vercel.app 기준)

작성일: 2026-06-21
분류: Core Asset · 구조 우선 작업
상태: 설계 승인 대기

## 왜

현재 로컬 Codex 가이드(`index.html` + 콘텐츠 페이지)는 구 분류 체계(진단 / 기본기 / 플러그인 / Codex실행 / 저장·배포 / 자동화)를 쓴다. 운영 중인 Claude판(https://airoasting.vercel.app/)은 5단계 분류가 새로 짜였고 서브섹션·페이지가 훨씬 많다. 두 사이트의 학습 동선과 정보 구조를 동일하게 맞춰, Codex판을 같은 수준의 완결된 자산으로 끌어올린다.

## 무엇 (확정 결정)

- 범위: 타깃과 동일한 IA로 `index.html` 전면 재구성 + 누락 페이지 전부 신설.
- Anthropic 전용 항목은 Codex/ChatGPT 등가물로 치환.
- **Cowork는 제외** (cowork-intro·cowork 둘 다 신설하지 않음). 2단계는 확장 프로그램만 둔다.
- 접근법 A안: IA 우선 → 공유 템플릿으로 골격 일괄 생성 → 페이지별 9.5점 심화.

### Codex 등가 매핑 (잠금)
| 타깃(Claude) | Codex판 처리 |
|---|---|
| Cowork (intro·8과제) | **제외** |
| Routines | ChatGPT Scheduled tasks(예약 작업) |
| chrome-plugin | ChatGPT Atlas / 브라우저 확장 |
| claude-tools | codex-tools (Codex의 도구란?) |
| claude-md-templates | agents-md-templates (AGENTS.md) |
| claude-code-101/-tasks | codex-101 / codex-tasks |

## 최종 IA (네비게이션 트리)

```
진단        codex-orientation, ai-levels
1단계 기본기부터
  ├ 기본기   ai-fluency, project-intro, multi-persona
  └ 검증     ai-sycophancy🆕, ai-hallucination🆕
2단계 확장   (Cowork 제외 → 확장 프로그램만)
  └ 확장프로그램  chrome-plugin🆕(Atlas), excel-plugin, pptx-plugin
3단계 Codex 코드
  ├ 노코드   codex-101, codex-tasks, github-guide(+vercel 통합)
  ├ CLI      checklist🆕, cheatsheet🆕
  └ 비법     codex-best-practices🆕
4단계 에이전트 설계
  ├ 하네스   harness-engineering, codex-tools🆕, harness-workflows(=agent-design 리네이밍 검토)
  └ 스킬     agents-md-templates, skills, code-plugin
5단계 루프 자동화
            loop-engineering🆕, routines🆕(Scheduled tasks)
예제
  ├ 기본     ai-writing🆕(윤문), news-clipping🆕, google-sheets-dashboard
  ├ MCP연결  playmcp-kakao, korean-law-mcp, stock-messenger
  └ 심화     harness-book, company-brain🆕, instagram-card-news(로컬 전용 유지)
후기        (index 섹션, 캐로우절)
쇼케이스    showcase-poems🆕, showcase🆕, hackathon🆕
갤러리      eda-gallery, component-gallery, ui-design
참고        security-guide🆕, ai-basic-law🆕
사전        file-types, license-compare, glossary
```

### 신설 페이지 목록 (🆕 ~18개)
검증 2 (ai-sycophancy, ai-hallucination) · 확장 1 (chrome-plugin) · CLI 2 (checklist, cheatsheet) · 비법 1 (codex-best-practices) · 하네스 1 (codex-tools) · 루프 2 (loop-engineering, routines) · 예제 3 (ai-writing, news-clipping, company-brain) · 쇼케이스 3 (showcase-poems, showcase, hackathon) · 참고 2 (security-guide, ai-basic-law).

> harness-workflows는 기존 `agent-design.html`을 리네이밍·재배치할지, 신설할지 심화 단계에서 내용 확인 후 결정.

## 공유 페이지 템플릿

신설 페이지는 모두 기존 콘텐츠 페이지 골격을 그대로 따른다(AGENTS.md 2장):
`header → step-nav → header-pages → sticky sub-menu → container → SM-HAMBURGER`.
기존 페이지 하나(예: `project-intro.html`)를 레퍼런스 스켈레톤으로 삼아 헤더/서브메뉴/푸터/스타일 토큰을 복제하고, 본문만 페이지별로 채운다. Codex 액센트(`--codex-accent:#3A32FF`), Pretendard, em dash 금지 등 AGENTS.md 작성·디자인 규약 전수 적용.

## 홈(index) 추가 섹션
- 퀵스타트 4접근(타깃의 4개 접근법) → Codex 맥락으로: ChatGPT.ai / 브라우저·오피스 확장 / 커넥터·파일 / Codex(코딩).
- 후기 캐로우절(기존 자산 유지·정렬), 쇼케이스 섹션 신설, 갤러리·참고·사전 정렬.
- step-nav 라벨을 새 5단계 명칭으로 통일.

## 단계 계획 (A안)

- **Phase 0 — 템플릿·IA 잠금**: 레퍼런스 스켈레톤 추출, 신설 페이지 파일명·제목·서브섹션 확정.
- **Phase 1 — index 전면 재구성**: step-nav·섹션·서브섹션·카드(시간/난이도)·퀵스타트·쇼케이스까지 타깃 IA로 교체. 신설 페이지는 골격으로 링크.
- **Phase 2 — 신설 18개 골격 생성**: 공유 템플릿으로 일괄 생성(헤더·서브메뉴·푸터·핵심 개요만). 사이트 전체가 일관·완주 가능 상태가 되는 게 목표.
- **Phase 3+ — 페이지별 심화**: 단계 순서(검증→확장→CLI→비법→하네스→루프→예제→쇼케이스→참고)로 각 페이지를 9.5점까지. 페이지당 별도 패스.

## 성공 기준
- index의 5단계+예제+섹션 구조가 타깃과 동일(Cowork 제외).
- 신설 페이지 전부 존재하고 공유 골격·디자인 규약 준수, 링크 무결.
- 각 페이지 본문이 Codex 등가 내용으로, 깨진 링크·Claude 잔재 표현 없음.

## 범위 밖
- Cowork 관련 일체.
- 갤러리/사전 등 ✓ 페이지의 내용 전면 개편(정렬·링크만).
- 호스팅·도메인 변경.

## 중단 조건
- Codex 등가가 억지스러운 페이지(현장감 없음)는 신설 대신 '준비중' 처리하고 보고.
- 한 페이지가 템플릿을 크게 벗어나야 하면 멈추고 구조 재검토.
