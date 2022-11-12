# This script removes files from original git commits that have sensitive info in them.
# be 100% sure you know what you are doing before using this script.

# To use the script, list the filenames in the array $filestonukefromrepo. For files under the main directory, 2 backslashes are needed: "directory\\filename2.ps1"
# run this script from inside the repo, I just copy it and add the file names to the array, then copy-paste up to the git push step directly into the console.

#list filenames to remove in this array
$filestonukefromrepo = @(
    "filename1.ps1",
    "directory\\filename2.ps1"
)

# loops through array and removes the file from the repo and all commits where it appears in history.
foreach ($i in $filestonukefromrepo) {
    $gitstatement = "git rm -rf --cached --ignore-unmatch $i"
    git filter-branch --index-filter "$gitstatment" HEAD
    git commit -m "Removing a file from history with confidential info, will be re-added shortly"
    }

#forces the change to the remote repository source
#git push --force