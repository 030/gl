# gl

* Create an API token and store it in `~/.gl/creds.yml` as `token: some-token`. Define the gitlab FQDN in `~/.gl/config.yml` as: `fqdn: some-fqdn`.
* Install [yq](https://github.com/mikefarah/yq).

## change default branch

```bash
./bash/defaultBranch.sh some-repository some-branch
```

## protect branches

```bash
./bash/protectedBranch.sh some-repository *-snapshot
```

## create a merge request

```bash
./bash/mergeRequest.sh some-repository some-source-branch some-target-branch some-ticket-number some-title some-assignee-id
```
