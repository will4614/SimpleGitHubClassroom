
org=$1
templateRepos=$2

# teams.txt
# TeamName,username1,username2,...,usernameN

if [ ! -n "$2" ]
then
	echo "${0} org templateRepos < teams.txt"
	exit -1
fi


while IFS=',' read -ra line 
do
	echo ${line[0]}
	echo ">${org}< | >${templateRepos}<"

	gh repo create "${org}/${templateRepos}-${line[0]}" --private --template="${org}/${templateRepos}"
	
	for user in "${line[@]:1}"; do
		echo "user: $user"
		gh api --method PUT "/repos/${org}/${templateRepos}-${line[0]}/collaborators/${user}" -f permission=push >> "${templateRepos}-create.log" 2>&1
	done
done
