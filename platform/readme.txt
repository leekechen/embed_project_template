1. Linux平台C语言嵌入式软件工程配置概述

	Linux平台嵌入式软件工程从生成的目标文件上来看，可以分为两类：
	
	1. 以发布软件库（静态库，动态库等）为目标文件的工程配置（中间件工程配置）
	
		以软件库为目标文件的工程配置，根据软件库的使用者不同稍有不同：		
		A. 对于同一软件项目团队（可以查看库源代码）而言可以隔离各个模块的软件工程师聚焦于各自负责的模块，提高各个模块间的封装性，减小各个模块之间的偶合性；
		B. 对于非同一软件项目团队（不能查看库源代码）而言，以库文件发布起到了保护知识产权的作用。
		
		以软件库为目标文件的工程配置，适用于SDK库，中间件库，算法库等应用场景。
		
		其发布软件库的方式根据软件开发阶段的不同分为：		
		A. 软件库测试阶段，软件库直接安装于软件库自身工程配置（例如在软件库工程中的lib目录），测试用用例调用、链接安装在工程目录内部的库文件；
		B. 对内发布阶段，软件库安装于软件库自身工程所在同一服务器(例如/usr/platform/module_xxx/lib)，应用工程直接调用、链接本服务器特定目录（此目录可以只由约定人员更新）的库文件；
		C. 对外发布阶段，软件库直接被打包成压缩文件进行发布。
		
		软件库发布目标文件由以下部分组：
		A. 头文件，库输出函数及配置头文件；
		B. 库文件，静态库（或动态库）
		
	2. 以发布可执行程序（Binary， ELF等)为目标文件的工程配置（应用工程配置）
	
		以发布可执行程序为目标文件的工程配置，其目的就是生成可以在目标板运行的可执行文件，目标文件常用的两种格式：
		A. ELF文件格式，包含符号表，加载信息，调试信息的一种文件格式，不能直接将其烧录到目标板，需要使用加载器（IDE+仿真器）才能将其烧录到目标板；
		   这种文件因包含符号表，可以方便的配合仿真器进行调试；
		B. Binary格式，文件不包含任何非程序和程序数据之外的信息，这种格式文件占用空间较小，但因不包含任何附加信息，文件本身无校验方式，需要额外增加校验保证文件传递的正确性。
		
2. Linux平台编译工具链概述
	
	Linux平台通常都用命GCC作为编译工具链，而嵌入式软件的PC平台编译、目标板运行特点，被称为交叉编译(cross compiler).
	
	当前ARM平台使用比较广泛，且持续维护的GCC交叉编译器是linaro组织发布的GCC版本，根据是否使用Linux和API调用规范，有：
	1. armeb-eabi，遵循ARM EABI函数调用规范的适用祼板
	2. armeb-linux-gnueabi，遵循ARM EABI+GNU函数调用规范并使用Linux操作系统的平台
	3. 带hf后缀的，支持硬件浮点处理器的平台
	
	当前采用的交叉编译器版本：
	gcc-linaro-7.3.1-2018.05-x86_64_armeb-eabi.tar.xz
	
	其下载链接：
	http://releases.linaro.org/components/toolchain/binaries/
	
3. 	软件工程的目录结构
	以CS32FX031芯片平台为例说明软件工程的目录结构
	platform----
			├── CS32FX031
			│   ├── app
			│   │   ├── main.c
			│   │   └── Makefile
			│   ├── include
			│   ├── lib
			│   ├── middlewave
			│   │   ├── ai
			│   │   │   ├── include
			│   │   │   │   └── middlewave_example.h
			│   │   │   ├── Makefile
			│   │   │   └── src
			│   │   │       └── middlewave_example.c
			│   │   ├── foc
			│   │   │   ├── include
			│   │   │   │   └── middlewave_example.h
			│   │   │   ├── Makefile
			│   │   │   └── src
			│   │   │       └── middlewave_example.c
			│   │   └── Makefile
			│   ├── modules
			│   │   ├── adc
			│   │   │   ├── include
			│   │   │   │   └── adc_example.h
			│   │   │   ├── Makefile
			│   │   │   └── src
			│   │   │       └── adc_example.c
			│   │   ├── Makefile
			│   │   └── tim
			│   │       ├── include
			│   │       │   └── tim_example.h
			│   │       ├── Makefile
			│   │       └── src
			│   │           └── tim_example.c
			│   ├── readme.txt
			│   ├── scripts
			│   └── test
			│       ├── framework
			│       └── test_case
			│           └── adc
			└── Makefile

	目录说明
		platform是主目录
		CS32FX031是芯片平台目录，
		Makefile是整个平台的目录
		
		                   
4. Makefile使用说明
	简单Makefile举例，
	platform = CS32FX031
	lib_path = /usr/platform/
	
	
	.PHONY
	all :
	    @$(MAKE) -C $(platform)
	    @echo "Make $(platform) finished"
	
	clean :
	    @$(MAKE) -C $(platform) $@
	    @echo "Make $@ finished"
	
	install :
	
	test :
	
	通过配置Makefile变量platform，可以选择需要编译的芯片平台，lib_path可以配置静态库的安装路径
	
	