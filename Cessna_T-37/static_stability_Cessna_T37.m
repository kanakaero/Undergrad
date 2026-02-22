%% Aircraft DATA Cessna T37 A
AR = 6.27;              % Aspect Ratio
A = 12.4;               % ft - Distance between Nose and AC of C_tip
b = 14;                 % ft - wingspan
b_H = 14;               % ft - Horizontal Tail span
b_V = 4.8;              % ft - Vertical Tail span
mac_w = 5.47;           % ft - MAC wing
c_ail = 1.2;            % ft - Aileron chord
c_R = 1.4;              % ft - Rudder Chord
C_r = 6.2;              % ft - Root Chord Wing
C_r_H = 4.6;            % ft - Root Chord Horizontal Tail
C_r_V = 4.6;            % ft - Root Chord Vertical Tail
C_t = 4.5;              % ft - Tip Chord Wing
C_t_H = 2.2;            % ft - Tip Chord Horizontal Tail
C_t_V = 2.5;            % ft - Tip Chord Vertical Tail
d = 4;                  % ft - Maximum Fuselage height at Wing Body intersection
l_b = 29.2;             % ft - Hrizontal length of the aircraft
l_cg = 11.4;            % ft - Moment arm of cg
r1 = 2.2;               % ft - Fuselage Height (including fin) at Root Chord AC of Vertical tail
S_w = 182;              % ft² - Planform Area of the Wing
S_B_s = 80.2;           % ft² - Fuselage Side Surface Area
S_f_avg = 8.7;          % ft² - Average Fuselage Cross Sectional Area
S_p_v = 1.9;            % ft² - Fuselage Cross sectional Area where flow turns from Potential to Viscous
w_max = 9;              % ft - Max Fuselage width (due to engine intakes)
X_AC_R = 5.1;           % ft - Distance between LE of C_r_V and AC of Rudder
X_HV = 1.5;             % ft - Distance between LE of C_r_V and LE of C_r_H
X_WH_r = 15.9;          % ft - Distance between LE of C_r and LE of C_r_H
X_WV_r = X_WH_r-X_HV;   % ft - Distance between LE of C_r and LE of C_r_V
X_1 = 26.6;             % ft - Location on fuselage where flow turns from Potential to Viscous
y_A_1 = 9.9;            % ft - Inboard Location of aileron on wing
y_A_0 = 16.6;           % ft - Outboard Location of aileron on wing
y_R_I = 0;              % ft - Inboard Location of Rudder
y_R_F = 4.4;            % ft - Outboard Location of Rudder
y_V = 1.7;              % ft - Vertical distance between FRL and C_r_V
Z_H = -3.1;             % ft - Vertcal distance between FRL and C_r_H
Z_R_s = 3.6;            % ft - Moment Arm for Rudder
z_1 = 4.3;              % ft - Fuselage Diameter before canopy
z_2 = 2.1;              % ft - Fuselage Diameter just before Tail
Z_H_s = -3.1;           % ft - Vertical Distance Horizontal Stabiliser
z_max = 4.4;            % ft - Max Fuselage height including canopy
Z_W = 0;                % ft - Vertical Distance between Wing Root and FRL
Z_WH_r = 3;             % ft - Vertical Distance between Wing Root axis and Horizontal Tail root axis
gamma_H = 0;            % deg - Horizontal Tail Dihedral Angle
gamma_W = 3;            % deg - Wing Dihedral Angle
epsilon_H = 2;          % deg - Twist Angle Horizontal Stabliser
epsilon_W = 2;          % deg - Wing twist angle (aerodynamic twist) - angle between zero lift lines
Delta_LE = 1.5;         % deg - Sweep Angle Wing
Delta_LE_H = 12.5;      % deg - Sweep Angle Horizontal Stabliser
Delta_LE_V = 33;        % deg - Sweep Angle Vertical Stabliser
Z_WH = 3.1;             % ft - Vertical Distance between FRL and ftAC of Horizontal Tail

%% Flight Conditions DATA
h = 30000;                          % ft - Altitude
[T,a,P,rho] = atmosisa(h*.3048);    % Flow Properties at 30k ft
M = 0.459;                          % Mach Number
Vp1 = 456;                          % ft/s - Perturbation Velocity
q = 92.7;                           % lbs/ft² - Dynamic Pressure
X_cg = 0.27;                        % cg location as fraction of fuselage length
W = 6360;                           % lbs - Weight
alpha = 2;                          % deg - AoA
mu = 3.823*10^-4;                   % Dynamic Viscosity at 30k ft        

