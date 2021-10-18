{{/*
Expand the name of the chart.
*/}}
{{- define "rtd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rtd.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rtd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rtd.common.labels" -}}
helm.sh/chart: {{ include "rtd.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Create a web Selector labels
*/}}
{{- define "rtd.web.labels" -}}
app.kubernetes.io/name: {{ include "rtd.name" . }}-web
app.kubernetes.io/component: rtd-web
{{ include "rtd.common.labels" . }}
{{- end }}

{{/*
Create a workflow Selector labels
*/}}
{{- define "rtd.workflow.labels" -}}
app.kubernetes.io/name: {{ include "rtd.name" . }}-workflow
app.kubernetes.io/component: rtd-workflow
{{ include "rtd.common.labels" . }}
{{- end }}


{{/*
Create a ruleengine Selector labels
*/}}
{{- define "rtd.ruleengine.labels" -}}
app.kubernetes.io/name: {{ include "rtd.name" . }}-ruleengine
app.kubernetes.io/component: rtd-ruleengine
{{ include "rtd.common.labels" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rtd.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rtd.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
