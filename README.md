# Docker nginx + php-fpm + mysql-server stack

Project shows simple docker-compose setup for serving PHP application with MySQL database.

## Getting started

If you simply follow the guidelines regarding installation and running and then copy over your PHP source files into `public_html` directory, you should be good to go to access them at [localhost](http://localhost:8080) :)

### Prerequisites

* Docker
* docker-compose

### Installing

Firstly, open terminal in root folder of the project and run initial bash script:

`./sh/00_Create_Directories.sh`

In case if bash scripts are non-executable then please copy over and execute command from this file:

`./sh/00_Set_Bin_Executable.sh`

You can use following bash scripts to install pre-required software:
* `./sh/01_Install_Docker.sh`
* `./sh/02_Install_Docker_Compose.sh`

You can also install Composer and Symfony additionally:
* `./sh/03_Install_Composer.sh`
* `./sh/04_Install_Symfony.sh`

### Building

In order to build containers use following bash script:

`./sh/Build_Docker.sh`

### Running

In order to run containers use following bash script:

`./sh/Run_Docker.sh`

### Additional commands

1. Reload nginx by executing `./sh/Reload_Server.sh` bash script.
2. Load initial DB script by executing `./sh/Load_Database.sh` bash script.
3. Query database by executing `./sh/Query_Database.sh` bash script.

## Deployment

There is no environment for the project, so there is no need for deployment :)

## Built with

* Docker
* docker-compose
* nginx
* PHP
* MySQL

## Contributing

There are no contribution rules established.

## Versioning

No versioning is applied to the project.

## Authors

* **Bartlomiej Roszczypala** - [Gucu112](https://github.com/Gucu112)

See also the list of [contributors](https://github.com/gucu112/docker-nginx-php-mysql-stack/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
