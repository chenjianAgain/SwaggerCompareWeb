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

