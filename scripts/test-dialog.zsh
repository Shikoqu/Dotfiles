CHOICE=$(echo -e "0\n1\n2\n3\n4\n5\n6\n7\n8\n9" | fzf --prompt="Do you want to continue? " --height=3 --reverse --border)

echo "You selected: $CHOICE"
