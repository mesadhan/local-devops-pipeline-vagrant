# Local DevOps Pipeline Configurations


## 1. Up and running guideline to start pipeline

- `vagrant ssh` into machine
- cd to `home/vagrant/data-vagrant/jenkins-ci-cd-server`
- then `docker-compose up -d` Or
- If container `already started before` then just use `docker ps` to show that container Id. then start it
using `docker start <containerId>`

## 2. Open Jenkins Server

- http://localhost:7001


## 3. Jenkins CI/CD Server Post Configuration
Before post configuration read `data-vagrant/sample-jenkins-app/Jenkinsfile` properly.

1. Make Sure `jenkins-ci-cd-server` server is up and running properly,
2. Create Credential for `MaxisHub` and `DockerHub`
3. To `Maven` & `Docker` Tools setup follow below steps,

- `Home` -> `Manage Jenkins` -> `Global Tool Configuration`
- `Maven` section add [ Name: `myMaven`, version: `3.5.2` ]
- `Docker` section add [ Name: `myDocker`, Checked: `Install automatically`, Download from: docker.com: `latest` ]

Note: If you want to change `myMaven` and `myDocker` then makes sure `Jenkinsfile` also has the same label.

4. Now setup Docker Hub credential Go -> `Global credentials' -> `Manage Jenkins` ID=`dockerHubAccount`, and put username, and password



## 4. Create new job using `Multibrach Pipeline`, following

    1.From `General` -> `Branch Sources`

    - Project Repository: `git project Url`
    - Credentials: `put previous configuration credential`

    2.Build Configuration

    - Mode: `by Jenkinsfile`
    - Script Path: `Jenkinsfile`


Apply, Save Then

## 5. Build Now

- http://localhost:7001 from home page select that pipeline and click `Build Now`



## After Build Success, `sample-jenkins-app` pull and run from DockerHub
Please read `data-vagrant/sample-jenkins-app/Jenkinsfile` file properly.

- http://localhost:18090

## SonarQube Setup
If you like to enable sonarqube server then `data-vagrant/jenkins-devops-server/docker-compose.yml` uncomment and check it.
