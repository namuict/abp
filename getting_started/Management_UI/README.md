---
sort: 2
---

# ABP 관리 UI

이 장에서는 관리 *사용자 인터페이스를* 나타내는 ABP UI를 다룹니다.

사용자 계정과 암호를 사용하여 웹 브라우저를 통해 관리 UI에 액세스할 수 있습니다. 사용자가 ABP와 상호 작용하는 주요 방법을 나타냅니다. ABP의 관리 UI에 액세스하려면 [최신 버전의 Mozilla Firefox](https://www.mozilla.org/en-GB/firefox/new/) 또는 [Google Chrome](https://www.google.com/chrome/)을 사용하는 것이 좋습니다.

![image](https://github.com/namuict/abp/assets/117419940/f33491a4-bf7b-4abb-8273-76e40c9cd294)

- 마우스를 올려 아이콘(1)을 클릭하여 왼쪽의 메뉴 항목을 최소화합니다.
- *조직*(2)과 *위치*(3)를 클릭하여 컨텍스트를 전환합니다.
    
    상황에 맞는 메뉴의 이름은 현재 선택한 컨텍스트에 따라 동적으로 지정됩니다. 컨텍스트라는 용어는 organization과 location로 구성된 튜플을 나타냅니다.
    
    하위 메뉴를 클릭하여 사용 가능한 organization과 location 목록을 보거나 조직 또는 위치 컨텍스트를 변경합니다. 또한 컨텍스트 소속에 관계없이 엔터티를 선택하거나 볼 수 있습니다.`Any Organization, Any Location`
    
- 사용자 메뉴(4)를 클릭하여 *사용자* 계정을 편집하거나 ABP에서 로그아웃합니다.
</br>
***ABP의 사용자***

ABP에 대한 사용자 액세스는 컨텍스트에 따라 제한됩니다. ABP 사용자는 자신이 할당된 컨텍스트에 속하는 엔터티만 볼 수 있습니다. 결과적으로 컨텍스트는 ABP의 사용자 관리의 일부로 간주됩니다.

자세한 내용은 *ABP 관리 안내서*의 사용자 및 역할 관리를 참조하십시오.

</br>
***조직 및 위치 컨텍스트 사용***

컨텍스트를 사용하여 ABP 내에서 조직 구조를 제공하여 호스트, 사용자, 컴퓨팅 리소스, 설치 미디어 등과 같은 엔터티를 구조화된 방식으로 그룹화하여 실제 조직 구조를 미러링할 수 있습니다. organization및 location 컨텍스트를 사용하여 조직 내의 각 부서에 고유한 조직 컨텍스트를 할당하고, 서로 다른 데이터 센터 또는 지점과 같은 각 물리적 위치 또는 내부 및 외부 서비스 또는 DMZ와 같은 논리적 위치에 고유한 위치 컨텍스트를 할당할 수 있습니다.

ABP의 거의 모든 단체는 적어도 하나의 organization및 location과 제휴하고 있습니다. organization과 location은 ABP의 사용자 관리의 일부인데, 그 이유는 엔티티와 사용자가 일반적으로 자신의 컨텍스트 내에서만 리소스에 액세스할 수 있기 때문입니다. 예를 들어 내부 위치에 속한 사용자는 DMZ 위치에만 할당된 DNS 서비스에 액세스할 수 없으며 그 반대의 경우도 마찬가지입니다.

상위 location을 제공하여 location을 계층적으로 구조화할 수 있습니다. 하위 location은 상위 Location에서 설정을 상속하지만 특정 값을 덮어쓸 수 있습니다.

|주의 : organization 및 location를 만들때 공백 또는 ASCII가 아닌 문자가 포함되면 버그가 발생하는 것으로 알려져 있습니다. 작성시 특수 문자가 포함되지 않은 단일 단어를 선택하십시오. 
|---|

***예제 구조***

- Internal
    - Testing Systems
    - Production Systems
- External
    - Testing Systems
    - Production Systems

구조화된 location과 관련된 컨텍스트는 ABP 관리 UI에서 다름과 같이 표시됩니다. `organization@parent_location/sub_location`

{% include list.liquid all=true %}