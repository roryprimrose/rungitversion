[![Actions Status](https://github.com/roryprimrose/rungitversion/workflows/CI/badge.svg)](https://github.com/roryprimrose/rungitversion/actions)

# roryprimrose/rungitversion

This action runs GitVersion against your repository in the `$GITHUB_WORKSPACE`. All supported GitVersion values are returned as action output values.

# Usage

See [action.yml](action.yml)

## Dependency
There are two step dependencies that are required in your workflow before running this action. You must checkout your Git repository and then fetch the master branch and tags.

```yaml
steps:
- name: Checkout
  uses: actions/checkout@v1

- name: Fetch tags for GitVersion
  run: git fetch --tags

- name: Fetch master for GitVersion
  if: github.ref != 'refs/heads/master'
  run: git branch --create-reflog master origin/master
```

Basic:

```yaml
steps:
- name: Checkout
  uses: actions/checkout@v1

- name: Fetch tags for GitVersion
  run: git fetch --tags

- name: Fetch master for GitVersion
  if: github.ref != 'refs/heads/master'
  run: git branch --create-reflog master origin/master

- name: GitVersion
  id: gitversion  # step id used as reference for output values
  uses: roryprimrose/rungitversion@v1.0.0
  
- name: Output version values 
  run: |
    echo "Major: ${{ steps.gitversion.outputs.Major }}"
    echo "Minor: ${{ steps.gitversion.outputs.Minor }}"
    echo "Patch: ${{ steps.gitversion.outputs.Patch }}"
    echo "PreReleaseTag: ${{ steps.gitversion.outputs.PreReleaseTag }}"
    echo "PreReleaseTagWithDash: ${{ steps.gitversion.outputs.PreReleaseTagWithDash }}"
    echo "PreReleaseLabel: ${{ steps.gitversion.outputs.PreReleaseLabel }}"
    echo "PreReleaseNumber: ${{ steps.gitversion.outputs.PreReleaseNumber }}"
    echo "WeightedPreReleaseNumber: ${{ steps.gitversion.outputs.WeightedPreReleaseNumber }}"
    echo "BuildMetaData: ${{ steps.gitversion.outputs.BuildMetaData }}"
    echo "BuildMetaDataPadded: ${{ steps.gitversion.outputs.BuildMetaDataPadded }}"
    echo "FullBuildMetaData: ${{ steps.gitversion.outputs.FullBuildMetaData }}"
    echo "MajorMinorPatch: ${{ steps.gitversion.outputs.MajorMinorPatch }}"
    echo "SemVer: ${{ steps.gitversion.outputs.SemVer }}"
    echo "LegacySemVer: ${{ steps.gitversion.outputs.LegacySemVer }}"
    echo "LegacySemVerPadded: ${{ steps.gitversion.outputs.LegacySemVerPadded }}"
    echo "AssemblySemVer: ${{ steps.gitversion.outputs.AssemblySemVer }}"
    echo "AssemblySemFileVer: ${{ steps.gitversion.outputs.AssemblySemFileVer }}"
    echo "FullSemVer: ${{ steps.gitversion.outputs.FullSemVer }}"
    echo "InformationalVersion: ${{ steps.gitversion.outputs.InformationalVersion }}"
    echo "BranchName: ${{ steps.gitversion.outputs.BranchName }}"
    echo "Sha: ${{ steps.gitversion.outputs.Sha }}"
    echo "ShortSha: ${{ steps.gitversion.outputs.ShortSha }}"
    echo "NuGetVersionV2: ${{ steps.gitversion.outputs.NuGetVersionV2 }}"
    echo "NuGetVersion: ${{ steps.gitversion.outputs.NuGetVersion }}"
    echo "NuGetPreReleaseTagV2: ${{ steps.gitversion.outputs.NuGetPreReleaseTagV2 }}"
    echo "NuGetPreReleaseTag: ${{ steps.gitversion.outputs.NuGetPreReleaseTag }}"
    echo "VersionSourceSha: ${{ steps.gitversion.outputs.VersionSourceSha }}"
    echo "CommitsSinceVersionSource: ${{ steps.gitversion.outputs.CommitsSinceVersionSource }}"
    echo "CommitsSinceVersionSourcePadded: ${{ steps.gitversion.outputs.CommitsSinceVersionSourcePadded }}"
    echo "CommitDate: ${{ steps.gitversion.outputs.CommitDate }}"
```

By default, the `/nofetch` and `/nocache` options are not used. These can be turned on by input parameters.

Turn on `/nofetch`:
```yaml
- uses: roryprimrose/rungitversion
  with:
    nofetch: true
```

Turn on `/nocache`:
```yaml
- uses: roryprimrose/rungitversion
  with:
    nocache: true
```

# Changelog

## v1.0.0
- Initial release

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)

# Local testing
Clone this repo
```
git clone https://github.com/roryprimrose/rungitversion.git
```

Build the container
```
docker build -t rungitversion .
```
Run the container
```
docker run --rm -v ${PWD}:/github/workspace rungitversion
```
