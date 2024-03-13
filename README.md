# SvgToVuePowershell

This PowerShell script is designed to convert SVG files into Vue components. It's particularly useful when you have a large number of SVG files that you want to use as Vue components in your project.

## How it Works

The script works by reading each SVG file in a specified source directory, encoding the SVG content to Base64, and then creating a new Vue component with the encoded SVG content in a specified destination directory.

The Vue component uses the `v-html` directive to inject the decoded SVG content into the DOM. The SVG content is decoded using the `atob` function.

## Usage

Before running the script, you may need to change the execution policy in PowerShell to allow the execution of scripts. You can do this with the following command:

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```
After running the script, you should set the execution policy back to its default setting:
```powershell
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope CurrentUser
```
To use the script, you need to set the `$sourceDir` variable to the path of the directory containing your SVG files, and the `$destDir` variable to the path of the directory where you want the Vue components to be created.

Then, you can run the script in PowerShell.

## Note

This script assumes that you're using a Windows machine and that your SVG files are encoded in UTF-8. If you're using a different operating system or your SVG files are encoded in a different character encoding, you may need to modify the script accordingly.

Please note that when you paste this into your README.md file, you'll need to remove the outer set of triple backticks (```) as they are only used here to allow the markdown to be copied correctly.

Watch the examples `IconComponent.vue` and `IconExample.vue`
