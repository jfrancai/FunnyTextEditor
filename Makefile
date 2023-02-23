NAME := fte

CC := clang
CFLAGS := -Wall -Werror -Wextra -MD -I include/

OBJSDIR := objs/

SRC := main.c

OBJS = $(SRC:%.c=$(OBJSDIR)%.o)

all:
	make $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

$(OBJSDIR)%.o: %.c
	mkdir -p $(OBJSDIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJSDIR) 

fclean: clean
	rm -rf $(NAME)

re: fclean
	make $(NAME)

-include $(SRC:%.c=%.d)

.PHONY: all clean re fclean
