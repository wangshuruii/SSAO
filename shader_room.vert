#version 330 core
layout (location = 3) in vec3 aPos;
layout (location = 4) in vec3 aNormal;
layout (location = 5) in vec2 aTexCoord;
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform vec3 tangent;
uniform vec3 bitangent;
out vec2 TexCoord;
out vec3 FragLocation;
out mat3 TBN;
void main() {
  gl_Position = projection * view * model * vec4(aPos, 1.0);
  TexCoord = aTexCoord;
  FragLocation = vec3(model * vec4(aPos, 1.0));
  mat3 normal_matrix = mat3(transpose(inverse(model)));
  vec3 T = normalize(normal_matrix * tangent);
  vec3 B = normalize(normal_matrix * bitangent);
  vec3 N = normalize(normal_matrix * aNormal);
  TBN = mat3(T,B,N);
}
