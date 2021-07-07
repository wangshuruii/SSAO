#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <iostream>
#include <stb_image.h>
#include <stdio.h>

/*#include <backends/imgui_impl_glfw.h>
#include <backends/imgui_impl_opengl3.h>
#include <imgui.h>*/

#include "camera.h"
#include "config.h"
#include "gl_env.h"
#include "shader.h"

float screen_width = 800;
float screen_height = 600;
float cube_length = 0.3f;
float cube_dist = 0.3f;
float vertices[] = {
    -cube_length, -cube_length, -cube_length, 0.0f,  0.0f,  -1.0f, 0.0f,  0.0f,
    cube_length,  -cube_length, -cube_length, 0.0f,  0.0f,  -1.0f, 1.0f,  0.0f,
    cube_length,  cube_length,  -cube_length, 0.0f,  0.0f,  -1.0f, 1.0f,  1.0f,
    cube_length,  cube_length,  -cube_length, 0.0f,  0.0f,  -1.0f, 1.0f,  1.0f,
    -cube_length, cube_length,  -cube_length, 0.0f,  0.0f,  -1.0f, 0.0f,  1.0f,
    -cube_length, -cube_length, -cube_length, 0.0f,  0.0f,  -1.0f, 0.0f,  0.0f,

    -cube_length, -cube_length, cube_length,  0.0f,  0.0f,  1.0f,  0.0f,  0.0f,
    cube_length,  -cube_length, cube_length,  0.0f,  0.0f,  1.0f,  1.0f,  0.0f,
    cube_length,  cube_length,  cube_length,  0.0f,  0.0f,  1.0f,  1.0f,  1.0f,
    cube_length,  cube_length,  cube_length,  0.0f,  0.0f,  1.0f,  1.0f,  1.0f,
    -cube_length, cube_length,  cube_length,  0.0f,  0.0f,  1.0f,  0.0f,  1.0f,
    -cube_length, -cube_length, cube_length,  0.0f,  0.0f,  1.0f,  0.0f,  0.0f,

    -cube_length, cube_length,  cube_length,  -1.0f, 0.0f,  0.0f,  1.0f,  0.0f,
    -cube_length, cube_length,  -cube_length, -1.0f, 0.0f,  0.0f,  1.0f,  1.0f,
    -cube_length, -cube_length, -cube_length, -1.0f, 0.0f,  0.0f,  0.0f,  1.0f,
    -cube_length, -cube_length, -cube_length, -1.0f, 0.0f,  0.0f,  0.0f,  1.0f,
    -cube_length, -cube_length, cube_length,  -1.0f, 0.0f,  0.0f,  0.0f,  0.0f,
    -cube_length, cube_length,  cube_length,  -1.0f, 0.0f,  0.0f,  1.0f,  0.0f,

    cube_length,  cube_length,  cube_length,  1.0f,  0.0f,  0.0f,  1.0f,  0.0f,
    cube_length,  cube_length,  -cube_length, 1.0f,  0.0f,  0.0f,  1.0f,  1.0f,
    cube_length,  -cube_length, -cube_length, 1.0f,  0.0f,  0.0f,  0.0f,  1.0f,
    cube_length,  -cube_length, -cube_length, 1.0f,  0.0f,  0.0f,  0.0f,  1.0f,
    cube_length,  -cube_length, cube_length,  1.0f,  0.0f,  0.0f,  0.0f,  0.0f,
    cube_length,  cube_length,  cube_length,  1.0f,  0.0f,  0.0f,  1.0f,  0.0f,

    -cube_length, -cube_length, -cube_length, 0.0f,  -1.0f, 0.0f,  0.0f,  1.0f,
    cube_length,  -cube_length, -cube_length, 0.0f,  -1.0f, 0.0f,  1.0f,  1.0f,
    cube_length,  -cube_length, cube_length,  0.0f,  -1.0f, 0.0f,  1.0f,  0.0f,
    cube_length,  -cube_length, cube_length,  0.0f,  -1.0f, 0.0f,  1.0f,  0.0f,
    -cube_length, -cube_length, cube_length,  0.0f,  -1.0f, 0.0f,  0.0f,  0.0f,
    -cube_length, -cube_length, -cube_length, 0.0f,  -1.0f, 0.0f,  0.0f,  1.0f,

    -cube_length, cube_length,  -cube_length, 0.0f,  1.0f,  0.0f,  0.0f,  1.0f,
    cube_length,  cube_length,  -cube_length, 0.0f,  1.0f,  0.0f,  1.0f,  1.0f,
    cube_length,  cube_length,  cube_length,  0.0f,  1.0f,  0.0f,  1.0f,  0.0f,
    cube_length,  cube_length,  cube_length,  0.0f,  1.0f,  0.0f,  1.0f,  0.0f,
    -cube_length, cube_length,  cube_length,  0.0f,  1.0f,  0.0f,  0.0f,  0.0f,
    -cube_length, cube_length,  -cube_length, 0.0f,  1.0f,  0.0f,  0.0f,  1.0f

};
unsigned int indices[] = { 0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11,
                          12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23,
                          24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35 };

