[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <img src="https://www.nginx.com/wp-content/uploads/2020/05/NGINX-product-icon.svg" alt="Logo" height="60">

  <h3 align="center">nginx</h3>

  <p align="center">
    Docker setup for nginx
    <br />
    <br />
    ·
    <a href="https://github.com/beuluis/nginx/issues">Report Bug</a>
    ·
    <a href="https://github.com/beuluis/nginx/issues">Request Feature</a>
  </p>
</p>

<!-- ABOUT THE PROJECT -->
## About The Project

Small docker setup for nginx. Utilizes [jwilder/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy) and [nginx-proxy/docker-letsencrypt-nginx-proxy-companion](https://github.com/nginx-proxy/docker-letsencrypt-nginx-proxy-companion) to reload configurations and renew certificates.

<!-- GETTING STARTED -->
## Getting Started Develop

To get a local copy up and running follow these simple steps.

### Prerequisites

* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1. Clone the repo
```sh
git clone https://github.com/beuluis/nginx.git
```
2. Start docker-compose
```sh
docker-compose up --build
```
3. Navigate to `localtest.me`

### Customization

1. Create a `.env` file
```sh
touch .env
```
2. Overwrite variables as you like (format: `{variable name}={variable value}`)

| Variable | Description | Default value | Required |
| --- | --- | --- | --- |
| `DEFAULT_EMAIL` | Defines your default email for Let's Encrypt | none | true |
| `PROXY_NETWORK_NAME` | Defines your proxy network name | nginxproxynet | false |

## Getting Started Production

To get a copy up and running follow these simple steps.

### Prerequisites

* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1. Clone the repo
```sh
git clone https://github.com/beuluis/nginx.git --branch master --bare
```
2. Create a `.env.prod` file
```sh
touch .env.prod
```
3. Overwrite all variables marked under Customization as required
4. Start docker-compose
```sh
docker-compose --env-file ./.env.prod -f docker-compose.yml -f docker-compose.production.yml up -d
```

### Customization

1. Create a `.env.prod` file
```sh
touch .env.prod
```
2. Overwrite variables as you like (format: `{variable name}={variable value}`)

| Variable | Description | Default value | Required |
| --- | --- | --- | --- |
| `DEFAULT_EMAIL` | Defines your default email for Let's Encrypt | none | true |
| `PROXY_NETWORK_NAME` | Defines your proxy network name | nginxproxynet | false |

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- CONTACT -->
## Contact

Luis Beu - me@luisbeu.de


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/beuluis/nginx.svg?style=flat-square
[contributors-url]: https://github.com/beuluis/nginx/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/beuluis/nginx.svg?style=flat-square
[forks-url]: https://github.com/beuluis/nginx/network/members
[stars-shield]: https://img.shields.io/github/stars/beuluis/nginx.svg?style=flat-square
[stars-url]: https://github.com/beuluis/nginx/stargazers
[issues-shield]: https://img.shields.io/github/issues/beuluis/nginx.svg?style=flat-square
[issues-url]: https://github.com/beuluis/nginx/issues
[license-shield]: https://img.shields.io/github/license/beuluis/nginx.svg?style=flat-square
