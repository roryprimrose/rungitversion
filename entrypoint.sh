#!/bin/bash

dotnet /app/GitVersion.dll /github/workspace /nocache /nofetch /output json > /version.json

data="$(cat /version.json)"
# (?<="NuGetVersionV2":")[^"]+(?=")
NuGetVersionV2=$(echo $data | grep -Eio '"NuGetVersionV2":"[^"]+"')
# NuGetVersionV2=jq ".NuGetVersionV2"
echo $NuGetVersionV2

echo "::set-output name=NuGetVersionV2::$NuGetVersionV2"

# echo $data

# echo ::set-output name=NuGetVersionV2::$GitVersion_NuGetVersionV2

# "Major":0,
# "Patch":0,
# "PreReleaseTag":"ExecuteGitVersion.1",
# "PreReleaseTagWithDash":"-ExecuteGitVersion.1",
# "PreReleaseLabel":"ExecuteGitVersion",
# "PreReleaseNumber":1,
# "WeightedPreReleaseNumber":30001,
# "BuildMetaData":37,
# "BuildMetaDataPadded":"0037",
# "FullBuildMetaData":"37.Branch.feature-ExecuteGitVersion.Sha.90938eda6105f8218bd75e2278d8a65316683355",
# "MajorMinorPatch":"0.1.0",
# "SemVer":"0.1.0-ExecuteGitVersion.1",
# "LegacySemVer":"0.1.0-ExecuteGitVersion1",
# "LegacySemVerPadded":"0.1.0-ExecuteGitVersio0001",
# "AssemblySemVer":"0.1.0.0",
# "AssemblySemFileVer":"0.1.0.0",
# "FullSemVer":"0.1.0-ExecuteGitVersion.1+37",
# "InformationalVersion":"0.1.0-ExecuteGitVersion.1+37.Branch.feature-ExecuteGitVersion.Sha.90938eda6105f8218bd75e2278d8a65316683355",
# "Sha":"90938eda6105f8218bd75e2278d8a65316683355",
# "ShortSha":"90938ed",
# "NuGetVersionV2":"0.1.0-executegitversio0001",
# "NuGetVersion":"0.1.0-executegitversio0001",
# "NuGetPreReleaseTagV2":"executegitversio0001",
# "NuGetPreReleaseTag":"executegitversio0001",
# "VersionSourceSha":"64705abfad54d484e6c252c01a698e94b8da8924",
# "CommitsSinceVersionSource":37,
# "CommitsSinceVersionSourcePadded":"0037",
# "CommitDate":"2019-11-18"