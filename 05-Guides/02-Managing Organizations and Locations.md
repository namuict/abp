---
title: "Managing Organizations"
---

# Managing Organizations and Locations

## **ABP의 Organization 및 Location Context 소개**

ABP의 Context는 Organization 과 Location 로구성됩니다.

ABP에 있는 대부분의 리소스는 하나 이상의 Organization 및 Location Context와 연관되어 있습니다. 리소스와 사용자는 일반적으로 자신의 Context 내에서만 리소스에 액세스할 수 있기 때문에 Organization 과 Location는 ABP의 사용자 관리에 필수적인 부분입니다.

상위 위치를 제공하여 위치를 계층적으로 구조화할 수 있습니다. 달리 지정하지 않는 한, 하위 위치는 상위 위치에서 설정을 상속합니다.

## **Organization 관리**
Organization은 ABP 리소스를 소유권, 목적, 콘텐츠, 보안 수준 또는 기타 부서에 따라 논리적 그룹으로 나눕니다. ABP를 통해 여러 조직을 만들고 관리한 다음 subscription을 나누고 각 개별조직에 할당할 수 있습니다. 이를 통해 하나의 관리 시스템에서 여러개의 개별조직의 콘텐츠를 관리할 수 있습니다. 다음은 Organization 관리의 몇 가지 예입니다.

***Single Organization***</br>
간단한 시스템 관리 체인을 갖춘 소규모 기업입니다. 이 경우 비즈니스에 대한 단일 조직을 만들고 콘텐츠를 할당할 수 있습니다.

***Multiple Organizations***</br>
여러 개의 소규모 사업부를 소유하고 있는 대기업입니다. 예를 들어, 별도의 시스템 관리 및 소프트웨어 개발 그룹이 있는 회사가 있습니다. 이 경우 회사 및 회사가 소유한 각 사업부에 대한 조직을 만들 수 있습니다. 이렇게 하면 각각에 대한 시스템 인프라가 별도로 유지됩니다. 그런 다음 필요에 따라 각 조직에 콘텐츠를 할당할 수 있습니다.

***External Organizations***</br>
다른 조직의 외부 시스템을 관리하는 회사입니다. 예를 들어 고객에게 클라우드 컴퓨팅 및 웹 호스팅 리소스를 제공하는 회사가 있습니다. 이 경우 회사 자체 시스템 인프라에 대한 조직을 만든 다음 각 외부 비즈니스에 대한 조직을 만들 수 있습니다. 그런 다음 필요한 경우 각 조직에 콘텐츠를 할당할 수 있습니다.

#### 신규 사용자
새 사용자에게 default Organization이 할당되지 않은 경우 해당 사용자의 액세스가 제한됩니다. 사용자에게 시스템 권한을 부여하려면 default Organization에 할당합니다. 다음에 사용자가 ABP에 로그온할 때 사용자의 계정에 올바른 시스템 권한이 있습니다.

### **Organization 만들기**

다음 절차에 따라 Organization을 생성하십시오. ABP 관리 UI 대신 CLI를 사용하려면 아래의 CLI 절차를 참조하십시오.

***절차***
1. ABP 관리 UI에서 **Admin** > **Organization** 으로 이동합니다.
2. 오른쪽 상단에 **Create**를 클릭합니다.
3. **Name** 필드에 Organization의 이름을 입력합니다.
4. 선택 사항: **Label** 필드에 조직의 고유 식별자를 입력합니다. 이는 콘텐츠 저장을 위한 디렉터리와 같은 특정 자산을 만들고 매핑하는 데 사용됩니다. 문자, 숫자, 밑줄, 대시를 사용하되 공백은 사용하지 마십시오.
5. 선택 사항: **Description** 필드에 조직에 대한 설명을 입력합니다.
6. **Submit(제출**)을 클릭합니다.
7. 생성된 Organization에 대한 설정을 위해 ABP 관리 UI에서 **Admin** > **Organization** 으로 이동합니다.
8. List 에서 새로 생성된 Organization name 을 클릭하여 Organization에 추가할 인프라 리소스를 할당합니다. 여기에는 설치 미디어, ProvisioningWorkflow 및 기타 매개변수가 포함됩니다. Organization의 설정 변경이 필요한 경우 언제든지 **Admin** > **Organization**로 이동한 다음 편집할 Organization을 선택하여 설정 할 수 있습니다.
9. **Submit(제출**)을 클릭합니다.

***CLI 절차***

1. 조직을 작성하려면 다음 명령을 입력하십시오.
    
    `# hammer organization create \
    --name "*My_Organization*" \
    --label "*My_Organization_Label*" \
    --description "*My_Organization_Description*"`
    
2. 선택 사항: organization을 편집하려면 다음 명령을 입력합니다. 예를 들어 다음 명령은 organization에 compute resource를 할당합니다."hammer organization update"
    
    `# hammer organization update \
    --name "*My_Organization*" \
    --compute-resource-ids 1`
    
### **Organization Context 설정**

Organization Context 는 Machines 및 관련 리소스에 사용할 조직을 정의합니다.

**절차**
Organization 메뉴는 ABP 관리 UI의 상단에 있는 메뉴 표시줄의 두 번째 메뉴 항목입니다. 현재 Organization을 선택하지 않은 경우 메뉴에 **Any Organization**이 표시됩니다. **Any Organization** 버튼을 클릭하고 사용할 조직을 선택합니다.

**CLI 절차**

CLI를 통해 이용하여 `--organization "*My_Organization*"` 또는 `--organization-label "*My_Organization_Label*"` 와 같이 옵션을 사용하여 설정 할 수 있습니다. 

