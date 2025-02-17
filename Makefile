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

#====<[ Colors: ]>==============================================================
GREEN			:= \033[1;32m
RED				:= \033[1;31m
CYAN			:= \033[1;36m
NOCLR			:= \033[1;0m

#====<[ CC compiler: ]>=========================================================
CC				:= cc
CFLAGS		:= -Wall -Wextra -Werror
RM				:= rm -rf

#===<[ Sources: ]>==============================================================
NAME			:= libftprintf.a
SRC_DIR		:= src
OBJ_DIR		:= obj
LIBFT_DIR := libft
INCLUDE		:= -I$(LIBFT_DIR) -Iinclude

SRC				:= ft_manage_flags.c ft_print_char.c ft_putnbr_base_id.c \
						 ft_print_str.c ft_putnbr_base_upx.c ft_printf_utils.c

OBJ				:= $(addprefix $(OBJ_DIR)/, ${SRC:.c=.o})
SRC				:= $(addprefix $(SRC_DIR)/, $(SRC))

#====<[ Rules: ]>===============================================================
all: $(NAME)

$(NAME): $(OBJ) $(OBJ_DIR)/ft_printf.o
	@make -C $(LIBFT_DIR)	
	@ar -rcs $@  $(OBJ_DIR)/* $(LIBFT_DIR)/obj/*
	@echo "${GREEN}[OK]: ${CYAN}$(NAME) ✔️${NOCLR}"

bonus: clean $(NAME)

test:
	gcc main.c libftprintf.a -Iinclude -Ilibft && ./a.out

$(OBJ_DIR)/ft_printf.o: ft_printf.c
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@
	@printf "$(GREEN)[OK]${NOCLR}: Compiling %-30s | $@\n" "$<"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@
	@printf "$(GREEN)[OK]${NOCLR}: Compiling %-30s | $@\n" "$<"

bonus: clean $(NAME)

$(OBJ_DIR):
	@mkdir -p $@

clean:
	@${RM} $(OBJ_DIR) 
	@make -C $(LIBFT_DIR) clean

fclean:
	@${RM} -rf $(NAME) $(OBJ_DIR) 
	@make -C $(LIBFT_DIR) fclean
	@echo "${GREEN}[OK]${NOCLR}: Cleaning ... $(NAME) ✔️"

re: fclean all
	
.PHONY: all bonus test clean fclean re 
#===============================================================================
