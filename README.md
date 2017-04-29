## Docker commands

### Install
```
./install.sh
```

### Clean images and volumes
```
./clean.sh
```

### See running dockers
```
docker ps
```

## Pumgrana project

### Build
run `make docker` in following repositories:  
 - git@github.com:Pumgrana/pum-api.git  
 - git@github.com:Pumgrana/dashboard.git  
  
and in following directories:  
 - elasticsearch  
 - postgres  
 - proxy  

### Launch
inside pumgrana directory  
```
docker-compose up -d
```  
web app will be availabled on http://localhost:3000

### Logs
inside pumgrana directory  
```
docker-compose logs -f
```  

### Stop
inside pumgrana directory  
```
docker-compose stop
```  
Will stop all the docker, but not removed logs

### Remove
inside pumgrana directory  
```
docker-compose rm
```  
Will remove all logs

### Stop and Remove
inside pumgrana directory  
```
docker-compose down
```  
Will stop and remove all logs
