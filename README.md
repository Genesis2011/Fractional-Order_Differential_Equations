# Fractional-Order Differential Equations
分数阶微分方程实例求解

paper文件夹：参考的论文

code文件夹：根据formula.md中的公式实现的例子，并绘图

​	运行main.m即可，其余为自定义函数

formula.md：“A Numerical Method for Delayed Fractional-Order.pdf”论文中用到的公式整理

Reference文件夹：老师提供的参考资料

------

formula.md中的公式：

$$a_{j,n+1}=\frac{h^{\alpha}}{\alpha (\alpha+1)}\qquad\times \left\{ \begin{array}{ll}n^{\alpha}-(n-\alpha)(n+1)^{\alpha}, & \textrm{j=0}\\ (n-j+2)^{\alpha+1}+(n-j)^{\alpha+1}-2(n-j+1)^{\alpha+1}, & \textrm{1<=j<=n}\\  1, & \textrm{j=n+1}\end{array} \right.$$

$$y_{n+1}=\sum_{k=0}^{m-1}\varphi_{k}\frac{t^{k}_{n+1}}{k!}\qquad+\frac{h^{\alpha}}{\Gamma (\alpha+2)}f(t_{n+1},y_{n+1}^{p},v_{n+1})\qquad+\frac{1}{\Gamma (\alpha)}\sum_{j=0}^{n}a_{j,n+1}f(t_{j},y_{j},v_{j})\qquad$$

$$v_{n+1}= \left\{ \begin{array}{ll}\delta y_{n-m+2}+(1-\delta)y_{n-m+1}, & \textrm{if m>1}\\ \delta y^{p}_{n+1}+(1-\delta)y_{n}, & \textrm{if m=1}\end{array} \right.$$

$$y^{p}_{n+1}=\sum^{m-1}_{k=0}\varphi_{k}\frac{t^{k}_{n+1}}{k!}\qquad+\frac{1}{\Gamma (\alpha)}\sum_{j=0}^{n}b_{j,n+1}f(t_{j},y_{j},v_{j})\qquad$$

$$b_{j,n+1}=\frac{h^{\alpha}}{\alpha}((n-j+1)^{\alpha}-(n-j)^{\alpha})\qquad$$

