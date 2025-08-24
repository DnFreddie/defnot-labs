# No Inventory, No Playbook

Here's the deal - you can't run Ansible playbooks without getting the basics right first. It's like trying to build a house without a foundation.

## Why This Order Matters

I've seen too many people jump straight into writing playbooks and then wonder why nothing works. Ansible needs two things before it can do anything:

1. **Config file** - tells Ansible where to find everything
2. **Inventory file** - tells Ansible which machines to talk to

Skip either one, and you'll be typing out long command arguments every time. During an exam? That's a recipe for disaster.

## What We're Covering

**Step 1: Set up your config file**
Do this once, do it right, never think about it again.

**Step 2: Build your inventory**
Define your servers and groups so your playbooks know where to run.

Let's start with that config file...
