# **ft_printf42** #
This project is an implementation of ft_printf, a custom printf function in C, developed using my libft library that contains over 40 utility functions.
- It handles all standard printf `flags` **(-, +, #, 0, )**.
- It handles all standard printf `conversions` **(c, s, p, d, i, u, x, X, %)**.
- It includes a **Makefile** that simplifies the process of using the ft_printf function. The Makefile generates a static `libftprintf.a` library.
- It includes **Unit Tests** for each flag and conversion.

## **ft_printf Unit tests** ##
To help 1337 coding school | (42 Network) students better understand `flags` and `conversions`, I have included unit tests for each case.

**Run the tests**
```bash
make tests
```

**Unit tests Output** :
[<img width="1479" alt="Image" src="https://github.com/user-attachments/assets/74fc7aee-5a7b-49da-b0ce-a75ed887c7c1" />]()

## **Usage Guide** ##

#### 1. Clone the repository ####
```bash
git clone https://github.com/exoks/ft_printf42.git
cd ft_printf42
```

#### 2. Compile the project ####
- Run the following command to build the library:

```bash
make
```
- This will generate the `libftprintf.a` static library.

#### 3. Using the Library #### 
- To compile your program with `ft_printf`, use one of the following methods:

##### Direct Linking #####
```bash
cc -Wall -Wextra -Werror -Iinclude -Ilibft/include test.c libftprintf.a -o foo 
```
- Or

##### Using the Library Flag #####
```bash
cc -Wall -Wextra -Werror -Iinclude -Ilibft/include test.c -L. -lftprintf -o foo
```

> NOTE  
> - Replace `test.c` with your actual source file.

#### 4. Cleanup #### 
- To remove Object files, run:
```bash
make clean
```

- To remove `libftprintf.a` and object files, run:
```bash
make fclean
```

---
