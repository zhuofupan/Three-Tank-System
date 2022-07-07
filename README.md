- [> 简介](#-简介)
- [> 线性化模型](#-线性化模型)
- [> 故障类型](#-故障类型)
- [> 结果展示](#-结果展示)
- [> My blog](#-my-blog)
- [> 参考文献](#-参考文献)
- [> Paper](#-paper)

## > 简介

​	> 仿真软件版本信息: Matlab R2020b

​	A three-tank system, as sketched in Fig. 1, has typical characteristics of tanks, pipelines and pumps used in chemical industry and thus often serves as a benchmark process in laboratories for process control. The model and the parameters of the three-tank system introduced here are from the laboratory setup DTS200.

<img src="https://github.com/zhuofupan/Three-Tank-System/blob/main/TTS.jpg?raw=true" alt="Fig.1：TTS" style="zoom:70%;" />



| Parameters                  | Symbol       | Value   | Unit     |
| --------------------------- | ------------ | ------- | -------- |
| cross section area of tanks | $\mathcal A$ | $154$   | $cm^2$   |
| cross section area of pipes | $s_n$        | $0.5$   | $cm^2$   |
| max. height of tanks        | $H_{max}$    | $62$    | $cm$     |
| max. flow rate of pump 1    | $Q_{1max}$   | $120$   | $cm^3/s$ |
| max. flow rate of pump 2    | $Q_{2max}$   | $120$   | $cm^3/s$ |
| coeff. of flow for pipe 1   | $a_1$        | $0.475$ |          |
| coeff. of flow for pipe 2   | $a_2$        | $0.6$   |          |
| coeff. of flow for pipe 3   | $a_3$        | $0.475$ |          |

Applying the incoming and outgoing mass flows under consideration of Torricelli’s law, the dynamics of DTS200 is modeled by
$$
\mathcal A\dot{h_1}=Q_1-Q_{13},\mathcal A\dot{h_2}=Q_2+Q_{32}-Q_{20},\mathcal A\dot{h_3}=Q_{13}-Q_{32}\\
Q_{13}=a_1s_{13}sign(h_1-h_3)\sqrt{2g|h_1-h_3|}\\
Q_{32}=a_3s_{23}sign(h_3-h_2)\sqrt{2g|h_3-h_2|},Q_{20}=a_2s_0\sqrt{2gh_2}
$$






## > 线性化模型




## > 故障类型

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

| Fault ID |                         Description                          | Location  |
| :------: | :----------------------------------------------------------: | :-------: |
|    1     | $$Q_1^{(s)} = Q_{1,0}^{(s)} + \sin\frac{\pi}{6}t,\\Q_2^{(s)} = Q_{2,0}^{(s)} + \sin\frac{\pi}{6}t$$ | $Q_1,Q_2$ |
|    2     |              $Q_1^{(s)} = Q_{1,0}^{(s)} +0.02t$              |   $Q_1$   |
|    3     | $Q_2^{(s)} = Q_{2,0}^{(s)} +0.05t+5\left[u(t-60n)-u(t-48-60n)\right],n=0,1,2,\cdots$ |   $Q_2$   |
|    4     |              $h_1^{(s)} = h_{1,0}^{(s)}-0.005t$              |   $h_1$   |
|    5     |              $h_2^{(s)} = h_{2,0}^{(s)}+0.005t$              |   $h_2$   |
|    6     |              $h_3^{(s)} = h_{3,0}^{(s)}+0.008t$              |   $h_3$   |
|    7     |        $h_1^{(s)} = h_{1,0}^{(s)}+0.00005t,t\leq6000$        |   $h_1$   |
|    8     |        $h_2^{(s)} = h_{2,0}^{(s)}+0.00005t,t\leq6000$        |   $h_2$   |
|    9     |        $h_3^{(s)} = h_{3,0}^{(s)}+0.00005t,t\leq6000$        |   $h_3$   |
|    10    |        $h_1^{(s)} = h_{1,0}^{(s)}-0.0002t,t\leq5000$         |   $h_1$   |
|    11    |        $h_2^{(s)} = h_{2,0}^{(s)}-0.0003t,t\leq3333$         |   $h_2$   |
|    12    |        $h_3^{(s)} = h_{3,0}^{(s)}-0.0005t,t\leq2000$         |   $h_3$   |

## > 结果展示



## > My blog

[ResearchGate](https://www.researchgate.net/profile/Zhuofu-Pan), [知乎](https://www.zhihu.com/people/fu-zi-36-41/posts), [CSDN](https://blog.csdn.net/fuzimango/article/list/)

QQ群：640571839

## > 参考文献



## > Paper

希望大家多支持支持我们的工作，欢迎交流探讨~
