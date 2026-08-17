{{- define "my-simple-gvisor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "my-simple-gvisor.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "my-simple-gvisor.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "my-simple-gvisor.labels" -}}
app.kubernetes.io/name: {{ include "my-simple-gvisor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}