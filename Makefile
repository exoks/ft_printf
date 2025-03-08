# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oezzaou <oezzaou@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/05 15:55:24 by oezzaou           #+#    #+#              #
#    Updated: 2022/10/07 08:43:57 by oezzaou          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#====<[ Colors: ]>==============================================================
GREEN					= \033[1;32m
RED						= \033[1;31m
BLUE					= \033[34m
CYAN					= \033[1;36m
GRAY					= \033[0;90m
PURPLE				= \033[0;35m
YELLOW				= \033[0;93m
BLACK  				= \033[20m
MAGENTA 			= \033[35m
WHITE  				= \033[37m
PINK					= \033[0;38;5;199m
ORANGE 				= \033[38;5;214m
LIGHT_BLACK  	= \033[90m
LIGHT_RED    	= \033[91m
LIGHT_GREEN  	= \033[92m
LIGHT_YELLOW 	= \033[93m
LIGHT_BLUE   	= \033[94m
LIGHT_MAGENTA = \033[95m
LIGHT_CYAN   	= \033[96m
LIGHT_WHITE  	= \033[97m
LIGHT_BLUE		= \033[38;5;45m
RESET					= \033[1;0m

#====<[ CC compiler: ]>=========================================================
CC            := cc
CFLAGS        := -Wall -Wextra -Werror
RM            := rm -rf

#===<[ Sources: ]>==============================================================
PROJECT       := ft_printf
NAME          := libftprintf.a
SRC_DIR       := src
OBJ_DIR       := obj
LIBFT         := libft
INCLUDE       := -I$(LIBFT)/include -Iinclude

SRC           := ft_manage_flags.c ft_print_char.c ft_putnbr_base_id.c \
                 ft_print_str.c ft_putnbr_base_upx.c ft_printf_utils.c

OBJ           := $(addprefix $(OBJ_DIR)/, ${SRC:.c=.o})
SRC           := $(addprefix $(SRC_DIR)/, $(SRC))

CFILE         := ./tests/tests.c
#====<[ Rules: ]>===============================================================
all: signature $(NAME)

$(NAME): $(OBJ) $(OBJ_DIR)/ft_printf.o
	@ar -rcs $@  $(OBJ_DIR)/* $(LIBFT)/obj/*
	@echo "${GREEN}[OK] ${CYAN}$(NAME) ✔️${RESET}"

signature:
	@printf "${GRAY}%19s${RESET}\n" "𓆩♕𓆪"
	@printf "${GRAY}%s${RESET}\n"		"𓄂 oussama ezzaou𓆃  "

bonus: clean $(NAME)

# Rule usage:
# 1|=> [ make tests | It will use default CFILE=./tests/tests.c]
# 2|=> [ make tests CFILE=<file_to_compile_with_libftprintf.a> ]
tests: 
	@make -s -C . 
	$(CC) $(CFLAGS) $(INCLUDE) $(CFILE) $(NAME) -o foo && ./foo

$(OBJ_DIR)/ft_printf.o: ft_printf.c
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@
	@printf "$(GREEN)[OK]${RESET} ${PINK}Compiling${RESET} %-26s| $@\n" "$<"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | .create_dirs $(LIBFT) 
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@
	@printf "$(GREEN)[OK]${RESET} ${PINK}Compiling${RESET} %-26s| $@\n" "$<"

$(LIBFT):
	@make -C $@

$(OBJ_DIR):
	@mkdir -p $@

clean:
	@make -C $(LIBFT) fclean
	@if [ -d $(OBJ_DIR) ]; then\
		${RM} $(OBJ_DIR);\
		printf "${GREEN}[OK]${RESET} ${ORANGE}Cleaning  %-26s${RESET}| ./%s\n"\
					 "... " "$(PROJECT)/$(OBJ_DIR) ✔️";\
	else\
		printf "${RED}[KO]${RESET} ${BLUE}Not Found %-26s${RESET}| ./%s\n"\
					 "..." "$(PROJECT)/$(OBJ_DIR) ✖️";\
	fi

fclean: clean
	@if [ -f $(NAME) ]; then\
		${RM} $(NAME);\
		${RM} ./foo\
		printf "${GREEN}[OK]${RESET} ${ORANGE}Cleaning  %-26s${RESET}| ./%s\n"\
					 "... " "$(PROJECT)/$(NAME) ✔️";\
	else\
		printf "${RED}[KO]${RESET} ${BLUE}Not Found %-26s${RESET}| ./%s\n"\
					 "..." "$(PROJECT)/$(NAME) ✖️";\
	fi

re: fclean all
	
.create_dirs: $(OBJ_DIR)

.PHONY: all bonus clean fclean tests re $(LIBFT) signature
#===============================================================================
