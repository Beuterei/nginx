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
    <a href="https://github.com/Beuterei/nginx/issues">Report Bug</a>
    ·
    <a href="https://github.com/Beuterei/nginx/issues">Request Feature</a>
  </p>
</p>

<!-- ABOUT THE PROJECT -->

## About The Project

Small docker setup for nginx. Utilizes [jwilder/nginx-proxy](https://github.com/nginx-proxy/nginx-proxy) and [nginx-proxy/docker-letsencrypt-nginx-proxy-companion](https://github.com/nginx-proxy/docker-letsencrypt-nginx-proxy-companion) to reload configurations and renew certificates.

<!-- GETTING STARTED -->

## Getting Started Develop

To get a local copy up and running follow these simple steps.

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1. Clone the repo

```sh
git clone https://github.com/Beuterei/nginx.git
```

2. Copy docker-compose example and edit it

```sh
cp docker-compose.override.example.yml docker-compose.override.yml && vim docker-compose.override.yml
```

3. Start docker-compose

```sh
docker-compose up --build
```

4. Navigate to `localtest.me`

### Customization

1. Create a `.env` file

```sh
touch .env
```

2. Overwrite variables as you like (format: `{variable name}={variable value}`)

| Variable             | Description                                  | Default value | Required |
| -------------------- | -------------------------------------------- | ------------- | -------- |
| `DEFAULT_EMAIL`      | Defines your default email for Let's Encrypt | none          | true     |
| `PROXY_NETWORK_NAME` | Defines your proxy network name              | nginxproxynet | false    |

## Getting Started Production

To get a copy up and running follow these simple steps.

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Installation

1. Clone the repo

```sh
git clone https://github.com/Beuterei/nginx.git --branch master
```

2. Create a `.env.production` file

```sh
touch .env.production
```

3. Overwrite all variables marked under Customization as required
4. Start docker-compose

```sh
docker-compose --env-file ./.env.production -f docker-compose.yml -f docker-compose.production.yml up -d
```

### Customization

1. Create a `.env.production` file

```sh
touch .env.production
```

2. Overwrite variables as you like (format: `{variable name}={variable value}`)

| Variable             | Description                                  | Default value | Required |
| -------------------- | -------------------------------------------- | ------------- | -------- |
| `DEFAULT_EMAIL`      | Defines your default email for Let's Encrypt | none          | true     |
| `PROXY_NETWORK_NAME` | Defines your proxy network name              | nginxproxynet | false    |
| `CF_Token`           | Cloudflare API Token (for DNS-01 challenge)  | none          | false    |
| `CF_Account_ID`      | Cloudflare Account ID (for DNS-01 challenge) | none          | false    |

### Wildcard Certificates & DNS Validation

To issue wildcard certificates (e.g., `*.yourdomain.com`) or secure local domains behind a NAT using DNS validation, you can provide DNS provider credentials.

1.  **Configure API Credentials**: Add the variables for your DNS provider to `.env.production`.

    - Example for Cloudflare:
      ```env
      CF_Token=your_token
      CF_Account_ID=your_account_id
      ```
    - _Note: The token requires `Zone:Zone:Read` and `Zone:DNS:Edit` permissions._

2.  **Request Wildcard Cert**: In your service configuration, request the wildcard domain and enable the DNS challenge.
    ```yaml
    environment:
      - VIRTUAL_HOST=sub.yourdomain.com
      - LETSENCRYPT_HOST=*.yourdomain.com
      - ACME_CHALLENGE=DNS-01
    ```

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/Beuterei/nginx.svg?style=flat-square
[contributors-url]: https://github.com/Beuterei/nginx/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Beuterei/nginx.svg?style=flat-square
[forks-url]: https://github.com/Beuterei/nginx/network/members
[stars-shield]: https://img.shields.io/github/stars/Beuterei/nginx.svg?style=flat-square
[stars-url]: https://github.com/Beuterei/nginx/stargazers
[issues-shield]: https://img.shields.io/github/issues/Beuterei/nginx.svg?style=flat-square
[issues-url]: https://github.com/Beuterei/nginx/issues
[license-shield]: https://img.shields.io/github/license/Beuterei/nginx.svg?style=flat-square
