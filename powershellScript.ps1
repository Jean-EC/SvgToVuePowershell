$sourceDir = "YourFullPath to the folder that has the svg icons"
$destDir = "YourFullPath to destination folder"

Get-ChildItem -Path $sourceDir -Filter *.svg | ForEach-Object {
    $name = $_.BaseName.Replace(' ', '') + 'Icon'
    $reader = New-Object System.IO.StreamReader($_.FullName, [System.Text.Encoding]::UTF8)
    $svgContent = $reader.ReadToEnd()
    $reader.Close()
    $svgContent = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($svgContent))
    $content = @"
<template>
  <div v-html="decodedSvgContent"></div>
</template>

<script>
export default {
  name: '$name',
  data() {
    return {
      svgContent: '$svgContent'
    }
  },
  computed: {
    decodedSvgContent() {
      return atob(this.svgContent);
    }
  }
}
</script>
"@
    Set-Content -Path "$destDir\$name.vue" -Value $content -Encoding UTF8
}
