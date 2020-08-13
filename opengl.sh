#!/bin/bash
curr=$(pwd)
option=1
# 1 to install, 0 to uninstall
if [ -n "$1" ]; then
	if [ $1 -eq "1" ]
	then
		option=1
	else
		option=0
	fi
fi
if [ $option -eq 1 ]
then
	sudo echo "安装OpenGL..."
	sudo apt-get install make -y
	sudo apt-get install cmake -y
	sudo apt-get install build-essential -y
	sudo echo "安装glut..."
	sudo apt-get install libgl1-mesa-dev -y
	sudo apt-get install libglu1-mesa-dev -y
	sudo apt-get install freeglut3-dev -y
	if [ -d "${HOME}/OpenGLtest" ]
	then
		sudo rm -rf ${HOME}/OpenGLtest
	fi
	mkdir ${HOME}/OpenGLtest
	# http://glad.dav1d.de/
	# glad库文件取决于OpenGL的版本号
	sudo echo "安装glad..."
	if [ ! -f "glad.zip" ]
	then
		echo "没有找到glad.zip，已结束"
		exit
	else
		unzip glad.zip -d glad
		if [ -d "/usr/local/include/glad" ]
		then
			sudo rm -rf /usr/local/include/glad
		fi
		sudo cp -r glad/include/glad /usr/local/include
		if [ -d "/usr/local/include/KHR" ]
		then
			sudo rm -rf /usr/local/include/KHR
		fi
		sudo cp -r glad/include/KHR /usr/local/include
		cp glad/src/glad.c ${HOME}/OpenGLtest/glad.c
		rm -rf glad
	fi
	sudo apt-get install libxrandr-dev -y
	sudo apt-get install libsdl2-dev -y
	# git clone https://github.com/glfw/glfw.git
	sudo echo "安装glfw..."
	if [ ! -f "glfw.zip" ]
	then
		echo "没有找到glfw.zip，已结束"
		exit
	else
		unzip glfw.zip -d ${HOME}/OpenGLtest
		cd ${HOME}/OpenGLtest/glfw
		cmake .
		sudo make
		sudo make install
		make clean
		cd $curr
		sudo chown ${USER}: -R ${HOME}/OpenGLtest
	fi
	touch ${HOME}/OpenGLtest/Makefile
	touch ${HOME}/OpenGLtest/test1.c
	touch ${HOME}/OpenGLtest/test2.c
	touch ${HOME}/OpenGLtest/version.c
cat > ${HOME}/OpenGLtest/Makefile << END_TEXT
all: version test1 test2
.PHONY: all
version:
	gcc version.c -o version -lGL -lGLU -lglut
test1:
	gcc test1.c -o test1 -lGL -lGLU -lglut
test2:
	gcc test2.c glad.c -o test2 -lglfw3 -lGL -lm -lXrandr -lXi -lX11 -lXxf86vm -lpthread -ldl -lXinerama -lXcursor
clean:
	rm -rf version test1 test2
END_TEXT
cat > ${HOME}/OpenGLtest/version.c << END_TEXT
#include <stdio.h>
#include <GL/glut.h>

int main(int argc, char **argv)
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(300, 300);
	glutInitWindowPosition(100, 100);
	glutCreateWindow("OpenGL Version");
	printf("OpenGL实现厂商：%s\n", glGetString(GL_VENDOR));
	printf("渲染器标识符：%s\n", glGetString(GL_RENDERER));
	printf("OpenGL版本号：%s\n", glGetString(GL_VERSION));
	printf("GLU工具库版本号：%s\n", gluGetString(GLU_VERSION));
	return 0;
}
END_TEXT
cat > ${HOME}/OpenGLtest/test1.c << END_TEXT
#include <GL/glut.h>

void init(void)
{
    glClearColor(0.0, 0.0, 0.0, 0.0);
    glMatrixMode(GL_PROJECTION);
    glOrtho(-5, 5, -5, 5, 5, 15);
    glMatrixMode(GL_MODELVIEW);
    gluLookAt(0, 0, 10, 0, 0, 0, 0, 1, 0);
    return;
}

