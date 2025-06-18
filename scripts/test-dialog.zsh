CHOICE=$(echo -e "0\n1\n2\n3\n4\n5\n6\n7\n8\n9" | fzf --prompt="Do you want to continue? " --height=3 --reverse --border)

if [[ "$CHOICE" == "Yes" ]]; then
    echo "User selected Yes."
elif [[ "$CHOICE" == "No" ]]; then
    echo "User selected No."
else
    echo "No choice made or fzf exited."
fi
