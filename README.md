## Flask Helloworld
This is a sample service for Giant Swarm which is used in the [Swarm Inception project](https://github.com/giantswarm/swarm-inception) as an example service.

### Prerequisites
At a minimum you will need the following to launch this guide's services:

* A Github [account](https://github.com).
* A Giant Swarm [account](https://giantswarm.io/request-invite/).
* A Docker Hub [account](https://hub.docker.com).

### Fork the Repo
You will need to fork the repo into your account to start. Navigate to the top of this page and click on the `Fork` button at the top right.

Select a target organization to fork the repository into:

![](https://raw.githubusercontent.com/giantswarm/swarm-flask-helloworld/master/assets/fork.png)

### Clone the Repo
Once you've forked the repo, you'll want to clone the repository. Here's an example of cloning the repo:

```
git clone https://github.com/<username>/swarm-flask-helloworld.git
```

You'll need to replace the `<username>` bit with your Github username.

Change into the directory before continuing:

```
$ cd swarm-flask-helloworld
```

### Build the Definition File
Next, you'll need to build the `swarm-api.json` file, which will be used by the Swarm Inception service to deploy or update this service automatically after a Docker build has been completed.

Ensure you are logged into Giant Swarm first:

```
$ swarm info
Swarm CLI version:   0.23.0
API endpoint:        https://api.giantswarm.io/v1
API status:          reachable
Logged in as user:   bant
Current environment: bant/dev
```

Next, trigger the build of the definition file:

```
$ make config
rm -f swarm-api.json swarm.json
##########################################################
Definition files written...
Check swarm-api.json into your repo before deployment...
##########################################################
```

### Commit the Definition File to Github
As the config build script mentioned, you'll need to check the new `swarm-api.json` file into Github:

```
$ git add .
$ git commit -m 'definition file'
[master 70ec94f] definition file
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git push
Counting objects: 5, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 305 bytes | 0 bytes/s, done.
Total 3 (delta 2), reused 0 (delta 0)
To https://github.com/bant/swarm-flask-helloworld.git
   1a441e1..70ec94f  master -> master
```

Once that is complete, you can head back over to the [Swarm Inception project](https://github.com/giantswarm/swarm-inception) and keep going!

**Note:** You may want to inspect the `swarm-api.json` file to confirm the image path is set to a `docker.io` registry image!

### Deploy
If you would like to deploy this project to Giant Swarm, you will need to edit the `Makefile` and update your Docker Hub username:

```
REGISTRY = docker.io
REGISTRY_USERNAME = <username>
```

**Note:** Keep in mind that you need to have the `REGISTRY` set to Docker Hub's `docker.io` to have it work properly with the Swarm Inception project.**

Once you've this information, you can do a deployment:

```
$ make deploy
```

You may access the sample application by using the following formatted URL (substituting your own Swarm username, of course):

```
http://sample-<username>.gigantic.io
```
