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
	
	gh repo clone "${org}/${templateRepos}-${login}"  >> "${templateRepos}-clone.log" 2>&1
	
done
