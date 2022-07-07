function value= Solve_Opeh3(h1, h2, h3, Theta_3, Theta_4, Theta_6)
    value = 0.46 * 0.5 * (1+ Theta_4)* sign(h1-h3) * sqrt(2*981*abs(h1-h3)) - ...
        0.45 * 0.5 *(1+ Theta_6)* sign(h3-h2) * sqrt(2*981*abs(h3-h2)) - Theta_3*sqrt(2*981*h3);
end