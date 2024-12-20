---
title: "Release Notes"
---

# ABP Release notes

ABP는 Automated Baremetal Provisioning으로,
멀티벤더의 Baremetal에 Bios Setup등의 설정과 OS 및 Platform을 한번의 Work-flow로 손쉽게 원격에서 자동으로 설치하는 솔루션입니다.

현재는, Dell 서버에 OpenShift Container Platform, Windriver Container Platform, CentOS, RHEL OS 등이 설치 가능하고,

HP 및 레노버 서버 등에도 설치 가능 하도록 고도화 진행 중입니다.

또하나의 제품군으로는 ABP Edge가 있습니다.

ABP Edge는 ABP의 Desktop 제품으로 ABP와 통신이 불가능 할 경우(별도의 원격 사이트에 ABP와 통신이 연결 안된 경우 등)에 사용가능하며, 복잡한 Container Platform 설치 이외의 작업(서버 Bios 설정, Healthcheck, OS설치 등)이 가능합니다.
## ABP v3.0 Release Notes

**DEC-25th-2024**

**ABP Features**
- HPE provider interface 추가
- HPE와 Dell Interface 통합 배포

**New in this release**
- Docker Container 운영환경 내 RHOCP 배포 형상 추가
- Docker Container 운영환경 내 Linux OS 배포 형상(RHEL, Rocky, CentOS) 추가
- Report Generate 기능 추가
- Report Export 기능 추가(HTML, JSON 등)
- Redfish 기능 JobTemplate 추가
- Reboot 중 Monitoring 기능 추가
- ZTP Dashboard Recurring Group Log Viewer 추가

## ABP v2.0 Release Notes

**DEC-25th-2023**

**ABP Features**

- ABP Edge Desktop 신규 출시
- Running ABP on docker-compose environment

**New in this release**

- ZTP 기능으로 Windriver Container Platform Simplex 설치
- ZTP 기능으로 Windriver Container Platform Multiplex 설치
- ZTP 기능으로 Windriver Container Platform DCManager Central Cloud 기반 Node 설치
- OpenShift Container Platform All-in-one 설치
- OpenShift Container Platform 7 Cluster node 설치
- OpenShift Container Platform Cluster 시간 동기화 기능 추가
- Cridencial Access Token 기능 추가
- Libvirt 생성, OS 설치 및 Configuration 구성 Work-flow 기능 추가

## ABP v1.0 Release Notes

**OCT-1st-2022**

**ABP Features**

- Zero Touch Provisioning Design - Single, Multiple composition
- Zero Touch Provisioning Dashboard
- Provisioning template
- Idrac Redfish Job template
- Ansible Job template

**New in this release**

- Support for Zero Touch Provisioning Design - Support Single or Multiple design for bmc Provisioning
- Support for Dell PowerEdge 12G/13G/14G/15G servers - Minimum iDRAC 7/8 FW 2.40.40.40, iDRAC9 FW 3.00.00.00
- Support for Zero Touch Provisioning Dashboard
- Support One-stop Provisioning from planing to application
- Support One-click provisioning step initiating, reinstating
- Status Dashboard shows current status of multiple hosts
- Host Dashboard shows step-by-step checkpoint status for each host
- Support for Redfish Bios Setup job templating
- Support idrac bios controlling with redfish scripts
- Support for Ansible job templating
- Support platform setup with ansible book
