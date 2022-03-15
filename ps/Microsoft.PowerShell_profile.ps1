Import-Module posh-git
Import-Module oh-my-posh

oh-my-posh --init --shell pwsh --config $env:POSH_THEMES_PATH/m365princess.omp.json | Invoke-Expression
