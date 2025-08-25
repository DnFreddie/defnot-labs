# Setting Up Ubuntu Repositories with Ansible
Alright, so here's the situation  Killer Coda doesn't give us Rocky or RHEL images to work with, which is a bit annoying. But hey, we're dealing with Ubuntu, and honestly that's fine. In the real world, you need to be ready to jump between different systems anyway.

## What We're Doing

So the exam wants us to configure two specific repositories on our Ubuntu hosts. Let me break down exactly what they're looking for:

**First up - the HashiCorp Repository:**

- Name it HASHICORP
- Description should be "HashiCorp Terraform repo"
- The repo URL: `deb [arch=amd64] https://apt.releases.hashicorp.com noble main`
- GPG key comes from: `https://apt.releases.hashicorp.com/gpg`

**Second - the Docker Repository:**

- Name this one DOCKER_REPO
- Description is just "Docker Repo"
- Repo URL: `deb [arch=amd64] https://download.docker.com/linux/ubuntu noble stable`
- GPG key is at: `https://download.docker.com/linux/ubuntu/gpg`

Both need to be enabled and have GPG signature checking turned on.

## Understanding the Tools We'll Use

Before we jump into writing the playbook, let's figure out what Ansible modules we need. Since we're on Ubuntu, we're dealing with the APT package manager.

Check what Ansible has to offer:

```bash
ansible-doc apt_key
ansible-doc apt_repository
```

The `apt_key` module is going to be our best friend here. What this module does is handle all the messy GPG key stuff for us. Instead of writing shell commands with `curl` and `gpg --dearmor`, we just tell it the URL and it handles everything automatically.

The basic pattern looks like this:

```yaml
- name: Add some GPG key
  apt_key:
    url: https://example.com/some-key.gpg
    state: present
```

Pretty straightforward, right? The module downloads the key, processes it, and adds it to the system's keyring. No fuss, no temporary files to clean up.

## Building Our Playbook - Step by Step

Now let's start building this thing. I'm going to show you how to add each repository one at a time, so you can see how it all fits together.

Let's start with the HashiCorp repository. Create a new playbook file:

```yaml
---
- name: Configure Ubuntu Repositories
  hosts: all
  become: true

  tasks:
    # First, we need to add HashiCorp's GPG key
    - name: Add HashiCorp GPG key
      apt_key:
        url: https://apt.releases.hashicorp.com/gpg
        state: present
```

What's happening here? We're telling Ansible to download HashiCorp's GPG key from their official URL and add it to the system. The `state: present` means "make sure this key exists on the system."

Next, we add the actual repository:

```yaml
# Now add the HashiCorp repository itself
- name: Add HashiCorp repository
  apt_repository:
    repo: "deb [arch=amd64] https://apt.releases.hashicorp.com noble main"
    state: present
    filename: hashicorp
```

The `apt_repository` module creates a new repository file in `/etc/apt/sources.list.d/`. The `filename: hashicorp` parameter means it'll create a file called `hashicorp.list` instead of some auto-generated name.

## Adding the Docker Repository

Now that we've got HashiCorp sorted, let's add Docker. The process is basically identical we add the GPG key first, then the repository.

Add these tasks to your playbook:

```yaml
# Time for Docker  GPG key first
- name: Add Docker GPG key
  apt_key:
    url: https://download.docker.com/linux/ubuntu/gpg
    state: present

# Then the Docker repository
- name: Add Docker repository
  apt_repository:
    repo: "deb [arch=amd64] https://download.docker.com/linux/ubuntu noble stable"
    state: present
    filename: docker
```

Same pattern here download Docker's GPG key, then add their repository with a clean filename.

## Finishing Up

There's one more thing we need to do. After adding new repositories, we should update the package cache so APT knows about all the new packages available.

Add this final task:

```yaml
# Update the package cache with our new repositories
- name: Update apt cache
  apt:
    update_cache: true
```

This runs `apt update` behind the scenes, which refreshes the package list with all the new stuff from HashiCorp and Docker.

## Testing and Running

Before you run this thing for real, always test it first:

```bash
ansible-playbook -C setup-repos.yml
```

That `-C` flag runs it in check mode shows you what would happen without actually changing anything. If everything looks good, run it for real:

```bash
ansible-playbook setup-repos.yml
```

## Making Sure It Worked

Once it's done, you can verify everything worked and move on to the next task ;)

```bash
# Test if packages from the new repos are available
ansible all -m shell -a "cat /etc/apt/sources.list.d/hashicorp.list"
ansible all -m shell -a "cat /etc/apt/sources.list.d/docker.list"
```
