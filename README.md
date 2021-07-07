# SSAO
2020 图形学大作业


multi-cube实现多个立方体呈现，预留接口（还没有加入gui修改立方体大小和间距）


配置assimp库：

参考教程：https://blog.csdn.net/u012278016/article/details/105788231?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522162565771716780261938759%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=162565771716780261938759&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduend~default-2-105788231.first_rank_v2_pc_rank_v29&utm_term=assimp&spm=1018.2226.3001.4187

库源码下载：https://github.com/assimp/assimp/releases/tag/v5.0.1

cmake生成x64文件

修改visual studio配置

a. 项目属性 ----> C/C++ —> 附加包含目录 —> your_path\assimp-master\include
b. 项目属性 ----> 链接器 —> 常规 —> 附加库目录 —> your_path\lib
c. 项目属性 ----> 链接器 —> 输入 —> 附加依赖项 —> assimp-vc140-mtd.lib

将.dll放在C:\Windows\System32中
