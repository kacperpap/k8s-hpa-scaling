{{/*
Expand the name of an app instance.
*/}}
{{- define "temp_conv_charts.instance" -}}
fahrenheit-to-celsius
{{- end }}

{{/*
Expand the name of base component
*/}}
{{- define "temp_conv_charts.component" -}}
backend
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "temp_conv_charts.fullname" -}}
temperature-converter
{{- end }}


{{/*
Common labels
*/}}
{{- define "temp_conv_charts.labels" -}}
app.temperature-converter/name: {{ include "temp_conv_charts.fullname" . }}
app.temperature-converter/instance: {{ include "temp_conv_charts.instance" . }}
app.temperature-converter/component: {{ include "temp_conv_charts.component" . }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "temp_conv_charts.selectorLabels" -}}
app.temperature-converter/name: {{ include "temp_conv_charts.fullname" . }}
app.temperature-converter/instance: {{ include "temp_conv_charts.instance" . }}
app.temperature-converter/component: {{ include "temp_conv_charts.component" . }}
{{- end }}

