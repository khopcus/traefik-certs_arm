
# Traefik Certs

Minimal service to extract SSL certificates from traefik and create certificate files for use elsewhere.


## Quick Start

See the (examples) directory for example docker compose demonstrating config.

## Configuration

The environment variables are:

|Environment Variable|Default|Description|
|--------------------|-------|-----------|
|CERT_PATH|`/certs`|Path to directory where certs will be placed|
|ACME_PATH|` `|Path to acme.json created by traefik|

## Output

The program with watch acme.json for changes and generate certficates and certfiacte chains with the names `domain.crt` and `domain.chain.crt` repsectively.

## Modified

2019 khopcus [thomseddon/traefik-certs](https://github.com/thomseddon/traefik-certs)

