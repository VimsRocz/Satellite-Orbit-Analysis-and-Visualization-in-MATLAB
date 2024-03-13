function [r_b,v_b,zenit,Elevation,Azi,closeset,index_close,closest_v,r_i1]=main(a,e,eta,omega_1,omega_2)


   GM= 398600.44;  
    n = sqrt(GM/(a*a*a))   %mean angular velocity/mean motion
    T= 2*pi/(n);
                      

k=1;
    for i=0:10:2*T
        time(:,k)=T;
        M= n *(i-0);                        %mean anomly
    E0=M;
    err=1;
    while(err>10^-12)
    E= M+e*sin(E0);
    err=abs(E-E0);                      % I want to understand this step
    E0=E;                               % eccentric anomly
    end
   v=2*atan(sqrt(1+e)*tan(E/2)/sqrt(1-e));    %atan2 is not working   % true anomly


    r = a*(1-e*cos(E));                          %distance of the satellite

    r_b= [r*cos(v);r*sin(v);0]  ;                %position vector in the orbit system
    r_b1(k,:)=[a*(cos(E)-e);a*(sqrt(1-(e*e)))*sin(E);0];   %position vector in the orbit system


       v_b(k,:)=[-a*n*sin(E)*a/r,a*n*sqrt(1-(e*e))*cos(E)*a/r,0];    %velocity vector in the orbit system
  
    
     r_3_omega_1= [cos(-omega_1) sin(-omega_1) 0;-sin(-omega_1) cos(-omega_1) 0;0 0 1];
      r_3_omega_2= [cos(-omega_2) sin(-omega_2) 0;-sin(-omega_2) cos(-omega_2) 0;0 0 1];
     r_1=[1 0 0;0 cos(-eta) sin(-eta);0 -sin(-eta) cos(-eta)];
     r_i= r_3_omega_1*r_1*r_3_omega_2*r_b;
     r_i1(k,:)=transpose(r_i);
    
        w_a=((2*pi)/86164);
       phi=w_a*(i-0);
       r_phi= [cos(phi) sin(phi) 0;-sin(phi) cos(phi) 0;0 0 1];
       r_e=r_phi*r_i;
       r_e1(k,:)=r_phi*r_i ;
       z_lat(k,:)= r_e1(k,3);
       y_lat(k,:)=r_e1(k,2);
       x_lat(k,:)=r_e1(k,1);
      lat(k,:)= atan2((z_lat(k,:)),(sqrt((x_lat(k,:)*x_lat(k,:))+(y_lat(k,:)*y_lat(k,:)))));
      long(k,:)= atan2(y_lat(k,:),x_lat(k,:))  ;
         
   
   r_w=[4075.53022;931.78130;4801.61819];
   lat_w(k,:)=atan2(r_w(3,1),(sqrt(r_w(1,1)*r_w(1,1)+r_w(2,1)*r_w(2,1))));
   long_w(k,:)=atan2(r_w(2,1),r_w(1,1));
   A  = [-sin(lat_w(k,:))*cos(long_w(k,:)) -sin(long_w(k,:)) cos(lat_w(k,:))*cos(long_w(k,:));-sin(lat_w(k,:))*sin(long_w(k,:)) cos(long_w(k,:)) cos(lat_w(k,:))*sin(long_w(k,:));cos(lat_w(k,:)) 0 sin(lat_w(k,:))];
   r_top = transpose(A)*(r_e-r_w);
   r_top1(k,:)=transpose(A)*(r_e-r_w);

   close(k,:)=(r_e-r_w);
   
   minimum_distance(k,:)=sqrt(close(k,1)^(2)+close(k,2)^(2)+close(k,3)^(2));
   closeset=min(minimum_distance);
   index_close=find(closeset==minimum_distance);
   closest_v=norm(v_b(index_close,:));
  
   S=sqrt(r_top(1,1).^2+r_top(2,1).^2+r_top(3,1).^2);
   S_1(k,:)=sqrt(r_top1(k,1).^2+r_top1(k,2).^2+r_top1(k,3).^2);
   
zenit(k,:)=acos(r_top(3,1)/S);
Elevation(k,:)=(pi/2) -zenit(k,:);
Azi(k,:)= atan2(-r_top1(k,2),r_top1(k,1));
 
   k=k+1;
    end
    
   % subplot(1,1,1);
   figure();
    plot3(r_e1(:,1),r_e1(:,2),r_e1(:,3));   
     save('fig(1)');
     
   % subplot(1,1,2);
   figure()
   plot3(r_i1(:,1),r_i1(:,2),r_i1(:,3));
    save('fig(2)');
    
    %subplot(1,1,3)
    figure();
    pax=polaraxes;
    pax.ThetaDir = 'clockwise';
 polarplot(Azi,rad2deg(Elevation))
  pax.RDir = 'reverse';
    
  
  
    %fig4=polarplot(zenit,rad2deg(Elevation))
   % subplot(1,1,4)
   figure();
     plot(rad2deg(long),rad2deg(lat));
    hold on
   load coastlines
    geoshow(coastlat,coastlon)
    hold off
 save('fig(5)')
   
  distance(:,k)=(r_e-r_w);
  
  minimum_closest_distance=min(r_e-r_w) ;
  minimum_time=(T);
end
 
