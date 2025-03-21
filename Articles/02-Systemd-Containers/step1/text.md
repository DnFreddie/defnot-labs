
<details>
<summary>Steps</summary>

Ok, first let's examine whether we have some images on the machine that we
can turn into systemd services.

```bash
$$ docker ps
```

Oh, actually, we have something! It's called **try-me**.

We don't know what it's doing.
Fortunately, the previous colleague left instructions on how to deploy them in a
**Docker Compose file**, so we don't have to worry too much.

Unfortunately, we are the **Red Hat team**, so we use **Podman** instead.
Maybe there will be something interesting.

Let's examine the **Docker Compose file**:

```bash
less docker-compose.yml
```
Ok, so we've got it—no need to worry. 
We need the service that

Requiers mounts /test
* It has to be run on port 8000
* it needs to be preseinatnt
* And i has to execute
* serve  to properly use the conaienr

Ok but how to acctualy do that we know that redhat enables us to do that
wihtout generating it based on this file but how to check
As i rembermer the quadlet was avaible at verison 4.4 > so mayb podman -V
Or even easier just type man quadlet
There u have the table of options at the end of the set



if u evere feel stuck therse an option for u to

</details>

