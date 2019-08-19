# Mongo DB

## up and running

```bash
$ pwgen -1 8 2
pah4Xa0o
Aedahwa7

$ cd ~/fig/mongo/

$ docker-compose up -d

$ docker exec -it mongo bash
/# mongo
> use admin
> db.createUser({user: 'root', pwd: 'pah4Xa0o', roles: [{role: 'userAdminAnyDatabase', db: 'admin'}]})
> db.auth('root', 'pah4Xa0o')
> db.runCommand({usersInfo: 1})
> exit
/# exit

$ docker cp mongo:/usr/bin/mongo /usr/local/bin/

$ mongo mongodb://root:pah4Xa0o@localhost:27017/admin
> use mydb
> db.createUser({user: 'myuser', pwd: 'Aedahwa7', roles: [{role: 'readWrite', db: 'mydb'}]})
> exit

$ mongo mongodb://myuser:Aedahwa7@localhost:27017/mydb
> show collections
> exit
```
