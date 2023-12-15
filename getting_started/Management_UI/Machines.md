---
sort: 1
---

# Machines

Machines 화면은 ABP에 login 하엽 접속을 하면 가장먼저 만나보게 되는 화면입니다.

현재 까지 등록된 HOST 들의 list 를 보여 주는 화면이며, 장비의 등록, 삭제 복제 등을 진행 할 수 있습니다.
개별 장비의 경우는 이곳에서 장비를 등록 하지만, 대량의 일괄 장비등록은 ZTP를 통해 진행을 하게 됩니다.
 


![Machines](https://github.com/namuict/abp/assets/152131676/86d554e3-63e9-42b9-930c-9ee79634bfb4)


- *Search*(1)을 통해 등록되어있는 장비들을 검색 할 수 있습니다. 또한 마우스를 이동하여 No grouping의 위치를 클릭하면, 현재 등록된 장비들을 그룹별로 정리할 수 있습니다.
ABP 에서는 Group by owner, Group by operating system, Group by status, Group by hostgroup 이렇게 4가지 형태로 분류를 지원 합니다.

- *Create*(2)를 클릭하여 새로운 장비를 등록 할수 있습니다.
- *Name*(5) 를 클릭하여 해당 장비의 세부 정보를 확인하거나, 설정변경, 삭제, Console 접속 등의 작업이 가능합니다.
   세부 정보에는 장비의 CPU, Memory, HDD, Interface 정보 등 H/W의 스펙과 관련된 정보외 장비와 관련된 상태를 확인 할수 있습니다.
- (3) 과 *Delete*(4)는 대량의 장비를 일괄삭제 할 경우에만 사용 합니다.
  (3)을 클릭하여 대상 장비들을 선택 한 이후에 *Delete*(4)가 활성화 됩니다. 장비가 선택 되지 않은 경우 *Delete*(4)는 어떠한 액션도 하지 않습니다.
- (6)을 클릭하여 대상비의 복제 수정 삭제를 진행 할수 있습니다.
