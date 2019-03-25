# quick-debug-container

```
mkdir debug-container
cd debug-container/
vi Dockerfile

gcloud auth configure-docker

cat <<EOF > build.sh
#!/bin/bash
export APPLICATION=debug-container
PROJECT_ID=`gcloud config get-value project`
PREFIX=makz-labs

docker build -t $APPLICATION .
docker tag $APPLICATION gcr.io/$PROJECT_ID/$PREFIX/$APPLICATION
docker push gcr.io/$PROJECT_ID/$PREFIX/$APPLICATION
EOF

chmod +x build.sh

./build.sh
kubectl run my-shell --rm -i --tty --image   gcr.io/$PROJECT_ID/$PREFIX/$APPLICATION -- bash
```
  
