Write-Host "$($PWD)"
Write-Host "This is Prod1"

#$csvfile = import-csv amis/product/prod2/prod2.csv
$csvfile = import-csv "D:\a\nmn_git\nmn_git\AMIS\product\prod2\prod2.csv"

$csvfile
