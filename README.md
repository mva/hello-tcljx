## Project Template for `tcljx`

This repository serves as a basic project template, using the classic
"hello world" program.

### Prerequisites

- Linux.  Has not been tested with Window or macOS *at all*.

- Whatever build of [OpenJDK](https://jdk.java.net/) tcljx is
  currently using.  At the time of writing this means OpenJDK 25 or
  later.

- A copy of `tcljx`'s modules from repository
  [bootstrap-tcljx](https://github.com/mva/bootstrap-tcljx) that match
  the OpenJDK build.  As long as there are no releases, the modules
  will be distributed as a repository of class files.

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

- `TCLJX_MDIR` is the bootstrap-tcljx directory holding the modules
  that comprise the compiler: runtime, core libraries, alpha
  libraries, and the compiler classes.  Default is
  `../bootstrap-tcljx`.
