# ngs-docker

## Usage
Create  image:
```
docker build -t nuada/ngs .
```

Create container:
```
mkdir tmp
chmod 1777 tmp
docker run -it --name ngs \
	--volume=/data:/data \
	--volume=/rawdata:/rawdata \
	--volume=/resources:/resources \
	--volume=$(pwd)/tmp:/tmp \
	nuada/ngs
```

Add SSH key to container:
```
docker exec -i ngs bash -c 'cat > /home/<your_user_name>/.ssh/id_rsa' < ~/.ssh/id_rsa
```

Update/install GEMINI annotation data:
```
/usr/bin/update-gemini-data
```
