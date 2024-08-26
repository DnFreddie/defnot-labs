
You might think that being nice to people has some advantages in the real world, but in the system, there’s no place for nice processes.
Follow these steps and become a Linux master!
<br>
<details>
<summary>Steps</summary>

**Create the Nice Guy Process**
First, we need a little explanation of what "being nice" in the system means.
Let's create a process that will be "nice." We’ll call it a nice guy.
It’s important that this process runs in a loop.
You can use your own script, but here’s an example of a CPU-intensive Fibonacci script that we’ll use:

```bash
echo -e '#!/bin/bash\nfibonacci() { if [ $1 -le 1 ]; then echo $1; else echo $(( $(fibonacci $(( $1 - 1 ))) + $(fibonacci $(( $1 - 2 ))) )); fi; }\nfor i in {35..45}; do for j in {1..4}; do fibonacci $i & done; done; wait' > nice_guy.sh
chmod +x nice_guy.sh
```{{exec}}

**Run the Process with a Nice Level**

Before we run it, we need to set a nice level. The nice level in a system varies from -20 to 19. It’s important to note that it’s upside down: the lower the nice level, the higher the priority of the process. A process with a priority of -19 will run over everything else. This might be somewhat dangerous, but we like it!

```bash
nice -n -19 ./nice_guy.sh &
```{{exec}}

### Observe the Effects

Now, try to run any command. You may notice that the system slows down. Kill the process before it’s too late!

```bash 
killall nice_guy.sh
```{{exec}}

Since we know that being "nice" doesn’t pay off that way, the `default value` is **zero**. But I think this process deserves a little less priority, so let’s call this process with a nice value of 20 and call it a day.
Click check after command execution 

```bash 
nice -n 19 ./nice_guy.sh &
```{{exec}}




</details>
