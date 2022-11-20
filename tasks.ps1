# Task to be run during the build process
param(
    [Parameter(Mandatory = $True)]
    [ValidateSet('build', 'cbuild', 'clean', 'install' )]
    [string]$Cmd
)

function logEnv {
    Write-Output $env:Path.Split(';')

    Get-Command clang++ | Select-Object -ExpandProperty Path
    clang++.exe --version

    Get-Command cmake | Select-Object -ExpandProperty Path
    cmake --version

    Get-Command gcc | Select-Object -ExpandProperty Path
    gcc.exe --version

    Get-Command ninja | Select-Object -ExpandProperty Path
    ninja.exe --version
}

function DoBuildInt {
    $env:Path = "$env:MSVC_ROOT\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja;$env:Path"
    Write-Output 'Building'
    # logEnv
    ninja.exe -v all
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

function DoInstall {
    ninja.exe -v w64r
    Copy-Item .\out\x64-msvc-rel\app\code-cmake-vcpkg.exe $env:BIN_DIR
}

switch ($Cmd.ToLower()) {
    'build' { DoBuild }
    'cbuild' { DoCBuild }
    'clean' { DoClean }
    'install' { DoInstall }
}