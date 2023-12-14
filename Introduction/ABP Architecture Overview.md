 # 아키텍처 개요
ABP는 원격에서 여러 곳에 분산 되어있는 대량의 서버를 Provisioning 하기 위한 솔루션 입니다. 따라서 배포를 위해서는 하나의 ABP 설치가 제공됩니다.

ABP는 자체 네트워크 내에서 베어 메탈 호스트를 관리하는 데 사용할 수 있습니다. 일반적으로 ABP는 동일한 네트워크 내에서 하나 이상의 [컴퓨팅 리소스에](https://docs.orcharhino.com/or/6.0/sources/compute_resources.html) 배포된 호스트를 관리하도록 구성됩니다.

모든 호스트 메타데이터, 프로비저닝 데이터 및 컨텐츠 저장소는 ABP의 데이터베이스 내에 저장됩니다.

ABP는 스마트 프록시 기능이 내장 되어있으며, 스마트 프록시 기능에는 DHCP, DNS 및 TFTP 서비스와 Puppet CA가 포함됩니다. 더 복잡한 시나리오에서는 ABP 프록시를 사용하여 네트워크 경계 넘어 존재하는 베어매탈 장비에 까지 Provisionig할 수 있도록 구성이 가능합니다.

기본적인 ABP의 아키텍처는 아래의 그림과 같습니다.
![image](https://github.com/namuict/abp/assets/117419940/fdb0b4f9-4e51-40af-abec-ca614033a070)
