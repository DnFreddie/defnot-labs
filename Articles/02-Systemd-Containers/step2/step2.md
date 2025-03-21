## Linger

When bringing an old server node back to life, it's important to ensure it doesn't die again. Sometimes, you want to keep your services running after boot. To achieve this, you need to check if your user is configured with lingering.

You can get helpful information from `loginctl`, but first, let's check how we can confirm if lingering is enabled for your user.

### Check if Lingering is Enabled

To check if lingering is enabled, use the following command:

```bash
loginctl show-user <username>
```

Replace `<username>` with the name of the user you're interested in.

---

Now, let's switch to the user and test it:

### Switch to the User and Enable the Service

```bash
su $USER
```

After switching to the user, enable the service:

```bash
systemctl --user enable quadlet
```
### Why Can't You Control User Services?

Unfortunately, in systemd, you are usually unable to control the user's services *(even as root)* unless you are part of that user's session. However, there's a workaround for this!

While systemd typically restricts control over user services to the user’s session, you can still enable or control a user service **from the root account** by using the `-M` flag to specify the user’s session. Here’s how you can do it:

### Enable/Stop User Service with Root Privileges

```bash
sudo systemctl --user -M aura@ stop mkdocs
```

This command will stop the `mkdocs` service in the context of the `aura` user's session.


