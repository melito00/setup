Function Get-LatestRelease {
	Param(
		[String]$Repo,
		[String]$Name
	)
	Write-Host $Repo
	Write-Host $Name
	$releasesUri = "https://api.github.com/repos/$Repo/releases/latest"
	Write-Host $releasesUri
	$asset = (Invoke-WebRequest $releasesUri | ConvertFrom-Json).assets | Where-Object name -like $Name*
	$downloadUri = $asset.browser_download_url
	Write-Host $downloadUri
	curl.exe --silent -LO $downloadUri
}

Get-LatestRelease -Repo 'yuru7/HackGen' -Name 'HackGen_NF'
