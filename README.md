# Start Jenkins

```
$ docker run -d --name jenkins \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v ${PWD}/jenkins_home:/var/jenkins_home \
 -p 8080:8080 \
 -p 50000:50000 \
 akikinyan/jenkins-dood
```
