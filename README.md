# Docker PHP environment
```
nginx + php-fpm + mysql-server
```
Project is simple [docker-compose](https://docs.docker.com/compose/) setup which serving PHP application over nginx server and additional MySQL database.

This is for **DEVELOPMENT** use only, please do not use it on **PRODUCTION** environments, thank you! :D

## Getting started

If you just follow the guidelines regarding installation and running you should be good to go! Copy over your PHP source files into `public` directory (by default, depends on configuration), and simply access them at [localhost:8080](http://localhost:8080) (default port, depends on configuration).

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
* `./sh/04_Install_MySQL.sh`
* `./sh/05_Install_Symfony.sh`
* `./sh/06_Install_Laravel.sh`

### Configuring

You can define variables for your project in `.env` file.

| Variable name                     | Default value                      | Description                                                            |
| --------------------------------- | ---------------------------------- | ---------------------------------------------------------------------- |
| **DOCKER_COMMAND**                | *docker*                           | Command to be executed when calling `docker`                           |
| **DOCKER_COMPOSE_COMMAND**        | *docker-compose*                   | Command to be executed when calling `docker-compose`                   |
| **APP_VERSION**                   | *{current_version}*                | Current version of application                                         |
| **NGINX_SERVER_CONTAINER_NAME**   | *nginx-server*                     | Docker image name for `nginx` container                                |
| **NGINX_SERVER_VERSION**          | *1.18.0-alpine*                    | Docker image version for `nginx` container                             |
| **NGINX_SERVER_PORT**             | *8080*                             | Docker public port for `nginx` container                               |
| **NGINX_SERVER_PUBLIC_DIRECTORY** | *public*                           | Docker public directory for `nginx` container                          |
| **PHP_FPM_CONTAINER_NAME**        | *php-fpm*                          | Docker image name for `php` container                                  |
| **PHP_FPM_VERSION**               | *7.4.5-fpm*                        | Docker image version for `php` container                               |
| **MYSQL_DATABASE_CONTAINER_NAME** | *mysql-database*                   | Docker image name for `mysql` container                                |
| **MYSQL_DATABASE_VERSION**        | *8.0.20-1.1.16-amd64*              | Docker image version for `mysql` container                             |
| **MYSQL_DATABASE_PORT**           | *3306*                             | Docker exposed port for `mysql` container                              |
| **MYSQL_DATABASE_ROOT_PASSWORD**  | *default*                          | MySQL root user password                                               |
| **MYSQL_DATABASE_INITIAL_SCRIPT** | *./docker/mysql/initialScript.sql* | Path to initial SQL script (absolute or relative to project directory) |
| --------------------------------- | ---------------------------------- | ---------------------------------------------------------------------- |

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

#### Functions

There are following main functions located in `./sh/Common_Code.sh` file:

* `getEnvironmentVariables()` function generates environment variables combining `.env` file and dynamic host user and group,
* `loadScript()` function loads single script from './sh' directory,
* `createFileFromTemplate()` function creates destination file based on template, replacing environment variables,
* `generateDockerfiles()` function generates Dockerfiles based on template provided in build context directory, replacing environment variables,
* `generateContainersConfiguration()` function generates containers configuration files based on template, replacing environment variables.

#### Wrappers

Other functions there are just wrappers for commands defined in `.env` file:

* `docker()` for `docker` command,
* `dockerCompose()` for `docker-compose` command.

#### Hooks

At the end there are also conditional hooks in order as follows:

1. Copy `.env` file (from `.env.example`) if not exists and grant read permission,
2. Make all bash script in `./sh` directory executable if some of them are not,
3. Load environment variables if no docker nor docker-compose commands specified.

## Deployment

There are no deployment procedure established yet.

**TODO: Create deployment procedure**

## Built with

* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)
* [nginx](https://hub.docker.com/_/nginx/)
* [PHP](https://hub.docker.com/_/php/)
* [MySQL](https://hub.docker.com/r/mysql/mysql-server/)

## Contributing

There are no contribution rules established yet.

**TODO: Create contribution rules**

## Versioning

Project versioning pattern is defined as follows:

```
v{yy}.{M}.{d}.{r}
```

**Legend:**

* {yy} - 2-digits year, range from 00 to 99
* {M} - month, range from 1 to 12
* {d} - day of the month, range from 1 to 31
* {r} - revison number, incrementing for each daily version, starting from 0

## Authors

* **Bartlomiej Roszczypala** - [Gucu112](https://github.com/Gucu112)

See also the list of [contributors](https://github.com/gucu112/docker-php-environment/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

**TODO**
* Create deployment procedure
  * Generally bash script for copying files over to another project
  * Simple guide how to deploy for some project (missing section)
* Add Apache server support
  * Split docker compose configs
  * Add switch variables
  * Create bash hook for docker composer command update
* Update PHP configuration
  * Split php.ini into several files (one main and per each module)
  * Analyze example php.ini (from inside container) and base config on them
  * Add own comments if needed
* Move sudo prefix to docker command environment variable
* Update README.md
  * 2 missing sections (deployment and contribution guide)
  * Rework "Common Code" section
  * Amendments after the last update

**v20.8.22.1**
* Fix typo in .gitignore file
* Update version

**v20.8.22.0**
* Generate containers main configuration
* Make MySQL port configurable
* Make public folder configurable
* Copy .env file if not exists
* Update MySQL and nginx configuration
* Extract additional hooks from bash functions
* Update MySQL container restart mode

**v20.8.17.1**
* Fix missing PHP container version
* README.md improvements
* Small changes to environment variables naming
* Add .dockerignore files
* Update version

**v20.8.17.0**
* Resolve host user and group dynamically
* Bash scripts improvements
* Update .editorconfig file
* Update version and changelog

**v20.5.22.0**
* Link containers configuration through directories
* Make port for nginx configurable
* Generate MySQL client passwords inside container
* Add container configuration testing
* Move .env file to root directory

**v20.5.5.1**
* Update contributors GitHub link
* Update version :D

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
