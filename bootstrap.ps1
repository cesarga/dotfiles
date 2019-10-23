$Distro = 'Ubuntu-18.04'
$Executable = 'ubuntu1804'

if (-Not (Get-Module -ListAvailable -Name PSWriteColor)) {
    Install-Module -Name "PSWriteColor"
}

# Input username or use the default
If ([string]::IsNullOrEmpty(($Username = Read-Host "Input your WSL username [cesar]"))) {
    $Username = 'cesar'
}

# Set WSL2 as the default
Write-Color -Text 'Setting ','WSL2 ','as the default version' -Color White,Blue,White -NoNewLine
wsl --set-default-version 2 | Out-Null
Write-Color -Text ' ✔️' -Color Green


If (-Not [string]::IsNullOrEmpty(((wsl --list --all --verbose) -replace "`0", "" | Select-String -Pattern $Distro | Select-String -Pattern '\s+2'))) {
    Write-Color -Text 'Unregistering ',"$Distro" -Color White,Blue -NoNewLine
    wsl --unregister $Distro | Out-Null
    Write-Color -Text ' ✔️' -Color Green
}

Write-Color -Text 'Installing ',"$Distro" -Color White,Blue -NoNewLine
& $Executable install --root | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Creating ','wsl.conf ','from default' -Color White,Blue,White -NoNewLine
& $Executable run "curl -sfL https://raw.githubusercontent.com/cesarga/dotfiles/master/wsl/wsl.conf > /etc/wsl.conf" | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Restarting ',"$Distro" -Color White,Blue -NoNewLine
wsl --terminate $Distro | Out-Null
Write-Color -Text ' ✔️' -Color Green

#Write-Color -Text 'Creating ','resolv.conf ','from default' -Color White,Blue,White -NoNewLine
#& $Executable run "curl -sfL https://raw.githubusercontent.com/cesarga/dotfiles/master/wsl/resolv.conf >> /etc/resolv.conf" | Out-Null
#Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Creating new user ',"$Username" -Color White,Blue -NoNewLine
& $Executable run -- adduser $Username --disabled-password --gecos "''" | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Adding ',"$Username ", 'to sudoers' -Color White,Blue,White -NoNewLine
& $Executable run "usermod -aG sudo $Username"
$SudoersLine = "$Username ALL=(ALL) NOPASSWD:ALL"
& $Executable run "cat /etc/sudoers | grep '$SudoersLine' || echo '$SudoersLine' >> /etc/sudoers" | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Setting ',"$Username ",'as the default user' -Color White,Blue,White -NoNewLine
& $Executable config --default-user $Username | Out-Null
Write-Color -Text ' ✔️' -Color Green

Write-Color -Text 'Restarting ',"$Distro" -Color White,Blue -NoNewLine
wsl --terminate $Distro | Out-Null
Write-Color -Text ' ✔️' -Color Green

# TODO: https://devblogs.microsoft.com/commandline/whats-new-for-wsl-in-insiders-preview-build-18945/
# Copy-Item .\wsl\.wslconfig -Destination "$HOME"
