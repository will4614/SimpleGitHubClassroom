
org=$1
templateRepos=$2

# students.txt
# FirstName LastName,username


if [ ! -n "$2" ]
then
	echo "${0} org templateRepos < students.txt"
	exit -1
fi


while read line 
do
	name=${line%,*}
	login=${line#*,}

	echo ">${name}< | >${login}<"
	echo ">${org}< | >${templateRepos}<"
	
	gh repo create "${org}/${templateRepos}-${login}" --private --template="${org}/${templateRepos}"
	gh api --method PUT "/repos/${org}/${templateRepos}-${login}/collaborators/${login}" -f permission=push >> "${templateRepos}-create.log" 2>&1
done
