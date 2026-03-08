JAVA_HOME ?= ~/local/jdk-classfile
TCLJX_MDIR ?= ../bootstrap-tcljx

JAVA_BIN=$(if $(JAVA_HOME),$(JAVA_HOME)/bin/,)
JAVA=$(JAVA_BIN)java

JAVA_OPTS=
TCLJX_OPTS=$(JAVA_OPTS) -p $(TCLJX_MDIR) -m tcljx.compiler

MAIN_NS=hello.core
RUN_TESTS_NS=hello.run-tests


# Compile namespace to classes in default destination directory
# /tmp/$(USER)/tcljx/hello-tcljx/.
compile:
	$(JAVA) $(TCLJX_OPTS) $(RUN_TESTS_NS)

# Loop: Watch for updates to source files, then compile.
watch-and-compile:
	$(JAVA) $(TCLJX_OPTS) --watch $(RUN_TESTS_NS)

# Compile namespace and run parameterless function.  No classes are written.
run:
	$(JAVA) $(TCLJX_OPTS) -d :none $(MAIN_NS)/run

# Loop: Watch for updates to source files, then compile & run.
watch-and-run:
	$(JAVA) $(TCLJX_OPTS) --watch $(MAIN_NS)/run


# Default destination directory of the compiler.
PROJECT_DIR=$(notdir $(PWD))
DEST_DIR=/tmp/$(USER)/tcljx/$(PROJECT_DIR)

# Run static main method of hello.core using compiled classes.  Uses
# output of "make compile".  Does not load compiler classes.
run-main:
	$(JAVA) $(JAVA_OPTS) -p $(TCLJX_MDIR) --add-modules tcljx.core -cp $(DEST_DIR) $(MAIN_NS).___ $(ARGS)



# Run static main method of namespace hello.run-tests using compiled
# classes.  Uses output of "make compile".
test:
	$(JAVA) $(JAVA_OPTS) -p $(TCLJX_MDIR) --add-modules tcljx.alpha -cp $(DEST_DIR) $(RUN_TESTS_NS).___

# Loop: Watch for updates to source files, then compile & run tests.
watch-and-test:
	$(JAVA) $(TCLJX_OPTS) --watch $(RUN_TESTS_NS)/run


clean:
	rm -rf "$(DEST_DIR)"/*

.PHONY: compile run test clean
