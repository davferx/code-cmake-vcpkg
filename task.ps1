# Task to be run during the build process
param(
    [Parameter(Mandatory = $True)]
    [ValidateSet('build', 'clean', 'cbuild', 'scan')]
    [string]$Cmd
)

function DoBuild {
    $env:Path += "$env:MSVC_ROOT\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja"
    mkdir out -ErrorAction Ignore | Out-Null
    ninja.exe all >out\build.log
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
    'scan' { DoScan | Out-File 'out\scan.log' }
}