---
sort: 2
---

# ZTP Template

Machine Group에서 선택한 형상에 따라 각각 다른 디자인 형상이 적용 됩니다. 

적용된 컬럼에 대해서는 ABP 관리 UI 내 에서 직접 작성 및 저장이 가능하지만, Design Detail우측에 있는 Export 버튼을 통해 Excel 형태로 다운 받아 
관리자 PC에서 에서 수정 및 편집후 Import 하여 저장 할 수 도 있습니다.

**Openshift용**</br>

***Design Detail 컬럼 목록***

- role_name : host의 용도. (common01, common02, Provisioner, bootstrap, Master, Worker 등.)
- parent_role : machine_type이 VM일 경우 대상이 되는 hyperviser의 role_name을 작성 합니다.
- machine_type : 호스트의 장비 타입을 의미 합니다. (HV(hyperviser) , PM(Physical Machine) , VM (Virtual Machine) 중에 선택 가능)
- provider_interface : Host 장비의 벤더 및 모델을 의미합니다.
- hostname : Host의 고유 name 입니다.
- bmc_mac : Idrac의 Mac address
- bmc_ip : Idrac의 IP
- subnet_network_address : Idrac의 network_address (ex 10.1.1.0)
- subnet_netmask : Idrac의 subnet_mask (ex 255.255.255.0)
- subnet_gateway : Idrac의 gateway (ex 10.1.1.1)
- provisioning_mac : Host 장비의 메인 Interface mac
- provisioning_ip : Host 장비의 메인 IP
- provisioning_subnet_network_address : Host장비의 메인 network_address (ex 10.1.1.0)
- provisioning_subnet_netmask : Host장비의 메인 subnet_mask (ex 255.255.255.0)
- provisioning_subnet_gateway : Host장비의 메인 gateway (ex 10.1.1.1)
- br_k8s_ifcfg : Cluster 사용을 위한 물리 Interface name (Tip : hyperviser 와 bootstrap 을 제외한 VM 에서 사용)
- br_k8s_name : Cluster 사용을 위한 bridge Interface name ( hyperviser 에서 사용)
- br_nbi_gateway : Cloud service를 위한 network gateway
- br_nbi_ifcfg : Cloud service를 위한 물리 Interface name
- br_nbi_ip : Cloud service를 위한 network IP
- br_nbi_ip_sec : Cloud service를 위한 network sub IP
- br_nbi_mac : Cloud service를 위한 network Mac address
- br_nbi_name : Cloud service를 위한 bridge Interface name
- br_nbi_prefix : Cloud service를 위한 Network prefix
- br_nbi_vip : Cloud service를 위한 network vip
- br_storage_ifcfg : 스토리지 통신을 위한 물리 Interface name
- br_storage_ip : 스토리지 통신을 위한 network IP
- br_storage_mac : 스토리지 통신을 위한 network Mac address
- br_storage_name : 스토리지 통신을 위한 bridge Interface name
- br_storage_prefix : 스토리지 통신을 위한 Network prefix
- cluster_set_name : 구성되는 Cluster set의 대표 이름.
- hypervisor_install : Hypervisor 설정을 위한 Template 지정.
- libvirt_guest_cpu_count : VM 생성용 cpu core 수량
- libvirt_guest_disk_gb : VM 생성용 disk 용량
- libvirt_guest_memory_mib : VM 생성용 memory 용량
- platform_setup : Platform 설정을 위한 Template 지정.
- redfish_password : H/W 원격 제어를 위한 BMC Password
- redfish_username : H/W 원격 제어를 위한 BMC user name
- remote_ssh_password : 원격 접속을 위한 OS 초기 Password

| 위의 항목중 다음의 항목은 반드시 작성을 해야 하는 항목입니다. (role_name, machine_type , provider_interface, hostname , bmc_mac , bmc_ip, subnet_network_address, subnet_netmask , subnet_gateway, provisioning_mac, provisioning_ip, provisioning_subnet_network_address, provisioning_subnet_netmask, provisioning_subnet_gateway) 나머지 항목의 경우에는 해당 Machine의 용도에 따라 값이 없을 수 있으며, 값이 없는 경우 공란으로 비워 둡니다. |
| --- |

 
