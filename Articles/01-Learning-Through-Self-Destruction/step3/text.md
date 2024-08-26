We use sudo all the time to escalate privileges to do anything. There was a meme a long time ago that said, "sudo make me a sandwich."

So, editing a configuration where this is stored might be crucial for your development. Let’s try that and see if we get caught red-handed.
<details>

<summary>Steps</summary>

## Can We Get Away with It?

Normally, the `sudo` command stores its information and configuration in the `/etc/sudoers` file. 
Since we in Linux are used to tinkering around, it’s important to note that the `sudoers` file is not something to be messed with lightly. 

But can we get away with it? Let’s try—after all, we only live once!

```bash
echo "Catch me if you can ;)" >> /etc/sudoers
```{{exec}}

Now, let’s see if this will be noticed.
We can use `visudo` to edit the file.
The `visudo` command checks the syntax of the `sudoers` file before saving it, which helps prevent configuration errors.

```bash
visudo
```{{exec}}

The `visudo` command will guide you on what to do, so be a good Linux admin and fix the issue.
You will need to delete the incorrect line. 

Now, for the fun part, replace it with this line:

```bash
echo "Defaults insults" >> /etc/sudoers
```{{exec}}

You might wonder what this does and who with the right mind would do such a thing.
Don’t worry; you will find out soon enough. 

Let’s create a user named `ok_boomer`. The `-s` option is used to specify a default shell:

```bash
useradd -s /usr/bin/bash ok_boomer
```{{exec}}

Now switch to the user `ok_boomer` with the following command:

```bash
su ok_boomer
```{{exec}}

Try entering any password with the `sudo` command:

```bash
sudo ls
```{{exec}}
As you can see, the `sudo` command has feelings and will check before moving to the next level.

No type `exit ` click  check to move to the next scenario

```bash
    exit 
```{{exec}}

</details>


