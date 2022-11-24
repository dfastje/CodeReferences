FOLDER_NAME_BASE="Fullmetal-"
BASE_PATH="/media/smoky/ssd/ScriptTesting/Fullmetal Alchemist Brotherhood (2009)"
NEW_BASE_PATH="/media/smoky/ssd/ScriptTesting/Fullmetal Alchemist Brotherhood (2009)2"

mkdir "$NEW_BASE_PATH"

for foldername in "$BASE_PATH/Fullmetal"*; do

  season=${foldername:0-2}
  new_foldername="$FOLDER_NAME_BASE""S""$season"
  echo "Working on season $new_foldername"

  mkdir "$NEW_BASE_PATH/$new_foldername"

  for filename in "$foldername/"*.mkv; do
    episode=${filename:0-6} #strip path
    episode=${episode:0:2}  #strip file type

    new_filename="S""$season""E""$episode"
    echo "Working on episode $new_filename"
    new_filepath="$NEW_BASE_PATH/""$new_foldername/""$new_filename"".mkv"
    echo "Old path is $filename"
    echo "New path is $new_filepath"
    cp "$filename" "$new_filepath"
  done
done