// world space positions of our cubes
float cube_distance = cube_length * 2+cube_dist;
glm::vec3 cubePositions[] = {
    glm::vec3(0.0f,  0.0f,  0.0f),
    glm::vec3(cube_distance,  0.0f, 0.0f),
    glm::vec3(0.0f, 0.0f, cube_distance),
    glm::vec3(-cube_distance, 0.0f, 0.f),
    glm::vec3(0.0f, 0.0f, -cube_distance),
    glm::vec3(cube_distance,  0.0f, cube_distance),
    glm::vec3(cube_distance, 0.0f, -cube_distance),
    glm::vec3(-cube_distance,  0.0f, -cube_distance),
    glm::vec3(-cube_distance,  0.0f, cube_distance),

    glm::vec3(cube_distance*2,  0.0f, 0.0f),
    glm::vec3(cube_distance*2,  0.0f, cube_distance),
    glm::vec3(cube_distance*2,  0.0f, -cube_distance),
    glm::vec3(-cube_distance*2,  0.0f, 0.0f),
    glm::vec3(-cube_distance*2,  0.0f, cube_distance),
    glm::vec3(-cube_distance*2,  0.0f, -cube_distance),
    glm::vec3(0.0f,  0.0f, cube_distance*2),
    glm::vec3(cube_distance,  0.0f, cube_distance*2),
    glm::vec3(-cube_distance,  0.0f, cube_distance*2),
    glm::vec3(0.0f,  0.0f, -cube_distance * 2),
    glm::vec3(cube_distance,  0.0f, -cube_distance * 2),
    glm::vec3(-cube_distance,  0.0f, -cube_distance * 2),
    glm::vec3(-cube_distance * 2,  0.0f, -cube_distance * 2),
    glm::vec3(cube_distance * 2,  0.0f, -cube_distance * 2),
    glm::vec3(-cube_distance * 2,  0.0f, cube_distance * 2),
    glm::vec3(cube_distance * 2,  0.0f, cube_distance * 2),
};

// 选取一个合适的初始位置
Camera camera(glm::vec3(1.38915f, 1.05779f, 2.4052f), glm::vec3(0.0f, 1.0f, 0.0f), 241.8f, -17.4f);
float last_x = screen_width / 2.0f, last_y = screen_width / 2.0f;
bool first_mouse = true;

float delta_time = 0.0f, last_frame = 0.0f;

float light_location[] = { 1.0f, 1.0f, 1.0f };
float light_color[] = { 1.0f, 1.0f, 1.0f };
float strength[] = { 0.2f, 2.0f, 1.0f, 16.0f };

bool free_sight = false;

void framebuffer_size_callback(GLFWwindow* window, int width, int height) {
    glViewport(0, 0, width, height);
    screen_width = width;
    screen_height = height;
}
void mouse_callback(GLFWwindow* window, double xpos, double ypos) {
    if (first_mouse) {
        last_x = xpos;
        last_y = ypos;
        first_mouse = false;
    }
    float xoffset = xpos - last_x;
    float yoffset = last_y - ypos;
    last_x = xpos;
    last_y = ypos;
    camera.ProcessMouseMovement(xoffset, yoffset);
}
void processInput(GLFWwindow* window) {
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);

    if (glfwGetKey(window, GLFW_KEY_W) == GLFW_PRESS)
        camera.ProcessKeyboard(FORWARD, delta_time);
    if (glfwGetKey(window, GLFW_KEY_S) == GLFW_PRESS)
        camera.ProcessKeyboard(BACKWARD, delta_time);
    if (glfwGetKey(window, GLFW_KEY_A) == GLFW_PRESS)
        camera.ProcessKeyboard(LEFT, delta_time);
    if (glfwGetKey(window, GLFW_KEY_D) == GLFW_PRESS)
        camera.ProcessKeyboard(RIGHT, delta_time);
    if (glfwGetKey(window, GLFW_KEY_SPACE) == GLFW_PRESS)
        camera.ProcessKeyboard(JUMP, delta_time);
    if (glfwGetKey(window, GLFW_KEY_LEFT_SHIFT) == GLFW_PRESS)
        camera.ProcessKeyboard(DOWN, delta_time);
}
void key_callback(GLFWwindow* window, int key, int scancode, int action,
    int mods) {
    if (key == GLFW_KEY_E && action == GLFW_PRESS) {
        if (free_sight) {
            glfwSetCursorPosCallback(window, nullptr);
            glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_NORMAL);
        }
        else {
            glfwSetCursorPosCallback(window, mouse_callback);
            glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_DISABLED);
            first_mouse = true;
        }
        free_sight = !free_sight;
    }
}
void scroll_callback(GLFWwindow* window, double xoffset, double yoffset) {
    camera.ProcessMouseScroll(yoffset);
}