%% Wing Parameters
lambda = C_t/C_r;                                                         % Taper Ratio Wing
Delta_LE = Delta_LE*pi/180;                                               % rad
Delta_LE_half = atan((tan(Delta_LE))-((2*(1-lambda))/(AR*(1+lambda))));   % rad - Geometric Relation
Delta_LE_quarter = atan((tan(Delta_LE))-((1-lambda)/(AR*(1+lambda))));    % rad - Geometric Relation
X_mac_w = ((b*(1+(2*lambda)))/(6*(1+lambda)))*tan(Delta_LE);              % ft - Distance between LE of C_r and LE of mac

%% Horizontal Tail Parameters
Delta_LE_H = Delta_LE_H*pi/180;                                                     % rad
lambda_H = C_t_H/C_r_H;                                                             % Taper Ratio Horizontal Tail
mac_H = (2/3)*C_r_H*((1+lambda_H+(lambda_H)^2)/(1+lambda_H));                       % ft - MAC of Horizontal Tail
X_mac_H = ((b_H*(1+(2*lambda_H)))/(6*(1+lambda_H)))*tan(Delta_LE_H);                % ft - Distance between LE of C_r_H and LE of mac_H
S_H = (b_H/2)*C_r_H*(1+lambda_H);                                                   % ft² - Planform Area Horizontal Tail
AR_H = (b_H^2)/S_H;                                                                 % Aspect Ratio Horizontal Tail
Delta_LE_half_H = atan((tan(Delta_LE_H))-((2*(1-lambda_H))/(AR_H*(1+lambda_H))));   % rad - Geometric Relation
Delta_LE_quarter_H = atan((tan(Delta_LE_H))-(((1-lambda_H))/(AR_H*(1+lambda_H))));  % rad - Geometric Relation

%% Wing Hirizontal Tail Geometric Properties
X_WH = X_WH_r - (C_r/4) + (C_r_H/4);            % ft - distance between Wing root AC and Horizontal Tail root AC
m = Z_WH*2/b;                                   % Geometric Parameter
r = X_WH*2/b;                                   % Geometric Parameter
X_AC_H = X_WH_r + X_mac_H + (mac_H/4)-X_mac_w;  % ft - distance between Wing mac AC and Horizontal Tail mac AC

%% Wing Lift Slope Coefficient
k = 1+(((8.2-(2.3*Delta_LE))-AR*(0.22-(0.153*Delta_LE)))/100);                                          % From Polhamus Formula
C_L_alpha_w = (2*pi*AR)/(2+sqrt(((AR^2*(1-M^2)/k^2)*(1+(((tan(Delta_LE_half))^2)/(1-M^2))))+4));        % From Polhamus Formula Mach = M
C_L_alpha_w_o= (2*pi*AR)/(2+sqrt(((AR^2*(1)/k^2)*(1+(((tan(Delta_LE_half))^2)/(1))))+4));               % From Polhamus Formula Mach = 0

%% Downwash on Horizontal Tail
K_AR = (1/AR)-(1/(1+(AR^1.7)));                                                     % Parameter to calculate d epsilon/d alpha at Mach = 0
K_lambda = (10-(3*lambda))/7;                                                       % Parameter to calculate d epsilon/d alpha at Mach = 0
K_mr = (1 - (m/2))/(r^0.333);                                                       % Parameter to calculate d epsilon/d alpha at Mach = 0
dEps_dalpha_o = 4.44*((K_AR*K_lambda*K_mr*sqrt(cos(Delta_LE_quarter))^1.19));       % d epsilon/d alpha at Mach = 0
dEps_dalpha = dEps_dalpha_o*(C_L_alpha_w/C_L_alpha_w_o);                            % d epsilon/d alpha at Flight Conditions
alpha_H = alpha*(1-dEps_dalpha);                                                    % rad - Effective AoA at Horizontal Tail   
K_mr_o = 1/(r^0.333); 
dEps_dalpha_m_o = 4.44*((K_AR*K_lambda*K_mr_o*sqrt(cos(Delta_LE_quarter))^1.19));   % d epsilon/d alpha at Mach = 0, m = 0

