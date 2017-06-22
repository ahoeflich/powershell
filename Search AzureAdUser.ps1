Connect-AzureAD
$name = read-host -Prompt "Input User to Search for:"

get-AzureADUser -SearchString $name

