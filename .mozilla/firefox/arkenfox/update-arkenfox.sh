cd arkenfox-upstream || exit
git pull origin master
echo "Updating arkenfox repo"
cd .. || exit
cp arkenfox-upstream/user.js user.js
echo "Arkenfox updated"
