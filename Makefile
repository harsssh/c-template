NAME = main
SRC = $(wildcard src/*.c)
OBJ = $(SRC:%.c=%.o)
DEPS = $(SRC:%.c=%.d)
CC = gcc
CFLAGS = -g -Wall -Wextra -Wshadow

.PHONY: all
all: $(NAME)

.PHONY: re
re: fclean all

.PHONY: $(NAME)
$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

.c.o:
	$(CC) -MMD -MP -o $@ -c $<

.PHONY: clean
clean:
	rm -f $(OBJ) $(DEPS)

.PHONY: fclean
fclean:
	rm -f $(NAME)

-include $(DEPS)
