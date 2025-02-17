# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oezzaou <oezzaou@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/30 15:57:20 by oezzaou           #+#    #+#              #
#    Updated: 2023/02/21 14:57:02 by oezzaou          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#====<[ Colors: ]>==============================================================
GREEN		:= \033[1;32m
RED			:= \033[1;31m
CYAN		:= \033[1;36m
NOCLR		:= \033[1;0m

#====<[ CC compiler: ]>=========================================================
CC			:= cc
CFLAGS	:= -Wall -Wextra -Werror
RM			:= rm -rf

#===<[ Sources: ]>==============================================================
NAME		:= libft.a

SRC 		:= ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c \
					 ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_memchr.c \
					 ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c \
					 ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c ft_split.c \
					 ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c \
					 ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c \
					 ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c

SRC_BNS	:= ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c \
					 ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_memchr.c \
					 ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c \
					 ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c ft_split.c \
					 ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c \
					 ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c \
					 ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c \
					 ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c ft_lstdelone.c \
					 ft_lstiter.c ft_lstlast.c ft_lstmap.c ft_lstnew.c ft_lstsize.c

HEADER	:= libft.h
OBJ_DIR	:= obj
OBJ			:= $(addprefix $(OBJ_DIR)/, ${SRC:.c=.o})
OBJ_BNS	:= $(addprefix $(OBJ_DIR)/, ${SRC_BNS:.c=.o})

#====<[ Rules: ]>===============================================================

all: $(NAME)

$(NAME): $(OBJ)
	@ar -rcs $@ $^
	@echo "${GREEN}[OK]: ${CYAN}$(NAME) ✔️${NOCLR}"

bonus: $(OBJ_BNS)
	@ar -rcs $(NAME) $^
	@echo "${GREEN}[OK]: ${CYAN}$(NAME) ✔️${NOCLR}"

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR) 
	@$(CC) $(CFLAGS) -I $(HEADER) -c $< -o $@
	@printf "$(GREEN)[OK]${NOCLR}: Compiling %-30s | $@\n" "$<"

$(OBJ_DIR):
	@mkdir -p $@

clean:
	@${RM} $(OBJ_DIR)
	@echo "${GREEN}[OK]${NOCLR}: Cleaning ... $(OBJ_DIR)/ ✔️"

fclean: clean
	@${RM} $(NAME)
	@echo "${GREEN}[OK]${NOCLR}: Cleaning ... $(NAME) ✔️"

re: fclean all

.PHONY : all bonus clean fclean re
#===============================================================================
