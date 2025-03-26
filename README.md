# aiml_back

git subtree for aiml-backend

먼저 .env.example 보고 .env 에 반영
docker, docker-compose 설치

### docker-compose

```bash
# docker-compose.yml 있는 디렉토리에서

# docker build + run 실행
docker-compose up --build

# 빌드만 할 시
docker-compose build

# 실행만
docker-compose up

# 실행 멈추기 ctrl-c

# 백그라운드 실행
docker-compose up -d

# 백그라운드 실행 멈추려면
docker-compose down
```


### docker

```bash
# for test
# 이건 디렉토리 위치랑 상관없음, 어디서든

# 실행중인 컨테이너 확인
docker ps

# 모든 컨테이너 확인
docker ps -a

# 실행중인 컨테이너 내부 진입, 컨테이너 이름은 docker ps 로 확인
# container id or name
docker exec -it ${CONTAINER_NAME} /bin/bash

# 실행중인 컨테이너에서 나오고 싶으면
exit
```


### DB

컨테이너 내에서 생성하는 volume은 로컬 도커의 디렉에 볼륨을 만들어 줌

기존의 도커에서 생성한 볼륨 있으면 알아서 기존 volume 사용

volume 삭제하거나 없으면, 알아서 새로 만들어 줌

```bash
# db test

# volume 확인
docker volume ls

# volume 삭제
docker volume rm ${VOLUME NAME}

# 강제 삭제
docker volume rm -f ${VOLUME NAME}

# db container 진입
# container id or name
docker exec -it ${DB_CONTAINER_NAME} /bin/bash

# db 컨테이너 진입 후 mysql 확인하고 싶을 시
# 기존 로컬에서랑 동일
mysql ${DB_NAME} --password=${DB_PASSWORD}

# mysql 진입 후 테이블 생성 확인
SHOW TABLES

# 데이터 확인
SELECT * FROM ${TABLE_NAME}
```
