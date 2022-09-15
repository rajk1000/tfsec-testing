
## Instructions on using git hooks in this repository.
---
*Please run the following command to set the git hooks directory as .githooks/*
---
git config --local core.hooksPath .githooks/

*The pre-commit hook*
---
This pre-commit hooks runs *tfsec* on any Terraform (.tf) files included as part of the commit.
If it finds *tfsec* issues reported, it will then disallow the commit. To override this, read the full instructions on what to do. This is output by the pre-commit hook 