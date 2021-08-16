# pgcli-docker

## Requirements
- jq

## Build image

```
# extract latest pgcli version
PGCLI_VERSION=$(curl -s https://pypi.org/pypi/pgcli/json | jq .releases | jq 'keys' | jq -r .[-1])

# Build image
docker build -t leonseng/pgcli-docker:$PGCLI_VERSION --build-arg pgcli_version=$PGCLI_VERSION .

# Publish
docker push
```
