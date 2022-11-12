# Task to be run during the build process
param(
    [Parameter(Mandatory = $True)]
    [ValidateSet('build', 'copy', 'clean', 'scan')]
    [string]$Cmd
)

function DoBuild {
    Write-Host 'doing a BUILD' -ForegroundColor Yellow
}

function DoCopy {
    Write-Host 'doing a COPY' -ForegroundColor Yellow
}

function DoClean {
    Write-Host 'doing a CLEAN' -ForegroundColor Yellow
}

function DoScan {
    Write-Output 'Environment Variables'
    Write-Output '---------------------'
    Get-ChildItem Env:

    Write-Output ''
    Write-Output 'Path'
    Write-Output '----'
    Write-Output $env:Path.Split(';')

    Write-Output ''
    Write-Output 'Root Dir'
    Write-Output '--------'
    Get-ChildItem c:\ | Out-String
    Get-ChildItem "c:\Program Files" | Out-String
    Get-ChildItem "c:\Program Files (x86)" | Out-String
}

switch ($Cmd.ToLower()) {
    'build' { DoBuild }
    'copy' { DoCopy }
    'clean' { DoClean }
    'scan' { DoScan }
}