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

$(NAME): $(OBJ) $(HD)
	$(CC) $(CFLAG) -L$(LIBFTPATH) -l$(LIBFTLIB) $(OBJ) -o $(NAME)
$(NAME): $(OBJ) $(HD)
	$(CC) $(CFLAG) -L$(LIBFTPATH) -l$(LIBFTLIB) $(OBJ) -o $(NAME)
$(NAME): $(OBJ) $(HD)
	$(CC) $(CFLAG) -L$(LIBFTPATH) -l$(LIBFTLIB) $(OBJ) -o $(NAME)

clean: sub_clean
	$(RM) $(OBJ_C)
	$(RM) $(OBJ_S)
	
fclean: clean sub_fclean
	$(RM) $(NAME_C)
	$(RM) $(NAME_S)

re: fclean all sub_re

# **************************************************************************
.PHONY: all clean fclean re bonus

# **************************************************************************

nono: sub_nono
	$(NORM) $(NFLAG) $(SRC_C)
	$(NORM) $(NFLAG) $(HD_C)
	$(NORM) $(NFLAG) $(SRC_S)
	$(NORM) $(NFLAG) $(HD_S)