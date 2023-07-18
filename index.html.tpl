<!DOCTYPE html>
<!-- ABUILD_RELEASER_ACTION_INDEX_TEMPLATE -->
<html lang="en">
  <head>
    <title>{{ .title }}</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@ajusa/lit@latest/dist/lit.css" />
  </head>
  <body class="c">
    <h1>Index {{ with .dir }}of {{ clean . }}{{ end }}</h1>
    <hr />
    <div class="row">
        <div class="7 col">Seven</div>
        <div class="5 col">Five</div>
    </div>
    {{- if .add_top_level }}
    <div class="row">
      <div class="12 col"><a href="..">..</a></div>
    </div>
    {{- end }}
    {{- $files := .files -}}
    {{- range (keys $files | sortAlpha) }}
    {{- $file := get $files . }}
    <div class="row">
      <div class="7 col"><a href="{{ . }}">{{ clean . }}</a></div>
      <div class="3 col">
        <time datetime="{{ get $file "created_at" }}">
          {{ get $file "created_at" }}
        </time>
      </div>
      <div class="2 col">
        {{- if gt (get $file "size") 0 }}
        {{ get $file "size" | fileSize }}
        {{- end }}
      </div>
    </div>
    {{- end }}
    <hr />
  </body>
</html>
