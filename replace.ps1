$old = Read-Host "Введите старое слово: "

$new = Read-Host "Введите новое слово: "

$current_directory = Get-Location

$files = Get-ChildItem "$current_directory" -Filter *.txt

foreach ($file in $files) {
    if (Get-Content $file | Select-String -Pattern $old -Quiet) {
        $file | Set-Content -Value ((Get-Content $file) -replace $old, $new)
        Add-Content -Path sp.txt -Value $file.FullName
    }
}

Write-Host "sp.txt"