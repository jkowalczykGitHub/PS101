clear-host
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted  -Verbose
$aChar =  @()
$aCharSet = @{}
$aTerms = @()
$aCatalog = @{}
$strRootPath = "Z:\Blogs"
$aCommonDelimeter = @(" ","_","-"," - ")

$oFiles = Get-ChildItem $strRootPath
$oFiles | ForEach-Object {
    ForEach ($strDelimeter in $aCommonDelimeter) {
        $aTerms += $_.BaseName.Split($strDelimeter)
        if (-not $aCatalog.ContainsKey($strDelimeter)) {$aCatalog.Add($strDelimeter, $aTerms)}
    }
    $aChar = $_.BaseName.ToCharArray()
    $aChar | ForEach-Object {
        if (-not $aCharSet.ContainsKey($_)) { 
            $aCharSet.Add($_, 1)
        } else {
            $aCharSet[$_] = $aCharSet[$_] + 1
        }
    }
    $aTerms = $null
}
$aCharSet.GetEnumerator() | Sort-Object Value -Descending
$aCatalog.GetEnumerator() | Sort-Object Key
write-host "values"
$aCatalog." - "
$aChar = $null
$aCharSet = $null
$aCatalog = $null