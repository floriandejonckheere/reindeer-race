# Reindeer race

![Continuous Integration](https://github.com/floriandejonckheere/reindeer-race/workflows/Continuous%20Integration/badge.svg)
![Continuous Deployment](https://github.com/floriandejonckheere/reindeer-race/workflows/Continuous%20Deployment/badge.svg)

![Release](https://img.shields.io/github/v/release/floriandejonckheere/reindeer-race?label=Latest%20release)
![Deployment](https://img.shields.io/github/deployments/floriandejonckheere/reindeer-race/production?label=Deployment)

Reindeer race

## Setup

First, ensure you have a working Docker environment.

Pull the images and start the containers:

```
docker-compose up -d
```

Set up the PostgreSQL database:

```
docker-compose exec app rails db:setup
```

The application should now be available at [http://localhost:3000](http://localhost:3000).

## Testing

Run the test suite:

```
docker-compose exec app rspec
```

## Secrets

### Repository secrets

Github secrets for release:

- `DOCKER_TOKEN` (needed for [Github Container Registry](https://docs.github.com/en/packages/getting-started-with-github-container-registry/migrating-to-github-container-registry-for-docker-images))

## Releasing

Update the changelog and bump the version in `lib/reindeer/version.rb`.
Create a tag for the version and push it to Github.
A Docker image will automatically be built and pushed to the registry.

```sh
nano lib/reindeer/version.rb
git add lib/reindeer/version.rb
git commit -m "Bump version to v1.0.0"
git tag v1.0.0
git push origin master
git push origin v1.0.0
```
