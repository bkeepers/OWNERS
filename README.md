# `OWNERS` files

Knowing who owns a project or piece of code is often tribal knowledge, which makes it difficult to know who to ask for help, feedback, or review. `OWNERS` files specify who is responsible for maintaining a project or specific files in a project, and may be used to notify maintainers of modifications or to enforce approval in reviews.

For example:

```
$ cat OWNERS
# Specify owners by email address.
user@example.com

# …or GitHub username
@username

# …or GitHub team
@org/team

# …and even limit to specific paths
@org/js *.js
@org/legal LICENSE*
```

## `OWNERS` file format

The syntax of the `OWNERS` file is, roughly:

```
lines      := (\s* line? \s* "\n")*

line       := directive | comment

directive  := "set noparent"
              |  identifier (\s* glob)*
              |  "*"

identifier := email_address
             | username
             | team

username   := @[a-zA-Z0-9-]+

team       := @[a-zA-Z0-9-]+/[a-zA-Z0-9-]+

glob       := [a-zA-Z0-9_-*?]+

comment    := "#" [^"\n"]*
```

A `username` is a GitHub username (e.g. @bkeepers). Email addresses must follow the `foo@chromium.org` short form. The specified `user` is considered an "OWNER" for all files in the directory. A `*` (wildcard) indicates that all committers are owners.

If a glob is specified, the line only applies to files in that directory that match the filename glob. Filename globs follow the simple UNIX shell conventions (`*` and `?` are supported). Relative and absolute paths are not allowed (globs may only refer to the files in the current directory).

If the `set noparent` directive used, then only entries in this `OWNERS` file apply to files in this directory; if the `set noparent` directive is not used, then entries in `OWNERS` files in parent directories also apply (up until a `set noparent` is encountered).

## Who should be in an `OWNERS` file?

Only the people who are actively investing energy in the improvement of a directory should be listed as `OWNERS`. `OWNERS` are responsible for ensuring the quality of code in their directory remains high and improves over time.

## Attribution

This specification is inspired by [Chrome's OWNERS files](https://www.chromium.org/developers/owners-files).
