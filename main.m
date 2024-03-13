a_gps=26500;
e_gps=0.01;
eta_gps=deg2rad(55);
omega_1_gps=deg2rad(0);
omega_2_gps=deg2rad(0);
[r_b,v_b,zenit,Elevation,Azi,closeset,index_close,closest_v]= GPSex1original(a_gps,e_gps,eta_gps,omega_1_gps,omega_2_gps);

% a_gnss=42164.140;
% e_gnss=0;
% eta_gnss=deg2rad(63);
% omega_1_gnss=deg2rad(0);
% omega_2_gnss=deg2rad(0);
% [gnss_r_b,gnss_v_b,gnss_zenit,gnss_Elevation,gnss_Azi,gnss_closeset,gnss_index_close,gnss_closest_v]=  GPSex1original(a_gnss,e_gnss,eta_gnss,omega_1_gnss,omega_2_gnss);
% 
% 
% 
% a_galileo=29994;
% e_galileo=0;
% eta_galileo=deg2rad(56);
% omega_1_galileo=deg2rad(0);
% omega_2_galileo=deg2rad(0);
% [galileo_r_b,galileo_v_b,galileo_zenit,galileo_Elevation,galileo_Azi,galileo_closeset,galileo_index_close,galileo_closest_v]=  GPSex1original(a_galileo,e_galileo,eta_galileo,omega_1_galileo,omega_2_galileo);
% 
% 
% a=6836;
% e=0.004;
% eta=deg2rad(87);
% omega_1=deg2rad(0);
% omega_2=deg2rad(0);
% [champ_r_b,champ_v_b,champ_zenit,champ_Elevation,champ_Azi,champ_closeset,champ_index_close,champ_closest_v]=  GPSex1original(a,e,eta,omega_1,omega_2);

% 
% 
% a=26554;
% e=0.7;
% eta=deg2rad(65);
% omega_1=deg2rad(245);
% omega_2=deg2rad(270);
% [molniya_r_b,molniya_v_b,molniya_zenit,molniya_Elevation,molniya_Azi,molniya_closeset,molniya_index_close,molniya_closest_v]=  GPSex1original(a,e,eta,omega_1,omega_2);
%  
