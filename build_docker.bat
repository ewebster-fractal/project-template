:: pull the code from git

SET image_name=%1
::SET expose_port=5000

:: build the docker file
:: https://medium.com/@chadlagore/conda-environments-with-docker-82cdc9d25754
docker build -t %image_name% -f dockerfile .
docker run -P -it %image_name%

