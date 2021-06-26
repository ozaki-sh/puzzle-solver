.PHONY: all clean

CXX = g++
CFLAGS = -g -Wall
SRCDIR = ./src
SRCS = $(wildcard $(SRCDIR)/*.cpp)
OBJDIR = ./obj
OBJS = $(addprefix $(OBJDIR)/, $(notdir $(SRCS:.cpp=.o)))
TARGET = puzzle-solver

$(warning SRCDIR = $(SRCDIR))
$(warning SRCS = $(SRCS))
$(warning OBJDIR = $(OBJDIR))
$(warning OBJS = $(OBJS))

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	mkdir -p $(OBJDIR)
	$(CXX) $(CFLAGS) -o $@ -c $<

$(TARGET): $(OBJS)
	$(CXX) $(CFLAGS) -o $@ $(OBJS)

all: clean $(TARGET)

clean:
	rm -f $(OBJS)
	rmdir $(OBJDIR)
	rm -f $(TARGET)
