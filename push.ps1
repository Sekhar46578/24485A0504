# Add GitHub to known hosts if not already there
$knownHostsPath = "$env:USERPROFILE\.ssh\known_hosts"
$githubKey = "github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHStV41XyG7C0ZVc/2K/+AxjhIIvmWB+B5h2/F8/C1G4"

# Create .ssh directory if it doesn't exist
$sshDir = "$env:USERPROFILE\.ssh"
if (-not (Test-Path $sshDir)) {
    New-Item -ItemType Directory -Path $sshDir -Force | Out-Null
}

# Add GitHub key to known_hosts if not already there
if (-not (Test-Path $knownHostsPath) -or -not (Select-String -Path $knownHostsPath -Pattern "github.com" -ErrorAction SilentlyContinue)) {
    Add-Content -Path $knownHostsPath -Value $githubKey -Force
}

# Now push to GitHub
Push-Location d:\24485A0504
git push -u origin main
Pop-Location
