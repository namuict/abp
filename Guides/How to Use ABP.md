---
sort: 1
---

# ABP 로 배포 하기

## 운영 체제 만들기
운영 체제는 ABP 서버가 호스트에 기본 운영 체제를 설치하는 방법을 정의하는 자원 콜렉션입니다. 운영 체제 항목은 이전에 정의된 리소스(예: Installation Media, 파티션 테이블, 프로비저닝 workflow 등)를 결합합니다.

다음 절차에 따라 사용자 지정 운영 체제를 추가할 수 있습니다

***절차***

1. ABP 관리 UI에서 **Contents** > Operating Systems로 이동하고 우측 상단에 **Create**를 클릭합니다.
2. **Name** 필드에 운영 체제 항목을 나타내는 이름을 입력하십시오.
3. Major(주요) 필드에 운영 체제의 **주** 버전에 해당하는 번호를 입력합니다.
4. **Minor** 필드에 운영 체제의 부 버전에 해당하는 번호를 입력합니다.
5. Description(**설명**) 필드에 운영 체제에 대한 설명을 입력합니다.
6. **family** 목록에서 운영 체제의 제품군을 선택합니다.
7. 루트 암호 **해시 목록에서 루트 암호**의 인코딩 방법을 선택합니다.
9. **아키텍처** 목록에서 운영 체제가 사용하는 아키텍처를 선택합니다.
8. **파티션 테이블** 탭을 클릭하고 이 운영 체제에 적용할 수 있는 파티션 테이블을 선택합니다.
10. 설치 미디어 탭을 클릭하고 설치 미디어 소스에 대한 정보를 입력합니다. 자세한 내용은 **ABP에 Installation Media 추가**를 참조하십시오.
11. **Templates**(템플릿) 탭을 클릭하고 운영 체제에서 사용할 **PXELinux** 템플릿, **Provisioning 템플릿** 및 **Finish 템플릿을** 선택합니다. 프로비저닝에 iPXE를 사용하려는 경우 다른 템플릿(예: **iPXE 템플릿**)을 선택할 수 있습니다. (생략 가능)
12. **Parameters** 탭을 클릭하고, 공통으로 적용이 되는 Parameter를 생성 할수 있습니다. (생략 가능)
13. **Submit(제출**)을 클릭하여 프로비저닝 템플릿을 저장합니다.

## **ABP에 Installation Media 추가**

Installation Media 는 ABP 서버가 외부 시스템에 기본 운영 체제를 설치하는 데 사용하는 패키지의 소스입니다.

Installation Media는 운영 체제 설치 트리 형식이어야 하며 HTTP URL을 통해 설치 프로그램을 호스팅하는 컴퓨터에서 액세스할 수 있어야 합니다. 
 Contents > Installation Media 메뉴에서 생성된 미디어를 볼 수 있습니다.

Installation Media 를 사용하여 여러 호스트에 운영 체제를 설치할 때 다운로드 성능을 향상시키려면 가장 가까운 미러 또는 로컬 복사본을 가리키도록 설치 매체의 **Path를** 수정해야 합니다.

***절차***

1. ABP 관리 UI에서 **Contents** > **Installation Media**로 이동하고 **Create**버튼을 클릭합니다.
2. **Name** 필드에 설치 매체 항목을 나타내는 이름을 입력하십시오.
3. **Path**에 설치 트리가 포함된 URL 또는 NFS 공유를 입력합니다. 경로에서 다음 변수를 사용하여 여러 다른 시스템 아키텍처 및 버전을 나타낼 수 있습니다.
    - `$arch` - 시스템 아키텍처.
    - `$version` - 운영 체제 버전입니다.
    - `$major` - 운영 체제 주 버전입니다.
    - `$minor` - 운영 체제 부 버전입니다.
        
        HTTP 경로 예: 
        `http://download.example.com/Redhat_Enterprise_linux/$version/Server/$arch/os/` 
        NFS 경로 예:  
        `nfs://download.example.com:/os/Redhat_Enterprise_linux/$version/Server/$arch/os/` 
        ABP프록시의 동기화된 콘텐츠는 항상 HTTP 경로를 사용합니다. ABP프록시 관리 컨텐츠는 NFS 경로를 지원하지 않습니다.
   
