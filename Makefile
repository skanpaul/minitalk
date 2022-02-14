NAME_C	= client
NAME_S	= server
NAME_C_BONUS	= client_bonus
NAME_S_BONUS	= server_bonus
# **************************************************************************
NAME	= bidon
NAME_BONUS	= sot
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
LIBFTPATH	= libft/

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
HD_C_BONUS	= bonus/client_bonus.h

SRC_C_BONUS	= bonus/client_bonus.c \
			bonus/init_data_client_bonus.c \
			bonus/stream_out_char_bonus.c \
			bonus/stream_out_int_bonus.c \
			bonus/stream_out_string_bonus.c
OBJ_C_BONUS		= $(SRC_C_BONUS:.c=.o)
# **************************************************************************
HD_S_BONUS	= bonus/server_bonus.h

SRC_S_BONUS	= bonus/server_bonus.c \
				bonus/init_data_server_bonus.c \
				bonus/stream_in_int_bonus.c \
				bonus/stream_in_str_bonus.c
OBJ_S_BONUS		= $(SRC_S_BONUS:.c=.o)
# **************************************************************************
all: $(NAME) $(NAME_C) $(NAME_S)

$(NAME): sub_all
	cp $(LIBFTPATH)$(LIBFTNAME) .
	cp $(LIBFTPATH)$(LIBFTHD) .

$(NAME_C): $(OBJ_C) $(HD_C)
	$(CC) $(CFLAG) -L$(LIBFTPATH) -l$(LIBFTLIB) $(OBJ_C) -o $(NAME_C)

$(NAME_S): $(OBJ_S) $(HD_S)
	$(CC) $(CFLAG) -L$(LIBFTPATH) -l$(LIBFTLIB) $(OBJ_S) -o $(NAME_S)
# **************************************************************************
bonus: $(NAME_BONUS) $(NAME_C_BONUS) $(NAME_S_BONUS) 

$(NAME_BONUS): sub_all
	cp $(LIBFTPATH)$(LIBFTNAME) .
	cp $(LIBFTPATH)$(LIBFTHD) .

$(NAME_C_BONUS): $(OBJ_C_BONUS) $(HD_C_BONUS)
	$(CC) $(CFLAG) -L$(LIBFTPATH) -l$(LIBFTLIB) $(OBJ_C_BONUS) -o $(NAME_C_BONUS)
	mv $(NAME_C_BONUS) $(NAME_C)

$(NAME_S_BONUS): $(OBJ_S_BONUS) $(HD_S_BONUS)
	$(CC) $(CFLAG) -L$(LIBFTPATH) -l$(LIBFTLIB) $(OBJ_S_BONUS) -o $(NAME_S_BONUS)
	mv $(NAME_S_BONUS) $(NAME_S)
# **************************************************************************

clean: sub_clean
	$(RM) $(OBJ_C)
	$(RM) $(OBJ_S)
	$(RM) $(OBJ_C_BONUS)
	$(RM) $(OBJ_S_BONUS)
	
fclean: clean sub_fclean
	$(RM) $(NAME_C)
	$(RM) $(NAME_S)

re: fclean all sub_re

# **************************************************************************** #
sub_all:
	${MAKE} all -C ${LIBFTPATH}

sub_clean:
	${MAKE} clean -C ${LIBFTPATH}

sub_fclean:
	${MAKE} fclean -C ${LIBFTPATH}

sub_re:
	${MAKE} re -C ${LIBFTPATH}

sub_nono:
	${MAKE} nono -C ${LIBFTPATH}
# **************************************************************************
.PHONY: all clean fclean re bonus

# **************************************************************************

nono: sub_nono
	$(NORM) $(NFLAG) $(SRC_C)
	$(NORM) $(NFLAG) $(HD_C)
	$(NORM) $(NFLAG) $(SRC_S)
	$(NORM) $(NFLAG) $(HD_S)