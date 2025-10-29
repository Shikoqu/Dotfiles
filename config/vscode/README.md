# VS-Code Settings

This project exists because vscode settings for profiles are trash!  
I hope to solve that (_for my use-case_) with this.

---

## Problem 1:

I hate **JSON**.

That's why I will write it in **[TOML]** (and then parse to JSON).

---

## Problem 2:

Actually bigger and more annoying one...

When setting up profiles there is no way to share some settings among them.
Like there actually is a way to share a extension between one, few or all profiles but for some reason there is no way to share configs for those extensions...

So the my solution is to write a program that can read few config files and merge them into one.
I can't be bothered to write extensive app to actually sync settings in real time and I actually want this to just be done and work... for my use-case.

> there is a open issue about this one - [#15909](https://github.com/microsoft/vscode/issues/15909)

---

## Problem 3:

I hate that vscode settings are buried deep in it's files and there is no way to change their location.
I just want a neat way to store settings in my [dotfiles repo](https://github.com/Shikoqu/Dotfiles).

> about this one too - [#3884](https://github.com/microsoft/vscode/issues/3884)
