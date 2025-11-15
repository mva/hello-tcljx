## Project Template for `tcljx`

This repository serves as a basic project template, using the classic
"hello world" program.

### Prerequisites

- Linux.  Has not been tested with Window or macOS *at all*.

- Whatever build of [OpenJDK](https://jdk.java.net/) tcljx is
  currently using.  At the time of writing this means OpenJDK 26 or
  later.

- A copy of `tcljx`'s modules from the directory created by running
  "make bootstrap-mdir" in `tcljx`s repository.

### Running the Thing

`Makefile` lists the most common commands.  They come as classic
one-shot invocations (like `make compile`), and as `watch-…` targets
(like `make watch-and-test`).  The latter start the compiler in a
looping mode.  Each time a source file changes, a recompile is
triggered and on success a parameterless function is called.

The makefile reads two environment variables:

- `JAVA_HOME` must point to the OpenJDK build.  The JVM executable
  `$JAVA_HOME/bin/java` will be used.  Default is
  `~/local/jdk-classfile`.

- `TCLJX_MDIR` is the directory holding the modules that comprise the
  compiler: runtime, core libraries, alpha libraries, and the compiler
  classes.  Default is `/tmp/$USER/tcljx-stage2.mdir-jar`.