%% Wing Aerodynamic Center
p1 = (tan(Delta_LE))/(sqrt(1-(M^2)));   % Parameter to determine K1 and K2 from the plots
p2 = AR*tan(Delta_LE);                  % Parameter to determine K1 and K2 from the plots
k1 = 1.15;                              % Parameter to determine wing AC (from plots)
k2 = 0.1;                               % Parameter to determine wing AC (from plots)
xd_AC_Cr = 0.2;                         % Parameter to determine wing AC (from plots)
x_AC_w = k1*(xd_AC_Cr-k2);              % ft - Location of Wing AC

%% Effect of Body on AC Munk's Theory
X_H = X_mac_w + X_AC_H - C_r;                                       % ft - Distance between Wing TE and AC of Horizontal Tail MAC
w_i = [0.29 0.5 .54 .78 0.78 0.37 0.25 0.20 0.18 0.06];             % Fuselage Widths in inches
s_f = 9/0.94;                                                       % Scale Factor
w_i = w_i.*s_f;                                                     % in ft
x_i = [0.83 0.53 0.19 0.48 0.16 0.15 0.45 0.75 1.05 1.15];          % position of fuselage widths (middle of section)
x_i = x_i*s_f;                                                      % in ft
Del_x_i = [0.3 0.3 0.38 0.32 0.32 0.3 0.3 0.3 0.3 0.2];             % relative position of fuselage section
Del_x_i = Del_x_i*s_f;                                              % in ft
x_i_c_f = x_i./C_r;
x_i_x_H = x_i./X_H;
dEps_dalpha_M_m_o = dEps_dalpha_m_o*(C_L_alpha_w/C_L_alpha_w_o);
dEps_dalpha_i = [1.1 1.2 1.6 1.3 (x_i_x_H(5)*(1-dEps_dalpha_M_m_o)) ...   % d eps/ d alpha m = 0 for every iteration
    (x_i_x_H(6)*(1-dEps_dalpha_M_m_o)) (x_i_x_H(7)*(1-dEps_dalpha_M_m_o)) ...
    (x_i_x_H(8)*(1-dEps_dalpha_M_m_o)) (x_i_x_H(9)*(1-dEps_dalpha_M_m_o)) (x_i_x_H(10)*(1-dEps_dalpha_m_o))];
Del_x_AC_b = 0;                                                     % init
for i=1:10                                                          % Number of Fuselage Sections             
Del_x_AC_b = Del_x_AC_b - (1/(q*C_L_alpha_w*S_w*mac_w)*(w_i(i)^2)*dEps_dalpha_i(i)*Del_x_i(i));   % Change in AC due to body
end

%% Horizontal Tail Lift Slope Coefficient
k_H = 1+(((8.2-(2.3*Delta_LE_H))-AR_H*(0.22-(0.153*Delta_LE_H)))/100);                                  % From Polhamus Formula
C_L_alpha_H = (2*pi*AR_H)/(2+sqrt(((AR_H^2*(1-M^2)/k^2)*(1+(((tan(Delta_LE_half_H))^2)/(1-M^2))))+4));  % From Polhamus Formula

%% Modelling of X_AC_wb
X_AC_wb = x_AC_w + Del_x_AC_b;

eta_H = 0.9;        % Assumption
tau_e = 0.4;        % Assumption

%% Longitudinal Stability And Control Deriviatives 
C_L_alpha = C_L_alpha_w + (C_L_alpha_H*eta_H*(S_H/S_w)*dEps_dalpha);
C_L_delev = eta_H*(S_H/S_w)*C_L_alpha_H*tau_e;
C_L_i_H = eta_H*(S_H/S_w)*C_L_alpha_H;
C_m_alpha = (C_L_alpha_w*(X_cg - X_AC_wb)) - (C_L_alpha_H*eta_H*(S_H/S_w)*(1-dEps_dalpha)*((X_AC_H - X_cg)/(mac_w)));
C_m_delev = -1*C_L_alpha_H*eta_H*(S_H/S_w)*tau_e*((X_AC_H - X_cg)/(mac_w));
C_m_i_H = -1*C_L_alpha_H*eta_H*(S_H/S_w)*((X_AC_H - X_cg)/(mac_w));

%% C_L_alpha_dot and C_m_alpha_dot
C_L_alpha_dot = 2*C_L_alpha_H*eta_H*(S_H/S_w)*dEps_dalpha*((X_AC_H - X_cg)/(mac_w));
C_m_alpha_dot = -2*C_L_alpha_H*eta_H*(((X_AC_H - X_cg)/(mac_w))^2)*dEps_dalpha;

