## 1. Các khái niệm
Helm có 4 khái niệm cơ bản:
- Chart: 
  - tập hợp những file YAML template của những k8s resource cần thiết để dựng lên 1 k8s application -> like a docker image and also have helm hub

- Config: nằm trong values.yaml chứa config dành riêng cho 1 bản release của k8s app. Có thể là config cho service, ingress, deployment đến những app riêng như kafka, vault,...

- Release: một version của k8s app đang chạy dựa trên chart và kết hợp với 1 config cụ thể
- 

- Repositories

## 2. Kiến trúc
- Helm có kiến trúc client-server khá đơn giản gồm client CLI và một server đang chạy trong k8s
  - helm client: cung cấp cho dev cmd để làm việc với chart, config, release, repo. Client sẽ tương tác với Tiller Server để thực hiện các hành động khác nhau như install, upgrade và rollback với chart, release
  - tiller server: là một server trong k8s, tương tác với helm client và giao tiếp với api server, nhờ đó có thể dễ dàng quản lý k8s với các tác vụ như install, upgrade, querry và rm với k8s resource

## 3. Cấu trúc 1 Helm package
```
[root@master1181 apache]# tree
.
├── charts
│   └── common
│       ├── Chart.yaml
│       ├── README.md
│       ├── templates
│       │   ├── _affinities.tpl
│       │   ├── _capabilities.tpl
│       │   ├── _errors.tpl
│       │   ├── _images.tpl
│       │   ├── _labels.tpl
│       │   ├── _names.tpl
│       │   ├── _secrets.tpl
│       │   ├── _storage.tpl
│       │   ├── _tplvalues.tpl
│       │   ├── _utils.tpl
│       │   ├── _validations.tpl
│       │   └── _warnings.tpl
│       └── values.yaml
├── Chart.yaml
├── ci
│   └── ct-values.yaml
├── files
│   ├── README.md
│   └── vhosts
│       └── README.md
├── README.md
├── requirements.lock
├── requirements.yaml
├── templates
│   ├── configmap-vhosts.yaml
│   ├── configmap.yaml
│   ├── deployment.yaml
│   ├── _helpers.tpl
│   ├── ingress.yaml
│   ├── NOTES.txt
│   └── svc.yaml
├── values.schema.json
└── values.yaml

7 directories, 31 files
```
- charts: những charts có thể phụ thuộc vào
- templates: chứa những template file để khi kết hợp với các biến config (từ values.yaml và cmd) tạo thành các manifest file cho k8s (template file sử dụng format của Go)
- Chart.yaml: yaml chứa các thông tin liên quan đến định nghĩa Chart như tên, version,...
- requirements.yaml: yaml file chứa danh sách các link của các chart phụ thuộc.
- values.yaml: yaml file chứa các biến config mặc định cho Chart.

## Note
- Thứ tự khởi tạo tài nguyên k8s khi chạy chương trình helm phiên bản v3 với độ ưu tiên từ trên xuống dưới
  - "Namespace",
  - "NetworkPolicy",
  - "ResourceQuota",
  - "LimitRange",
  - "PodSecurityPolicy",
  - "PodDisruptionBudget",
  - "Secret",
  - "ConfigMap",
  - "StorageClass",
  - "PersistentVolume",
  - "PersistentVolumeClaim",
  - "ServiceAccount",
  - "CustomResourceDefinition",
  - "ClusterRole",
  - "ClusterRoleList",
  - "ClusterRoleBinding",
  - "ClusterRoleBindingList",
  - "Role",
  - "RoleList",
  - "RoleBinding",
  - "RoleBindingList",
  - "Service",
  - "DaemonSet",
  - "Pod",
  - "ReplicationController",
  - "ReplicaSet",
  - "Deployment",
  - "HorizontalPodAutoscaler",
  - "StatefulSet",
  - "Job",
  - "CronJob",
  - "Ingress",
  - "APIService",


## useful command
- helm dependency update guestbook