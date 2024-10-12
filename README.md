# SeSAC 2024 Project: Meet

<!--
초기, 빈 프로젝트에 알맞게 config.json을 작성하였습니다.
각자 개발해 나아가면서 config.json에 변경사항이 생길 경우
README.md에 반드시 적용해주셔야 합니다.

gitignore에 포함되어 있어, 공유가 안되면 관리가 되지 않습니다.

참고로, gitignore은 window, macOS, linux, node, react를 사용하는 환경에 알맞게 작성되어 있습니다.

추가하실 사항이 있다면 상의 후 수정 부탁드립니다.
-->

## 👥 팀원 소개

#### Mentor : [나동빈 강사님](https://github.com/ndb796)

- Team Leader : [박경운](https://github.com/kyeoungwoon)
- Team Member : [최재원](https://github.com/JayOneC)

## 🌟 프로젝트 개요

**Meet**는 단순한 랜덤 매칭 소개팅 시스템에서 한 발 더 나아가,  
학력 및 직장 인증을 통해 검증된 사람들과의 만남을 제공합니다.  
사용자는 추가적으로 뱃지를 통해 자신의 개성을 뽐내며,  
신뢰할 수 있는 네트워킹을 즐길 수 있습니다.

## ⚙️ Tech Spec

- **Frontend**: Next.js + React.js
- **Backend**: Node.js + NGINX with Docker
- **CI/CD**: GitHub Actions

## 🗂️ Git Strategy: GitHub Flow

- **`main`**: 항상 안정적인 상태를 유지하는 브랜치입니다.
- **`develop`**: `feature` 브랜치에서 변경된 사항들을 1차적으로 합치는 공간입니다.  
  `main` 브랜치에 PR하기 전, 마지막 체크 단계로 사용됩니다.
- **`feature`**: 각 팀원이 새로운 기능을 자유롭게 구현하는 공간입니다.
