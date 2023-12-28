{{/*
Defining the application image
*/}}
{{- define "application.image" -}}
{{- if .Values.django.image.tag -}}
{{- printf "%s:%s" .Values.django.image.repository .Values.django.image.tag -}}
{{- else if .Chart.AppVersion  -}}
{{- printf "%s:%s" .Values.django.image.repository .Chart.AppVersion -}}
{{- else -}}
{{- printf "%s:latest" .Values.django.image.repository -}}
{{- end -}}
{{- end }}

{{/*
Defining labels
*/}}
{{- define "labels" -}}
app: {{ .Release.Name }}
chart: "{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}"
release: {{ .Release.Name | quote }}
{{- if .Chart.AppVersion }}
version: {{ .Chart.Version | quote }}
{{- end }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
