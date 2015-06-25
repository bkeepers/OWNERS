# `OWNERS`

`OWNERS` files are a way of specifying a set of reviewers whose review is required to modify certain areas of code.

When contributing code, for each file modified in a changelist, a "LGTM" review is required from someone listed in the `OWNERS` file in that directory, or in the `OWNERS` file in a parent / higher-level directory of that file. That means that the approver must type "lgtm" (case insensitive) into a comment on the code review.
In certain circumstances ex post approval is acceptable or preferred, in which case the owner is instead listed in the TBR (To Be Reviewed) field.

**An example:**

You want to change code in `src/chrome/browser/tab_contents/tab_contents_delegate.h`.

Either you or one of the change’s reviewers must be an owner of src/chrome/browser/tab_contents/. (If you are an owner, another committer must still review the change, but they need not be an owner.)

Who owns `src/chrome/browser/tab_contents/`? Everyone named in `src/chrome/browser/tab_contents/OWNERS`. In addition, everyone named in `src/chrome/browser/OWNERS` can review this code, and so on up the directory tree. If no `OWNERS` file exists in the directory containing a modified file, crawl up the hierarchy to find the nearest one.

**Another example:**

You want to do a refactoring and make some changes to `ChildProcessHost` that require you touch code in many different directories due to a renamed method. You make changes to `src/chrome/common/child_process_host.h` and to callsites in `src/chrome/browser`, `src/chrome/service`, `/src/chrome/common`, and elsewhere, across 20 different sub directories. You could either get a LGTM from someone listed in the `OWNERS` file of each of these 20 subdirectories, or you could get a LGTM from someone listed in `/src/chrome/OWNERS`.

## Why `OWNERS`?

`OWNERS` are people who are intimately familiar with specific areas of code. They have a deep understanding of how the code works, why it was built the way it was and what needs to happen to the code to improve it.

`OWNERS` are responsible for ensuring the quality of code in their directory remains high and improves over time.

## Who should be in an `OWNERS` file?

Only the people who are actively investing energy in the improvement of a directory should be listed as `OWNERS`.

`OWNERS` are expected to have demonstrated excellent judgment, teamwork and ability to uphold Chrome development principles. They must understand the development process.

Additionally, for someone to be listed as an OWNER of a directory they must be approved by the other `OWNERS` of the affected directory. Some guidelines:
already acting as an OWNER, providing high-quality reviews and design feedback
be a Chromium project member with full svn commit access of at least 6 months tenure
have submitted a substantial number of non-trivial changes to the affected directory
have committed or reviewed substantial work to the affected directory within the last 90 days
have the bandwidth to contribute with other `OWNERS` to review of code within the affected directory
It is up to `OWNERS` of a directory to keep the list up to date. `OWNERS` lists should be as small as possible to encourage better code modularization. When a directory has many hundreds of files, it becomes hard to understand which `OWNERS` are familiar with which files.

## `OWNERS` file format

The syntax of the `OWNERS` file is, roughly:

```
lines  := (\s* line? \s* "\n")*

line    := directive
          | "per-file" \s+ glob "=" directive
          | comment

directive := "set noparent"
                |  email_address
                |  "*"

glob      := [a-zA-Z0-9_-*?]+

comment   := "#" [^"\n"]*
```

Email addresses must follow the "foo@chromium.org" short form. Filename globs follow the simple UNIX shell conventions ("*" and "?" are supported), and relative and absolute paths are not allowed (globs may only refer to the files in the current directory).

If a user's email is one of the email_addresses in the file, the user is considered an "OWNER" for all files in the directory. A "*" (wildcard) indicates that all committers are owners. If the file contains "set noparent", then `OWNERS` in parent directories are not searched when checking for reviewers.

If the "per-file" directive is used, the line only applies to files in that directory that match the filename glob specified. If the "set noparent" directive used, then only entries in this `OWNERS` file apply to files in this directory; if the "set noparent" directive is not used, then entries in `OWNERS` files in enclosing (upper) directories also apply (up until a "set noparent is encountered"). If "per-file glob=set noparent" is used, then global directives are ignored for the glob, and only the "per-file" owners are used for files matching that glob.

Example:

```
% cat dir/`OWNERS`
foo@chromium.org
bar@chromium.org

per-file *.gypi=baz@chromium.org
%
```

## Committing Notes

git-cl/commit queue will enforce that relevant `OWNERS` have given a positive review to a changelist before it will be committed.
A review can (and should) be sought from qualified engineers (not exclusively `OWNERS`); if an OWNER is satisfied with the review (s)he may just approve it.

## When to use To Be Reviewed (TBR)

A developer (e.g. a sheriff) who is trying to correct a broken build can submit changes TBR=OWNER.
For widespread or refactoring changes that are mechanical or global in nature, it is acceptable to TBR the `OWNERS` required for submission, as long as your changes have had the appropriate level of review or general approval.  (For example, if touching hundreds of files across the codebase, a thread on the chromium-dev mailing list may be better than getting individual approval from dozens of different `OWNERS`.)

## Attribution

This specification is inspired by [Chrome's OWNERS files](https://www.chromium.org/developers/owners-files).
