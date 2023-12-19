---
sort: 3
---

# Using Hammer CLI

ABP의 UI 화면을 통해 수행할 수 있는 대부분의 작업을 Hammer CLI를 사용하여 수행할 수 있습니다. ABP를 설치하는 동안 Hammer CLI가 설치 및 구성됩니다. Hammer CLI의 기능은 플러그인으로 확장할 수 있습니다.

예제와 같은 명령어를 사용하여 명령 목록을 볼 수 있습니다. 각 명령 및 하위 명령에는 추가 도움말이 포함되어 있습니다.`예제: hammer --help, hammer os -h, hammer os create -h`

## Hammer CLI 설치

Hammer CLI는 ABP를 설치하는 동안 자동으로 설치됩니다. 그렇지 않거나 별도의 호스트에 Hammer CLI를 설치하려는 경우 다음 명령을 사용하여 이 작업을 수행할 수 있습니다.

```
# dnf install rubygem-hammer_cli_katello
```

추가 Hammer CLI 플러그인을 설치할 수 있습니다.

List of Hammer CLI Plugins
| Plugin | Package |
| --- | --- |
| Ansible | rubygem-hammer_cli_foreman_ansible |
| Boot Disk | rubygem-hammer_cli_foreman_bootdisk |
| Discovery | rubygem-hammer_cli_foreman_discovery |
| OpenSCAP | rubygem-hammer_cli_foreman_openscap |
| Remote Execution | rubygem-hammer_cli_foreman_remote_execution |
| SCC Manager | rubygem-hammer_cli_foreman_scc_manager |
| Salt | rubygem-hammer_cli_foreman_salt |

ABP 설치를 하는 동안 기본 구성이 저장됩니다. Hammer CLI에서 구성을 검색합니다. 두 디렉토리 모두 일반 및 플러그인별 구성을 포함합니다. Hammer CLI를 사용하는 동안 구성 파일의 경로를 설정할 수 있습니다. `/etc/hammer/ /etc/hammer/cli.modules.d/ /etc/hammer/ ~/.hammer/ -c */path/to/config/file.yml*`

## Hammer CLI 출력 보기

기본적으로 Hammer는 생성된 출력을 표 형식으로 표시합니다. 이것은 파라미터 `--output *format*`로 제어 할 수 있습니다. ABP에서 지원하는 형식은 `base`, `table`, `silent`, `csv`, `yaml`, `json` 입니다. CSV 데이터의 출력 형식의 더 짧은 형식은 Hammer 옵션 `--csv`를 사용하여 제어할 수 있습니다.

`--no-headers`옵션을 사용하면 제목의 출력을 억제할 수 있습니다. 출력을 파일에 직접 쓰려면 `--output-file *My_Output_File*` 옵션을 사용할 수 있습니다.

**예제**

ABP에 구성된 호스트 목록을 파일에 제목 없이 CSV 형식으로 만듭니다. `host_list.csv`

```
# hammer --csv --no-headers --output-file host_list.csv host list
```

## Hammer CLI 예제

- 다음 명령을 사용하여 운영 체제를 만들 수 있습니다.
    
    ```
    # hammer os create --name "Centos_7.9" --family "Rehat" --major "15" --description "Centos 7.9"
    ```
    
- 루프에서 전역 매개 변수를 만듭니다.
    
    ```bash
    for varin sles11:true sles12:true sles15:false;do \
      name=$(echo $var | cut -f1 -d:); \
      value=$(echo $var | cut -f2 -d:); \
      hammer global-parameter set --name $name --value $value; \
    done
    ```
    
- 파일 및 bash 스크립트를 사용하여 여러 호스트를 배포합니다.`.csvmulti_host_deploy.sh`
    - bash 스크립트를 만듭니다.
        
        ```bash
        #!/bin/bash
        while IFS=, read -r host_name host_group organization location
        do
          hammer host create \
            --name "${host_name}" \
            --hostgroup "${host_group}" \
            --organization "${organization}" \
            --location "${location}"
          hammer host start --name "${host_name}.example.com"
        done < hosts.csv
        ```
                
    - `hosts.csv`파일에서 `host_name`, `host_group`, `organization`및 `location`의 매개 변수를 설정하여 임의의 수의 호스트를 정의합니다.
        
        ```
        # cat hosts.csv
        host1,CentOS 7,My_Organization,My_Location_A
        host2,SLES 15,My_Organization,My_Location_B
        ```
                
    - 다음과 같이 셸 스크립트를 실행하여 여러 호스트를 한 번에 배포합니다.`multi_host_deploy.sh`
        
        ```
        # ./multi_host_deploy.sh
        ```
