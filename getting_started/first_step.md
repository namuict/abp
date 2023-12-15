---
sort: 1
---

## 초기 설정

이 섹션에서는 일반 ABP 설치에서 완전히 권한이 부여된 첫 번째 호스트 배포로 이동할 수 있는 워크플로를 설명합니다.

실제로 아래 단계의 순서는 유연합니다. 예상되는 결과와 ABP설치시에 이미 구성한 설정수준에 따라 일부는 완전히 생략될 수 있습니다.


다음은 순서대로 사용할 ABP 관리 UI 메뉴를 설명 합니다. 

infra 메뉴, Contents 메뉴, Workflow 메뉴, Machines Group 메뉴, Machines 메뉴, 마지막으로 ZTP 메뉴입니다.

1. 호스트를 배포하려면 먼저 ABP에 인프라에 대해 설정을 합니다. (infra > Compute Resources , infra > Subnet)

   호스트를 배포할 서브넷(네트워크)을 구성과, 베어매탈 외의 환경에도 배포를 한다면 추가적으로 Compute Resources를 설정 합니다.

2. 배포할 호스트에 대한 컨텐츠를 준비합니다. (Content > Operating system) 

3. 호스트 배포를 위한 Machines Group을 구성합니다. (Machines Group)

4. ABP에 적절한 설치 미디어를 등록 합니다. (Content > Install media)

5. 호스트에 배포하려는 운영 체제에 대해 설정합니다. (Machines Group, Machines)

6. 마지막으로 ABP 운영 체제를 적절한 템플릿과 연결해야 합니다. (Machines Group, ZTP > ZTP Template)

반드시 필요한 것은 아니지만 단일 호스트 그룹(배포하려는 각 호스트 유형에 대해) 내에서 이 모든 구성을 수집하는 것이 좋습니다. 이렇게 하면 호스트를 배포할 때마다 모든 옵션을 수동으로 선택하는 지루한 작업을 수행하는 대신 적절한 호스트 그룹을 선택하고 조정하여 호스트를 배포할 수 있습니다.

지금까지 수행한 모든 작업을 종합하면 이제 호스트를 배포할 준비가 되었습니다.
