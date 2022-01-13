# SVM(base on Sequential Minimal Optimization algorithm)
+ smo.m 

smo算法的主程序,输入训练数据和标签，返回对偶问题的拉格朗日乘子$ \alpha $.

+ K.m

该程序用于计算核，提供了linear核以及gauss核的计算。

+ compute_UV.m

该函数用于smo迭代计算中，计算参数的上下界。

+ choose_work_set.m

该函数用于选择需要进行修正的$\alpha$,选择的依据为违反KKT条件最严重的$\alpha$

### 主程序
代码中提供了两个可运行的主程序:

- linear_data.m
- gauss_data.m 

分别展示了线性可分数据的实例和圆形可分数据的实例(分别使用了Lienar kernel 和gauss kernel