`예제 : # hammer subscription list --organization "*My_Organization*"`

이 명령은 *My_Organization*에 할당된 subscription을 출력합니다.

### **Organization 삭제**

Organization이 리소스 및 Machine Group과 연관되지 않은 경우 Organization을 삭제할 수 있습니다. 삭제하려는 Organization과 연관된 리소스 및 Machine Group이 있는 경우  **Admin** > **Organization** 항목 이동하고 관련된 Organization을 눌러 제거합니다. Default Organization은 ABP환경에서 어디에도 할당되지 않은 Machine에 대한 기본값 이므로 초기 설치시 작성된 default Organization은 삭제하지 마십시오. 하나 이상의 Organization 은 반드시 있어야 합니다.


***절차***

1. ABP 관리 UI에서 **Admin** > **Organization**로 이동합니다.
2. 삭제할 조직의 이름 오른쪽에 있는 Actions목록에서 **Delete**를 선택합니다.
3. 팝업 창에서 **Yes** 클릭하여 Organization을 삭제합니다.

***CLI 절차***

1. 다음 명령을 입력하여 삭제할 조직의 ID를 검색합니다.
    `# hammer organization list`
    출력에서 삭제하려는 조직의 ID를 기록해 둡니다.
    
2. 다음 명령을 입력하여 조직을 삭제합니다.
    `# hammer organization delete --id *Organization_ID*`
    

## **Location 관리**

Location은 organization과 유사한 기능을 수행하며, 리소스를 그룹화하고 Machines를 할당하는 방법을 제공합니다. organization과 Location에는 다음과 같은 개념적 차이점이 있습니다.

- Location은 물리적 또는 지리적 설정을 기반으로 합니다.
- Location에는 계층 구조를 가지고 있습니다.

### **Location 만들기**

이 절차를 사용하여 Location별로 Machine 및 리소스를 관리할 수 있도록 Location을 생성합니다. ABP 관리 UI 대신 CLI를 사용하려면 아래 CLI 절차를 참조하십시오.

***절차***

1. ABP 관리 UI에서 **Admin** > **Locations**으로 이동합니다.
2. **Create**를 클릭하여 새로운 Location을 생성합니다.
3. 선택 사항: Parent 목록에서 **Parent** 위치를 선택합니다. 이렇게 하면 Location에 대한 계층이 만들어집니다.
4. **Name** 필드에 위치 이름을 입력합니다.
5. 선택 사항: **Description** 필드에 위치에 대한 설명을 입력합니다.
6. **Submit**을 클릭합니다.
7. Location에 추가할 인프라 리소스를 할당합니다. 여기에는 설치 미디어, ProvisioningWorkflow 및 기타 매개변수가 포함됩니다. Location에 대한 설정 변경이 필요한 경우 언제든지 **Admin** > **Locations**로 이동한 다음 편집할 Location을 선택하여 설정 할 수 있습니다.
9. **Submit**을 클릭하여 변경 사항을 저장합니다.

***CLI 절차***

- 다음 명령을 입력하여 Location을 생성합니다.
    
    `# hammer location create \
    --description "*My_Location_Description*" \
    --name "*My_Location*" \
    --parent-id "*My_Location_Parent_ID*"`

    
### **여러 Location 만들기**

다음의 Bash 스크립트 예제는 런던, 뮌헨, 보스턴의 세 위치를 만들고 Example Organization에 할당합니다.

```
ORG="Example Organization"
LOCATIONS="London Munich Boston"

for LOCin ${LOCATIONS}
do
  hammer location create --name "${LOC}"
  hammer location add-organization --name "${LOC}" --organization "${ORG}"
done
```


### **Location Context 설정**

Location Context는 Machine 및 관련 리소스에 사용할 위치를 정의합니다.

**절차**

Location 메뉴는 ABP 관리 UI의 오른쪽 상단에 있는 메뉴 모음의 첫 번째 메뉴 항목입니다. 현재 위치를 선택하지 않은 경우 메뉴에 **Any Location**이 표시됩니다. Any Location을 클릭하고 사용할 **Location**을 선택합니다.

**CLI 절차**

CLI를 사용하는 경우 `--location "*My_Location*"` 또는 `--location-id "*My_Location_ID*"` 옵션을 사용 할 수 있습니다.

예제 :
`# hammer host list --location "*My_Location*"`

이 명령은 *My_Location* 위치와 연결된 Machine을 나열합니다.

### **Location 삭제**

Location이 리소스 또는 Machine Group과 연관되지 않은 경우 삭제할 수 있습니다. 삭제하려는 Location과 연관된 리소스 또는 Machine Group이 있는 경우 **Admin** > **Locations**로 이동하여 관련된 Location을 클릭하여 제거합니다. default Location은 ABP환경에서 어디에도 할당되지 않은 Machine의 기본값 이므로 초기 설치시 작성된 default Location 은 삭제하지 마십시오. 하나 이상의 Location은 반드시 있어야 합니다.

***절차***

1. ABP관리 UI에서 **Admin** > **Locations**로 이동합니다.
2. 삭제할 Location 이름 오른쪽에 있는 목록에서 **Delete**를 선택합니다.
3. 팝업 창에서 **Yes** 클릭하여 Location을 삭제합니다.

***CLI 절차***

1. 다음 명령을 입력하여 삭제할 Location의 ID를 검색합니다.
    
    `# hammer location list`
    
    출력에서 삭제하려는 Location의 ID를 기록해 둡니다.
    
2. 다음 명령을 입력하여 Location를 삭제합니다.
    
    `# hammer location delete --id *Location ID*`
