---
sort: 3
---

# ZTP Dashboard
ZTP Dashboard에서는 ZTP Template에서 작성된 Template을 토대로 진행된 작업 그룹을 확인할수 있는 페이지 입니다.

ABP는 ZTP Template을 통해 수집된 각각의 Machine DATA와 Machine Group을 선언 한후 일괄적으로 작업이 진행되는 형태의 Flow를
가지고 있습니다. ZTP Dashboard에서는 이러한 작업이 실행 및 진행사항을 확인 할 수 있습니다.

![image](https://github.com/namuict/abp/assets/152131676/32e44fa9-bf19-4593-a74a-6a3d2c744cb2)

- *Create*(1)을 통해 실행 이 되어질 Job을 생성 할수 있습니다.

| 새로운 job을 실행 할때는 반드시 사전에 ZTP template 가 작성이 되어있어야 합니다. 동일한 ZTP template를 job으로 실행 시에는 기존에 등록 되어있던 HOST를 반드시 삭제 해야 합니다. ABP는 유일한 HOST 만들 이닉하므로 중복 된 HOST를 등록시에는 작업이 진행 되지 않습니다. |
| --- |

- (2)를 통해서 앞서 실행이 되었던 Job 들을 검색 할 수 있습니다.
- (1)을 통해 새로운 job을 실행 하게 되면, (3)이 자동으로 생성됩니다. 
- (4)를 통해 현재 실행 중인 상태를 간략 하게 모니터링 할 수 있습니다. 보다 디테일한 실행 과정을 보기 위해서는 (3)을 클리하여 진행 상태의 확인이 가능합니다.
