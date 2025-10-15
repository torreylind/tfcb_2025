# create_question01.ps1
# Creates question01.txt containing user/home info and listing of tfcb_2023/lectures/lecture04/,
# then creates directory homework02 and moves the file there.

$Username = $env:USERNAME
$HomeDir  = $env:USERPROFILE
$TargetDir = "tfcb_2023\lectures\lecture04"
$OutFile = "question01.txt"

# Build the content
$content = @()
$content += "My username is $Username"
$content += ""
$content += "My home directory is $HomeDir"
$content += ""
$content += "The contents of the $TargetDir directory are"
$content += ""

if (Test-Path $TargetDir -PathType Container) {
    Get-ChildItem -Path $TargetDir | ForEach-Object { $content += $_.Name }
} else {
    $content += "Directory not found: $TargetDir"
}

Set-Content -Path $OutFile -Value $content -Encoding UTF8

# Create homework02 and move the file
New-Item -ItemType Directory -Path homework02 -Force | Out-Null
Move-Item -Path $OutFile -Destination homework02 -Force

Write-Host "Wrote homework02\$OutFile"
