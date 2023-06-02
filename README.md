# Github hydrate timeline

This script aim to hydrate github timeline with commit pushed on other plateform will keeping you entire privacy !

### Summary

- Description
- Installation
- Contribute
- Authors

## Description

This script work as a [git hook](https://mirrors.edge.kernel.org/pub/software/scm/git/docs/githooks.html) binded on the pre-commit hook.
Each time you'll produce a new commit, this script will be handled and will increment a counter and push the file. During the installation process,
you'll have the ability to setup the way you want's the current script to work !

You'll have the ability to ignore some repository url (see the setting --ignore)
You'll have the ability to fragement you're counters for privacy purpose (see the setting --fragment)

## Installation

**Before using this script, you must fork this repository and i recommand you to turn you fork as a private repository !**

```sh
cd ./github-hydrate
chmod +x ./install.sh
./install.sh [-i|--ignore] [-f|--fragment]
```

## Settings

Default options are the equivalent of this installation command:
```sh
./install.sh -i github.com -f NONE
```

Installation options are available, in the below table:
| Options       | Unique    | Description   |
|---------------|-----------|-------------  |
| -i, --ignore  | `false`   | Add a url to ignore. Commit to repository under this URL will not be compatibilized (default: "github.com") |
| -f, --fragment| `true`    | Define in how much fragmented file the script must be splited (Default: NONE) |

| Fragement     | Format        | Description   |
|---------------|---------------|---------------|
| `NONE`        | file: `all`   | One file for all counters. This value will give you the highest level of privacy. Note: for bridging number of commit for enterprise git, this is RECOMANDED value for compliance with your NDA or Work contract ! |
| `URL`         | file: `<url>`  | One file for each top url. All repository stored under the url gitlab.com will by counted in same file. |
| `REPO`        | file: `<repo>` | One file for each repository. All commit on a repository will be counted together (ignore ssh or https difference) |
| `ORIGIN`      | file: `<method><url><repo>` | On file for each origin. All commint on a origin will be counted together (does not merge ssh and https) |

## Contribue

You can contribute on the repository if you want's, do not hesitate to create a merge request and to push on the repository

## Authors

- Author [Louis](https://github.com/grdlo)