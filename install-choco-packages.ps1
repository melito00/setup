$packages = "packages-win.txt"

Write-Host $packages
Get-Content $packages | foreach-object {
  $data = $_ -split " "
  $exec_cmd = "cinst " + $data[0]
  Write-Host $exec_cmd
  # Invoke-Expression $exec_cmd
  if ($data[1] -eq "pin") {
    $exec_cmd = "choco pin add -n=" + $data[0]
    Write-Host $exec_cmd
    # Invoke-Expression $exec_cmd
  }
}
