CPP = g++
CFLAGS = -g -O2 -std=c++11 -Wall
LDFLAGS =
LIBS = -lpthread
SRC_DIR = src
OBJ_DIR = obj
INCLUDES = -I$(SRC_DIR)/openecho
CPP_FILES = $(wildcard $(SRC_DIR)/openecho/*.cpp) \
			$(wildcard $(SRC_DIR)/HouseholdSolarPowerGeneration/*.cpp) 
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(CPP_FILES))

PROGRAM = OpenECHOForCpp

all: $(PROGRAM)

$(PROGRAM): $(OBJS)
	$(CPP) $(CFLAGS) $(OBJS) $(LDFLAGS) $(LIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(@D)
	$(CPP) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(PROGRAM)

.PHONY: all clean
