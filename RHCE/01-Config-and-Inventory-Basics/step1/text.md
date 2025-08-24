# Setting Up Ansible Config for RHCE

Look, the first thing you absolutely need to nail for the RHCE exam is getting your Ansible config file right. Trust me on this one - if you don't do this step properly, you'll be typing `--inventory` and `--roles-path` over and over again during the exam, and that's just going to eat up your time.

## What You Need to Set Up

Here's what the exam expects you to have configured:

- Config file goes here: `~/ansible/ansible.cfg`
- Your inventory file: `~/ansible/inventory`
- Where your roles live: `~/ansible/roles`

Pretty straightforward, right?

## How to Actually Do It

### The Old Way (Don't Do This)

Most people used to just copy someone else's `ansible.cfg` file or hunt around on the Ansible docs website. Yeah, that works fine when you're at your day job, but during the exam? You don't have time to be googling around or trying to remember what someone else's config looked like.

### The Smart Way

Here's the thing - Ansible actually has a command for this exact situation. It's called `ansible-config` and honestly, it's a lifesaver.

Want to see what it can do?

```bash
ansible-config --help
```

### Actually Generating the File

This is the command you want:

```bash
ansible-config init --disabled > ~/ansible.cfg
```

What's with the `--disabled` flag? Well, if you don't use it, Ansible will enable ALL the default settings, which is probably not what you want. With `--disabled`, everything gets commented out so you can pick and choose what you actually need.

### Adding the Stuff You Actually Care About

Now you've got this massive config file with everything commented out. Don't panic - you only need to uncomment and set two things. Find the `[defaults]` section and add these lines:

```ini
[defaults]
inventory=~/ansible/inventory
roles_path=~/ansible/roles
```

That's it. Really.

### Making Sure It Worked

Want to double-check you didn't mess anything up? Run this:

```bash
ansible-config validate
ansible-config dump --changed
```

This shows you only the settings that are different from Ansible's built-in defaults. If you see your `inventory` and `roles_path` settings there, you're golden.

Ok now we only has to create the actual files and the directories

```bash
mkdir -p ~/ansible/roles
touch ~/ansible/inventory
```

## You're Done!

That's literally all there is to it. Your Ansible setup is ready to go, and you won't be wasting precious exam time typing out long command-line arguments.