%% Aircraft Aerodynamic Center
x_AC = (X_AC_wb + (C_L_alpha_H/C_L_alpha_w)*eta_H*(S_H/S_w)*(1-dEps_dalpha)*X_AC_H/(mac_w))/(1 + (C_L_alpha_H/C_L_alpha_w)*eta_H*(S_H/S_w)*(1-dEps_dalpha));

%% Static Margin
SM = (X_cg - x_AC)/(mac_w);

%% Modelling C_L_q
B = sqrt(1 - ((M^2)*(cos(Delta_LE_quarter)^2)));
C_L_q_w_o = (0.5 + 2*((x_AC_w - X_cg)/(mac_w)))*C_L_alpha_w_o;
C_L_q_w = ((AR + (2*cos(Delta_LE_quarter)))/((AR*B) + (2*cos(Delta_LE_quarter))))*C_L_q_w_o;
C_L_q_H = 2*C_L_alpha_H*eta_H*(S_H/S_w)*((X_AC_H - X_cg)/(mac_w));
C_L_q = C_L_q_H + C_L_q_w;

%% Modelling C_m_q
K_q = 0.7;              % Correlation Coefficient from plot
C = (((AR*0.5*abs((x_AC_w - X_cg)/mac_w)) + (2*(abs((x_AC_w - X_cg)/mac_w)^2)))/(AR + (2*cos(Delta_LE_quarter)))) + (((1/24)*(AR^3)*tan(Delta_LE_quarter))/(AR + (6*cos(Delta_LE_quarter)))) + (1/8);
C_m_q_w_o = -1*K_q*C_L_alpha_w_o*cos(Delta_LE_quarter)*C;
C_m_q_w = (((((AR^3)*tan(Delta_LE_quarter))/((AR*B) + (6*cos(Delta_LE_quarter)))) + (3/B))/((((AR^3)*tan(Delta_LE_quarter))/((AR) + (6*cos(Delta_LE_quarter)))) + (3)))*C_m_q_w_o;
C_m_q_H = -2*C_L_alpha_H*eta_H*(S_H/S_w)*(((X_AC_H - X_cg)/mac_w)^2);
C_m_q = C_m_q_w + C_m_q_H;

%% Vertical Tail Geometric Properties
b_2v = b_V*2;                                                                       % ft² - twice the span of vertical tail
lambda_V = C_t_V/C_r_V;                                                             %  Taper Ratio of the vertical tail
S_2v = 0.5*b_2v*C_r_V*(1+lambda_V);                                                 % ft² - Area of the Vertical Tail
AR_V = (b_2v^2)/S_2v;                                                               % Aspect Ratio Vertical Tail
mac_V = (2/3)*C_r_V*((1+lambda_V+lambda_V^2)/(1+lambda_V));                         % ft - MAC of the Vertical Tail
Delta_LE_V = Delta_LE_V*pi/180;                                                     % rad
X_mac_V = ((b*(1+(2*lambda_V)))/(6*(1+lambda_V)))*tan(Delta_LE_V);                  % ft - Distance between LE of C_r_V and LE of mac_V
Y_mac_V = ((b*(1+(2*lambda_V)))/(6*(1+lambda_V)));                                  % ft - Distance between C_r_V and mac_V along Y
Delta_LE_half_V = atan((tan(Delta_LE_V))-((2*(1-lambda_V))/(AR_V*(1+lambda_V))));   % rad - Geometric Relation

%% Wing Horizontal Tail Geometric Properties
X_cg_r = X_mac_w + (X_cg*mac_w);                                            % ft - Distance between LE of wing root and cg
X_V_s = X_WV_r + (mac_w/4) + X_mac_V - X_cg_r;                              % ft - Distance between cg and AC of mac_V
Z_V_s = y_V + Y_mac_V;                                                      % ft - Distance between FRL and mac_V
X_R_s = X_WV_r +    X_AC_R - X_cg_r;                                        % ft - Distance between cg and Rudder AC

