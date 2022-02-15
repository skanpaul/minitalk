NAME_C	= client
NAME_S	= server
# **************************************************************************
NAME	= bidon
# **************************************************************************
CC		= gcc
CFLAG	= -Wall -Wextra -Werror
RM		= rm -f
AR 		= ar -rcs
NORM	= norminette
NFLAG	= -R CheckForbiddenSourceHeader
# **************************************************************************
LIBFTNAME	= libft.a
LIBFTHD		= libft.h
LIBFTLIB	= ft
LIBFTPATH	= ./

# **************************************************************************
HD_C	= client.h

SRC_C		= client.c \
			init_data_client.c \
			stream_out_char.c \
			stream_out_int.c \
			stream_out_string.c
OBJ_C		= $(SRC_C:.c=.o)

# **************************************************************************
HD_S	= server.h

SRC_S	= server.c \
			init_data_server.c \
			stream_in_int.c \
			stream_in_str.c
OBJ_S		= $(SRC_S:.c=.o)
# **************************************************************************
all: $(NAME)

$(NAME):  $(NAME_C) $(NAME_S)

$(NAME_C): $(OBJ_C) $(HD_C)
	$(CC) $(CFLAG) -L$(LIBFTPATH) -l$(LIBFTLIB) $(OBJ_C) -o $(NAME_C)

$(NAME_S): $(OBJ_S) $(HD_S)
	$(CC) $(CFLAG) -L$(LIBFTPATH) -l$(LIBFTLIB) $(OBJ_S) -o $(NAME_S)

# **************************************************************************
clean:
	$(RM) $(OBJ_C)
	$(RM) $(OBJ_S)
	
fclean: clean
	$(RM) $(NAME_C)
	$(RM) $(NAME_S)

re: fclean all

# **************************************************************************
.PHONY: all clean fclean re

# **************************************************************************

nono: sub_nono
	$(NORM) $(NFLAG) $(SRC_C)
	$(NORM) $(NFLAG) $(HD_C)
	$(NORM) $(NFLAG) $(SRC_S)
	$(NORM) $(NFLAG) $(HD_S)