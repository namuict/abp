---
title: "Glossary"
---

# 용어 설명

ABP는 물리적 서버와 가상 서버를 
위한 완벽한 데이터 센터 관리 솔루션입니다. 주요 기능에는 자동화된 시스템 배포, 구성 관리, 패치 관리를 포함한 콘텐츠 관리가 포함됩니다. 단일 통합 인터페이스를 통해 작업을 자동화하고 호스트를 빠르게 배포할 수 있습니다.

알파벳순으로 정렬된 이 용어집은 ABP와 관련한 기술용어의 개요를 제공합니다.

***ABP 프록시*** <br>
ABP 프록시는 ABP 서버와 별도의 호스트에서 실행되는 자율 ABP 구성 요소입니다. 클라이언트-서버 모델에서 ABP Server와 상호 작용합니다. ABP 설치는 항상 통합 스마트 프록시 기능과 함께 번들로 제공되므로 대부분의 사용 사례에서 유일한 ABP 프록시로 작동할 수 있습니다.

별도의 ABP 프록시는 ABP 가 여러 네트워크에 걸쳐 있는 IT 인프라를 관리하는 시나리오에만 필요합니다. 이러한 시나리오에서 ABP서버는 ABP서버 네트워크와 다른 [compute resource provider]에 있는 모든 네트워크에 ABP프록시가 필요합니다 .

***Ansible*** <br>
[Ansible]은 호스트를 프로비저닝하기 위해 SSH 또는 PowerShell을 통해 에이전트 없이 실행되는 구성 관리 도구입니다. 이는 *플레이북* ( `.yaml`-files)을 사용하여 구성, 배포 및 오케스트레이션을 설명합니다. ABP 내에서 Ansible을 관리 호스트의 구성 관리 도구로 사용할 수 있습니다. Ansible을 사용하면 Foreman Ansible 모듈을 사용하여 배포를 자동화합니다.

***Compliance Policies*** <br>
규정 준수 정책은 OpenSCAP 플러그인과 함께 ABP를 사용하는 관리 호스트에 SCAP 콘텐츠를 실제로 적용하는 것과 관련이 있습니다. ABP 관리UI를 사용하여 규정 준수 정책을 생성할 수 있습니다. 규정 준수 보고서를 사용하려면 선택적으로 조정 파일을 사용하여 SCAP 콘텐츠에서 특정 XCCDF 프로필을 설정해야 합니다. 이는 감사 실행 일정과 연결되어 있으며 호스트 그룹 수에 관계없이 연결될 수 있습니다.

***Compute Resource*** <br>
[Compute Resource]는 ABP에 연결할 수 있는 외부 가상화 솔루션입니다. 일단 연결되면 ABP는 가상화 솔루션 내에서 인스턴스를 배포하고 관리할 수 있습니다. 컴퓨팅 리소스의 대표적인 예로는 VMware, libvirt 및 Proxmox 설치는 물론 Microsoft Azure와 같은 클라우드 공급자가 있습니다. Compute Resource는 인프라 메뉴를 통해 액세스할 수 있습니다.

***Configuration Management*** <br>
[구성 관리는] 관리 대상 호스트를 구성하고 유지 관리하는 작업을 설명합니다. ABP에서는 [Ansible], [Puppet] 및 [Salt]를 사용하여 관리형 호스트를 구성하고 모든 것을 단일 인프라 소스로 한곳에서 유지 관리할 수 있습니다.

***Content***<br>
Content는 소프트웨어 저장소로 운영체제와, 미디어 경로를 포함하고 있습니다.

***Deployment***<br>
배포는 의도한 대상에 소프트웨어를 공급하는 것입니다. 이 프로세스는 이상적으로 자동화됩니다. ABP에서는 프로비저닝, 운영 체제 설치 및 구성을 포함하는 새 호스트를 생성하는 데 사용됩니다.

***Foreman***<br>
Foreman은 ABP의 오픈 소스 구성 요소입니다.

***Hammer*** <br>
[Hammer]는 APB용 명령줄 인터페이스 도구입니다. 브라우저 없이 ABP의 API와 직접 상호작용하는 데 사용할 수 있습니다. 특정 반복 작업을 자동화하는 데 적합하며, 또 다른 가능성은 원격 실행 또는 Ansible 모듈을 사용하는 것입니다.

***Install Media*** <br>
Install Media는 프로비저닝 프로세스 중에 기본 운영 체제를 설치하는 데 사용되는 패키지입니다. ABP의 설치 매체는 URL 또는 NFS 서버 위치를 통해 네트워크를 통해 액세스r가 가능한 하나 이상의 운영 체제에 대한 설치 파일을 나타냅니다. 일반적으로 Mirror, CD, DVD 이미지입니다. 

모든 운영 체제는 정확히 하나의 설치 미디어 경로에 의존하는 반면, Install Media 경로는 동시에 여러 운영 체제를 제공할 수 있습니다. CentOS 및 RHEL의 경우 URL에 액세스할 때 입력되는 경로에 `$version`, `$major`및 키워드를 사용하여 이를 수행할 수 있습니다 . `$minor`Debian, Ubuntu 및 SLES는 이러한 변수를 지원하지 않습니다. *여러 버전의 Debian 설치 미디어를 하나의 경로에 묶을 수 있습니다. 예를 들어 Debian 10 Buster* 및 *Debian 11 Bullseye* 패키지가 포함된 저장소가 있습니다 . 이것은 우분투에서도 작동합니다.

