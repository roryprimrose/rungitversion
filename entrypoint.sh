#!/bin/bash

nofetch=""
nocache=""

# Check if the nofetch option has been set
if [ "${1,,}" == "true" ] ;then
    echo "nofetch enabled"
    nofetch="/nofetch"
fi

# Check if the nocache option has been set
if [ "${2,,}" == "true" ] ;then
    echo "nocache enabled"
    nocache="/nocache"
fi

dotnet /app/GitVersion.dll /github/workspace $nocache $nofetch /output buildserver > /version.txt; result=$?

buildserver="$(cat /version.txt)"

if [[ $buildserver == *"Could not find a 'develop' or 'master' branch, neither locally nor remotely."* ]] ;then

    echo "
    
    Fetch the master branch and tags before running GitVersion. Use the following GitHub actions step before running this action.

    - name: Fetch tags and master for GitVersion
      run: |
        git fetch --tags
        git branch --create-reflog master origin/master
    
    "

fi

if [ $result -ne 0 ]; then
    echo "Failed to evaluate GitVersion (/output buildserver)"
    exit $result
fi

dotnet /app/GitVersion.dll /github/workspace $nocache $nofetch /output json > /version.json; result=$?

if [ $result -ne 0 ]; then
    echo "Failed to evaluate GitVersion (/output json)"
    exit $result
fi

json="$(cat /version.json)"

function outputValue() {
    local prefix='"'
    local suffix='":(("[^"]+")|[0-9]+)'
    local expression=$prefix$1$suffix

    # Get the json line ("key":"value" or "key":value)
    local line=$(echo $json | grep -Eio $expression)

    # Split the line and take the value
    local part=$(echo $line | cut -d \: -f 2)

    # Remove the " characters
    local value="${part//[\"]}"

    # Log the value to the github action output parameter
    echo "::set-output name=$1::$value"
}

outputValue "Major"
outputValue "Minor"
outputValue "Patch"
outputValue "PreReleaseTag"
outputValue "PreReleaseTagWithDash"
outputValue "PreReleaseLabel"
outputValue "PreReleaseNumber"
outputValue "WeightedPreReleaseNumber"
outputValue "BuildMetaData"
outputValue "BuildMetaDataPadded"
outputValue "FullBuildMetaData"
outputValue "MajorMinorPatch"
outputValue "SemVer"
outputValue "LegacySemVer"
outputValue "LegacySemVerPadded"
outputValue "AssemblySemVer"
outputValue "AssemblySemFileVer"
outputValue "FullSemVer"
outputValue "InformationalVersion"
outputValue "BranchName"
outputValue "Sha"
outputValue "ShortSha"
outputValue "NuGetVersionV2"
outputValue "NuGetVersion"
outputValue "NuGetPreReleaseTagV2"
outputValue "NuGetPreReleaseTag"
outputValue "VersionSourceSha"
outputValue "CommitsSinceVersionSource"
outputValue "CommitsSinceVersionSourcePadded"
outputValue "CommitDate"