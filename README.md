# actions-gitversion
Provides a GitHub action for running GitVersion

# Local testing
Build the container
```
docker build -t entrypoint .
```
Run the container
```
docker run --rm -v [PATH]:/github/workspace entrypoint
```