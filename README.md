# dev_image
A docker image build with packer contains Linux Development Tools
```
$make all DESTINATION_TAG="repository-path"
$docker run -it -v $(pwd)/:/home/ "repository-path":latest
```