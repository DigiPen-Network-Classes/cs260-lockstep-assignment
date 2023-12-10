param (
    [string]$directoryName
)
$ErrorActionPreference='Stop'

# TODO! For the build, figure out how to "tee" the output so that we can see it
# on the console as well as capturing it to determine if there are any warnings.
# see Issue #1

# Check if the directory exists
if (-not (Test-Path $directoryName -PathType Container)) {
    Write-Host "Directory not found: $directoryName"
    exit 1
}

# Get the path to the .sln file
$projectFilePath = Join-Path $directoryName "CS260_Assignment4.sln"
Write-Host $projectFilePath

# Check if the file exists
if (-not (Test-Path $projectFilePath -PathType Leaf)) {
    Write-Host "file not found: $projectFilePath"
    exit 1
}

# Run msbuild on the project
$msbuildArgs = @($projectFilePath, "/p:Configuration=Debug", "/p:Platform=x64", "/t:rebuild")

$output = msbuild $msbuildArgs
Write-Host $output

# Check for warnings in the output
$warnings = $output | Select-String "warning"

# Display warnings if any
if ($warnings) {
    Write-Host "Warnings detected!" -ForegroundColor Red
    $warnings | ForEach-Object { Write-Host $_.Line -ForegroundColor Red }
    Read-Host "Any Key to continue.."
} else {
    Write-Host "Build completed without warnings."
}

# run two copies of the exe
$outputDir = Join-Path $directoryName "x64\Debug"
$assignment4 = Get-ChildItem -Path $outputDir -Filter "CS260_Assignment4_Client.exe"
Write-Host "Executing game:" $assignment4.FullName
Start-Process $assignment4.FullName
Start-Process $assignment4.FullName
