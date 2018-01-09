@REM Push to PCF
cf push swaggercompareweb -b https://github.com/cloudfoundry/nodejs-buildpack -c "node app.js"