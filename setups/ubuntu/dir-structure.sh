declare -a arr=("dev" "Documents" "Movies & Shows" "Graphism" "Books" "Windows" "Music" "Photos" "photos_autres" "downloads")
for i in "${arr[@]}"
do
    mkdir -p ~/"$i"
done