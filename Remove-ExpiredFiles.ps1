<#
.Synopsis
   Removes Files older than 30 days from a set directory
.EXAMPLE
    This script has no params for running at cli. All params are set within the ps1 file.
.NOTES
    Author - Robert Ainsworth - https://ainsey11.com
#>

$Filepath = "C:\Test"
$MaxAge = (Get-Date).AddDays(-30)

# Delete files older than the $limit.
Get-ChildItem -Path $Filepath -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $maxage } | Remove-Item -Force

# Delete any empty directories left behind after deleting the old files.
Get-ChildItem -Path $Filepath -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse