# idm-docker

## Alguns comandos uteis:

Build da Imagem:

`docker build -t idm/idm-docker .`

Run:

`docker run --name idm-docker -p 8081:8080 idm/idm-docker:latest`

Listando a imagem:

`docker images | grep idm-docker`

Acesso:

http://localhost:8080/hello

Ver quais módulos são necessários para a aplicação (Windows 10):

`'C:\Program Files\Java\jdk-11.0.7\bin\jdeps.exe' -cp 'C:\Users\erick.budal\Downloads\image-demo\BOOT-INF\lib\*' --multi-release 11 -R -s target/image-demo.jar`
