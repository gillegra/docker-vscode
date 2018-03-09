# start VcXsrv if it is not started yet
$prog="$env:ProgramFiles\VcXsrv\vcxsrv.exe"
if (! (ps | ? {$_.path -eq $prog})) {& $prog -multiwindow -ac}

# get the IP address used by Docker for Windows
$dockerIP = Get-NetIPAddress `
    | where {$_.InterfaceAlias -like 'vEthernet (DockerNAT)??' -and $_.AddressFamily -eq 'IPv4'} `
    | select -ExpandProperty IPAddress

# start Visual Studo Code as the vscode user
$cmd = "export DISPLAY=${dockerIP}:0; code -w ."
$containerName = "docker-vscode-base"
$containerIsRunning = !([string]::IsNullOrEmpty("$(docker ps -aqf NAME=${containerName})"))
if ($containerIsRunning) {
    docker start $containerName
} Else {
    docker run -d --init --name $containerName `
        --security-opt seccomp=unconfined `
        gillegra/docker-vscode `
        "$cmd"
}