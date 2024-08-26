In our previous lessons, we learned about the sudo command and how processes work in Linux.
Now, I want to show you that you usually don't have to worry too much because Linux can be both free and resilient.

<details>
<summary>Steps</summary>

You might be somewhat familiar with the term **fork bomb**. A fork bomb is when processes spawn child processes indefinitely, consuming system memory. It sounds scary, but let's see how it works in practice.

#### Step 1: Create a User

First, create a user `user_gonna_use`.

```bash
useradd -s /usr/bin/bash user_gonna_use
```

#### Step 2: Understanding the Impact

Running a fork bomb in this environment can crash your system, but there’s a way to mitigate this. 

You can configure process limits for users by editing a specific file. Let’s take a look at it:

```bash
cat /etc/security/limits.conf
```

This file defines how many processes can be run by each user. By setting a limit, you can prevent any user from overwhelming the system.

#### Step 3: Set Process Limits

To set a limit for the user you just created, run the following command:

```bash
echo "user_gonna_use hard nproc 300" >> /etc/security/limits.conf
```

This command sets the maximum number of processes that the user can spawn to 300.

#### Step 4: Running the Fork Bomb

Now you can experiment with the fork bomb. Here’s the magic syntax:

Run this command and press `Ctrl + C` when you get bored or if the system starts to slow down.
```bash
:(){ :|: & };:
```
No click  check and move to the tool of the ultimate destruction 
</details>

