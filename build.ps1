$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    if (Get-Command latexmk -ErrorAction SilentlyContinue) {
        & latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
        if ($LASTEXITCODE -ne 0) { throw 'LaTeX compilation failed.' }
    } else {
        for ($pass = 1; $pass -le 2; $pass++) {
            & xelatex -interaction=nonstopmode -halt-on-error main.tex
            if ($LASTEXITCODE -ne 0) { throw 'LaTeX compilation failed.' }
        }
    }
    Write-Host 'PDF created: main.pdf'
} finally {
    Pop-Location
}
