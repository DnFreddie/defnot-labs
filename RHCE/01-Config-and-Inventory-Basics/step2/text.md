# Setting Up Your Ansible Inventory

## Alright, What's Next?

So we've got our `ansible.cfg` sorted out, and now we need to actually create that inventory file we referenced. The inventory is basically where you tell Ansible "hey, these are the machines you need to talk to."

## What We're Building

Here's what the exam wants you to set up:

- `node01` goes in the `loadbalancers` group
- Both `node01` and `node02` are in `production`
- `node02` also goes in `development`
- `node01` is also in `testing`
- The whole `production` group is part of `webservers` too

Yeah, I know - one server can be in multiple groups. That's totally normal.

## Quick Format Decision

Here's the thing about inventory files - you can write them in three different formats: `INI`, `JSON`, or `YAML`.

`INI` is probably the easiest to start with since it looks like old-school config files, but honestly? Go with `YAML`. Trust me on this one. When you start adding variables and your inventory gets bigger, `YAML` is way easier to read and maintain.

You can always convert between formats if you need to:

```bash
ansible-inventory --list --yaml
ansible-inventory --list --json
ansible-inventory --list
```

## Pro Tip About Inventories

Just so you know - your inventory doesn't have to be a single file. It can be a whole directory with multiple inventory files and even dynamic inventory plugins. As you get more advanced in your career, you'll probably use dynamic inventories that pull server info from cloud providers or CMDBs. But for now, we're keeping it simple with a static file.

## The Built-in Groups

When you look at any inventory, you'll always see two special groups that Ansible creates automatically:

- `all` - contains literally every host in your inventory
- `ungrouped` - contains hosts that aren't in any custom groups

You don't create these - they just exist.

## Building the YAML Structure

In `YAML`, every group is basically a dictionary with a `hosts` section. If you want to put groups inside other groups, you use the `children` keyword instead.

Here's the basic pattern:

```yaml
production:
  hosts:
    node01:
    node02:
```

Pretty straightforward, right?

## Your Complete Inventory

Based on what we need, here's what your `~/ansible/inventory` file should look like:

```yaml
# Add this to ~/ansible/inventory
loadbalancers:
  hosts:
    node01:

production:
  hosts:
    node01:
    node02:

development:
  hosts:
    node02:

testing:
  hosts:
    node01:

webservers:
  children:
    production:
```

## What's Happening Here

- Each group lists its hosts under the `hosts:` section
- `webservers` uses `children:` instead of `hosts:` because it contains other groups, not individual servers
- Notice how `node01` and `node02` can appear in multiple groups - that's totally fine and actually pretty common

## Test It Out

Want to make sure everything looks right? Run this:

```bash
ansible-inventory --list
```

You should see all your groups with the right hosts in them, plus those automatic `all` and `ungrouped` groups.

That's it! Your inventory is ready to go.
