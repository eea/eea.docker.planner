# eea.docker.planner

run the container with docker-compose:

create the data container planner_home (see below)
    git clone <reponame>
    
    docker-compose build 
    
    docker-compose up -d

run the container:

    docker run --restart=always --name planner -p <port_host>:21582 --volumes-from=planner_home -d eeacms/planner

current <port_host> = 50005

moving data volume containers from one host to another: 

<donor host>

    docker run --rm --volumes-from=planner_home -v $(pwd):/backup busybox tar cvfp /backup/planner_home.tar /var/local

<target host>

    docker run -d --name planner_home eeacms/var_local_data adduser -D planner

    docker run --rm --volumes-from=planner_home -v $(pwd):/backups busybox tar xvfp /backups/planner_home.tar
