# Task to be run during the build process
param(
    [Parameter(Mandatory = $True)]
    [ValidateSet('build', 'clean', 'cbuild')]
    [string]$Cmd
)

function DoBuildInt {
    $env:Path = "$env:CLANG_ROOT;$env:MSVC_ROOT\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja;$env:Path"
    Write-Output 'Building'
    Write-Output $env:Path.Split(';')
    Get-Command ninja | Format-List
    Get-Command clang++ | Format-List
    Get-Command gcc | Format-List
    ninja.exe --version
    clang++.exe --version
    gcc.exe --version

    ninja.exe all
    cmd.exe /c "robocopy out out/artifact code-cmake-vcpkg.exe code-cmake-vcpkg.pdb build.log test.log /S /Z /NDL /XD artifact || echo %errorlevel%"
}

function DoBuild {
    mkdir out\artifact -ErrorAction Ignore | Out-Null
    DoBuildInt | Tee-Object out\build.log
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