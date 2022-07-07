function Ope_Q= Get_OpeQ(A, Ope_h, Theta)
    mode = 2;
    if mode == 1
        B = [1/154 0; 0 1/154; 0 0];
        Ope_Q = pinv(B)*(-A*Ope_h);
    else
        h1 = Ope_h(1); h2 = Ope_h(2); h3 = Ope_h(3);
        Theta_1 = Theta(1); Theta_2 = Theta(2); 
        Theta_4 = Theta(4); Theta_5 = Theta(5); Theta_6 = Theta(6);

        Q13 = 0.46 * 0.5 * sign(h1 - h3) * sqrt(2 * 981 * abs(h1- h3));
        Q32 = 0.45 * 0.5 * sign(h3 - h2) * sqrt(2 * 981 * abs(h3- h2));
        Q20 = 0.6 * 0.5 * sqrt(2* 981 * h2);

        f_A1 = -Q13*(1+Theta_4)/154 - Theta_1*sqrt(2*981*h1 )/154;
        f_A2 = (Q32*(1+Theta_6)-Q20*(1+Theta_5))/154 - Theta_2*sqrt(2*981*h2 )/154;

        Ope_Q1 = -154 * f_A1;
        Ope_Q2 = -154 * f_A2;
        Ope_Q = [Ope_Q1, Ope_Q2].';
    end
    Ope_Q(Ope_Q > 150) =150;
    Ope_Q(Ope_Q < 0) =0;
end