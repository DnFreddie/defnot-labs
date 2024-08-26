Often, we are asked to add something to the PATH variable for various programs.
However, this process can sometimes lead to confusion and unexpected behavior.

In this exercise, you will intentionally add a path incorrectly to see what happens.
Follow the steps below to experience the effects firsthand.
<br>
<details>
<summary>Steps</summary>


First, let's take a look at the PATH variable to see what we have.
The $PATH is an environmental variable that tells the shell where to look for executable files when you run a command.
When you type a command in the terminal, the shell searches through these directories in the order they are listed to find the corresponding executable file.
```
echo $PATH
```{{exec}}

There’s a better way to visualize it. You can see the colons (`:`) as separators between the directories. We can use `tr` (short for "translate") to display the contents more clearly:

```bash
echo $PATH | tr ':' '\n'
```{{exec}}

Now we can see where the system looks for applications. But we need to add one of our own! Let’s create a script that will display "Muhahahahah" every time we call it:

```bash
mkdir -p ~/scripts/
echo "echo Muhahahahah" > ~/scripts/funny.sh
chmod +x ~/scripts/funny.sh
```{{exec}}

Now, we can make our system "blind" for a second. You see, it will fall in love with this script so much that it won't see anything else:

```bash
export PATH=~/scripts
```{{exec}}

Now, try to run any command. I'm sure your Bash shell doesn't see anything other than `funny.sh`. So, how can we fix this?

Fortunately, the change we made to the PATH is only temporary.
To get back the original PATH settings, you can simply run the command exec bash -l.
This command starts a new Bash shell, which is a type of command line interface, as if you just logged in.

When it does this, it reads some important system files that set up your environment, including the PATH settings.
Running this command will refresh your settings and bring back the way things were before.

The usual PATH settings are stored in `/etc/profile`, but **do not change it directly** if you want to add more paths system-wide. Instead, it's much better to create a custom shell script in the `/etc/profile.d/` directory. This way, you can make your custom changes without modifying the main profile file directly.

To restore your PATH, run:
Or if it doesn't wrok just add new tab in ure terminal or restart it :)

```bash
exec /user/bin/bash -l 
```{{exec}}


Now we know everything about the PATH, so we can properly append to it. Here’s how to do it: 

We need to append to the end of the `.bashrc` file and then source it again. 

**Remember:** `>>` appends, while `>` overwrites and can cause trouble!

Click here to check the lab and see if you succeeded!


```bash
echo 'export PATH="$PATH:~/scripts/"' >> ~/.bashrc
source ~/.bashrc
```{{exec}}


</details>
