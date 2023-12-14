# **ABP 서버 설치**

이 가이드에서는 환경에서 ABP Server를 설치하는 방법을 설명합니다. Alma Linux 8, Oracle Linux 8, Red Hat Enterprise Linux 8 및 Rocky Linux 8에 ABP 서버를 설치할 수 있습니다.

- VMware vSphere 환경 내에 ABP 서버를 설치하려는 경우 ABP OVA 이미지를 사용하여 Alma Linux 8에서 ABP를 실행할 수 있습니다. 이렇게 하면 OVA(*Open Virtual Appliance* Image)가 사용되어 VMware vSphere에 ABP 호스트가 생성되고 설치 프로세스가 자동으로 시작됩니다.
- ABP 서버를 설치할 호스트를 프로비저닝하려는 경우 Alma Linux 8, Oracle Linux 8 및 Rocky Linux 8용 킥스타트 파일을 제공합니다. 이는 베어 메탈 설치를 포함한 거의 모든 시나리오에서 작동합니다.
- ABP 서버에 대한 기존 호스트가 이미 있는 경우 수동 설치를 시작합니다.

모든 전제 조건 및 요구 사항을주의 깊게 읽고 ABP 서버 설치 프로세스를 시작하십시오. ABP 서버가 있는 네트워크가 아닌 다른 네트워크에 호스트를 배포하려면 각 대상 네트워크에 [ABP 프록시](https://installing_ABP_proxy.html)를 설치해야 합니다.

## **필수 구성 요소 및 시스템 요구 사항**

ABP 서버를 설치하기 전에 환경이 다음 요구사항을 충족하는지 확인하십시오.

- 시스템 요구 사항에 설명된 호스트입니다.
- 네트워크 요구 사항에 설명된 네트워크인프라입니다.
- ABP 서버에 대한 경로를 확인할 수 있는 보조 장치의 브라우저입니다.
- 직접 또는 HTTP/HTTPS 프록시를 사용하여 작동하는 인터넷 연결.

### **시스템 요구 사항**

시스템은 가상 머신인지 베어메탈 서버인지에 관계없이 다음 요구 사항을 충족해야 합니다.

|  | 최소 | 권장 |
| --- | --- | --- |
| 운영 체제 | Alma Linux 8, Oracle Linux 8, Red Hat Enterprise Linux 8 또는 Rocky Linux 8
| CPU | 4cores | 8cores |
| RAM | 20GiB | 32GiB |
| HDD 1 (/) | 30GiB | 50GiB |
| HDD 2 (/var) | 각 Enterprise Linux 배포판에 대해 ~ 40GiB
~ 각 Debian 또는 Ubuntu 배포에 대해 80GiB | ~ 500GiB(또는 적절한 경우) 추가 리포지토리를 유지 관리하거나 여러 버전의 패키지를 유지하려는 경우 |

ABP 서버에는 두 개의 하드 드라이브가 필요합니다. 하나는 루트 파티션에 사용되고 다른 하나는 데이터 리포지토리에 사용됩니다. 이러한 분리는 스냅샷과 백업을 생성하는 데 필수적입니다.

의 주요 디렉토리는 다음과 같습니다.`/var`

- `/var/cache/pulp/`
- `/var/lib/pulp/`
- `/var/opt/rh/rh-postgresql12/lib/pgsql/`

심볼릭 링크를 사용하는 것은 나중에 도입될 경우 SELinux 컨텍스트를 손상시키고 손상시키므로 옵션이 아닙니다.`ABP-installer`

|  | 처음에 충분한 하드 드라이브 리소스를 할당해야 합니다. 정기적으로 ABP를 사용하는 동안 데이터 저장소의 공간이 부족하면 상당한 어려움이 발생합니다. |
| --- |

LVM 스냅샷에 의존하는 를 사용하여 백업을 생성하려면 상주하는 LVM 볼륨 그룹에 사용 가능한 디스크 공간이 2GiB 이상 있는지 확인합니다. 사용 가능한 디스크 공간은 스냅숏을 만드는 동안 데이터베이스에 대한 모든 변경 내용을 저장하는 데 사용됩니다.`ABP-maintainvg-data`

### **OS 요구 사항**

Alma Linux 8, Oracle Linux 8, Red Hat Enterprise Linux 8 및 Rocky Linux 8에 ABP 서버를 설치할 수 있습니다. ABP 구독 키는 선택한 플랫폼에 따라 다릅니다.

Oracle Linux에 ABP 서버 설치는 최신 릴리스된 Oracle Linux 8 부 버전(8.Y)에서만 지원됩니다. 최신 Oracle Linux 8.Y 릴리스는 [yum.oracle.com](https://yum.oracle.com/oracle-linux-isos.html) 에서 확인할 수 있습니다.

ABP 서버를 수동으로 설치하는 경우 스크립트를 다운로드하여 실행해야 합니다. 

|  | Oracle Linux 또는 Red Hat Enterprise Linux에 ABP Server를 설치하려는 경우 필요한 Oracle Linux 또는 Red Hat Enterprise Linux 서브스크립션이 있는지 확인합니다. ABP 서브스크립션에는 Oracle Linux 또는 Red Hat Enterprise Linux 서브스크립션이 포함되어 있지 않습니다. |
| --- | --- |

### **네트워크 요구 사항**

| ABP는 호스트를 배포하는 네트워크를 관리할 수 있을 때 가장 잘 작동하며, 이는 해당 네트워크에 대한 DHCP, DNS 및 TFTP 서버 역할을 한다는 것을 의미합니다. ABP가 이러한 방식으로 네트워크를 관리하도록 허용하는 것은 선택 사항이지만 ABP 설치를 계획할 때 고려해야 합니다. 동일한 네트워크에서 두 개의 DHCP 서비스를 실행하면 네트워킹 문제가 발생할 수 있습니다. |
| --- |

ABP가 하나 이상의 네트워크에서 호스트를 관리하려면 [ABP 프록시]를 사용하여 해당 호스트와 통신할 수 있어야 합니다. 결과적으로 해당 서비스를 사용하려면 네트워크에서 ABP를 작동하려면 포트 세트를 열어야합니다. 일반적으로 서로 연결해야 하는 세 가지 시스템 유형(ABP 서버, ABP 프록시 및 관리 호스트)이 있습니다.

| Port | 프로토콜 | SSL  | Required for |
| --- | --- | --- | --- |
| 8015 | TCP | no | ABP 설치 프로그램 |

스크립트를 실행할 때 옵션을 사용하여 이를 생략할 수 있습니다.`--skip-guiinstall_ABP.sh`

| Port | 프로토콜 | SSL  | Required for |
| --- | --- | --- | --- |
| 53 | TCP & UDP | 아니요 | DNS 서비스 |
| 67 | UDP | 아니요 | DHCP 서비스 |
| 69 | UDP | 아니요 | PXE 부팅 |
| 80 | TCP | 아니요 | 아나콘다, yum, 템플릿, iPXE |
| 443 | TCP | 예 | 구독 관리, yum, Katello |
| 5000 | TCP | 예 | Docker 레지스트리용 Katello |
| 8000 | TCP | 예 | 킥스타트 템플릿 다운로드를 위한 Anaconda, iPXE |
| 8140 | TCP | 예 | Puppet 에이전트에서 Puppet 마스터로 |
| 9090 | TCP | 예 | OpenSCAP 보고서 |

| Port | 프로토콜 | SSL  | Required for |
| --- | --- | --- | --- |
| 53 | TCP 및 UDP | 아니요 | DNS 서비스 |
| 67 | UDP | 아니요 | DHCP 서비스 |
| 69 | UDP | 아니요 | PXE 부팅 |
| 80 | TCP | 아니요 | 아나콘다, yum, 템플릿, iPXE |
| 443 | TCP | 예 | yum |
| 8000 | TCP | 예 | 킥스타트 템플릿 다운로드를 위한 Anaconda, iPXE |
| 8140 | TCP | 예 | Puppet agent to Puppet master |
| 8443 | TCP | 예 | Subscription Management |
| 9090 | TCP | 예 | OpenSCAP 보고서 |

### **포트 및 방화벽 요구 사항**

ABP 아키텍처의 구성 요소가 통신하려면 필요한 네트워크 포트가 기본 운영 체제에서 열려 있고 사용 가능한지 확인하십시오. 또한 필요한 네트워크 포트가 네트워크 기반 방화벽에서 열려 있는지 확인해야 합니다.

다음 정보를 사용하여 네트워크 기반 방화벽을 구성할 수 있습니다. 일부 클라우드 솔루션은 네트워크 기반 방화벽과 유사하게 시스템을 격리하기 때문에 시스템 간의 통신을 허용하도록 특별히 구성해야 합니다. 응용 프로그램 기반 방화벽을 사용하는 경우 응용 프로그램 기반 방화벽이 표에 나열되어 있고 방화벽에 알려진 모든 응용 프로그램을 허용하는지 확인합니다. 가능하면 응용 프로그램 검사를 비활성화하고 프로토콜을 기반으로 열린 포트 통신을 허용하십시오.

**통합 ABP 프록시**

ABP 서버에는 통합 ABP 프록시가 있으며 ABP 서버에 직접 연결된 모든 호스트는 이 섹션의 컨텍스트에서 ABP의 클라이언트입니다. 여기에는 ABP 프록시가 실행 중인 기본 운영 체제가 포함됩니다.

**ABP 프록시의 클라이언트**

ABP의 통합 ABP 프록시 이외의 ABP 프록시의 클라이언트 인 호스트는 ABP 서버에 액세스 할 필요가 없습니다.

필요한 포트는 구성에 따라 변경될 수 있습니다.

다음 표는 대상 포트와 네트워크 트래픽의 방향을 나타냅니다.

| 대상 포트 | 프로토콜 | 서비스 | Source | Required For | Description |
| --- | --- | --- | --- | --- | --- |
| 53 | TCP & UDP | DNS | DNS 서버 및 클라이언트 | 이름 확인 | DNS(선택 사항) |
| 67 | TCP & UDP | DHCP | 클라이언트 | 유동 IP | DHCP(선택 사항) |
| 69 | TCP & UDP | TFTP | 클라이언트 | TFTP 서버(선택 사항) |  |
| 443 | TCP | HTTPS  | ABP 프록시 | ABP server API | ABP 프록시에서 통신 |
| 443, 80 | TCP | HTTPS, HTTP | 클라이언트 | 콘텐츠 검색 | 콘텐츠 |
| 443, 80 | TCP | HTTPS, HTTP | ABP 프록시 | 콘텐츠 검색 | 콘텐츠 |
| 443, 80 | TCP | HTTPS, HTTP | 클라이언트 | 콘텐츠 호스트 등록 | ABP 프록시 CA RPM 설치 |
| 443 | TCP | HTTPS  | 클라이언트 | 콘텐츠 호스트 등록 | Initiation
Uploading facts
Sending installed packages and traces|
| 443 | TCP | HTTPS  | ABP server | Content Mirroring | 	Management |
| 443 | TCP | HTTPS  | ABP server | ABP 프록시 API | 스마트 프록시 기능 |
| 1883 | TCP | MQTT | 클라이언트 | 풀 기반 REX(선택 사항) | REX 작업 통지를 위한 콘텐츠 호스트(선택 사항) |
| 5646, 5647 | TCP | AMQP | ABP 프록시 | Katello 에이전트 | ABP의 Qpid 디스패치 라우터로 메시지 전달(선택 사항) |
| 5910 – 5930 | TCP | HTTPS  | 브라우저 | Compute Resource의 가상 콘솔 |  |
| 8000 | TCP | HTTP | 클라이언트 | 프로비저닝 템플릿 | 클라이언트 설치 관리자, iPXE 또는 UEFI HTTP 부팅을 위한 템플릿 검색 |
| 8000 | TCP | HTTPS  | 클라이언트 | PXE 부팅 | 설치 |
| 8140 | TCP | HTTPS  | 클라이언트 | 퍼핏 에이전트 | 클라이언트 업데이트(선택 사항) |
| 9090 | TCP | HTTPS  | 클라이언트 | 오픈스캡 | 클라이언트 구성 |
| 9090 | TCP | HTTPS  | 검색된 노드 | 발견 | 호스트 검색 및 프로비저닝 |
| 9090 | TCP | HTTPS  | ABP server | ABP 프록시 API | ABP 프록시 기능 |

ABP 서버에 직접 연결된 관리 호스트는 통합 ABP 프록시의 클라이언트이기 때문에 이 컨텍스트에서 클라이언트입니다. 여기에는 ABP 프록시가 실행 중인 기본 운영 체제가 포함됩니다.

DHCP ABP 프록시는 DHCP IPAM이 설정된 서브넷의 호스트에 대해 ICMP ping 또는 TCP 에코 연결을 시도하여 사용 가능한 IP 주소인지 확인합니다. 이 동작은 를 사용하여 끌 수 있습니다.`ABP-installer --foreman-proxy-dhcp-ping-free-ip=false`

| 대상 포트 | 프로토콜 | 서비스 | 목적지 | Required For | Description |
| --- | --- | --- | --- | --- | --- |
|  | TCP & UDP | 핑 | 클라이언트 | DHCP | 무료 IP 확인(선택 사항) |
| 7 | TCP | 반향 | 클라이언트 | DHCP | 무료 IP 확인(선택 사항) |
| 22 | TCP | SSH를 참조하십시오 | 대상 호스트 | 원격 실행 | 작업 실행 |
| 22, 16514 | TCP | SSH SSH/TLS | 계산 리소스(Compute Resource) | ABP Libvirt의 컴퓨팅 리소스에 대한 통신 시작 |  |
| 53 | TCP & UDP | DNS | 인터넷의 DNS 서버 | DNS 서버 | DNS 레코드 확인(선택 사항) |
| 53 | TCP & UDP | DNS | DNS 서버 | ABP 프록시 DNS | DNS 충돌 유효성 검사(선택 사항) |
| 53 | TCP & UDP | DNS | DNS 서버 | 오케스트레이션 | DNS 충돌 유효성 검사 |
| 68 | TCP & UDP | DHCP | 클라이언트 | 유동 IP | DHCP(선택 사항) |
| 80 | TCP | HTTP | 원격 리포지토리 | 콘텐츠 동기화 | 원격 yum 저장소 |
| 389, 636 | TCP | LDAP, LDAPS | 외부 LDAP 서버 | LDAP | LDAP 인증 - 외부 인증이 활성화된 경우에만 필요합니다. 포트는 정의될 때 사용자 지정할 수 있습니다.LDAPAuthSource |
| 443 | TCP | HTTPS  | ABP server | ABP 프록시 | ABP 프록시
구성 관리
템플릿 검색
오픈스캡
원격 실행 결과 업로드 |
| 443 | TCP | HTTPS  | 아마존 EC2, 애저, 구글 GCE | 계산 리소스Compute resources | 가상 머신 상호 작용(쿼리/만들기/삭제)(선택 사항) |
| 443 | TCP | HTTPS  | ABP 프록시 | 콘텐츠 미러링 | 개시 |
| 443 | TCP | HTTPS  | Infoblox DHCP 서버 | DHCP 관리 | DHCP용 Infoblox를 사용하는 경우 DHCP 임대 관리(선택 사항) |
| 623 |  |  | 클라이언트 | 전력 관리 | BMC 켜기/끄기/주기/상태 |
| 5000 | TCP | HTTPS  | OpenStack 컴퓨팅 리소스 | 계산 리소스Compute resources | 가상 머신 상호 작용(쿼리/만들기/삭제)(선택 사항) |
| 5646 | TCP | AMQP(주)에이엠큐피 | ABP 서버 | Katello 에이전트 | ABP 프록시의 Qpid 디스패치 라우터로 메시지 전달(선택 사항) |
| 5671 |  |  | 큐피드 | 원격 설치 | 클라이언트에 설치 명령 보내기 |
| 5671 |  |  | 디스패치 라우터(허브) | 원격 설치 | ABP의 디스패치 라우터로 메시지 전달 |
| 5671 |  |  | ABP 서버 | Katello 에이전트에 대한 원격 설치 | 클라이언트에 설치 명령 보내기 |
| 5671 |  |  | ABP 서버 | Katello 에이전트에 대한 원격 설치 | ABP의 디스패치 라우터로 메시지 전달 |
| 5900 – 5930 | TCP | SSL/TLS | 하이퍼바이저 | noVNC 콘솔 | noVNC 콘솔 실행 |
| 5985 | TCP | HTTP | 클라이언트 | 윈RM | Windows를 실행하는 클라이언트 구성 |
| 5986 | TCP | HTTPS  | 클라이언트 | 윈RM | Windows를 실행하는 클라이언트 구성 |
| 7911 | TCP | DHCP, OMAPI | DHCP 서버 | DHCP | DHCP 대상은 다음을 사용하여 구성되며 기본값은 localhost입니다.--foreman-proxy-dhcp-server
ISC를 사용하고 기본값이 7911이고 OMAPI를 사용하는 구성 가능한 포트를 사용합니다.remote_isc |
| 8443 | TCP | HTTPS  | 클라이언트 | 발견 | ABP 프록시가 검색된 호스트에 재부팅 명령을 보냅니다(선택 사항). |
| 9090 | TCP | HTTPS  | ABP 프록시 | ABP 프록시 API | ABP 프록시 관리 |

### **방화벽 구성**

ABP 서버는 [firewalld](https://firewalld.org/)를 사용합니다. 방화벽은 ABP를 설치하거나 업그레이드 할 때 자동으로 설정 및 구성됩니다. 다음 명령을 실행하여 방화벽의 현재 상태를 볼 수 있습니다. `firewall-cmd --state`

### **ABP 기기 요구 사항**

ABP server 설치를 수행하는 경우 다음이 필요합니다.

- 버전 6.0 이상의 VMware vSphere 환경. 또는 KVM 환경.
- ABP 이미지는 Namuict 로 문의 바랍니다. .

### **킥스타트 요구 사항**

킥스타트 설치를 수행하는 경우 다음이 필요합니다.

- 킥스타트 파일
    
## **기기 설치 단계**
