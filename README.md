# Docker PHP environment

```
nginx + php-fpm + mysql-server
```

Project is simple [docker-compose](https://docs.docker.com/compose/) setup which serving PHP application over nginx server and additional MySQL database.

This is for **DEVELOPMENT** use only, please do not use it on **PRODUCTION** environments, thank you! :D

## Getting started

If you just follow the guidelines regarding installation and running you should be good to go! Copy over your PHP source files into `public` directory (by default, depends on configuration), and simply access them at [localhost:8080](http://localhost:8080) (default port, depends on configuration).

### Prerequisites

- [Docker](https://www.docker.com/)
- [docker-compose](https://docs.docker.com/compose/)

### Installing

Firstly, open terminal in root folder of the project and run initial bash script for setting up the environment:

`./sh/Setup_Environment.sh`

In case if bash scripts are non-executable then please execute following command from root folder of the project:

`sudo find './sh' -maxdepth 1 -type f -name '*.sh' -exec chmod +x {} \;`

You can use following bash scripts to install pre-required software:

- `./sh/01_Install_Docker.sh`
- `./sh/02_Install_Docker_Compose.sh`

You can also install Composer and Symfony additionally:

- `./sh/03_Install_Composer.sh`
- `./sh/04_Install_MySQL.sh`
- `./sh/05_Install_Symfony.sh`
- `./sh/06_Install_Laravel.sh`

### Configuring

You can define variables for your project in `.env` file.

| Variable name                       | Default value                      | Description                                                                                                    |
| ----------------------------------- | ---------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| **DOCKER_TAG**                      | _latest_                           | Global docker tag that will be used when building docker images.                                               |
| **COMPOSE_PROJECT_NAME**            | _docker-php-environment_           | Compose CLI variable. See [here](https://docs.docker.com/compose/reference/envvars/#compose_project_name).     |
| **COMPOSE_FILE**                    | _./docker/docker-compose.yml_      | Compose CLI variable. See [here](https://docs.docker.com/compose/reference/envvars/#compose_file).             |
| **COMPOSE_HTTP_TIMEOUT**            | _15_                               | Compose CLI variable. See [here](https://docs.docker.com/compose/reference/envvars/#compose_http_timeout).     |
| **NGINX_SERVER_CONTAINER_SWITCH**   | _true_                             | Switch for `nginx` container; Defaults to disabled; Set either `1` or `true` to enable container.              |
| **NGINX_SERVER_CONTAINER_NAME**     | _nginx-server_                     | Image name for `nginx` container; Used in bash scripts and docker compose.                                     |
| **NGINX_SERVER_VERSION**            | _1.18.0-alpine_                    | Image tag for `nginx` container; See [tags](https://hub.docker.com/_/nginx?tab=tags).                          |
| **NGINX_SERVER_PORT**               | _8080_                             | Public port for `nginx` container; Used in docker compose; Replaced in configuration.                          |
| **NGINX_SERVER_PUBLIC_DIRECTORY**   | _public_                           | Public directory for `nginx` container; Replaced in configuration.                                             |
| **PHP_FPM_CONTAINER_SWITCH**        | _true_                             | Switch for `nginx` container; Defaults to disabled; Set either `1` or `true` to enable container.              |
| **PHP_FPM_CONTAINER_NAME**          | _php-fpm_                          | Image name for `php` container; Used in bash scripts and docker compose.                                       |
| **PHP_FPM_VERSION**                 | _7.4.5-fpm_                        | Image tag for `php` container; See [tags](https://hub.docker.com/_/php?tab=tags).                              |
| **MYSQL_DATABASE_CONTAINER_SWITCH** | _true_                             | Switch for `mysql` container; Defaults to disabled; Set either `1` or `true` to enable container.              |
| **MYSQL_DATABASE_CONTAINER_NAME**   | _mysql-database_                   | Image name for `mysql` container; Used in bash scripts and docker compose.                                     |
| **MYSQL_DATABASE_VERSION**          | _8.0.20-1.1.16-amd64_              | Image tag for `mysql` container; See [tags](https://hub.docker.com/_/mysql?tab=tags).                          |
| **MYSQL_DATABASE_PORT**             | _3306_                             | Exposed port for `mysql` container; Used in docker compose; Replaced in configuration.                         |
| **MYSQL_DATABASE_ROOT_PASSWORD**    | _default_                          | Root user password for `mysql` container; Set by `MYSQL_ROOT_PASSWORD` environment variable inside container.  |
| **MYSQL_DATABASE_INITIAL_SCRIPT**   | _./docker/mysql/initialScript.sql_ | Path to initial SQL script (absolute or relative to project directory) used when loading database.             |
| ---------------------------------   | ---------------------------------- | -------------------------------------------------------------------------------------------------------------- |

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

- `getEnvironmentVariables()` function generates environment variables combining `.env` file and dynamic host user and group,
- `loadScript()` function loads single script from './sh' directory,
- `createFileFromTemplate()` function creates destination file based on template, replacing environment variables,
- `generateDockerfiles()` function generates Dockerfiles based on template provided in build context directory, replacing environment variables,
- `generateContainersConfiguration()` function generates containers configuration files based on template, replacing environment variables,
- `getContainerEnvironmentPrefix()` function returns environment variables prefix for provided docker build context directory name.

#### Wrappers

Other functions there are just wrappers for commands defined in `.env` file:

- `docker()` for `docker` command,
- `dockerCompose()` for `docker-compose` command.

#### Hooks

At the end there are also conditional hooks in order as follows:

1. Copy `.env` file (from `.env.example`) if not exists and grant read permission,
2. Make all bash script in `./sh` directory executable if some of them are not,
3. Load environment variables if there is no `COMPOSE_PROJECT_NAME` environment variable,
4. Update `COMPOSE_FILE` environment variable to include docker configurations for enabled containers.

## Deployment

There are no deployment procedure established yet.

**TODO: Create deployment procedure**

## Built with

- [Docker](https://www.docker.com/)
- [docker-compose](https://docs.docker.com/compose/)
- [nginx](https://hub.docker.com/_/nginx/)
- [PHP](https://hub.docker.com/_/php/)
- [MySQL](https://hub.docker.com/r/mysql/mysql-server/)

## Contributing

There are no contribution rules established yet.

**TODO: Create contribution rules**

## Versioning

Project versioning pattern is defined as follows:

```
v{yy}.{M}.{d}.{r}
```

**Legend:**

- {yy} - 2-digits year, range from 00 to 99
- {M} - month, range from 1 to 12
- {d} - day of the month, range from 1 to 31
- {r} - revison number, incrementing for each daily version, starting from 0

## Authors

- **Bartlomiej Roszczypala** - [Gucu112](https://github.com/Gucu112)

See also the list of [contributors](https://github.com/gucu112/docker-php-environment/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

**TODO**

- Add Apache server support
- Update PHP configuration
  - Split php.ini into several files (one main and per each module)
  - Analyze example php.ini (from inside container) and base config on them
  - Add own comments if needed
- Update README.md
  - Create deployment guide (simple guide how to deploy)
  - Create contribution rules (set of rules to follow when contributing)

**v20.8.24.0**

- Split docker compose configuration
- Update environment variables (add switches)
- Load multiple configuration files on startup
- Move sudo and docker command to wrappers
- Colored output for error messages
- Formatting changes

**v20.8.23.0**

- Create deployment script
- Apply different IDs for MySQL directories which depends on operating system
- Small nginx configuration update
- Update version and changelog

**v20.8.22.1**

- Fix typo in .gitignore file
- Update version

**v20.8.22.0**

- Generate containers main configuration
- Make MySQL port configurable
- Make public folder configurable
- Copy .env file if not exists
- Update MySQL and nginx configuration
- Extract additional hooks from bash functions
- Update MySQL container restart mode

**v20.8.17.1**

- Fix missing PHP container version
- README.md improvements
- Small changes to environment variables naming
- Add .dockerignore files
- Update version

**v20.8.17.0**

- Resolve host user and group dynamically
- Bash scripts improvements
- Update .editorconfig file
- Update version and changelog

**v20.5.22.0**

- Link containers configuration through directories
- Make port for nginx configurable
- Generate MySQL client passwords inside container
- Add container configuration testing
- Move .env file to root directory

**v20.5.5.1**

- Update contributors GitHub link
- Update version :D

**v20.5.5.0**

- Move docker images versions to .env file
- Introduce docker images versioning
- Generating Dockerfiles based on templates
- Removing orphans during Docker purge
- README.md updated

**v20.4.23.0**

- Bash scripts improvements
- Docker configuration improvements
- Simplified pids and socket locations
- EditorConfig file added
- README.md updated

**v20.3.20.0**

- Initial commit
