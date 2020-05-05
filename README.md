# Docker PHP environment
```
nginx + php-fpm + mysql-server
```
Project is simple [docker-compose](https://docs.docker.com/compose/) setup which serving PHP application over nginx server and additional MySQL database.

This is for **DEVELOPMENT** use only, please do not use it on **PRODUCTION** environments, thank you! :D

## Getting started

If you just follow the guidelines regarding installation and running you should be good to go! Copy over your PHP source files into `public_html` directory, and simply access them at [localhost:8080](http://localhost:8080) :)

### Prerequisites

* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)

### Installing

Firstly, open terminal in root folder of the project and run initial bash script for setting up the environment:

`./sh/Setup_Environment.sh`

In case if bash scripts are non-executable then please execute following command from root folder of the project:

`sudo find './sh' -maxdepth 1 -type f -name '*.sh' -exec chmod +x {} \;`

You can use following bash scripts to install pre-required software:
* `./sh/01_Install_Docker.sh`
* `./sh/02_Install_Docker_Compose.sh`

You can also install Composer and Symfony additionally:
* `./sh/03_Install_Composer.sh`
* `./sh/04_Install_Symfony.sh`

### Configuring

You can define variables for your project in `./docker/.env` file.

**TODO: List and describe all the available variables.**

### Building

In order to build containers use following bash script:

`./sh/Build_Docker.sh`

### Running

Use following bash script to run containers:

`./sh/Run_Docker.sh`

And use this bash script to stop them:

`./sh/Stop_Docker.sh`

### Purging

You can remove all docker containers (even not project related!) and volumes by executing this bash script:

`./sh/Purge_Docker.sh`

Above command will not remove database files. In order to do that you need to execute following bash script:

`./sh/Purge_Database.sh`

### Additional commands

1. Reload nginx by executing `./sh/Reload_Server.sh` bash script.
2. Load initial DB script by executing `./sh/Load_Database.sh` bash script.
3. Query database by executing `./sh/Query_Database.sh` bash script.

### Common code

There are 3 functions located in `./sh/Common_Code.sh` file:

**TODO: List and describe all the functions.**

## Deployment

There is no environment for the project, so there is no need for deployment :)

## Built with

* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)
* [nginx](https://hub.docker.com/_/nginx/)
* [PHP](https://hub.docker.com/_/php/)
* [MySQL](https://hub.docker.com/r/mysql/mysql-server/)

## Contributing

There are no contribution rules established.

## Versioning

No versioning is applied to the project.

## Authors

* **Bartlomiej Roszczypala** - [Gucu112](https://github.com/Gucu112)

See also the list of [contributors](https://github.com/gucu112/docker-nginx-php-mysql-stack/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

**v20.5.5.0**
* Move docker images versions to .env file
* Introduce docker images versioning
* Generating Dockerfiles based on templates
* Removing orphans during Docker purge
* README.md updated

**v20.4.23.0**
* Bash scripts improvements
* Docker configuration improvements
* Simplified pids and socket locations
* EditorConfig file added
* README.md updated

**v20.3.20.0**
* Initial commit