int main() {
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
#ifdef __APPLE__
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
#endif
    GLFWwindow* window = glfwCreateWindow(800, 600, "SSAO", NULL, NULL);
    if (window == NULL) {
        std::cout << "Failed to create GLFW window" << std::endl;
        glfwTerminate();
        return -1;
    }
    glfwMakeContextCurrent(window);
    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)) {
        std::cout << "Failed to initialize GLAD" << std::endl;
        return -1;
    }

    /*IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO();
    ImGui_ImplGlfw_InitForOpenGL(window, true);
    ImGui_ImplOpenGL3_Init("#version 330");
    ImGui::StyleColorsDark();*/

    unsigned int VAO;
    glGenVertexArrays(1, &VAO);
    glBindVertexArray(VAO);

    unsigned int VBO;
    glGenBuffers(1, &VBO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

    unsigned int EBO;
    glGenBuffers(1, &EBO);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices,
        GL_STATIC_DRAW);

    //三个属性：顶点、法向量、XXX
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float),
        (void*)(3 * sizeof(float)));
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 8 * sizeof(float),
        (void*)(6 * sizeof(float)));
    glEnableVertexAttribArray(2);

    Shader shader_program(DATA_DIR "/shader.vert", DATA_DIR "/shader.frag");
    Shader shader_light_program(DATA_DIR "/shader.vert",
        DATA_DIR "/shader_light.frag");

    stbi_set_flip_vertically_on_load(true);
    int width, height, nrChannels;
    unsigned char* data;

    unsigned int texture1;
    glGenTextures(1, &texture1);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, texture1);
    // 为当前绑定的纹理对象设置环绕、过滤方式
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    // 加载并生成纹理
    data = stbi_load(DATA_DIR "/色彩纹理图.bmp", &width, &height, &nrChannels, 0);
    if (data) {
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB,
            GL_UNSIGNED_BYTE, data);
        glGenerateMipmap(GL_TEXTURE_2D);
    }
    else {
        std::cout << "Failed to load texture1" << std::endl;
    }
    stbi_image_free(data);

    unsigned int texture2;
    glGenTextures(1, &texture2);
    glActiveTexture(GL_TEXTURE1);
    glBindTexture(GL_TEXTURE_2D, texture2);
    // 为当前绑定的纹理对象设置环绕、过滤方式
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    // 加载并生成纹理
    data = stbi_load(DATA_DIR "/法向图.bmp", &width, &height, &nrChannels, 0);
    if (data) {
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB,
            GL_UNSIGNED_BYTE, data);
        glGenerateMipmap(GL_TEXTURE_2D);
    }
    else {
        std::cout << "Failed to load texture2" << std::endl;
    }
    stbi_image_free(data);

    glm::mat4 model;
    glm::mat4 view;
    glm::mat4 projection;

    glViewport(0, 0, screen_width, screen_height);
    glEnable(GL_DEPTH_TEST);
    glfwSetFramebufferSizeCallback(window, framebuffer_size_callback);
    glfwSetScrollCallback(window, scroll_callback);
    glfwSetKeyCallback(window, key_callback);
    while (!glfwWindowShouldClose(window)) {
        float current_frame = glfwGetTime();
        delta_time = current_frame - last_frame;
        last_frame = current_frame;
        glClearColor(0.2f, 0.3f, 0.3f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        processInput(window);
        
        /*ImGui_ImplOpenGL3_NewFrame();
        ImGui_ImplGlfw_NewFrame();
        ImGui::NewFrame();*/

        shader_program.use();
        shader_program.setInt("texture_color", 0);
        shader_program.setInt("texture_normal", 1);
        shader_program.setVec3("LightColor", light_color[0], light_color[1],
            light_color[2]);
        shader_program.setVec3("LightLocation", light_location[0],
            light_location[1], light_location[2]);
        shader_program.setVec3("ViewLocation", camera.Position);
        shader_program.setVec4("Strength", strength[0], strength[1], strength[2],
            strength[3]);
        view = camera.GetViewMatrix();
        shader_program.setMat4("view", view);
        projection = glm::perspective(glm::radians(camera.Zoom),
            screen_width / screen_height, 0.1f, 100.0f);
        shader_program.setMat4("projection", projection);

        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, texture1);
        glActiveTexture(GL_TEXTURE1);
        glBindTexture(GL_TEXTURE_2D, texture2);
        glBindVertexArray(VAO);
        // 对每个面计算TBN矩阵
        for (int j = 0; j < 25; ++j)
        {
            for (int i = 0; i < 12; ++i) {//六个面
                glm::vec3 tangent, bitangent;
                int bias = 6 * 8 * i;
                glm::vec3 pos1(vertices[0 * 8 + 0 + bias], vertices[0 * 8 + 1 + bias],
                    vertices[0 * 8 + 2 + bias]);
                glm::vec3 pos2(vertices[1 * 8 + 0 + bias], vertices[1 * 8 + 1 + bias],
                    vertices[1 * 8 + 2 + bias]);
                glm::vec3 pos3(vertices[2 * 8 + 0 + bias], vertices[2 * 8 + 1 + bias],
                    vertices[2 * 8 + 2 + bias]);
                //printf("%lf%lf%lf\n", pos1.x, pos1.y, pos1.z);
                glm::vec2 uv1(vertices[0 * 8 + 6 + bias], vertices[0 * 8 + 7 + bias]);
                glm::vec2 uv2(vertices[1 * 8 + 6 + bias], vertices[1 * 8 + 7 + bias]);
                glm::vec2 uv3(vertices[2 * 8 + 6 + bias], vertices[2 * 8 + 7 + bias]);

                glm::vec3 edge1 = pos2 - pos1;
                glm::vec3 edge2 = pos3 - pos1;
                glm::vec2 delta_uv1 = uv2 - uv1;
                glm::vec2 delta_uv2 = uv3 - uv1;
                float f = 1.0f / (delta_uv1.x * delta_uv2.y - delta_uv2.x * delta_uv1.y);
                tangent.x = f * (delta_uv2.y * edge1.x - delta_uv1.y * edge2.x);
                tangent.y = f * (delta_uv2.y * edge1.y - delta_uv1.y * edge2.y);
                tangent.z = f * (delta_uv2.y * edge1.z - delta_uv1.y * edge2.z);
                tangent = glm::normalize(tangent);
                bitangent.x = f * (-delta_uv2.x * edge1.x + delta_uv1.x * edge2.x);
                bitangent.y = f * (-delta_uv2.x * edge1.y + delta_uv1.x * edge2.y);
                bitangent.z = f * (-delta_uv2.x * edge1.z + delta_uv1.x * edge2.z);
                bitangent = glm::normalize(bitangent);
                shader_program.setVec3("tangent", tangent);
                shader_program.setVec3("bitangent", bitangent);
                //printf("%lf%lf%lfxxx%lf%lf%lf\n", tangent.x, tangent.y, tangent.z, bitangent.x, bitangent.y, bitangent.z);
            
                glm::mat4 model = glm::mat4(1.0f); // make sure to initialize matrix to identity matrix first
                model = glm::translate(model, cubePositions[j]);
                shader_program.setMat4("model", model);

                glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT,
                    (const void*)(6 * i * sizeof(float)));
            }
        }
        glBindVertexArray(0);

        shader_light_program.use();
        shader_light_program.setVec3("LightColor", light_color[0], light_color[1],
            light_color[2]);
        model = glm::mat4(1.0f);
        model = glm::translate(
            model,
            glm::vec3(light_location[0], light_location[1], light_location[2]));
        model = glm::scale(model, glm::vec3(0.1, 0.1, 0.1));
        shader_light_program.setMat4("model", model);
        view = camera.GetViewMatrix();
        shader_light_program.setMat4("view", view);
        projection = glm::perspective(glm::radians(camera.Zoom),
            screen_width / screen_height, 0.1f, 100.0f);
        shader_light_program.setMat4("projection", projection);

        glBindVertexArray(VAO);
        glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT, 0);
        glBindVertexArray(0);

        /*ImGui::Begin("Parameters");
        ImGui::ColorEdit3("Light Color", light_color);
        ImGui::SliderFloat3("Light Position", light_location, -1.0f, 1.0f);
        ImGui::SliderFloat3("Strength", strength, 0.0f, 5.0f);
        ImGui::SliderFloat("Shiniess", &strength[3], 0.0f, 128.0f);
        ImGui::End();
        ImGui::Render();
        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());*/

        glfwSwapBuffers(window);
        glfwPollEvents();
    }
    
    /*ImGui_ImplOpenGL3_Shutdown();
    ImGui_ImplGlfw_Shutdown();
    ImGui::DestroyContext();*/

    glfwTerminate();
    return 0;
}
