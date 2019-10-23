#$PackageUri = 'https://aka.ms/wsl-ubuntu-1804'
#$Package = 'CanonicalGroupLimited.Ubuntu18.04onWindows'
$Distro = 'Ubuntu-18.04'
$Executable = 'ubuntu1804'

$Username = 'cesar'

# Set WSL2 as the default
Write-Color -Text 'Setting ','WSL2 ','as the default version' -Color White,Blue,White -NoNewLine
wsl --set-default-version 2 | Out-Null
Write-Color -Text ' ✔️' -Color Green

# Install the distro from the Microsft Store if needed
#If (Get-AppxPackage -Name $Package) {} Else {
#    $TmpFile = "~/$Package.Appx"
#    $ProgressPreference = 'SilentlyContinue'
#    Invoke-WebRequest -Uri $PackageUri -OutFile $TmpFile -UseBasicParsing
#    Add-AppxPackage $TmpFile
#    Remove-Item $TmpFile
#}

Write-Color -Text 'Unregistering ',"$Distro" -Color White,Blue -NoNewLine
wsl --unregister $Distro | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Installing ',"$Distro" -Color White,Blue -NoNewLine
& $Executable install --root | Out-Null
Write-Color -Text ' ✔️' -Color Green

# TODO: https://devblogs.microsoft.com/commandline/whats-new-for-wsl-in-insiders-preview-build-18945/
Write-Color -Text 'Creating ','wsl.conf ','from default' -Color White,Blue,White -NoNewLine
$WslConf = (Get-Content .\wsl\wsl.conf) -Join '\\n'
& $Executable run "touch /etc/wsl.conf && echo -e $WslConf > /etc/wsl.conf" | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Restarting ',"$Distro" -Color White,Blue -NoNewLine
wsl --terminate $Distro | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Creating ','resolv.conf ','from default' -Color White,Blue,White -NoNewLine
$ResolvConf = (Get-Content .\wsl\resolv.conf) -Join '\\n'
& $Executable run "rm -f /etc/resolv.conf && touch /etc/resolv.conf && echo -e $ResolvConf > /etc/resolv.conf" | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Creating new user ',"$Username" -Color White,Blue -NoNewLine
& $Executable run -- adduser $Username --disabled-password --gecos "''" | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Adding ',"$Username ", 'to sudoers' -Color White,Blue,White -NoNewLine
& $Executable run "usermod -aG sudo $Username"
$SudoersLine = "$Username ALL=(ALL) NOPASSWD:ALL"
& $Executable run "cat /etc/sudoers | grep '$SudoersLine' || echo '$SudoersLine' | tee -a /etc/sudoers" | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Setting ',"$Username ",'as the default user' -Color White,Blue,White -NoNewLine
& $Executable config --default-user $Username | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Restarting ',"$Distro" -Color White,Blue -NoNewLine
wsl --terminate $Distro | Out-Null
Write-Color -Text ' ✔️' -Color Green
