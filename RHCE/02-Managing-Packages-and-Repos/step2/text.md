# Package Installation with Ansible

Great! Now that we've got our repositories all set up, we can finally install the tools we actually want to use. Plus, we need to get some packages ready for the tasks coming up later.

## What We're Doing

The exam wants us to install specific packages on different host groups. Here's the breakdown:

**For dev, test, and prod host groups:**
- nginx (web server)
- postgresql (database)
- e3 (emacs)

**For the dev host group only:**
- Development Tools package group (compilers, build tools, etc.)
- Update all packages to their latest versions

## The Smart Way  Using the Package Module

Here's a cool thing  you don't need to worry about whether you're on Ubuntu, RHEL, or whatever. Ansible has this `package` module that automatically figures out what package manager to use.

Let's check what it can do:
```bash
ansible-doc package
```

## Installing Packages on Multiple Host Groups

Since we're working with Ubuntu, we need to use the Ubuntu package names. Let's start by installing nginx and postgresql on our dev, test, and prod groups.

Here's how we target multiple host groups at once:

```yaml
---
- name: Install packages on dev, test, and prod
  hosts: dev:test:prod
  become: true

  tasks:
    - name: Install nginx and postgresql
      package:
        name:
          - nginx
          - postgresql
          - e3
        state: present
```

Notice how we're targeting multiple groups with `hosts: dev:test:prod`. You can separate host groups with colons, and Ansible will run the tasks on all hosts in those groups.

The `state: present` means "make sure these packages are installed." If they're already there, nothing happens. If they're missing, Ansible installs them.

## Working with the Development Group

Now we need to do some special stuff just for the development group. This is where things get a bit more interesting because we need to install a package group and update everything to the latest versions.

Add this to your playbook:

```yaml
---
- name: Configure development hosts
hosts: dev
become: true

tasks:
    - name: Install Development Tools package group
      package:
        name: build-essential
        state: present
```

Wait, what's `build-essential`? On Ubuntu, this is the equivalent of the "`@Development Tools`" group you'd find on RHEL systems. It includes gcc, make, and other essential build tools that developers need.

## Updating to Latest Versions

Here's where the `state` parameter gets really useful. Instead of just making sure packages are present, we can tell Ansible to update them to the latest available versions.

Add this task to the development section:

```yaml
    - name: Update all packages to latest versions
      package:
        name: "*"
        state: latest
```

The `state: latest` tells Ansible to not just install packages, but to make sure they're updated to the newest available version. The `name: "*"` means "do this for all packages on the system."

## Putting It All Together

Here's what your complete playbook should look like:

```yaml
---
# Install packages on dev, test, and prod groups
- name: Install packages on multiple environments
  hosts: dev:test:prod
  become: true

  tasks:
    - name: Install nginx postgresql and emacs
      package:
        name:
          - nginx
          - postgresql
          - e3
        state: present

# Special tasks for development group only
- name: Configure development environment
  hosts: dev
  become: true

  tasks:
    - name: Install Development Tools (build-essential)
      package:
        name: build-essential
        state: present

    - name: Update all packages to latest versions
      package:
        name: "*"
        state: latest
```
## Running Your Playbook

As always, test it first:
```bash
ansible-playbook -C package-install.yml
```

If everything looks good, run it for real:
```bash
ansible-playbook package-install.yml
```

## Checking Your Work

You can verify the installations worked and finish
```bash
ansible all -m shell -a "apt list | grep -E 'nginx|postgresql|gcc'"
```
