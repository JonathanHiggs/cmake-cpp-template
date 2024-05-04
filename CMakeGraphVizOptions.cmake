## Settings used to generate graphviz dependency diagrams
##
## Run:
##     cmake . --preset <preset> --graphviz=graphs/qpl.dot
##
## Then:
##     dot -Tpng graphs/qpl.dot -o graphs/qpl.png
##     dot -Tsvg graphs/qpl.dot -o graphs/qpl.svg

# Name of the graph
set(GRAPHVIZ_GRAPH_NAME "qpl")

# Header written at the top of the file
# set(GRAPHVIZ_GRAPH_HEADER "node [ fontsize = \"12\" ];")

# Prefix for each node
# set(GRAPHVIZ_NODE_PREFIX "")

# Include executables (default: TRUE)
# set(GRAPHVIZ_INCLUDE_EXECUTABLES TRUE)

# Include static libraries (default: TRUE)
# set(GRAPHVIZ_STATIC_LIBS TRUE)

# Include shared libraries (default: TRUE)
# set(GRAPHVIZ_SHARED_LIBS TRUE)

# Include module libraries (default: TRUE)
# set(GRAPHVIZ_MODULE_LIBS TRUE)

# Include interface libraries (default: TRUE)
set(GRAPHVIZ_INTERFACE_LIBS FALSE)

# Include object libraries (default: TRUE)
set(GRAPHVIZ_OBJECT_LIBS FALSE)

# Include unknown libraries (default: TRUE)
set(GRAPHVIZ_UNKNOWN_LIBS FALSE)

# Include external libraries (default: TRUE)
set(GRAPHVIZ_EXTERNAL_LIBS FALSE)

# Include custom targets (default: FALSE)
# set(GRAPHVIZ_CUSTOM_TARGETS FALSE)

# Regular expression of targets to exclude
set(GRAPHVIZ_IGNORE_TARGETS ".*tests.*")

# Generate graphs per-target `qpl.dot.<target>` (default: TRUE)
set(GRAPHVIZ_GENERATE_PER_TARGET FALSE)

# Generate graphs per-dependence `qpl.dot.<dependency>` (default: TRUE)
set(GRAPHVIZ_GENERATE_DEPENDERS FALSE)