***Location*** <br>
Location은 ABP에서 관리되는 호스트를 지리적으로 분리하는 데 주로 사용되는 태그입니다. 이는 다른 도시일 수도 있고 다른 데이터 센터일 수도 있습니다.

***Machine*** <br>
Machine는 ABP가 관리하는 시스템입니다. host와 동일한 의미로 사용되며, 물리적Machine, 가상Machine 을 모두 포함 하고 있습니다. ABP내에서 Machine는 유일한 하나의 Hostname을 가집니다.

***Machine Group*** <br>
Machine Group은 새로운 Machine을 구축하기 위해 미리 특정 속성을 지정하는 데 사용됩니다. 여기에는 네트워킹 및 운영 체제 정보가 포함될 수 있습니다. 또한 Machine을 그룹화하여 Ansible, Puppet 및 Salt에서 구성 관리를 통합하는 데 도움이 됩니다. Machine Group은 새로운 Machine뿐만 아니라 기존 Machine에도 적용됩니다.

***Organization*** <br>
Organization은 ABP에 의해 관리되는 호스트를 조직적으로 분리하는 데 사용되는 태그입니다. 이는 여러 고객이나 사업 단위를 상대할 때 특히 유용합니다.

***패치 및 릴리스 관리*** <br>
패치 및 릴리스 관리는 인프라에 대한 패치 및 소프트웨어 업데이트를 획득, 관리 및 설치하는 프로세스를 설명합니다. 또한 호스트가 패키지 버전을 제어할 수 있도록 유지하고 해당 에라타에 대한 정보를 제공합니다.

***Provisioning workflow*** <br>
Provisioning workflow은 운영 체제 자동 설치에 사용되는 파일 입니다. 이로 인해 사용자가 수동으로 입력할 필요 없이 설치 프로세스가 진행됩니다. (예: *kickstart )

***Pulp*** <br>
Pulp는 소프트웨어 패키지 저장소를 로컬로 미러링하여 관리합니다.

***Puppet*** <br>
[Puppet]은 서버-클라이언트 아키텍처에서 선언적 언어를 활용하는 소프트웨어 구성 관리 도구입니다.

***PXE*** <br>
PXE(*Preboot Execution Environment*)는 로컬 디스크가 아닌 네트워크에서 받은 운영 체제를 부팅하는 데 사용됩니다. 호환 가능한 NIC가 필요하며 DHCP 및 TFTP를 사용합니다.

***Repository*** <br>
Repository는 일반적으로 URL 형식의 단일 콘텐츠 소스입니다. ABP에서 소프트웨어 콘텐츠를 저장하는 최소 단위입니다.일반적으로 콘텐츠를 가져오기 위해서는 콘텐츠원본과 동기화되어야 하지만, ABP에 패키지를 수동으로 업로드할 수도 있습니다. Repository를 ABP에서 사용하려면 원격 저장소가 ABP에서 지원하는 유형 이어야 합니다. 이러한 유형은 *deb* , *yum* , *Puppet* , *Docker* 및 *file* 입니다.

***Salt*** <br>
[Salt는] 패키지가 설치되어 있는 경우나 서비스가 실행중인 상태와 같이 사전 정의된 특정 상태로 호스트를 유지하는 데 사용되는 모듈식 구성 관리 도구입니다. 멱등성을 가지도록 설계되었습니다. ABP는 구성 관리를 위해 Salt를 활용합니다.

***Smart Proxy*** <br>
스마트 프록시는 특정 방식으로 네트워크 트래픽을 중계하는 중간 역할을 하는 네트워크 노드입니다. 이들은 *DNS* , *DHCP* , *TFTP* 및 *CA* 기능을 제공할 뿐만 아니라 ABP 서버에서 관리되는 호스트로 동기화되거나 릴레이된 콘텐츠를 제공할 수도 있습니다. ABP 프록시는 다양한 스마트 프록시 기능을 번들로 제공하며 *Ansible 제어 노드* , *Puppet 마스터* 또는 *Salt Master* 역할을 할 수 있습니다 .

***Virtualization*** <br>
[Virtualization]는 VMware 또는 libvirt와 같은 하이퍼바이저를 사용하여 단일 하드웨어 호스트에서 다양한 애플리케이션과 함께 여러 운영 체제를 실행하는 프로세스를 설명합니다. 확장성과 비용 절감이 용이합니다.

***Workflow*** <br>
일반적으로 Workflow는 정의된 순서로 실행되는 각각의 과정을 의미 합니다. ABP에서는 대상 장비에 provisioning시 각각의 순서에서 실행되는 Template 을 의미 합니다.

***ZTP*** <br>
ZTP(*Zero Touch Provisioning)는 ABP의 주요 기능중 하나로, 사전에 정의된 MAC, IP, Hostname 등의 정보를 통해 전원control 부터 플랫폼 설치까지 운영자의 추가적인 작업 없이 지정된 Workfolw를 실행합니다.

