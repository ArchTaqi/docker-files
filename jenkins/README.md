# Jenkins

## up and running

```bash
$ cd ~/fig/jenkins
$ mkdir -p data
$ sudo chown 1000 data
$ docker-compose up -d
$ docker-compose exec jenkins bash
>>> cat ~/secrets/initialAdminPassword
******
>>> ssh-keygen
>>> cat ~/.ssh/id_rsa.pub
......
>>> exit
$ docker-compose exec --user root jenkins apk add -U git
$ firefox http://localhost:8080/
