# Declaration of variables
CC = g++
CC_FLAGS = -Wall -Wextra -Werror -fPIC -pthread
GTEST_LIB_FLAGS = -lgtest -lgtest_main

# File names
TEST = test
SOURCES = $(wildcard *.cc)
OBJECTS = $(SOURCES:.cc=.o)

run_test: $(TEST)
	./$(TEST)

# Main target
$(TEST): $(OBJECTS)
	$(CC) $(OBJECTS) $(GTEST_LIB_FLAGS) $(CC_FLAGS) -o $(TEST)

# To obtain object files
%.o: %.cc
	$(CC) -c $(CC_FLAGS) $< -o $@

# To remove generated files
clean:
	rm -f $(TEST) $(OBJECTS)

.PHONY: run_test