void display(void)
{
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(1.0, 0, 0);
    glutWireTeapot(3);
    glFlush();
    return;
}

int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);
    glutInitWindowPosition(0, 0);
    glutInitWindowSize(300, 300);
    glutCreateWindow("OpenGL 3D View");
    init();
    glutDisplayFunc(display);
    glutMainLoop();
    return 0;
}
END_TEXT
cat > ${HOME}/OpenGLtest/test2.c << END_TEXT
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <stdio.h>
#include <stdlib.h>

void framebuffer_size_callback(GLFWwindow *window, int width, int height); //回调函数原型声明
void processInput(GLFWwindow *window);
const unsigned int SCR_WIDTH = 800;
const unsigned int SCR_HEIGHT = 600;

int main(int argc, char *argv[])
{
    //初始化GLFW
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    //创建一个窗口对象
    GLFWwindow *window = glfwCreateWindow(SCR_WIDTH, SCR_HEIGHT, "FirstGL", NULL, NULL);
    if (window == NULL)
    {
        printf("Failed to create GLFW window\n");
        glfwTerminate();
        return -1;
    }
    //通知GLFW将我们窗口的上下文设置为当前线程的主上下文
    glfwMakeContextCurrent(window);
    //对窗口注册一个回调函数,每当窗口改变大小，GLFW会调用这个函数并填充相应的参数供你处理
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
    //初始化GLAD用来管理OpenGL的函数指针
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
    {
        printf("Failed to initialize GLAD\n");
        return -1;
    }
    //渲染循环
    while (!glfwWindowShouldClose(window))
    {
        // 输入
        processInput(window);
        // 渲染指令
        glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);
        // 检查并调用事件，交换缓冲
        glfwSwapBuffers(window); //检查触发事件
        glfwPollEvents();        //交换颜色缓冲
    }
    //释放/删除之前的分配的所有资源
    glfwTerminate();
    return EXIT_SUCCESS;
}

//输入控制，检查用户是否按下了返回键(Esc)
void processInput(GLFWwindow *window)
{
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, 1);
}

// 当用户改变窗口的大小的时候，视口也应该被调整
void framebuffer_size_callback(GLFWwindow *window, int width, int height)
{
    // 注意：对于视网膜(Retina)显示屏，width和height都会明显比原输入值更高一点。
    glViewport(0, 0, width, height);
}
END_TEXT
	cd ${HOME}/OpenGLtest
	make
	echo
	./version
	make clean
	cd $curr
	echo "已经成功安装OpenGl"
	echo "已经成功安装glad"
	echo "已经成功安装glfw"
	echo "[1]主目录下的OpenGLtest中有test1.c、test2.c和version.c等测试文件"
	echo "[2]若使用glad库需将主目录下的OpenGLtest/glad.c和源代码放在同一目录下"
	echo "[3]通过主目录下的OpenGLtest/glfw/examples可以测试glfw"
	echo "OpenGL参考文档"
	echo "http://docs.gl/"
else
	sudo echo "卸载OpenGL..."
	sudo apt-get --purge remove libgl1-mesa-dev -y
	sudo apt-get --purge remove libglu1-mesa-dev -y
	sudo apt-get --purge remove freeglut3-dev -y
	sudo apt-get --purge remove libxrandr-dev -y
	sudo apt-get --purge remove libsdl2-dev -y
	sudo apt-get autoremove -y
	if [ -d "${HOME}/OpenGLtest" ]
	then
		sudo rm -rf ${HOME}/OpenGLtest
	fi
	sudo rm -rf /usr/local/include/GLFW
	sudo rm -rf /usr/local/include/glad
	sudo rm -rf /usr/local/include/KHR
	sudo rm -rf /usr/local/lib/cmake/glfw3
	sudo rm -rf /usr/local/lib/pkgconfig/glfw3.pc
	sudo rm -rf /usr/local/lib/libglfw3.a
fi

