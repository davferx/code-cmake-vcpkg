# Task to be run during the build process
param(
    [Parameter(Mandatory = $True)]
    [ValidateSet('build', 'clean', 'cbuild')]
    [string]$Cmd
)

function DoBuild {
    mkdir out\artifact -ErrorAction Ignore | Out-Null
    $env:Path = "$env:CLANG_ROOT;$env:MSVC_ROOT\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja;$env:Path"
    Write-Output 'building'
    Write-Output $env:Path.Split(';')
    Get-Command ninja | Format-List
    Get-Command clang++ | Format-List
    ninja.exe all
    # >out\build.log
}

function DoCBuild {
    DoClean
    DoBuild
}

function DoClean {
    Remove-Item .\.ninja_log -ErrorAction Ignore
    remove-item out -Recurse -Force -ErrorAction Ignore
}

switch ($Cmd.ToLower()) {
    'build' { DoBuild }
    'cbuild' { DoCBuild }
    'clean' { DoClean }
}