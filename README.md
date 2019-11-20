# roryprimrose/rungitversion
Provides a GitHub action for running GitVersion

```
    steps:
    - name: Checkout
      uses: actions/checkout@v1

    - name: Fetch tags and master for GitVersion
      run: |
        git fetch --tags
        git branch --create-reflog master origin/master
        
    - name: GitVersion
      id: gitversion
      uses: roryprimrose/rungitversion
      
    - name: Output
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

You can also toggle whether `/nofetch` or `/nocache` options are enabled.

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