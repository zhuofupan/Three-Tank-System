- [> Brief Introduction](#-brief-introduction)
- [> System dynamics](#-system-dynamics)
- [> Linearization](#-linearization)
- [> Fault description](#-fault-description)
  - [Train:](#train)
  - [Test:](#test)
- [> My blog](#-my-blog)
- [> References](#-references)

## > Brief Introduction

​	This work is developed by Simulink, Matlab R2020b.

​	A three-tank system, as sketched in Fig. 1, has typical characteristics of tanks, pipelines and pumps used in chemical industry and thus often serves as a benchmark process in laboratories for process control.

<img src="https://github.com/zhuofupan/Three-Tank-System/blob/main/TTS.jpg?raw=true" alt="Fig.1：TTS" style="zoom:30%;" />

​	The model and the parameters of the three-tank system introduced here are from the laboratory setup DTS200 (see [3]).


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

$ s_{13} = s_{23} = s_0  = s_n = 0.5\ cm^2$

## > System dynamics

​	Input variables:
$ u = [Q1\ Q2]^T$
​	Measurements:
$ y = [h_1\ h_2\ h_3]^T $

​	Applying the incoming and outgoing mass flows under consideration of Torricelli’s law, the dynamics of DTS200 is modeled by

$$
\begin{equation}
    \begin{split}
        &\mathcal A\dot{h_1}=Q_1-Q_{13},\mathcal A\dot{h_2}=Q_2+Q_{32}-Q_{20},\mathcal A\dot{h_3}=Q_{13}-Q_{32}\\
        &Q_{13}=a_1s_{13}sign(h_1-h_3)\sqrt{2g|h_1-h_3|}  \\
        &Q_{32}=a_3s_{23}sign(h_3-h_2)\sqrt{2g|h_3-h_2|},Q_{20}=a_2s_0\sqrt{2gh_2}  \\
    \end{split}
\end{equation}
$$

## > Linearization

​	The linear form of the above model can be achieved by a linearization at an operating point as follows:

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

$$
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

## > Fault description

​	Twelve different faults were injected starting at the 200th sample.

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

​	The system contianed fault signals can be represented by

$$
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

​	The collected training and testing data sets can be describled as
### Train:  
[train].mat -> normal (16008 × 5)  
### Test:  
model1[train].mat  -> fault01 (2001 × 5), ..., fault12 (2001 × 5)


## > My blog

[ResearchGate](https://www.researchgate.net/profile/Zhuofu-Pan), [知乎](https://www.zhihu.com/people/fu-zi-36-41/posts), [CSDN](https://blog.csdn.net/fuzimango/article/list/)

QQ Group：640571839

## > References
[1] Z. Pan, H. Chen, Y. Wang, B. Huang, and W. Gui, "[A new perspective on ae-and vae-based process monitoring](https://www.techrxiv.org/articles/preprint/A_New_Perspective_on_AE-_and_VAE-based_Process_Monitoring/19617534)," TechRxiv, Apr. 2022, doi.10.36227/techrxiv.19617534. </br>
[2] S. X. Ding, "[Data-driven design of fault diagnosis and fault-tolerant control systems](https://link.springer.com/content/pdf/10.1007/978-1-4471-6410-4.pdf)," London, U.K.: Springer, 2014.</br>
[3] Z. Pan, Y. Wang, k. Wang, G. Ran, H. Chen, and W. Gui, "Layer-Wise Contribution-Filtered Propagation for Deep Learning-Based Fault Isolation," Int. J. Robust Nonlinear Control, Jul. 2022, doi.10.1002/rnc.6328 </br>
[4] Z. Pan, Y. Wang, K. Wang, H. Chen, C. Yang, and W. Gui, "[Imputation of Missing Values in Time Series Using an Adaptive-Learned Median-Filled Deep Autoencoder](https://ieeexplore.ieee.org/document/9768200)", IEEE Trans. Cybern., 2022, doi.10.1109/TCYB.2022.3167995 </br>
[5] Y. Wang, Z. Pan, X. Yuan, C. Yang, and W. Gui, "[A novel deep learning based fault diagnosis approach for chemical process with extended deep belief network](https://www.sciencedirect.com/science/article/pii/S0019057819302903?via%3Dihub),” ISA Trans., vol. 96, pp. 457–467, 2020. </br>
[6] Z. Pan, Y. Wang, X. Yuan, C. Yang, and W. Gui, "[A classification-driven neuron-grouped sae for feature representation and its application to fault
classification in chemical processes](https://www.sciencedirect.com/science/article/pii/S0950705121006122) ," Knowl.-Based Syst., vol. 230, p. 107350, 2021. </br>
