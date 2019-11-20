# roryprimrose/rungitversion
Provides a GitHub action for running GitVersion

```
    - name: GitVersion
      id: gitversion
      uses: roryprimrose/rungitversion
      with:
        nocache: true
        nofetch: true
```

# Local testing
Build the container
```
docker build -t rungitversion .
```
Run the container
```
docker run --rm -v [PATH]:/github/workspace rungitversion
```