%% Vertical Tail Lift Slope Coefficient
p_1 = b_V/(2*r1);                                                                                                       % parameter for AR_V_eff
p_2 = Z_H/b_V;                                                                                                          % parameter for AR_V_eff
p_3 = S_H/S_2v;                                                                                                         % parameter for AR_V_eff
X_AC_H_V = X_mac_H + 0.25*mac_H;                                                                                        % parameter for AR_V_eff
p_4 = X_AC_H_V/mac_V;                                                                                                   % parameter for AR_V_eff
c1 = 1.6;                                                                                                               % from plot
c2 = 0.82;                                                                                                              % from plot
K_HV = 1.05;                                                                                                            % from plot
AR_V_eff = c1*AR_V*(1+(K_HV*(c2 - 1)));                                                                                 % Effect AR at Vertical Tail
k_V = 1+(((8.2-(2.3*Delta_LE_V))-AR_V_eff*(0.22-(0.153*Delta_LE_V)))/100);                                              % From Polhamus Formula
C_L_alpha_V_eff = (2*pi*AR_V_eff)/(2+sqrt(((AR_V_eff^2*(1-M^2)/k_V^2)*(1+(((tan(Delta_LE_half_V))^2)/(1-M^2))))+4));    % 1/rad - From Polhamus Formula 
C_L_alpha_V_eff_o= (2*pi*AR_V_eff)/(2+sqrt(((AR_V_eff^2*(1)/k_V^2)*(1+(((tan(Delta_LE_half_V))^2)/(1))))+4));           % 1/rad - From Polhamus Formula Mach = 0

%% Wing Body Contribution

%% Wing Contribution to the Dihedral Effect to the geometric Dihedral Angle
C_L_beta_gamma_w = -1.6*(10^-4);                                                    % From Plot
par1 = AR/cos(Delta_LE_half);                                                       % Parameter for K_m_gamma
par2 = M*cos(Delta_LE_half);                                                        % Parameter for K_m_gamma
K_m_gamma = 1.08;                                                                   % From Plot  
C_L_beta_wb_gda = 57.3*gamma_W*(C_L_beta_gamma_w*K_m_gamma);                        % Dihedral Effect due to geometric dihedral angle

%% Wing contribution to the dihedral effect due to wing-fuselage position
d_B = sqrt(S_f_avg/0.7854);                                                         % ft - Fuselage Average Diameter
C_L_beta_wb_low_wing = (1.2*sqrt(AR)*Z_W*2*d_B)/(b^2);                              % Dihedral Effect due to wing-fuselage position     

%% Wing contribution to the Dihedral effect due to the Wing Sweep Angle
C_L_1 = W/(q*S_w);                                                                  % C_L for the Flight Conditions
C_L1_C_L_beta = -0.5*(10^-3);                                                       % From plot
p1 = AR/(cos(Delta_LE_half));                                                       % Parameter for K_M_Delta
p2 = M*cos(Delta_LE_half);                                                          % Parameter for K_M_Delta
K_M_Delta = 1.05;                                                                   % From Plot
p = A/b;                                                                            % Parameter for K_f
K_f = 0.9;                                                                          % From Plot
C_L_beta_wb_Delta_w = 57.3*C_L_1*(C_L1_C_L_beta*K_M_Delta*K_f);                     % Dihedral effect due to the Wing Sweep Angle

%% Wing contribution to the Dihedral effect due to the Wing AR
C_L_beta_C_L1 = -1*(10^-3);                                                         % From Plot using lambda and AR
C_L_beta_wb_AR_w = 57.3*C_L_1*C_L_beta_C_L1;                                        % Dihedral effect due to the Wing AR

%% Wing contribution to the dihedral effect doe to wing twist angle
Del_C_L_beta_eps_tan_Del_c_4 = -2.25*(10^-5);                                                       % From Plot using AR and lambda
C_L_beta_wb_twist = 57.3*epsilon_W*(pi/180)*tan(Delta_LE_quarter)*Del_C_L_beta_eps_tan_Del_c_4;     % Dihedral effect due to the Wing Twist

%% Fuselage contribution to the dihedral effect
Del_C_L_beta_gamma_w = -0.0005*AR*(d_B/b)^2;                                        % Contibution
C_L_beta_wb_f_gda = 57.3*gamma_W*(C_L_beta_gamma_w*Del_C_L_beta_gamma_w);           % Dihedral Effect due to geometric dihedral angle


%% FINAL C_L_beta_wb
C_L_beta_wb = C_L_beta_wb_gda + C_L_beta_wb_low_wing + C_L_beta_wb_Delta_w + C_L_beta_wb_AR_w + C_L_beta_wb_twist + C_L_beta_wb_f_gda;

