- [> Brief Introduction](#-Brief Introduction)
- [> System dynamics](#-System dynamics)
- [> Linearization](#-Linearization)
- [> 故障类型](#-故障类型)
- [> 结果展示](#-结果展示)
- [> My blog](#-my-blog)
- [> 参考文献](#-参考文献)
- [> Paper](#-paper)

## > Brief Introduction

​	This work is developed by Simulink, Matlab R2020b.

​	A three-tank system, as sketched in Fig. 1, has typical characteristics of tanks, pipelines and pumps used in chemical industry and thus often serves as a benchmark process in laboratories for process control.

<img src="https://github.com/zhuofupan/Three-Tank-System/blob/main/TTS.jpg?raw=true" alt="Fig.1：TTS" style="zoom:30%;" />

​	The model and the parameters of the three-tank system introduced here are from the laboratory setup DTS200 [1].


| Parameters                  | Symbol       | Value  | Unit     |
| --------------------------- | ------------ | ------ | -------- |
| cross section area of tanks | $\mathcal A$ | $154$  | $cm^2$   |
| cross section area of pipes | $s_n$        | $0.5$  | $cm^2$   |
| max. height of tanks        | $H_{max}$    | $62$   | $cm$     |
| max. flow rate of pump 1    | $Q_{1max}$   | $150$  | $cm^3/s$ |
| max. flow rate of pump 2    | $Q_{2max}$   | $150$  | $cm^3/s$ |
| coeff. of flow for pipe 1   | $a_1$        | $0.46$ |          |
| coeff. of flow for pipe 2   | $a_2$        | $0.60$ |          |
| coeff. of flow for pipe 3   | $a_3$        | $0.45$ |          |


## > System dynamics

​	Applying the incoming and outgoing mass flows under consideration of Torricelli’s law, the dynamics of DTS200 is modeled by

<div align="left">

$$ 
\begin{equation}
    \begin{split}
        &\mathcal A\dot{h_1}=Q_1-Q_{13},\mathcal A\dot{h_2}=Q_2+Q_{32}-Q_{20},\mathcal A\dot{h_3}=Q_{13}-Q_{32}\\
        &Q_{13}=a_1s_{13}sign(h_1-h_3)\sqrt{2g|h_1-h_3|}  \\
        &Q_{32}=a_3s_{23}sign(h_3-h_2)\sqrt{2g|h_3-h_2|},Q_{20}=a_2s_0\sqrt{2gh_2}  \\
    \end{split}
\end{equation}
$$

</div>

## > Linearization

​	The linear form of the above model can be achieved by a linearization at an operating point as follows:

<div align=center>

$$ 
\begin{equation}
    \begin{split}
\begin{array}{l}
\dot x = Ax + Bu,y = Cx\\
x = \left[ {\begin{array}{*{20}{c}}
{{h_1} - {h_{1,o}}}\\
{{h_2} - {h_{2,o}}}\\
{{h_3} - {h_{3,o}}}
\end{array}} \right],u = \left[ {\begin{array}{*{20}{c}}
{{Q_1} - {Q_{1,o}}}\\
{{Q_2} - {Q_{2,o}}}
\end{array}} \right],{Q_o} = \left[ {\begin{array}{*{20}{c}}
{{Q_{1,o}}}\\
{{Q_{2,o}}}
\end{array}} \right]\\
A = \frac{{\partial f}}{{\partial g}}\left| {_{h = {h_o}},B = } \right.\left[ {\begin{array}{*{20}{c}}
{\begin{array}{*{20}{c}}
{\frac{1}{{\cal A}}}\\
0\\
0
\end{array}}&{\begin{array}{*{20}{c}}
0\\
{\frac{1}{{\cal A}}}\\
0
\end{array}}
\end{array}} \right],C = \left[ {\begin{array}{*{20}{c}}
1&0&0\\
0&1&0\\
0&0&1
\end{array}} \right]
\end{array}
    \end{split}
\end{equation}
$$

</div>

<div align=center>

$$ {}
\begin{equation}
    \begin{split}
        f\left( h \right) = \left[ {\begin{array}{*{20}{c}}
{\frac{-a_1 s_{13}sign(h_1-h_3)\sqrt{2g|h_1-h_3|})}{{\cal A}}}\\
{\frac{a_3 s_{23}sign(h_3-h_2)\sqrt{2g|h_3-h_2|}-a_2s_0\sqrt{2gh_2})}{{\cal A}}}\\
{\frac{a_1 s_{13}sign(h_1-h_3)\sqrt{2g|h_1-h_3|}-a_3s_{23}sign(h_3-h_2)\sqrt{2g|h_3-h_2|}}{{\cal A}}}
\end{array}} \right],h = \left[ {\begin{array}{*{20}{c}}
{h_1}\\
{h_2}\\
{h_3}
\end{array}} \right]
    \end{split}
\end{equation}
$$
  
</div>

## > 故障类型

### 变量:  
u = Q1, Q2  
y = h1, h2, h3  
x = h1, h2, h3  

### Input Disturbances  
Q1: 0.05; Q2: 0.02  
v1, v2, v3: 1e-4  
h1, h2, h3: 0.02  

### Fault start = 200  

<div align=center>

$$ {}
\begin{equation}
    \begin{split}
        &\mathcal{A} \dot{h}_1 = Q_1 + f_1 + f_2 -  Q_{13} - f_7 \check Q_{10} + \omega_1\\
        &\mathcal{A} \dot{h}_2 = Q_2 + f_1 + f_3 + Q_{32} - f_8 (f_{11}+1) \check Q_{20} + \omega_2 \\
        &\mathcal{A} \dot{h}_3 = Q_{13} -  Q_{32} - f_9 \check Q_{30} + \omega_3\\ 
        &Q_{13} =  a_1 s_{13} (f_{10}+1) sign(h_1-h_3) \sqrt{2g \left| h_1 - h_3 \right| } \\
        &Q_{32} =  a_3 s_{23} (f_{12}+1) sign(h_3-h_2) \sqrt{2g \left| h_3 - h_2 \right| } \\
        &\check Q_{i0} =  a_i s_{0} \sqrt{2g h_i }, i = 1,2,3
    \end{split}
\end{equation}
$$
  
</div>

<div align=center>

| Fault ID |                         Description                          | Location |
| :------: | :----------------------------------------------------------: | :------: |
|    1     |             $f_1(t) =  6 \sin\frac{t-200}{6\pi}$             | Actuator |
|    2     |                   $f_2(t) =  0.02(t-200)$                    | Actuator |
|    3     | $f_3(t) = 0.005(t-200) + (-1)^{\lfloor \frac{t}{48}  - \frac{5}{4}\lfloor \frac{t}{60} \rfloor\rfloor }$ | Actuator |
|    4     |                   $f_4(t) = -0.005(t-200)$                   |  Sensor  |
|    5     |                   $f_5(t) = 0.005(t-200)$                    |  Sensor  |
|    6     |                   $f_6(t) = 0.008(t-200)$                    |  Sensor  |
|  7,8,9   |          $f_7(t) =f_8(t) =f_9(t) = 0.00005 (t-200)$          | Process  |
|    10    |                 $f_{10}(t) =-0.0002(t-200)$                  | Process  |
|    11    |                 $f_{11}(t) =-0.0003(t-200)$                  | Process  |
|    12    |                 $f_{12}(t) =-0.0005(t-200)$                  | Process  |

</div>

### Train:  
[train].mat -> normal (16008 × 5)  
### Test:  
model1[train].mat  -> fault01 (2001 × 5), ..., fault12 (2001 × 5)  

## > 结果展示



## > My blog

[ResearchGate](https://www.researchgate.net/profile/Zhuofu-Pan), [知乎](https://www.zhihu.com/people/fu-zi-36-41/posts), [CSDN](https://blog.csdn.net/fuzimango/article/list/)

QQ群：640571839

## > 参考文献



## > Paper

希望大家多支持支持我们的工作，欢迎交流探讨~
