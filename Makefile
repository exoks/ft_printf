# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oezzaou <oezzaou@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/05 15:55:24 by oezzaou           #+#    #+#              #
#    Updated: 2022/10/12 19:04:11 by oezzaou          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
NAME := libftprintf.a
SRCDIR := src/
INC = -I libft -I include
CC := cc
CFLAGS := -Wall -Wextra -Werror
SRC := ft_manage_flags.c ft_putnbr_base_upx.c ft_print_char.c ft_print_str.c ft_putnbr_base_id.c ft_printf_utils.c
OBJ := ${SRC:.c=.o}
LIBFT = libft/

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -c ft_printf.c $(INC)
	make -C libft	
	ar -rcs $@ libft/*.o *.o

all: $(NAME)

test:
	gcc main.c libftprintf.a -Iinclude -Ilibft && ./a.out

%.o:$(SRCDIR)%.c
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

bonus: clean $(NAME)

clean:
	$(MAKE) -C $(LIBFT) clean
	rm -f *.o 

fclean: clean
	$(MAKE) -C $(LIBFT) fclean
	rm -f $(NAME)

re: fclean all
	
.PHONY: test all clean fclean re bonus
