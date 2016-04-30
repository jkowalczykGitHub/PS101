$i = 0
$x = 1


clear host
do {
    $y = $i + $x
    Write-Host $x " + " $i " = " $y
    $i += $x
    $x++
}
Until ($x -eq 101)
#Write-Host $x " + " $i " = " $y
Write-Host "x = " $x