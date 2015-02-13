Nab Changelog
===

1.2.0
---
  - Changes client class to be easier to run when not called from command line

1.1.0
---
  - Factors out path_from_uri into new Utils module

1.0.0
---
  - Adds ability to change destination directory (where files go)
  - Adds the ability to strip leading directories when saving files locally
  - Major rewrite of how files are writter (file adapters)
  - Adds storage adapters for STDERR and STDOUT

0.0.5
---
  - Fixes bug because of missing require for the new aws-sdk-v1 gem.

0.0.4
---
  - Switches to aws-sdk-v1 as a dependencies as per recommendation from
      http://ruby.awsblog.com/post/TxFKSK2QJE6RPZ/Upcoming-Stable-Release-of-AWS-SDK-for-Ruby-Version-2`

0.0.3
---
  - Locks AWS gem into version 1.x

0.0.2
---
  - removed require relative for nonexistent http adapter


0.0.1
---
  - Initial release
