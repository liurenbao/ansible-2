#!/bin/bash
while [ 1 ]; do
  kubectl get pod -owide -n kube-system >> kube-system.txt
  echo "-------" >> kube-system.txt
  kubectl get pod -owide -n elk >> elk.txt
  echo "-------" >> elk.txt
  kubectl get pod -owide -n monitoring >> monitoring.txt
  echo "-------" >> monitoring.txt
  kubectl get pod -owide -n gaussdb-monitoring >> gaussdb-monitoring.txt
  echo "-------" >> gaussdb-monitoring.txt
  kubectl get pod -owide -n kubernetes-dashboard >> kubernetes-dashboard.txt
  echo "-------" >> kubernetes-dashboard.txt
  kubectl get pod -owide -n rocketmq >> rocketmq.txt
  echo "-------" >> rocketmq.txt
  kubectl get pod -owide -n test >> test.txt
  echo "-------" >> test.txt
  kubectl get pod -owide -n traefik >> traefik.txt
  echo "-------" >> traefik.txt
  sleep 2
done



/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-blackbox-probe-rules.yaml > blackbox
BlackboxProbeFailed
BlackboxSlowProbe
BlackboxProbeSlowHttp
BlackboxProbeSlowPing
BlackboxSslCertificateExpired
BlackboxSslCertificateWillExpireSoon
BlackboxSslCertificateWillExpireSoon
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-elasticsearch-rules.yaml > elasticsearch
ElasticsearchClusterRed
ElasticsearchClusterYellow
ElasticsearchDiskOutOfSpace
ElasticsearchDiskSpaceLow
ElasticsearchHeapUsageTooHigh
ElasticsearchInitializingShardsTooLong
ElasticsearchPendingTasks
ElasticsearchUnassignedShards
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-gaussdb-rules.yaml > gaussdb-monitor-prometheus-rules
gaussGsCheck-warning
gaussSqlCheck-FailOver-warning
gaussSqlCheck-LogicRepProgress-warning
gaussSqlCheck-LongTransaction-warning
gaussAlarmLog-warning
gaussConnectionUsage-warning
gaussGsOm-AZStatus-warning
gaussGsOm-CMInstanceStatus-warning
gaussGsOm-ClusterStatus-warning
gaussGsOm-DBInGroupInstanceStatus-warning
gaussGsOm-ETCDInstanceStatus-warning
gaussGsOm-HostStatus-warning
gaussSqlCheck-ClusterRunMode-warning
gaussSqlCheck-LockTableSQL-warning
gaussSqlCheck-LongSQL-warning
gaussSqlCheck-SyncInfoFlush-warning
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-host-hardware-rules.yaml > host-hardware
HostOutOfDiskSpace
HostOutOfMemory
HostDiskWillFillIn24Hours
HostEdacUncorrectableErrorsDetected
HostHighCpuLoad
HostInodesWillFillIn24Hours
HostMemoryUnderMemoryPressure
HostNetworkInterfaceSaturated
HostNodeOvertemperatureAlarm
HostOomKillDetected
HostOutOfInodes
HostPhysicalComponentTooHot
HostSystemdServiceCrashed
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-kafka-rules.yaml > kafka
KafkaConsumersGroup
KafkaTopicsReplicas
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-ext-rules.yaml > prometheus-ext-rules
PrometheusMetricsScrapeFailed
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > alertmanager.rules
AlertmanagerMembersInconsistent
AlertmanagerConfigInconsistent
AlertmanagerFailedReload
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > general.rules
Watchdog
TargetDown
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kube-apiserver-slos
KubeAPIErrorBudgetBurn
KubeAPIErrorBudgetBurn
KubeAPIErrorBudgetBurn
KubeAPIErrorBudgetBurn
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kube-state-metrics
KubeStateMetricsListErrors
KubeStateMetricsWatchErrors
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kubernetes-apps
KubeContainerWaiting
KubeDaemonSetMisScheduled
KubeDaemonSetRolloutStuck
KubeDeploymentReplicasMismatch
KubePodNotReady
KubeStatefulSetReplicasMismatch
KubeDaemonSetNotScheduled
KubeDeploymentGenerationMismatch
KubeHpaMaxedOut
KubeHpaReplicasMismatch
KubeJobCompletion
KubeJobFailed
KubePodCrashLooping
KubeStatefulSetGenerationMismatch
KubeStatefulSetUpdateNotRolledOut
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kubernetes-resources
CPUThrottlingHigh
KubeCPUOvercommit
KubeCPUQuotaOvercommit
KubeMemoryOvercommit
KubeMemoryQuotaOvercommit
KubeQuotaAlmostFull
KubeQuotaExceeded
KubeQuotaFullyUsed
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kubernetes-storage
KubePersistentVolumeErrors
KubePersistentVolumeFillingUp
KubePersistentVolumeFillingUp
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kubernetes-system
KubeClientErrors
KubeVersionMismatch
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kubernetes-system-apiserver
AggregatedAPIDown
AggregatedAPIErrors
KubeAPIDown
KubeClientCertificateExpiration
KubeClientCertificateExpiration
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kubernetes-system-controller-manager
KubeControllerManagerDown
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kubernetes-system-kubelet
KubeNodeNotReady
KubeNodeReadinessFlapping
KubeNodeUnreachable
KubeletDown
KubeletPlegDurationHigh
KubeletPodStartUpLatencyHigh
KubeletTooManyPods
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > kubernetes-system-scheduler
KubeSchedulerDown
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > node-exporter
NodeClockNotSynchronising
NodeClockSkewDetected
NodeFilesystemAlmostOutOfFiles
NodeFilesystemAlmostOutOfFiles
NodeFilesystemAlmostOutOfSpace
NodeFilesystemAlmostOutOfSpace
NodeFilesystemFilesFillingUp
NodeFilesystemFilesFillingUp
NodeFilesystemSpaceFillingUp
NodeFilesystemSpaceFillingUp
NodeHighNumberConntrackEntriesUsed
NodeNetworkReceiveErrs
NodeNetworkTransmitErrs
NodeRAIDDegraded
NodeRAIDDiskFailure
NodeTextFileCollectorScrapeError
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > node-network
NodeNetworkInterfaceFlapping
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > prometheus
PrometheusBadConfig
PrometheusDuplicateTimestamps
PrometheusErrorSendingAlertsToAnyAlertmanager
PrometheusErrorSendingAlertsToSomeAlertmanagers
PrometheusMissingRuleEvaluations
PrometheusNotConnectedToAlertmanagers
PrometheusNotIngestingSamples
PrometheusNotificationQueueRunningFull
PrometheusOutOfOrderTimestamps
PrometheusRemoteStorageFailures
PrometheusRemoteWriteBehind
PrometheusRemoteWriteDesiredShards
PrometheusRuleFailures
PrometheusTSDBCompactionsFailing
PrometheusTSDBReloadsFailing
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-prometheus-k8s-rules.yaml > prometheus-operator
PrometheusOperatorListErrors
PrometheusOperatorNodeLookupErrors
PrometheusOperatorReconcileErrors
PrometheusOperatorWatchErrors
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-ravencast-rules.yaml > ravencast
RavencastLicenseExpiring
RavencastQueueWait
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-redis-rules.yaml > redis
RedisClusterFlapping
RedisDisconnectedSlaves
RedisDown
RedisMissingBackup
RedisMissingMaster
RedisOutOfConfiguredMaxmemory
RedisOutOfSystemMemory
RedisRejectedConnections
RedisReplicationBroken
RedisTooManyConnections
RedisTooManyMasters
/etc/prometheus/rules/prometheus-k8s-rulefiles-0/monitoring-rocketmq-rules.yaml > GaleraAlerts
ConsumerFallingBehind
GroupGetLatencyByStoretime