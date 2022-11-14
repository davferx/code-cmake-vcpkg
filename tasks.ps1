# Task to be run during the build process
param(
    [Parameter(Mandatory = $True)]
    [ValidateSet('build', 'clean', 'cbuild', 'scan', 'list')]
    [string]$Cmd
)

function DoBuild {
    mkdir out\artifact -ErrorAction Ignore | Out-Null
    $env:Path = "$env:CLANG_ROOT;$env:MSVC_ROOT\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja;" + $env:Path
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

function DoScan {
    Write-Host 'Scanning' -ForegroundColor Yellow
    Get-ChildItem 'C:\Program Files\LLVM\bin' -Recurse | Format-List FullName
    &'C:\Program Files\LLVM\bin\clang++.exe' --version
    Get-ChildItem "C:\*exe" -Recurse -ErrorAction Ignore | Where-Object Name -Match "^(cl|clang\+\+|cmake|gcc|ninja)\.exe$" | Format-List FullName
}

switch ($Cmd.ToLower()) {
    'build' { DoBuild }
    'cbuild' { DoCBuild }
    'clean' {
        mkdir out\artifact -ErrorAction Ignore | Out-Null
        DoClean >out\artifact\scan.log
    }
    'scan' { DoScan }
}