# Swagger Difference Web Site

It's simple but it works and has been handy

## Core Library

Uses the excellent `swagger-diff`

https://www.npmjs.com/package/swagger-diff

## How to run on IIS with IISNODE

### IIS NODE

Blog: https://tomasz.janczuk.org/2011/08/hosting-nodejs-applications-in-iis-on.html
GitHub: https://github.com/tjanczuk/iisnode

### Install 

* A modern windows server (2012+) with IIS
* URL Rewrite 2
* GIT for Windows
* NODEJS for Windows
* IISNODE

### Configure

1. Make an AppPool, sadly I could only get it to run correctly running as `LocalSystem`
2. Make a web site (I use an alternate port number)
- associate it to the AppPool you made 
- change the file system path to point to the root of the git folder you pulled
3. IISReset

### Use and enjoy

The site should come up on http://localhost:[port]

## Dockerization using Azure Container Service (in Swarm mode)

These examples are in BASH format, you may need to alias the azure command line ('az') to:

```bash
alias az="/C/Program\ Files\ \(x86\)/Microsoft\ SDKs/Azure/CLI2/wbin/az.cmd"
```

### Login to Azure

```bash
az login
az acs list --resource-group {ResourceGroup} --query '[*].{Master:masterProfile.fqdn,Agent:agentPoolProfiles[0].fqdn}' -o table
```

### SSH

If you used *PuTTYGen* to make a key, you must export your private key in open ssh format to use it in the command line argument

```bash
# make an ssh tunnel
ssh -L 2375:localhost:2375 -f -N {user}@{fdqn} -p 2200 -i {private-key}
# export port
export DOCKER_HOST=:2375
```

### Build

```docker build -t {yourname}/swaggercompareweb .```

### Run

```docker run -p 49160:8033 -d {yourname}/swaggercompareweb```

### What's your container id?

```docker ps```

### terminal into docker container

```winpty docker exec -it {container-id} bash```

### kill your container

```docker kill {container-id}```

### Tips

* Shutdown the master VM when not in use to save money.
