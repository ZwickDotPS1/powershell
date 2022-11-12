# put the search term in between the wildcards
$servicename = "SEARCHTERM"

get-service | Where Name -like *servicename* | Format-List