4. **OS family** 목록에서 설치 매체의 분배 또는 제품군을 선택합니다.
5. Organizations(**조직**) 및 **Locations(위치**) 탭을 클릭하여 프로비저닝 컨텍스트를 변경합니다. ABP Server는 설정된 프로비저닝 컨텍스트에 설치 매체를 추가합니다.
6. **Submit(제출**)을 클릭하여 설치 매체를 저장합니다.

***CLI 절차***

- 다음 명령을 사용하여 설치 미디어를 만듭니다.`hammer medium create`
    
    `# hammer medium create \
    --locations "*My_Location*" \
    --name "*My_OS*" \
    --organizations "*My_Organization*" \
    --os-family "Redhat" \
    --path 'http://download.example.com/Redhat_Enterprise_linux/$version/Server/$arch/os/'`
    

## **파티션 테이블 만들기**

파티션 테이블은 ABP서버가 새로운 호스트에서 사용 가능한 디스크를 구성하는 방법을 정의하는 Template 유형입니다. 파티션 테이블은 Provisioning Workflow 와 동일한 ERB 구문을 사용합니다. ABP에는 기본 파티션 테이블 집합이 포함되어 있습니다. 파티션 테이블 항목을 편집하여 선호하는 파티션 구성표를 구성하거나 파티션 테이블 항목을 만들어 운영 체제 항목에 추가할 수도 있습니다.

***절차***

1. ABP관리 UI에서 **Workflow** > Partition Table로 이동하고 **Create**를 클릭합니다.
2. **Name** 필드에 파티션 테이블의 이름을 입력합니다.
3. 템플릿이 새 조직 또는 위치와 자동으로 연결되도록 설정하려면 **Default** 확인란을 선택합니다.
4. 템플릿을 다른 파티션 테이블에 재사용 가능한 코드 조각으로 식별하려면 **snippet** 확인란을 선택합니다.
5. **Operating System Family** 목록에서 파티션 레이아웃의 배포 또는 제품군을 선택합니다. 예를 들어 Alma Linux, CentOS 및 Fedora는 Red Hat 제품군에 속합니다.
6. **Template editor** 필드에 디스크 파티션의 레이아웃을 입력합니다. 예를 들어:
    
    `zerombr
    clearpart --all --initlabel
    autopart`
    
    템플릿 파일 브라우저를 사용하여 **템플릿** 파일을 업로드할 수도 있습니다.
    
    레이아웃의 형식은 의도한 운영 체제의 형식과 일치해야 합니다. 예를 들어, redhat Enterprise Linux 8.2에는 킥스타트 파일과 일치하는 레이아웃이 필요합니다.
    
7. **Audit Comment** 필드에서 파티션 레이아웃에 대한 변경 사항 요약을 추가합니다.
8. Organizations(**조직)** 및 **Locations(위치**) 탭을 클릭하여 파티션 테이블과 연결할 다른 프로비저닝 컨텍스트를 추가합니다. ABP는 파티션 테이블을 현재 프로비저닝 컨텍스트에 추가합니다.
9. **Submit(제출**)을 클릭하여 파티션 테이블을 저장합니다.


## **Provisioning Workflow**

Provisioning Workflow는 ABP 서버가 호스트에 운영 체제를 설치하는 방법을 정의합니다.

ABP에는 기본적으로 사용이 가능한 템플릿 예제가 포함되어 있습니다. ABP 관리 UI에서 **Workflow** > **Provisioning Workflow**로 이동하여 확인합니다. 템플릿을 생성하거나 템플릿을 복제하고 복제본을 편집할 수 있습니다. 템플릿에 대한 도움말을 보려면 **Workflow** > **Provisioning Workflow** > **Create** > **Help**로 이동하십시오.