%% Vertical Tail Contribution
eta_V = 0.9;                                                                                                                                                                    % Vertical Tail Efficiency
p1 = b_V/(2*r1);                                                                                                                                                                % Parameter for K_Y_V
K_Y_V = 0.76;                                                                                                                                                                   % K_Y_V
eta_V_d_sigma_d_beta = 0.724 + (3.06*((0.5*S_2v/S_w)/(1+cos(Delta_LE_quarter)))) + (0.4*Z_W/d) + (0.009*AR);                                                                    % another term
C_L_beta_V = -1*K_Y_V*abs(C_L_alpha_V_eff)*eta_V_d_sigma_d_beta*((0.5*S_2v/S_w)/(1+cos(Delta_LE_quarter)))*(((Z_V_s*cos(alpha*pi/180)) - (X_V_s*sin(alpha*pi/180)))/b);         % Vertical Tail Contribution

%% FINAL C_L_beta
C_L_beta = C_L_beta_wb + C_L_beta_V;                % 1/rad - C_L_beta

%% Modelling C_Y_beta
C_Y_beta_w = -0.0001*abs(gamma_W)*57.3;                                     % Wing Contribution
p = Z_W/(d/2);                                                              % Parameter for K_int
K_int = 0;                                                                  % Mid Wing so 0
C_Y_beta_B = -2*K_int*(S_p_v/S_w);                                          % Body Contribution
C_Y_beta = 0;                                                               % Horizontal Tail 0 due to negligible dihedral angle
C_Y_beta_V = -K_Y_V*abs(C_L_alpha_V_eff)*eta_V_d_sigma_d_beta*(S_2v/S_w);   % Vertical Tail Contribution
C_Y_beta = C_Y_beta_w + C_Y_beta_B + C_Y_beta_V;                            % C_Y_beta

%% Modelling C_n_beta
C_n_beta_w = 0;                                                                         % Wing Contribution
p1 = l_cg/l_b;                                                                          % Parameter for K_N
p2 = (l_b^2)/S_B_s;                                                                     % Parameter for K_N
p3 = sqrt(z_1/z_2);                                                                     % Parameter for K_N
p4 = z_max/w_max;                                                                       % Parameter for K_N
K_N = 0.0002;                                                                           % From Plot
Re_fuselage = Vp1*l_b/mu;                                                               % Reynolds Number of Fuselage
K_RE_i = 1.7;                                                                           % From Plot
C_n_beta_B = -57.3*K_N*K_RE_i*(S_B_s/S_w)*(l_b/b);                                      % Fuselage/Body Contribution
C_n_beta_V = -C_Y_beta_V*(((X_V_s*cos(alpha*pi/180)) + (Z_V_s*sin(alpha*pi/180)))/b);   % Vertical Tail Contribution
C_n_beta = C_n_beta_B + C_n_beta_V;                                                     % C_n_beta

%% Modelling C_L_p
Beta = sqrt(1 - M^2);                                       % Beta      
k = C_L_alpha_w*Beta/(2*pi);                                % k
p1 = Beta*AR/k;                                             % Parameter for RDP
Delta_beta = atan(tan(Delta_LE_quarter)/Beta)*180/pi;       % deg - Parameter for RDP
RDP = -0.40;                                                % RDP
C_L_p_wb = RDP*k/Beta;                                      % Wing Body Contribution
k_H = (C_L_alpha_H*Beta)/(2*pi);           -0.0996                 % k_H
p2 = Beta*AR/k_H;                                           % Parameter for RDP_H
Delta_beta_H = atan(tan(Delta_LE_quarter_H)/Beta)*180/pi;   % deg - Parameter for RDP_H
RDP_H = -0.49;                                              % RDP_H
C_L_p_H = (RDP_H*Beta/k_H)*0.5*(S_H/S_w)*(b_H/b)^2;         % Horizontal Tail Contribution
C_L_p_V = 2*C_Y_beta_V*((Z_V_s/b)^2);                       % Vertical Tail Contribution
C_L_p = C_L_p_V + C_L_p_H + C_L_p_wb;                       % C_L_p

%% Modelling C_n_r
C_n_r_C_L_1 = -0.2;                                                                         % From Graph
C_n_r_w = C_n_r_C_L_1*C_L_1^2;                                                              % Wing Contribution
C_n_r_V = 2*C_Y_beta_V*(((X_V_s*cos(alpha*pi/180)) + (Z_V_s*sin(alpha*pi/180)))/(b^2));     % Vertical Tail Contribution
C_n_r = C_n_r_V + C_n_r_w;                                                                  % C_n_r