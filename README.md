# cd4pe_precheck

A bolt plan which aims to check whether a host meets all the requirements to have CD4PE installed on it.

#### Table of Contents

- [cd4pe_precheck](#cd4pe_precheck)
      - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Setup](#setup)
  - [Usage](#usage)
  - [Limitations](#limitations)
  - [Contributions](#contributions)

## Description

Basically what the first sentence of this README said.

## Setup

This plan has been tested with Bolt 2.x.

1. Clone down the repository into a directory in your module path (for example, into `~/Boltdir/site-modules`)
2. Make sure `bolt plan show` lists the plan `cd4pe_precheck`

## Usage

```
bolt plan run cd4pe_precheck cd4pe_host=$host cd4pe_jobs_host=$host git_host="github.com" pe_host=$host
```

## Limitations

Currently, only some port checks are done.
What needs to be added:

1. Check hardware specs
2. Check docker availability
3. Check other things?

## Contributions

All contributions welcome as PRs! Questions welcome: dimitri@puppet.com