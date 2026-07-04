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


	gh repo clone "${org}/${templateRepos}-${line[0]}"  >> "${templateRepos}-clone.log" 2>&1

done
