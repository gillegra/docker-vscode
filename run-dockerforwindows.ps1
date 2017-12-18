# start VcXsrv if it is not started yet
$prog="$env:ProgramFiles\VcXsrv\vcxsrv.exe"
if (! (ps | ? {$_.path -eq $prog})) {& $prog -multiwindow -ac -logverbose 3}

# get the IP address used by Docker for Windows
$ip = Get-NetIPAddress `
    | where {$_.InterfaceAlias -like 'vEthernet (DockerNAT)*' -and $_.AddressFamily -eq 'IPv4'} `
    | select -ExpandProperty IPAddress

# start Visual Studo Code as the vscode user
$cmd="export DISPLAY=${ip}:0; code -w --recursive ."
docker run --rm -it `
    --security-opt seccomp=unconfined `
    -v /var/run/docker.sock:/var/run/docker.sock `
    docker-vscode-golang:test `
    su - vscode -c "$cmd"