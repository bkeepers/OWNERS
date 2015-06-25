# `OWNERS` files

`OWNERS` files are a way of specifying who is responsible for maintaining a project or specific files in a project. It may be used to notify maintainers of modifications or to enforce review.

**For example:**

You want to change code in `src/chrome/browser/tab_contents/tab_contents_delegate.h`. Who do you ask for help, feedback, or review?

Anyone named in `src/chrome/browser/tab_contents/OWNERS`, or `src/chrome/browser/OWNERS`, and so on up the directory tree. If no `OWNERS` file exists in the directory containing a modified file, crawl up the hierarchy to find the nearest one.

## `OWNERS` file format

The syntax of the `OWNERS` file is, roughly:

```
lines  := (\s* line? \s* "\n")*

line    := directive
          | comment

directive := "set noparent"
                |  email_address (\s* glob)*
                |  "*"

glob      := [a-zA-Z0-9_-*?]+

comment   := "#" [^"\n"]*
```

Email addresses must follow the `foo@chromium.org` short form. If a user's email is one of the email_addresses in the file, the user is considered an "OWNER" for all files in the directory. A `*` (wildcard) indicates that all committers are owners.

If a glob is specified, the line only applies to files in that directory that match the filename glob. Filename globs follow the simple UNIX shell conventions (`*` and `?` are supported). Relative and absolute paths are not allowed (globs may only refer to the files in the current directory).

If the `set noparent` directive used, then only entries in this `OWNERS` file apply to files in this directory; if the `set noparent` directive is not used, then entries in `OWNERS` files in parent directories also apply (up until a `set noparent` is encountered).

Example:

```
% cat dir/`OWNERS`
foo@chromium.org
bar@chromium.org

baz@chromium.org *.gypi
%
```

## Who should be in an `OWNERS` file?

Only the people who are actively investing energy in the improvement of a directory should be listed as `OWNERS`. `OWNERS` are responsible for ensuring the quality of code in their directory remains high and improves over time.

## Attribution

This specification is inspired by [Chrome's OWNERS files](https://www.chromium.org/developers/owners-files).
