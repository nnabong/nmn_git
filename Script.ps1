####nmnabong 08/02/2022 - Sample Test Script
####nmnabong 08/03/2022 - Fixed Try Catch loop


####Running the actual code to match the contents of list.txt file with the contents of list_folder folder.
<#
Try {
$n_list = Get-Content "C:\Users\nnabong\Documents\list.txt"   

foreach ($n_items in $n_list) {
Get-ChildItem "C:\Users\nnabong\Documents\list_folder\$n_items.txt" -ErrorAction Stop
}

####If a mismatch is found, an error message will be logged in Error_log.txt file.
}
Catch [System.Management.Automation.ItemNotFoundException] {

Write-Output "$(get-date): $PSItem" >> "C:\Users\nnabong\Documents\Error_log.txt"
}
#>

#### Adding Parent Try Catch loop
$ErrorActionPreference = "Stop"
$ErrMsg = $Error[0].Exception
Try {

#### Fixed Try Catch loop
$n_list = Get-Content "C:\Users\nnabong\Documents\list.txt"

Echo "[Start] $(Get-Date): Begin Script...." | Out-File C:\Users\nnabong\Documents\Log.txt -Append

foreach ($n_items in $n_list) {



Try {

Get-ChildItem "C:\Users\nnabong\Documents\list_folder\$n_items.txt" -ErrorAction Stop

####Log action/result in Log.txt file.
Echo "[Progress] $(Get-Date): Checking list.txt and matching contents with files in list_folder.... - $n_items found" | `
Out-File C:\Users\nnabong\Documents\Log.txt -Append
}


####If a mismatch is found, an error message will be logged in Log.txt file.

Catch {
Echo "[Error] $(get-date): $n_items does not exist" | Out-File C:\Users\nnabong\Documents\Log.txt -Append
}

}

Echo "[End] $(Get-Date): Script-run completed...." | Out-File C:\Users\nnabong\Documents\Log.txt -Append

}

Catch {
Echo "[Error] $(Get-Date): Encountered Error below:" $ErrMsg | Out-File C:\Users\nnabong\Documents\Log.txt -Append

}

Exit