템플릿은 ERB(Embedded Ruby) 구문을 허용합니다. 자세한 내용은 *호스트 관리*의 [템플릿 작성 참조](https://docs.ABP.com/or/6.0/sources/guides/rocky_linux/managing_hosts/template_writing_reference.html#Template_Writing_Reference_managing-hosts)를 참조하십시오.

Provisioning Workflow에 적용된 변경 내역을 보려면 **Workflow** > Provisioning Workflow로 이동하여 **Provisioning Workflow** 중 하나를 선택하고 **history** 클릭합니다. **Revert(되돌리**기)를 클릭하여 콘텐츠를 이전 버전으로 재정의합니다. 이전 변경 사항으로 되돌릴 수도 있습니다. **Show Diff**를 클릭하여 특정 변경 사항에 대한 정보를 확인합니다.

- **세부 정보** 탭에는 템플릿 설명의 변경 사항이 표시됩니다.
- **History** 탭에는 템플릿을 변경한 사용자와 변경 날짜가 표시됩니다.

## **Types of Provisioning Workflow**

다양한 유형의 Provisioning Workflow가 있습니다.

***Provision***</br>
프로비저닝 프로세스에 대한 기본 템플릿입니다. 예를 들어, 킥스타트 템플릿이 있습니다.
***PXELinux, PXEGrub, PXEGrub2***</br>
호스트가 올바른 커널 옵션과 함께 설치 프로그램을 사용하도록 서브넷과 연결된 ABP프록시에 배포되는 PXE 기반 템플릿입니다. BIOS 프로비저닝의 경우 **PXELinux** 템플릿을 선택합니다. UEFI 프로비저닝의 경우 **PXEGrub2**를 선택합니다.
***user_data***</br>
시드 데이터라고도 하는 사용자 지정 데이터를 허용하는 공급자에 대한 사후 구성 스크립트입니다. user_data 템플릿을 사용하여 클라우드 또는 가상화된 환경에서만 가상 머신을 프로비저닝할 수 있습니다. 이 템플릿에서는 ABP가 호스트에 연결할 수 있어야 합니다. 클라우드 또는 가상화 플랫폼은 데이터를 이미지에 전달하는 역할을 합니다.
프로비저닝하려는 이미지에 데이터를 읽을 수 있는 소프트웨어가 설치되어 있고 부팅 중에 시작하도록 설정되어 있는지 확인합니다. 예를 들어 YAML 입력이 필요한 경우 또는 JSON 입력이 필요한 경우입니다.

***Bootdisk***</br>
PXE가 없는 부팅 방법에 대한 템플릿입니다.
***Kernel Execution (kexec)***</br>
PXE가 없는 부팅 방법을 위한 커널 실행 템플릿입니다.
***Script***</br>
기본적으로 사용되지 않지만 사용자 지정 작업에 유용한 임의의 스크립트입니다.
***ZTP***</br>
제로 터치 프로비저닝 템플릿.
***POAP (팝)***</br>
PowerOn 자동 프로비저닝 템플릿.
***아이픽스(iPXE)***
PXELinux 대신 사용할 또는 환경에 대한 템플릿입니다.

## **Provisioning Workflow  만들기**

Provisioning Workflow 는 ABP서버가 호스트에 운영 체제를 설치하는 방법을 정의합니다. 다음 절차에 따라 새로운 Provisioning Workflow 를 만듭니다.

***절차***

1. ABP 관리 UI에서 **Workflow** > **Provisioning Workflow** 로 이동하고 **Create**을 클릭합니다.
2. **Name** 필드에 프로비저닝 템플릿의 이름을 입력합니다.
3. 필요에 따라 나머지 필드를 채웁니다. **Help** 탭에서는 템플릿 구문에 대한 정보를 제공하고 템플릿 내의 다양한 개체 형식에서 호출할 수 있는 사용 가능한 함수, 변수 및 메서드에 대해 자세히 설명합니다.


## **Provisioning Workflow 복제**

Provisioning Workflow은 ABP 서버가 호스트에 운영 체제를 설치하는 방법을 정의합니다. 이 절차를 사용하여 Workflow를 복제하고 복제본에 업데이트를 추가합니다.

***절차***

1. ABP 관리 UI에서 **Workflow** > **Provisioning Workflow**으로 이동하여 사용할 템플릿을 검색합니다.
2. Clone(복제)을 클릭하여 템플릿을 **복제**합니다.
3. **Name** 필드에 프로비저닝 템플릿의 이름을 입력합니다.
4. **Default** 확인란을 선택하여 템플릿이 새 조직 또는 위치에 자동으로 연결되도록 설정합니다.
5. **Template editor** 필드에 Provisioning Workflow의 본문을 입력합니다. 템플릿 파일 브라우저를 사용하여 **Workflow** 파일을 업로드할 수도 있습니다.
6. **Audit Comment** 필드에 감사 목적으로 Provisioning Workflow에 대한 변경 사항 요약을 입력합니다.
7. **Type** 탭을 클릭하고 Workflow가 스니펫인 경우 **Snippet** 확인란을 선택합니다. Snippet은 독립적으로 실행되는 Workflow가 아니라 다른 Provisioning Workflow에 삽입할 수 있는 Provisioning Workflow의 일부입니다.
8. **Type** 목록에서 템플릿의 유형을 선택합니다.
9. ** Association** 탭을 클릭하고 적용 가능한 운영 체제 목록에서 Provisioning Workflow과 연결할 **Operating Systems**의 이름을 선택합니다.
10. 필요한 경우 **Add combination**를 클릭하고 Machine Group 목록에서 Machine Group을 선택하거나 환경 목록에서 환경을 선택하여 Provisioning Workflow을 **Machine Group** 및 **Environment**와 연결합니다.
11. **Organizations** 및 **Locations** 탭을 눌러 Workflow에 컨텍스트를 추가합니다.
12. **Submit(제출**)을 클릭하여 프로비저닝 템플릿을 저장합니다.


## **Machine Group 만들기**
대량의 Machine을 생성하는 경우 많은 Machine가 공통 설정 및 특성을 가질 수 있습니다. 새로 생성되는 모든 Machine에 대해 이러한 설정 및 특성을 추가하는 것은 시간이 많이 걸립니다. Machine Group을 사용하는 경우 생성한 Machine에 공통 특성을 적용할 수 있습니다.

Machine Group은 일반적인 Machine 설정에 대한 템플릿 역할을 하며, Machine에 제공하는 것과 동일한 세부 정보를 많이 포함합니다. Machine Group을 사용하여 Machine을 생성하면 각각의 Machine은 Machine Group에서 정의된 설정을 상속합니다. 그런 다음 추가 세부 정보를 제공하여 Machine을 개별화할 수 있습니다.

**Machine Group 계층 구조**

Machine Group의 계층 구조를 만들 수 있습니다. 조직의 모든 Machine을 대표하고 일반 설정을 제공하는 하나의 기본 수준 Machine Group을 만든 다음 중첩된 그룹을 사용하여 특정 설정을 제공하는 것을 목표로 합니다. 예를 들어 운영 체제를 정의하는 기본 수준 Machine Group과 기본 수준 Machine Group을 상속하는 두 개의 중첩된 Machine Group이 있을 수 있습니다.

- **Machine Group:** (RHEL 8.8)`Base`
    - **Machine Group:** (Puppet 클래스 적용)`Hypervisor`
        - **Machine:** (Hypervisor)`common01.example.com`
        - **Machine:** (Hypervisor)`common02.example.com`
    - **Machine Group:** (Puppet 클래스 적용)``
        - **Machine:** (web 서버)`web1.example.com`
        - **Machine:** (web 서버)`web2.example.com`

이 예에서 모든 호스트는 호스트 그룹을 상속하기 때문에 RHEL 8.8을 운영 체제로 사용합니다. 두 Hypervisor 서버는 Machine Group의 설정을 상속하며, 여기에는 Puppet 클래스와 Machine Group의 설정이 포함됩니다. 두 web 서버는 Machine Group의 설정을 상속하며, Machine Group에는 Puppet 클래스와 Machine Group의 설정이 포함됩니다. 

***절차***

1. ABP 관리 UI에서 > **Machine Group** 으로 이동하고 **Create**을 클릭합니다.
2. 특성을 상속하려는 기존 Machine Group이 있는 경우 **Parent** 목록에서 Machine Group을 선택할 수 있습니다. 그렇지 않은 경우 이 필드를 비워 둡니다.
3. 새 호스트 그룹의 **Name** 입력합니다.
4. 향후 Machine이 상속할 추가 정보를 입력합니다.
5. 추가 탭을 클릭하고 Machine Group에 귀속시키려는 세부 정보를 추가합니다.
6. **Submit**을 클릭하여 Machine Group을 저장합니다.



## **ZTP Template 만들기**
Machine Group을 통해 새로 생성되는 Machine에 대해 공통된 특성을 적용하더라도, 대량의 Machine을 생성 또는 하나의 Cluster로 구성된 Machine들을 하나씩 생성하려면, 동일 한 작업의 반복이 발생합니다. ZTP Template는 이러한 반복적인 작업을 하나의 템플릿 형태로 지원 합니다.

Machine Group이 일반적인 Machine 설정에 대한 템플릿 역할을 한다며, ZTP Template은 Machine Group 대한 Template 역할로 정의할 수 있습니다. Machine Group에서 상속된 값을 ZTP Template에 정의된 대량의 Machine에 대해 각각 부여할 수 있습니다.

***절차***

1. ABP 관리 UI에서 > **ZTP**> **ZTP Templates** 으로 이동하고 **Create**을 클릭합니다.
2. 새로운 ZTP Template의 이름을 **Design Name**에 입력 합니다.
3. Health Check 항목에서는 Machine Group 에서 정의한 H/W 점검에 관련 Machine Group 을 선택 합니다.
4. Machine Group 에서는 최종적으로 목표하는 형상의 Machine Group을 선택 합니다. 
5. Default Host Domain 에서는 
6. Default Host Organization 에서는... 
7. Default Host Location 에서는 ...
    여기까지는 모든 Machine들이 공통으로 한 Group에 대한 정보를 설정 하는 부분입니다.

8. Design Detail 의 항목을 작성 합니다.

    |  | Design Detail은 위의 4번에서 선택한 Machine Group에 따라 형상이 다른게 표현 됩니다. 일반적으로 엑셀 형태의 key–value 형태를 하고 있습니다.
         세부 적인 각 항목의 설명은 [ZTP Template] (Http://)을 참고 하시길 바랍니다.|
    | --- | --- |

7. **Submit**을 클릭하여 ZTP Templates을 저장합니다.


## **ZTP Dashboard**
ZTP Dashboard에서는 ZTP Templates에서 작성된 Design을 바탕으로 배포를 실행 하거나, 진행 사항을 확인 할 수 있습니다.
ABP 관리 UI에서 > **ZTP**> **ZTP  Dashboard**로 이동하면 앞서 배포가 진행된 이력을 확인 할 수 있으며, 현재의 진행 상태를 간략하게 확인 할 수있습니다.

신규 배포를 진행할 경우 아래의 절차를 참고 바랍니다.

***절차***

1. ABP 관리 UI에서 > **ZTP**> **ZTP  Dashboard** 으로 이동하고 **Create**을 클릭합니다.
2. Design 에서 원하는 항목을 선택 합니다. 항목에 표시되는 내용은 ZTP Template에서 생성한 Template List입니다.
   새로운 형태의 Template가 필요한 경우 ZTP Template를 먼저 작성후 이곳에서 선택을 해 주어야 합니다.
3. Design Details 를 통해 검토합니다. 
   | 참고: 수정이 필요한 경우 Edit 버튼 클릭합니다. Edit 버튼을 클릭하면, ZTP Template의 해당 디자인으로 이동하게 됩니다.수정 및 Submit 이후에 본 과정을 처음부터 다시 시작 합니다.|
4. 하단의 Design Network Topology 를 통해 원하는 형상의 구조가 올바른지 검토 합니다.
5. Review 탭으로 이동후 ZTP Recurring Group Name 작성합니다.
   |Recurring Group Name은 현재 실행하고자 하는 그룹의 이름이며, 해당 이름은 ZTP 실행과 동시에, ZTP Dashboard 에서 확인이 가능하다. |

6. **Submit**을 클릭하여 ZTP를 실행합니다.
